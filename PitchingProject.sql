--Select * from "LastPitchMariners";
--Select * from "MarinersPitchingStats";

-- Mariners Pitching Analysis Project

-- 1) Avg Pitches Per at Bat Analysis

-- a) Avg Pitches per at bat
select 
	avg(Pitch_number) as AvgNumberOfPitchesPerAtBat 
from "LastPitchMariners";

-- b) AVG Pitchers per At Bat Home vs Away Analysis
select 
	avg(Pitch_number) as AvgNumberOfPitchesPerAtBat, 
	'Home' as TypeOfGame 
from "LastPitchMariners" 
where home_team = 'SEA'
union 
select 
	avg(Pitch_number) as AvgNumberOfPitchesPerAtBat, 
	'Away' as TypeOfGame 
from "LastPitchMariners" 
where away_team = 'SEA';

-- c) AVG Pitches per at Bat Lefty vs. Righty

select 
	avg(case when batter_position = 'R' then pitch_number end) as RightAtBats,
	avg(case when batter_position = 'L' then pitch_number end) as LeftAtBats
from "LastPitchMariners";

-- d) Avg Pitchers per at bat Lefty vs. Righty Pitcher for each Away game the Mariners played against every other Home Team

select 
	home_team,
	pitcher_position,
	avg(pitch_number)
from "LastPitchMariners"
group by 
	home_team, away_team, pitcher_position
having
	away_team = 'SEA'
order by pitcher_position;

-- e) Top 3 Most Common pitches for at bat 1-10 and total amount of pitches
with pitchfrequencyrankquery as 
(select *,  
rank() over (partition by pitch_number order by PitchFrequency desc) as PitchFrequencyRanking
from (select distinct
	pitch_name,
	pitch_number,
	count(pitch_name) over (partition by pitch_name, pitch_number) as PitchFrequency
from "LastPitchMariners"
where pitch_number < 11
) as TopBats)
select *
from pitchfrequencyrankquery
where PitchFrequencyRanking < 4;

-- f) Avg Pitchers per at bat per pitcher with 20+ innings in descending order

select MPS.name, avg(lpm.pitch_number) as AvgPitches
from "LastPitchMariners" as LPM
join "MarinersPitchingStats" as MPS
on LPM.pitcher = MPS.pitcher_id
where MPS.IP >= 20
group by MPS.Name
order by avg(LPM.pitch_number) desc;

-- 2) Last Pitch Analysis for each Mariners pitcher

-- a) Number of last pitches thrown in descending order

select pitch_name, count(*) as numLastPitches
from "LastPitchMariners"
group by pitch_name
order by count(*) desc;
	
-- b) number of different last pitches thrown as fastball or offspeed (fast ball is considred a 4-seam and cutter because they are 95+ mph. Changes, sliders and other are all slower than 95)

select 
	sum (case when pitch_name in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) as Fastball,
	sum (case when pitch_name not in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) as Offspeed
from "LastPitchMariners";

-- c) percentage of different last pitches between fastballs or offspeed

select 
	100 * sum (case when pitch_name in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) / count(*) as FastballPercent,
	100 * sum (case when pitch_name not in ('4-Seam Fastball', 'Cutter') then 1 else 0 end) / count(*) as OffspeedPercent
from "LastPitchMariners";

-- d) top 5 most common last pitches for a relief pitcher vs a starting pitcher

select *
from (
	select 
	countPitches.pos, 
	countPitches.pitch_name,
	countPitches.timesthrown,
	rank() over (partition by countPitches.pos order by countPitches.timesthrown desc) as pitchrank
from (
	select MPS.pos, LPM.pitch_name, count(*) as timesthrown
	from "LastPitchMariners" as LPM
	join "MarinersPitchingStats" as MPS
	on LPM.pitcher = MPS.pitcher_id
	group by MPS.pos, LPM.pitch_name) as countPitches) as pitchesrankedquery
where pitchesrankedquery.pitchrank < 6;

-- 3) Homerun Analysis

-- a) what pitches have given up the most home runs

select pitch_name, count(*) as HomeRuns
from "LastPitchMariners"
where events = 'home_run'
group by pitch_name
order by count(*) desc;

-- b) top 5 most common home runs given up by zone and pitch

select zone, pitch_name, count(*) as HomeRuns
from "LastPitchMariners"
where events = 'home_run'
group by zone, pitch_name
order by count(*) desc
limit 5;

-- c) home runs for each type ball or strike and for each type of pitcher

select MPS.pos, LPM.balls, LPM.strikes, count(*) as HomeRuns
from "LastPitchMariners" as LPM
join "MarinersPitchingStats" as MPS
on LPM.pitcher = MPS.pitcher_id
where events='home_run'
group by MPS.pos, LPM.balls, LPM.strikes
order by count(*) desc;
	
-- d) Show each pitchers most common count to give up a hr (min 30 Innings pitched)

with hrcounts as (select MPS.name, LPM.balls, LPM.strikes, count(*) as HomeRuns
from "LastPitchMariners" as LPM
join "MarinersPitchingStats" as MPS
on LPM.pitcher = MPS.pitcher_id
where events='home_run' and MPS.ip >= 30
group by MPS.name, LPM.balls, LPM.strikes
),
hrcountranks as (select hrcounts.name, hrcounts.balls, hrcounts.strikes, hrcounts.HomeRuns,
rank() over (Partition by hrcounts.name order by hrcounts.HomeRuns desc) as hrrank
from hrcounts)
select *
from hrcountranks
where hrrank = 1;

-- 4) Stats from George Kirby

-- a) AVG release speed, spin rate, strikeouts, most popular zone

Select 
	AVG(release_speed) as AvgReleaseSpeed, 
	AVG(release_spin_rate) as AvgReleaseSpinRate,
	Sum(case when events='strikeout' then 1 else 0 end) as strikeouts,
	max(zones.zone) as Zone
from "LastPitchMariners" as LPM
join (select pitcher, zone, count(*) as zonenum
from "LastPitchMariners"
where player_name = 'Kirby, George'
group by pitcher, zone
limit 1) as zones on zones.pitcher = LPM.pitcher
where player_name = 'Kirby, George';

-- b) top pitches for each infield position where total pitches are over 5, rank them
select *
from (select pitch_name, count(*) as timeshit, 'third' as Position
from "LastPitchMariners"
where hit_location = 5 and player_name = 'Kirby, George'
group by pitch_name
union
select pitch_name, count(*) as timeshit, 'short' as Position
from "LastPitchMariners"
where hit_location = 6 and player_name = 'Kirby, George'
group by pitch_name
union
select pitch_name, count(*) as timeshit, 'second' as Position
from "LastPitchMariners"
where hit_location = 4 and player_name = 'Kirby, George'
group by pitch_name
union
select pitch_name, count(*) as timeshit, 'first' as Position
from "LastPitchMariners"
where hit_location = 3 and player_name = 'Kirby, George'
group by pitch_name) as questionsubquery
where timeshit > 4
order by timeshit desc;

-- c) show different balls/strikes as well as frequency when someone is on base

select balls, strikes, count(*) as frequency
from "LastPitchMariners"
where (on_3b is not null or on_2b is not null or on_1b is not null) and player_name = 'Kirby, George'
group by balls, strikes
order by frequency desc;

-- d) what pitch causes the lowest launch speed

select pitch_name, avg(launch_speed) as LaunchSpeed
from "LastPitchMariners"
where player_name = 'Kirby, George'
group by pitch_name
order by LaunchSpeed asc
limit 1;


