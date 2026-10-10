# Early Warning System for Academic Probation Using Predictive Analytics

## Project objective
Analyze student academic performance and engagement indicators to identify students who may need additional academic support. The repository includes exploratory analysis, rule-based risk categorization, an SVM classification experiment, KPI summaries, and a Power BI report.

## Dataset
The cleaned dataset is stored in `Dataset/Cleaned_Academic_Probation_Project.xlsx` and `Dataset/Cleaned_Academic_Probation_Project.csv`. The notebook output shows **10,000 rows and 16 columns**. The classification target is `Probation_Status` (`Yes` / `No`).

## Project components
| Folder / file | Purpose |
|---|---|
| `Dataset/` | Cleaned CSV/Excel and uncleaned Excel data |
| `EDA_Python/` | Exploratory data analysis |
| `Performance_Analysis/` | Academic performance and department comparisons |
| `Anomaly_Detection/` | Risk-level rules and SVM classifier experiment |
| `KPI_Monitoring/` | KPI calculations and summary CSV exports |
| `Student_Segmentation/` | Existing student segmentation analysis |
| `PostgreSQL/` | SQL scripts and screenshots |
| `Early_Warning_Academic_Probation.pbix` | Power BI dashboard |

## Main methods
- Exploratory summaries and visualizations using pandas, Matplotlib, and Seaborn.
- IQR-based outlier checks for attendance and GPA.
- Rule-based risk levels:
  - **Critical Risk:** attendance < 50%, or GPA < 5, or backlog count > 3.
  - **At Risk:** not Critical Risk, and attendance < 75% or GPA < 6.5.
  - **Normal:** otherwise.
- SVM classification of `Probation_Status` using eight academic/engagement features, an 80/20 stratified split, feature standardization, and an RBF kernel. The saved notebook records **97.55% test-set accuracy** on the current split.

## KPI outputs
The KPI notebook exports department KPI, probation-status, and risk-level summary CSV files under `KPI_Monitoring/Output_Charts/`.

## Run / review
1. Clone or download this repository.
2. Install the main Python dependencies: `pandas`, `numpy`, `matplotlib`, `seaborn`, `scikit-learn`, and `openpyxl`.
3. Open the notebooks from their folders and keep the dataset paths as expected by the notebooks.
4. Open the PBIX file in Power BI Desktop to inspect the existing interactive dashboard.

## Important limitation
The SVM score reflects the current dataset and held-out split only; it does not guarantee the same performance on new students. Validate on independent, representative data before using predictions for consequential decisions. The current dataset has a `Last_Login_Date` field, but a single snapshot does not by itself establish a valid 90-day forecast or longitudinal retention analysis.

## Documentation
See [Day 7 Technical Report](Day_7_Dashboard_Development/Technical_Report.md) for the dashboard-stage methodology and deliverables.
