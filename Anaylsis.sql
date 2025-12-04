USE happy_country;

-- ===========================================================

-- checking the tables
DESCRIBE happiness;
DESCRIBE economy;

SELECT * FROM happiness LIMIT 10;
SELECT * FROM economy   LIMIT 10;

-- ===========================================================

-- basic summaries of happiness statistics
SELECT
    COUNT(*)   AS count_countries,
    MIN(Score) AS min_score,
    MAX(Score) AS max_score,
    AVG(Score) AS avg_score,
    STD(Score) AS std_score
FROM happiness;

-- ===========================================================

-- Avg healthy life expectancy and happiness
SELECT
    AVG(Healthy_life_expectancy) AS avg_health,
    AVG(Score)                   AS avg_happiness
FROM happiness;

-- ===========================================================

-- basic summaries of economy statistics
SELECT
    MIN(GDP_per_capita)  AS min_gdp,
    MAX(GDP_per_capita)  AS max_gdp,
    AVG(GDP_per_capita)  AS avg_gdp,
    STD(GDP_per_capita)  AS std_gdp,
    AVG(av_Working_h)    AS avg_working_hours
FROM economy;

-- ===========================================================
-- ===========================================================

-- JOIN happiness + economy
-- Basic joining
SELECT
    h.country,
    h.Score,
    h.Overall_rank,
    h.Healthy_life_expectancy,
    h.Social_support,
    h.Freedom_to_make_life_choices,
    h.Generosity,
    h.Perceptions_of_corruption,
    e.`population(mil.)`,
    e.GDP_per_capita,
    e.real_consumption_per_capita,
    e.human_capital_index,
    e.av_Working_h
FROM happiness h
JOIN economy e
    ON h.country = e.country
LIMIT 20;

-- ===========================================================

-- Analysing top 10 happiest countries
SELECT
    h.Overall_rank,
    h.country,
    h.Score,
    e.`population(mil.)`,
    h.Healthy_life_expectancy,
    e.GDP_per_capita,
    e.av_Working_h
FROM happiness h
JOIN economy e
    ON h.country = e.country
ORDER BY h.Score DESC
LIMIT 10;


-- ===========================================================
-- ===========================================================
-- Healthy_Life_Expectancy are between: 0.3 and 1.2
-- Because the World Happiness Report converts real WHO life expectancy into a scaled value that fits with the other components of the model.
-- 75. --> 1.1 / 70. --> 10 /65. -->0.9 /.... /50. --> 0.6
-- So the real WHO values range roughly from: ~50 years (low) ~75 years (high)


-- Hypothesis 1: Longer healthy life expectancy -> higher happiness
SELECT
    country,
    Score,
    Healthy_life_expectancy
FROM happiness
ORDER BY Healthy_life_expectancy DESC;

-- Grouping countries based on health perspective

SELECT
    CASE
        WHEN Healthy_life_expectancy >= 1.10 THEN 'High health'
        WHEN Healthy_life_expectancy BETWEEN 0.80 AND 1.10 THEN 'Medium health'
        ELSE 'Low health'
    END AS health_group,
    COUNT(*)                         AS n_countries,
    AVG(Healthy_life_expectancy)     AS avg_health,
    AVG(Score)                       AS avg_happiness
FROM happiness
GROUP BY health_group
ORDER BY avg_happiness DESC;

-- 1.10+ top health --> nordic countries and so
-- 0.80–1.10 medium health --> the majority
-- Below 0.80 weak health --> 

-- Hypothesis 2: "Effect of working hours on happiness is stronger in high-GDP countries"
-- high versus low gdp
SELECT
    h.country,
    h.Score,
    e.av_Working_h,
    e.GDP_per_capita,
    CASE
        WHEN e.GDP_per_capita >= (SELECT AVG(GDP_per_capita) FROM economy)
            THEN 'High GDP'
        ELSE 'Low GDP'
    END AS gdp_group
FROM happiness h
JOIN economy e
    ON h.country = e.country
ORDER BY gdp_group, e.av_Working_h;

SELECT AVG(GDP_per_capita) FROM economy
