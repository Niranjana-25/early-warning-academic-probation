# Day 7 — Interactive Dashboard Development

## 1. Project overview
The Early Warning System for Academic Probation analyzes student academic and engagement indicators to help identify students who may need academic support. The project combines exploratory analysis, a rule-based risk categorization, an SVM classification experiment, KPI summaries, and a Power BI dashboard.

## 2. Dataset
- File used in the analysis: `Dataset/Cleaned_Academic_Probation_Project.xlsx`
- Cleaned CSV copy: `Dataset/Cleaned_Academic_Probation_Project.csv`
- Rows and columns: **10,000 rows × 16 columns**
- Target column for classification: `Probation_Status` (`Yes` / `No`)

The fields cover student identifiers and demographics, department and semester, attendance, GPA, assignment/quiz/internal marks, LMS logins, weekly study hours, backlog count, last login date, admission year, and probation status. The notebook's `df.info()` output reports 10,000 non-null values for each of the 16 columns.

## 3. Tools used
- Python: pandas, NumPy, Matplotlib, Seaborn, scikit-learn
- Jupyter Notebook for analysis and model experiments
- Power BI Desktop for interactive dashboard development
- Excel and CSV for dataset storage and summaries
- GitHub for version control and project delivery

## 4. Methodology

### 4.1 Exploratory and performance analysis
The notebooks calculate overall academic and engagement measures and compare GPA and other performance indicators across departments. The Day 4 notebook reports:
- Average GPA: **5.71**
- Average attendance: **69.99%**
- Average study hours per week: **20.17**
- Average LMS login count: **80.25**

The GPA and attendance values are examined with IQR-based outlier checks. The saved notebook outputs report zero outliers for both of these fields under the applied IQR bounds. Visualizations include department-level comparisons and a GPA-versus-backlog relationship plot.

### 4.2 Rule-based risk categorization
The Day 5 notebook assigns a risk level using attendance, GPA, and backlog count:
- **Critical Risk:** attendance below 50%, or GPA below 5, or backlog count greater than 3.
- **At Risk:** if not Critical Risk, attendance below 75% or GPA below 6.5.
- **Normal:** otherwise.

The notebook output counts are:
- Critical Risk: **6,847**
- At Risk: **1,960**
- Normal: **1,193**

These labels are screening indicators intended to help prioritize review; they are not a substitute for an academic advisor's assessment.

### 4.3 SVM classification experiment
The classifier predicts `Probation_Status` from eight numeric features:
`Attendance_Percentage`, `GPA`, `Assignment_Score`, `Quiz_Score`, `Internal_Marks`, `LMS_Login_Count`, `Study_Hours_Per_Week`, and `Backlog_Count`.

The notebook uses an 80/20 train-test split with `random_state=42` and stratification, standardizes the features using `StandardScaler`, and trains an SVM with an RBF kernel. The recorded test-set accuracy is **97.55%**. The notebook also generates a classification report and confusion-matrix visualization.

This is the result on the current dataset and split only. It should not be interpreted as proof of the same performance on new cohorts or real operational data; validate on independent data before using predictions for consequential decisions.

### 4.4 KPI summaries and Power BI dashboard
The Day 6 notebook computes student-level summary KPIs, including total students, average GPA, attendance, assignment/quiz/internal scores, LMS logins, study hours, backlog count, and probation-status counts. It also exports summary CSV files for department KPIs, probation status, and risk levels.

The Power BI file is `Early_Warning_Academic_Probation.pbix`. It brings the project's academic-risk indicators and summaries into an interactive dashboard. Use the supplied PBIX to review the existing report pages and slicers rather than rebuilding the dashboard from scratch.

## 5. Repository deliverables
- `Dataset/`: cleaned and uncleaned Excel files plus cleaned CSV
- `EDA_Python/`: exploratory analysis notebook and charts
- `Performance_Analysis/`: performance analysis notebook and charts
- `Anomaly_Detection/`: risk-level logic and SVM classification notebook/output charts
- `KPI_Monitoring/`: KPI notebook and summary CSV files
- `Student_Segmentation/`: existing segmentation notebook and related outputs
- `PostgreSQL/`: SQL scripts and screenshots
- `Early_Warning_Academic_Probation.pbix`: Power BI report

## 6. Outcome and limitations
The current Day 7 work documents the existing analysis, model experiment, KPI exports, and Power BI artifact. The risk levels are rule-based, while probation status is also modeled separately with SVM. These are distinct approaches and should not be treated as identical outputs.

The dataset contains a single row-level snapshot with a `Last_Login_Date` field. A reliable 90-day time-series forecast or true student-retention-over-time analysis requires suitable dated observations or repeated-period data; those tasks are separate from the dashboard described here.

## 7. How to review
1. Open the notebooks in Jupyter Notebook or JupyterLab.
2. Keep the dataset in the relative `Dataset/` folder expected by the notebooks.
3. Open `Early_Warning_Academic_Probation.pbix` in Power BI Desktop.
4. Review the existing report pages, filters, and summary visuals against the exported CSV files.

