# Early Warning System for Academic Probation Using Predictive Analytics

## Project Objective

Analyze student academic performance and engagement indicators to identify students who may need additional academic support. The project combines exploratory data analysis, rule-based risk categorization, an SVM classification experiment, KPI monitoring, a Power BI dashboard, exploratory forecasting, and cohort comparison.

## Dataset

The cleaned dataset is available in:
- [Cleaned CSV](Dataset/Cleaned_Academic_Probation_Project.csv)
- [Cleaned Excel file](Dataset/Cleaned_Academic_Probation_Project.xlsx)

The analysis notebook reports **10,000 rows and 16 columns**. The classification target is `Probation_Status` (`Yes` / `No`).

## Project Documentation and Workflow

### Core Analysis — Days 1–6

The first six days are documented through the project's analysis folders and notebooks rather than separate Day 1–6 technical reports.

| Work area | Repository contents |
|---|---|
| Dataset and exploratory analysis | [Dataset](Dataset/) · [EDA_Python](EDA_Python/) |
| Academic and department performance analysis | [Performance_Analysis](Performance_Analysis/) |
| Rule-based risk levels and SVM experiment | [Anomaly_Detection](Anomaly_Detection/) |
| KPI monitoring and exported summaries | [KPI_Monitoring](KPI_Monitoring/) |
| Student segmentation | [Student_Segmentation](Student_Segmentation/) |
| SQL work | [PostgreSQL](PostgreSQL/) |

The Day 7 technical report also documents the verified workflow details for Days 4–6: performance comparisons, rule-based risk categorization and SVM classification, and KPI summaries.

### Day 7 — Interactive Dashboard Development

- [Day 7 Technical Report](Day_7_Dashboard_Development/Technical_Report.md)
- [Power BI dashboard file](Early_Warning_Academic_Probation.pbix)

### Day 8 — Time-Series Forecasting

- [Day 8 Forecasting Notebook](Day_8_Forecasting/day8_time_series_forecasting.ipynb)
- [Day 8 Technical Report](Day_8_Forecasting/Technical_Report.md)
- [Forecast charts and CSV outputs](Day_8_Forecasting/Output_Charts/)

This is an exploratory forecast of weekly counts derived from the recorded `Last_Login_Date` values. It is **not** a validated forecast of future student activity or probation outcomes.

### Day 9 — Cohort Analysis

- [Day 9 Cohort Analysis Notebook](Day_9_Cohort_Retention/day9_cohort_retention_analysis.ipynb)
- [Day 9 Technical Report](Day_9_Cohort_Retention/Technical_Report.md)
- [Cohort charts and CSV outputs](Day_9_Cohort_Retention/Output_Charts/)

Day 9 compares admission-year cohorts using available snapshot measures such as record counts, GPA, attendance, and probation rates. Because the dataset contains a single snapshot and does not provide repeated observations for each student over time, this is **not true longitudinal retention analysis**.

## Main Methods

- Exploratory data analysis and visualizations using pandas, Matplotlib, and Seaborn.
- IQR-based outlier checks for attendance and GPA.
- Rule-based risk levels:
  - **Critical Risk:** attendance below 50%, or GPA below 5, or backlog count greater than 3.
  - **At Risk:** not Critical Risk, and attendance below 75% or GPA below 6.5.
  - **Normal:** otherwise.
- SVM classification of `Probation_Status` using eight academic/engagement features, an 80/20 stratified train-test split, feature standardization, and an RBF kernel. The saved notebook records **97.55% test-set accuracy** on the current split.
- KPI monitoring, Power BI visualization, exploratory recorded-date forecasting, and admission-year cohort comparison.

## How to Explore the Project

1. Open the notebooks in their respective folders using Jupyter Notebook/JupyterLab or the configured Codespace.
2. Keep the dataset in the relative `Dataset/` folder expected by the notebooks.
3. Review the linked technical reports for methodology and limitations.
4. Open `Early_Warning_Academic_Probation.pbix` in Power BI Desktop to inspect the existing dashboard.

Install the libraries required by the notebook you intend to run. Common dependencies include `pandas`, `numpy`, `matplotlib`, `seaborn`, `scikit-learn`, `openpyxl`, and `scipy`.

## Important Limitations

- The SVM accuracy is from the current dataset and held-out split; it does not guarantee the same performance on new students. Independent, representative validation is needed before consequential use.
- The rule-based risk category and SVM prediction are separate methods and should not be treated as identical outputs.
- A single `Last_Login_Date` per student does not establish a reliable future-activity forecast.
- The available snapshot supports cohort comparisons, not true longitudinal retention or individual changes in engagement over time.

## Conclusion

The repository brings together student data analysis, risk screening, an SVM classification experiment, KPI summaries, a Power BI dashboard, exploratory forecasting, and cohort comparisons. These outputs are intended to support further review and academic support planning, not to replace professional judgment.
