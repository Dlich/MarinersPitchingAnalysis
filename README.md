# Mariners Pitching Analysis Project

As a Seattle native, I've always been passionate about the Seattle Mariners, my favorite MLB baseball team. The rich history, the team's tenacious spirit in the face of challenges, and the unique culture surrounding it have captivated me. Growing up in Seattle throughout the 2000s and 2010s, I had never witnessed the Mariners make the playoffs in my lifetime. However, the 2022 season marked an extraordinary turning point as the Mariners finally shattered their 21-year playoff drought.

This monumental achievement brought immense joy to Mariners fans, including myself. It was particularly fascinating to observe the crucial role played by our pitching staff in this triumph. Consequently, I embarked on an in-depth analysis of our pitching performance to assess the true effectiveness of our team on the mound.

**Datasets Used** 

<a href="https://baseballsavant.mlb.com/statcast_search"> https://baseballsavant.mlb.com/statcast_search </a>

<a href="https://www.baseball-reference.com/teams/SEA/2022.shtml"> https://www.baseball-reference.com/teams/SEA/2022.shtml </a>

<hr></hr>

# <u> Goal of the Project </u>

The goal of this project was to go through the thought process of data exploration (learning, cleaning and preparing the data) and delve into the process of importing this refined data into a SQL database, paving the way for insightful analysis through SQL queries.

# <u> Data Exploration  </u>

To initiate my analysis, I obtained the first dataset from Baseball Savant, a reliable source that directly retrieves data from the MLB. This pitching dataset specifically dealt with the last pitch each pitcher threw per hitter to determine what kind of event happened for that last pitch i.e. if it was a strike, homerun, etc. The credibility and validity of these datasets were ensured, as they are sourced directly from the MLB. Accessing the pitching data for the 2022 season was conveniently straightforward, as it was available for download as a CSV file.

Upon examining the dataset, I discovered several empty and extraneous columns that were irrelevant to the specific questions I aimed to address. Consequently, I performed a thorough data cleaning process by removing unnecessary columns such as 'pfx_x', 'pfx_z', and others, as they were not required for my SQL queries. Furthermore, I encountered instances where certain columns, such as 'bb_type', contained rows with improper values. Specifically, the rows pertaining to the last pitch resulting in a strikeout were empty. To rectify this issue, I replaced each of those empty cells with the designated value 'Strikeout', ensuring the column could be effectively utilized in SQL queries. By diligently analyzing the dataset, I successfully determined the appropriate data to insert into these rows, ensuring that each column contained the necessary information for my analysis.

After cleaning up the Baseball Savant data, I proceeded to download the data from each Mariners pitcher on Baseball Reference. This platform is widely recognized for tracking baseball statistics, ensuring the validity and acceptability of the data. Unlike the Baseball Savant dataset, this particular dataset was already well-organized, eliminating the need to remove any columns. Each column contained crucial information necessary for the analysis, and all rows were populated with data. Although a few header rows required deletion, the overall data cleaning process was swift and efficient.

<hr></hr>

# <u> SQL Analysis </u>

talk about some of the sql questions i did and show some screenshots from the queries

In order to thoroughly analyze the Mariners' pitching performance, I structured my analysis into four comprehensive sections, each with specific sub-questions that I aimed to answer. These overarching sections were as follows:

Average Pitches per At-Bat
Last Pitch Analysis for Each Mariners Pitcher
Home Run Analysis
Pitching Stats from Mariners Pitcher George Kirby
For each of these sections, I formulated 4-5 targeted questions to gain deep insights into the Mariners' pitching prowess.

For example, in Section 1, I crafted queries to determine the average number of pitches thrown per at-bat, the average number of pitches thrown per at-bat for both right-handed and left-handed batters, and the average number of pitches per at-bat for pitchers with over 20 innings pitched, sorted in descending order.

In Section 2, I explored inquiries such as the percentage of last pitches categorized as fastballs or offspeed balls (offspeed being defined as pitches below 95 mph) and the top 5 most frequently used last pitches by relief pitchers compared to starting pitchers.

Section 3 focused on questions regarding the types of pitches that resulted in the most home runs and the top 5 home runs surrendered categorized by pitching zone and pitch type.

For the final section, I directed my attention to one of my favorite pitchers, George Kirby, who emerged as a standout on the pitching staff last year. I delved into his average release speed, spin rate, strikeout statistics, the most popular pitching zone for his pitches, and the pitch type that yielded the lowest launch speed.

Collectively, my objective was to showcase significant statistics derived from the SQL queries I created, highlighting the exceptional strength of the Mariners' pitching during the remarkable 2022 season..

<hr></hr>

# <u> Conclusion </u>

This Mariners Pitching Analysis project not only provided valuable insights into the team's performance but also allowed me to further deepen my appreciation for the Mariners' journey. This project served as one of my initial forays into data analysis, allowing me to enhance my proficiency in Excel and SQL. Through the meticulous exploration and analysis of the data using SQL queries, I successfully unearthed hidden patterns, evaluated critical metrics, and gained a comprehensive understanding of the team's exceptional pitching prowess. Consequently, this project stands as a testament to the skill and dedication exhibited by the Mariners' pitching staff throughout the unforgettable 2022 season. It has been a rewarding experience that has contributed significantly to my growth as a data analyst.
