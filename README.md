# sql-data-analysis-portfolio
# 🌍 World Life Expectancy — SQL Data Analysis
![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Type](https://img.shields.io/badge/Type-Data%20Cleaning%20%7C%20EDA-purple)

## Overview
End-to-end SQL analysis of global life expectancy data covering 193 countries
over a 15-year period. The project is split into two phases: data cleaning to
ensure data quality, and exploratory data analysis (EDA) to uncover patterns
and correlations between life expectancy and key factors such as GDP, BMI,
and adult mortality.

## Dataset
- **Source:** World Life Expectancy (public dataset)
- **Coverage:** 193 countries, 15-year time span
- **Features:** Life expectancy, GDP, BMI, adult mortality, development status

## Phase 1 — Data Cleaning
Issues identified and resolved:
- **Duplicate records:** detected using `ROW_NUMBER() OVER(PARTITION BY Country, Year)`
  and removed via subquery
- **Missing Status values:** imputed via Self JOIN — countries correctly
  labelled as Developed or Developing based on existing records
- **Missing Life Expectancy values:** interpolated as the average of the
  previous and following year using a triple Self JOIN

## Phase 2 — Exploratory Data Analysis
Key questions answered:
- Which countries recorded the highest increase in life expectancy over 15 years?
- How does GDP correlate with life expectancy?
- Is there a significant gap between Developed and Developing nations?
- What is the global year-over-year trend?
- How does BMI relate to life expectancy across countries?

## Key Findings
1. ~16-year life expectancy gap between high-GDP and low-GDP countries
2. Developed nations live ~13 years longer on average than Developing ones
3. Global life expectancy increased by ~5.5 years over the 15-year period
4. GDP threshold of 1,500 marks a significant jump in life expectancy

## SQL Techniques Used
- `ROW_NUMBER()` window function for duplicate detection
- Self JOIN (2x and 3x) for missing value imputation
- `CASE WHEN` for GDP segmentation (high / low)
- `SUM() OVER(PARTITION BY ... ORDER BY ...)` for rolling adult mortality total
- Aggregations: `GROUP BY`, `HAVING`, `AVG`, `MIN`, `MAX`, `ROUND`

## Project Structure
```
📂 world-life-expectancy-sql/
├── README.md
├── data/
│   └── WorldLifeExpectancy.csv
└── queries/
    ├── data_cleaning.sql
    └── exploratory_analysis.sql
```

## Tools
- MySQL Workbench
- SQL — Window Functions, Self Joins, Subqueries, Conditional Aggregations
