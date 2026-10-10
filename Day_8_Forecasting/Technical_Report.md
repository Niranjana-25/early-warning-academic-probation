# Day 8 — Exploratory Time-Series Forecasting Report

## Objective
Demonstrate a 90-day forecasting workflow using the academic probation project's available date field.

## Data used
- Dataset: `Dataset/Cleaned_Academic_Probation_Project.csv`
- Date field: `Last_Login_Date`
- Aggregation: count student records by week ending Sunday.
- Forecast horizon: 13 weekly periods, approximately 90 days.

## Method
1. Parse the recorded last-login date, excluding rows with invalid/missing dates.
2. Aggregate records into a weekly time series.
3. Fit a simple linear regression trend to the weekly counts.
4. Forecast the next 13 weekly points after the latest observed week.
5. Calculate approximate 95% regression-based prediction intervals and export a CSV and plots.

## Outputs created when the notebook is run
- `Output_Charts/weekly_recorded_last_login_counts.png`
- `Output_Charts/90_day_recorded_last_login_forecast.png`
- `Output_Charts/90_day_weekly_forecast.csv`

## Limitation (important)
The dataset has one `Last_Login_Date` per student, rather than repeated login-event records or historical weekly academic KPIs. The forecast therefore estimates the weekly distribution of *records by their recorded last-login date*. It is an exploratory demonstration and **does not** establish future LMS activity, student retention, GPA, or probation trends. The forecast is not suitable for individual student decisions.

For an operational forecast, collect timestamped LMS events or repeated weekly/monthly academic metrics across multiple periods, then validate the model on a chronological holdout set using appropriate error metrics.

## Reproducibility
Run `Day_8_Forecasting/day8_time_series_forecasting.ipynb` in Jupyter with the repository's cleaned CSV in the existing `Dataset/` folder. Required packages: pandas, NumPy, Matplotlib, scikit-learn, and SciPy.
