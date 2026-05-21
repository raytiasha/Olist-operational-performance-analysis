-- Customers table stores user information
/*
  CSV contains missing (blank) and non-numeric values. These rows/values were handled during data import to prevent type conversion errors and ensure proper loading into MySQL.
      1. TRIM() - Removes: spaces, " ", tabs, hidden characters.
      2. NULLIF() - Converts empty values → NULL.
  */
  
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE saas_analytics.customer_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID,
Country,
State,
City,
ZipCode,
Latitude,
Longitude,
Gender,
SeniorCitizen,
Partner,
Dependents,
TenureMonths,
PhoneService,
MultipleLines,
InternetService,
OnlineSecurity,
OnlineBackup,
DeviceProtection,
TechSupport,
StreamingTV,
StreamingMovies,
Contract,
PaperlessBilling,
PaymentMethod,
MonthlyCharges,
@TotalCharges,
ChurnLabel,
ChurnValue,
ChurnScore,
CLTV,
ChurnReason)
SET TotalCharges =
NULLIF(TRIM(@TotalCharges), '');

/*
The 'active' column is of type TINYINT.
Values were converted to 1/0 to handle type mismatch errors during data import.
*/
