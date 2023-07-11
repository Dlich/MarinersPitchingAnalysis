# Mariners Pitching Analysis Project

As a Seattle native, I've always been passionate about the Seattle Mariners, my favorite MLB baseball team. The rich history, the team's tenacious spirit in the face of challenges, and the unique culture surrounding it have captivated me. Growing up in Seattle throughout the 2000s and 2010s, I had never witnessed the Mariners make the playoffs in my lifetime. However, the 2022 season marked an extraordinary turning point as the Mariners finally shattered their 21-year playoff drought.

This monumental achievement brought immense joy to Mariners fans, including myself. It was particularly fascinating to observe the crucial role played by our pitching staff in this triumph. Consequently, I embarked on an in-depth analysis of our pitching performance to assess the true effectiveness of our team on the mound.

**Datasets Used** 

<a href="https://baseballsavant.mlb.com/statcast_search"> https://baseballsavant.mlb.com/statcast_search </a>

<a href="https://www.baseball-reference.com/teams/SEA/2022.shtml"> https://www.baseball-reference.com/teams/SEA/2022.shtml </a>

<hr></hr>

# <u> Goal of the Project </u>

The goal of this project was to go through the thought process of data exploration (learning, cleaning and preparing the data) and delve into the process of importing this refined data into a SQL database, paving the way for insightful analysis through SQL queries.

# <u> Data exploration  </u>

talk about the data sets and what i did to clean them

The first dataset I downloaded was from Baseball Savant, and the datasets from this website come directly from the MLB which means they are pretty valid and acceptable. It was also easily accesible to download the pitching data from the 2022 season as a CSV file. This dataset originally had many empty columns, and many random columns that weren't needed for the questions I was analyzing. Thus I was able to clean up the data by removing those columns to ensure i only had the columns that i needed. There were also a few columns with rows that didn't have the proper values in place (talk about the column with no home run location). I was able to figure out what the proper data would be to insert into those rows and ensure each column had the proper data i needed for my analysis.

The next dataset I downloaded from was the specific player pitching stats from each mariners pitcher on baseball reference. Baseball reference is wildly used to track baseball stats so the data also was valid and acceptable. This dataset was a lot more cleaned up than the baseball savant data set which means i didnt have to delete any columns because each one was important for the analysis, and each column had data for each row. There were a couple header rows that needed to be deleted, but overall the data cleaning was done quickly and efficiently.




<hr></hr>

# <u> SQL Analysis </u>

talk about some of the sql questions i did and show some screenshots from the queries

<hr></hr>

# <u> Conclusion </u>
