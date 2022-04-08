# Probability Modelling
---

We obtained an average 13.6% annual probability of winning the FSA Championship for our chosen team, with a 17.1% annual probability of ranking within the top 10 members of the FSA. This resulted in a 76.9% probability of winning the FSA Championship within 10 years, and a 60.8% probability of ranking within the top 10 members of the FSA within 5 years. The 95% confidence intervals for the annual probabilities are shown below.

<img src="confidence.png"
     alt="95% Confidence Intervals"
     style="align: center; margin-left: 1000px;" />

img[src~="confidence.png"] {
   width:150px;
   height:100px;
   align: center;
}

Four beta regression models were ran for each player position (defender, midfielder, forward and goalkeeper) with a determined 2021 probability of success as the response variables and chosen pertinent average player statistics as the independent variables. The fitted coefficient outputs for each player statistic across the four models were then applied to the Rarita team’s average player statistics across each player position, obtaining an average 13.6% annual probability of success for our chosen team, with a 95% confidence interval of 8.89% to 18.4%.

Assuming an independent probability of success in winning the league each year for simplicity, where otherwise complex factors, such as player performance and annual player exchange, would need to be calculated, the model resulted in a 76.9% probability of achieving an FSA championship in the next 10 years between 2021 and 2030.

Running a similar model, a 17.1% annual probability of ranking within the top 10 members of the FSA was obtained, with a 95% confidence interval of 10.9% to 23.3%. A 5-year probability of ranking within the top 10 members of 60.8% was additionally obtained.

