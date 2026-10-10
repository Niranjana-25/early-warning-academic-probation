# Day 9 Technical Report: Cohort & Retention Analysis

## 1. Objective
Compare academic indicators across student admission-year cohorts in the Early Warning System for Academic Probation project.

## 2. Data and tools
The notebook uses `Dataset/Cleaned_Academic_Probation_Project.csv` and Python libraries: pandas, NumPy, Matplotlib. It detects admission year, GPA, attendance percentage, probation status, and optional department, semester, and LMS login fields.

## 3. Methodology
1. Load the cleaned dataset.
2. Standardize numeric fields for admission year, GPA, attendance, and probation status.
3. Group records by admission year.
4. Calculate student-record counts, mean GPA, mean attendance, and recorded probation rate among rows with known probation status.
5. Where available, calculate descriptive summaries by department and semester and mean LMS login count by cohort.
6. Export summary CSVs and create charts.

## 4. Deliverables
Running `day9_cohort_retention_analysis.ipynb` creates:
- `student_records_by_cohort.png`
- `average_gpa_by_cohort.png`
- `probation_rate_by_cohort.png`
- `cohort_summary.csv`
- Optional department and semester snapshot summary CSVs when those fields are present.

## 5. Interpretation
Use the outputs to compare groups and identify cohorts that may merit further review. These are descriptive associations; they do not show that admission year caused academic outcomes.

## 6. Important limitation
The available data is a single student snapshot. It does not include repeated period-by-period enrollment status or longitudinal activity records. Therefore, true retention, dropout, or semester-to-semester persistence cannot be calculated from this dataset alone. The analysis is correctly described as a **cohort comparison using snapshot indicators**, not a validated longitudinal retention analysis.

## 7. How to run
From the repository root in Codespaces, open the notebook and choose **Run All**. Required libraries: pandas, NumPy, Matplotlib.