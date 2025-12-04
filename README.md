# happy_country
Mini_Project_2 / Analysing World's happiness Report for the year 2019

## World Happiness & Economy Analysis Project


## Overview

This project explores the relationship between economic conditions and happiness across countries.
We combined two external datasets into a relational SQL database to test how factors like health, GDP, and working hours influence national happiness.
The final goal: provide recommendations for a new country aiming to improve well-being and attract tourism.

## Datasets

### Happiness Dataset

Source: https://www.kaggle.com/datasets/unsdsn/world-happiness/data

Includes: happiness score, social support, freedom, generosity, corruption, healthy life expectancy (scaled), and global ranking.

### Economy Dataset

Source: https://www.rug.nl/ggdc/productivity/pwt/?lang=en

Includes: population, GDP per capita, real consumption, human capital index, and average working hours.


## Database Structure

We built a simple 1:1 relational model with:

Happiness Table --> Well-being indicators for each country.

Economy Table --> Economic indicators for the same countries.

Linked via the shared Country field, allowing us to explore relationships using SQL JOINs.
![alt text](image.png)


## Data Preparation

Key steps:

* Standardized and matched country names

* Fixed incorrect column types and naming mismatches

* Removed a duplicated column causing import errors

* Clarified the meaning of scaled variables (e.g., life expectancy index)

* Ensured both datasets aligned cleanly before analysis


## Hypotheses

* Higher healthy life expectancy → higher happiness → Supported by the data.

* Longer working hours reduce happiness more in high-GGDP countries → Partially supported.

* Working hours alone show a weak effect, but GDP influences how much happiness is impacted.


## Methods

* SQL (JOIN, GROUP BY, ORDER BY, CASE, subqueries)

* ERD modelling

* Descriptive statistics for selecting the most meaningful variables


## Key Findings

* Health is one of the strongest drivers of happiness.

* GDP per capita shapes how resilient a country is to long working hours.

* The happiest countries tend to have: strong healthcare, high GDP, social support, low corruption, and reasonable working hours.

## Conclusion

To increase happiness and attract tourism, our new country should:

* Invest in public health and prevention

* Strengthen economic opportunities

* Promote work-life balance

* Improve governance and social trust

* Build a tourism identity around well-being and quality of life