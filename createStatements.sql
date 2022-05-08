CREATE DATABASE HospitalDB;
USE HospitalDB;
-- 1
CREATE TABLE Country(
CountryID INT,
Name VARCHAR(50),
CountryCode VARCHAR(10),
Continent VARCHAR(30),
PRIMARY KEY(CountryID)
);
-- 2
CREATE TABLE StateProvince(
StateProvinceID INT,
CountryID int,
Name VARCHAR(50),
PRIMARY KEY(StateProvinceID),
CONSTRAINT cntryfk FOREIGN KEY (CountryID)REFERENCES Country(CountryID)
);


-- 3
CREATE TABLE ADDRESS(
AddressID INT,
AddressLine1 VARCHAR(40),
AddressLine2 VARCHAR(40),
City VARCHAR(50),
StateProvinceID INT,
PRIMARY KEY(AddressID),
CONSTRAINT statefk FOREIGN KEY (StateProvinceID) REFERENCES StateProvince(StateProvinceID)
);
-- 4
CREATE TABLE Disease(
DiseaseID INT,
DiseaseName VARCHAR(50),
Status VARCHAR(10),
Conditions VARCHAR(50),
Diagnosis VARCHAR(100),
OtherInformation VARCHAR(50),
PRIMARY KEY(DiseaseID)
);

-- 5
CREATE TABLE Contact(
ContactID INT,
PhoneNumber1 VARCHAR(15),
PhoneNumber2 VARCHAR(15),
PhoneNumber3 VARCHAR(15),
PRIMARY KEY(ContactID)
);

-- 6
CREATE TABLE Building(
BuildingNo INT,
Building_name VARCHAR(50),
Floors INT,
Location VARCHAR(30),
Parking VARCHAR(10),
PRIMARY KEY(BuildingNo)
);

-- 7
CREATE TABLE Ward(
WardID INT,
Ward_name VARCHAR(50),
Floor INT,
GenderAllocated VARCHAR(10),
OtherInformation VARCHAR(50),
BuildingNo INT,
PRIMARY KEY(WardID),
CONSTRAINT Bldgfk FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo)
);

-- 8
CREATE TABLE Department(
DepartmentID INT,
DepartmentName VARCHAR(50),
Roles VARCHAR(50),
BuildingNo INT,
PRIMARY KEY(DepartmentID),
CONSTRAINT Bldgfk1 FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo)
);

-- 9
CREATE TABLE Theatre(
TheatreNo INT,
TheatreName VARCHAR(50),
Size VARCHAR(30),
Operation_type VARCHAR(20),
Other_information VARCHAR(50),
BuildingNo INT,
PRIMARY KEY(TheatreNo),
CONSTRAINT Bldgfk2 FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo)
);

-- 10
CREATE TABLE Laboratory(
LaboratoryID INT,
LabName VARCHAR(40),
TestTypes VARCHAR(40),
BuildingNo INT,
PRIMARY KEY(LaboratoryID),
CONSTRAINT Build4k FOREIGN KEY (BuildingNo) REFERENCES Building(BuildingNo)
);


-- 11
CREATE TABLE Shift(
ShiftID INT,
ShiftStartTime TIME,
ShiftEndTime TIME,
Section VARCHAR(30),
NumberOfworkers INT,
PRIMARY KEY(ShiftID)
);

-- 12 
CREATE TABLE Staff(
StaffID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
DOB DATE,
Gender VARCHAR(10),
DepartmentID INT,
Salary DECIMAL,
Email VARCHAR(40),
ShiftID INT,
PRIMARY KEY(StaffID),
CONSTRAINT dptmfk FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
CONSTRAINT shiftFk FOREIGN KEY (ShiftID) REFERENCES Shift(ShiftID)
);

-- 13
CREATE TABLE StaffDependant(
DependantID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DOB DATE,
Contact VARCHAR(15),
StaffID INT,
PRIMARY KEY(DependantID),
CONSTRAINT Staff5fk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);


-- 14
CREATE TABLE Doctor(
DoctorID INT,
First_name VARCHAR(40),
Last_name VARCHAR(50),
Speciality VARCHAR(60),
StaffID int,
WardID INT,
PRIMARY KEY(DoctorID,StaffID),
CONSTRAINT Stafffk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
CONSTRAINT Wardfk FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);

-- 15
CREATE TABLE HealthRecordSpecialist(
HealthRecordSpecialistID INT,
First_name VARCHAR(40),
Last_name VARCHAR(50),
Gender VARCHAR(10),
Email VARCHAR(50),
StaffID INT,
PRIMARY KEY(HealthRecordSpecialistID,StaffID),
CONSTRAINT Stafff23k FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 16
CREATE TABLE Nutritionist(
NutritionistID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
Speciality VARCHAR(60),
Gender VARCHAR(10),
StaffID INT,
PRIMARY KEY(NutritionistID,StaffID),
CONSTRAINT stafk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 17
CREATE TABLE Secretary(
SecretaryID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
DOB DATE,
Gender VARCHAR(10),
StaffID INT,
PRIMARY KEY(SecretaryID,StaffID),
CONSTRAINT sta6fk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 18
CREATE TABLE Security(
SecurityID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
Section VARCHAR(60),
Gender VARCHAR(10),
StaffID INT,
PRIMARY KEY(SecurityID,StaffID),
CONSTRAINT sta7fk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 19
CREATE TABLE Cooks(
CookID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
Speciality VARCHAR(60),
Gender VARCHAR(10),
StaffID INT,
PRIMARY KEY(CookID,StaffID),
CONSTRAINT stafk7 FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 20
CREATE TABLE Cleaner (
    CleanerID INT,
    First_name VARCHAR(40),
    Last_name VARCHAR(40),
    Contact VARCHAR(60),
    Gender VARCHAR(10),
    StaffID INT,
    WardID INT,
    PRIMARY KEY (CleanerID , StaffID),
    CONSTRAINT stafk9 FOREIGN KEY (StaffID)
        REFERENCES Staff (StaffID),
    CONSTRAINT wrd9fk FOREIGN KEY (WardID)
        REFERENCES Ward (WardID)
);
-- 21
CREATE TABLE Driver(
DriverID INT,
First_name VARCHAR(40),
Last_name VARCHAR(40),
Contact VARCHAR(60),
Gender VARCHAR(10),
StaffID INT,
PRIMARY KEY(DriverID,StaffID),
CONSTRAINT statfk9 FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 22
CREATE TABLE LabTechnician(
LabTechnicianID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
LaboratoryID INT,
StaffID INT,
DOB DATE,
PRIMARY KEY(LabTechnicianID,StaffID),
CONSTRAINT labfffk FOREIGN KEY (LaboratoryID) REFERENCES Laboratory(LaboratoryID),
CONSTRAINT stfffk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 23
CREATE TABLE Pharmacist(
PharmacistID INT,
FirstName VARCHAR(60),
LastName VARCHAR(50),
Unit VARCHAR(50),
Email VARCHAR(60),
StaffID INT,
PRIMARY KEY(PharmacistID,StaffID),
CONSTRAINT ST2fk FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 24
CREATE TABLE DrugCategory(
DrugCategoryID INT,
CategoryName VARCHAR(50),
AdditionalInfo VARCHAR(80),
PRIMARY KEY(DrugCategoryID)
);

-- 25
CREATE TABLE MANUFACTURER(
ManufacturerID INT,
Name VARCHAR(50),
MfgLicense VARCHAR(50),
Website VARCHAR(60),
Email VARCHAR(50),
Location VARCHAR(50),
PRIMARY KEY(ManufacturerID)
);

-- 26
CREATE TABLE Drug(
DrugID INT,
DrugName VARCHAR(50),
SideEffects VARCHAR(100),
ExpiryDate DATE,
ManufacturerID INT,
Available VARCHAR(10),
DrugCategoryID INT,
PRIMARY KEY(DrugID),
CONSTRAINT man2ffk FOREIGN KEY (ManufacturerID) REFERENCES MANUFACTURER(ManufacturerID),
CONSTRAINT drgffk FOREIGN KEY (DrugCategoryID) REFERENCES DrugCategory(DrugCategoryID)
);


-- 27
CREATE TABLE DrugItemPackage(
DrugPackageCode INT,
DrugID INT,
PharmacistID INT,
PackageType VARCHAR(50),
Quantity INT,
Price INT,
PRIMARY KEY(DrugPackageCode),
CONSTRAINT dragfk FOREIGN KEY (DrugID) REFERENCES Drug(DrugID),
CONSTRAINT phrmffk FOREIGN KEY (PharmacistID) REFERENCES Pharmacist(PharmacistID)
);

-- 28
CREATE TABLE DrugPayments(
DrugPaymentID INT,
Amount INT,
PayDate DATE,
PaymentMethod VARCHAR(50),
DrugPackageCode INT,
CONSTRAINT drgPfk FOREIGN KEY (DrugPackageCode) REFERENCES DrugItemPackage(DrugPackageCode)
);

-- 29
CREATE TABLE PurchasingOfficer(
OfficerID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DOB DATE,
StaffID INT,
PRIMARY KEY(OfficerID,StaffID),
CONSTRAINT stf12 FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

-- 30
CREATE TABLE Vendor(
VendorID INT,
AccountNumber VARCHAR(30),
Name VARCHAR(50),
TypeOfService VARCHAR(50),
Email VARCHAR(50),
Website VARCHAR(60),
PRIMARY KEY(VendorID)
);

-- 31
CREATE TABLE PurchaseDetails(
VendorID INT,
OfficerID INT,
PurchaseDate DATE,
OtherInfo VARCHAR(50),
PRIMARY KEY(VendorID,OfficerID),
CONSTRAINT pVk FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
CONSTRAINT offfk FOREIGN KEY (OfficerID) REFERENCES PurchasingOfficer(OfficerID)
);

-- 32
CREATE TABLE PurchaseBankAccount(
AccountNo INT,
AccountName VARCHAR(50),
AvailableAmount INT,
AccountType VARCHAR(50),
Branch VARCHAR(50),
PRIMARY KEY(AccountNo)
);

-- 33
CREATE TABLE ProductCategory(
CategoryID INT,
CategoryName VARCHAR(50),
Description VARCHAR(100),
DateCreated DATE,
PRIMARY KEY(CategoryID)
);

-- 34
CREATE TABLE Product(
ProductID INT,
ProductName VARCHAR(50),
Amount INT,
Price INT,
CategoryID INT,
PRIMARY KEY(ProductID),
CONSTRAINT pcat2ffk FOREIGN KEY (CategoryID) REFERENCES ProductCategory(CategoryID)
);



-- 35
CREATE TABLE PurchaseOrder(
ProductID INT,
OfficerID INT,
OrderDate DATE,
AdditionalInfo VARCHAR(60),
PRIMARY KEY(ProductID,OfficerID),
CONSTRAINT prodfk FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
CONSTRAINT prchfk FOREIGN KEY (OfficerID) REFERENCES PurchasingOfficer(OfficerID)
);

-- 36
CREATE TABLE Vehicle(
VehicleNo INT,
VehicleType VARCHAR(50),
NumberPlate VARCHAR(20),
Capacity INT,
DriverID INT,
PRIMARY KEY(VehicleNo),
CONSTRAINT drvfk FOREIGN KEY (DriverID) REFERENCES Driver(DriverID)
);


-- 37
CREATE TABLE ParkingLot(
ParkingID INT,
Available VARCHAR(10),
Size VARCHAR(10),
VehicleNo INT,
PRIMARY KEY(ParkingID),
CONSTRAINT vhclfk FOREIGN KEY (VehicleNo) REFERENCES Vehicle(VehicleNo)
);

-- 38
CREATE TABLE TransportOperators(
OperatorID INT,
PickupDate DATE,
Location VARCHAR(20),
VehicleNo INT,
PRIMARY KEY(OperatorID),
CONSTRAINT Vfk FOREIGN KEY (VehicleNo) REFERENCES Vehicle(VehicleNo)
);

-- 39
CREATE TABLE SupplyDetails(
ID INT,
SupplyDate DATE,
Location VARCHAR(50),
OtherInformation VARCHAR(50),
OperatorID INT,
PRIMARY KEY(ID),
CONSTRAINT topfk FOREIGN KEY (OperatorID) REFERENCES TransportOperators(OperatorID)
);

-- 40
CREATE TABLE SupplyInformation(
VendorID INT,
OperatorID INT,
SupplyStatus VARCHAR(10),
SupplyInfo VARCHAR(50),
PRIMARY KEY(VendorID,OperatorID),
CONSTRAINT vndr9fk FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID),
CONSTRAINT tropfk FOREIGN KEY (OperatorID) REFERENCES TransportOperators(OperatorID)
);

-- 41
CREATE TABLE Patient(
PatientID INT,
First_name VARCHAR(50),
Last_name  VARCHAR(50),
Title VARCHAR(5),
Email VARCHAR(50),
DOB  DATE,
Gender VARCHAR(10),
Weight DECIMAL,
Height DECIMAL,
Patient_description VARCHAR(100),
ContactID INT,
AddressID INT,
DoctorID INT,
NutritionistID INT,
WardID INT,
DiseaseID INT,
PRIMARY KEY(PatientID),
CONSTRAINT contfk FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
CONSTRAINT addfk FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID),
CONSTRAINT dktfk FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
CONSTRAINT ntrnfk FOREIGN KEY (NutritionistID) REFERENCES Nutritionist(NutritionistID),
CONSTRAINT wrdfk FOREIGN KEY (WardID) REFERENCES Ward(WardID),
CONSTRAINT diseasefk FOREIGN KEY (DiseaseID) REFERENCES Disease(DiseaseID)
);

-- 42
CREATE TABLE HealthRecord(
HealthRecordID INT,
DateCreated DATE,
PatientID INT,
HealthRecordSpecialistID INT,
Record VARCHAR(100),
AdditionalInfo VARCHAR(50),
PRIMARY KEY(HealthRecordID),
CONSTRAINT hspfk FOREIGN KEY (HealthRecordSpecialistID) REFERENCES HealthRecordSpecialist(HealthRecordSpecialistID)
,CONSTRAINT p3fk FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);


-- 43
CREATE TABLE ContactPerson(
ContactPersonID INT,
First_name VARCHAR(50),
Last_name  VARCHAR(50),
Email VARCHAR(50),
DOB  DATE,
Gender VARCHAR(10),
PatientID INT,
ContactID INT,
AddressID INT,
PRIMARY KEY(ContactPersonID),
CONSTRAINT patientfk FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
CONSTRAINT contfk1 FOREIGN KEY (ContactID) REFERENCES Contact(ContactID),
CONSTRAINT addrfk FOREIGN KEY (AddressID) REFERENCES ADDRESS(AddressID)
);


-- 44
CREATE TABLE PatientAssignment(
PatientID INT,
WardID INT,
AssignmentDetail VARCHAR(100),
AssignmentDate DATE,
Status VARCHAR(20),
DateDischarged DATE,
PRIMARY KEY(PatientID,WardID),
CONSTRAINT pt6fk FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
CONSTRAINT wrd7fk FOREIGN KEY (WardID) REFERENCES Ward(WardID)
);
-- 45
CREATE TABLE Bill(
BillID INT,
PatientID INT,
Amount INT,
PRIMARY KEY(BillID,PatientID),
CONSTRAINT patfk FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- 46
CREATE TABLE CashPayment(
CashPaymentID INT,
Amount INT,
PaymentDate DATE,
Balance INT,
PaymentTime TIME,
BillID INT,
CONSTRAINT bill1fk FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

-- 47
CREATE TABLE BankPayment(
CardNo INT,
BankName VARCHAR(60),
Branch VARCHAR(50),
Amount INT,
PaymentDate DATE,
Balance INT,
ExpiryDate DATE,
PaymentTime TIME,
BillID INT,
CONSTRAINT bill2fk FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

-- 48
CREATE TABLE PaymentDetails(
PaymentDetailID INT,
BillID INT, 
PaidDate DATE,
PaymentMethod VARCHAR(40),
PaymentDetailDescription VARCHAR(50),
PRIMARY KEY(PaymentDetailID),
CONSTRAINT bill3fk FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);

-- 49 
CREATE TABLE InsuranceCompany(
InsuranceCompanyID INT,
Name VARCHAR(50),
OtherCompanyDetails VARCHAR(70),
PRIMARY KEY(InsuranceCompanyID)
);

-- 50
CREATE TABLE Coverage(
CoverageID INT,
CoverageName VARCHAR(50),
CoverageGroup VARCHAR(50),
CoverageDescription VARCHAR(60),
IsPolicyCoverage VARCHAR(6),
InsuranceCompanyID INT,
PRIMARY KEY(CoverageID),
CONSTRAINT infk FOREIGN KEY (InsuranceCompanyID) REFERENCES InsuranceCompany(InsuranceCompanyID)
);

-- 51
CREATE TABLE Policy(
PolicyID INT,
PolicyNumber INT,
PolicyEffectiveStartDate DATE,
PolicyEffectiveEndDate DATE,
PaymentOption VARCHAR(50),
Active VARCHAR(30),
PolicyAdditionalInfo VARCHAR(50),
InsuranceCompanyID INT,
PRIMARY KEY(PolicyID),
CONSTRAINT in2fk FOREIGN KEY (InsuranceCompanyID) REFERENCES InsuranceCompany(InsuranceCompanyID)
);

-- 52
CREATE TABLE PolicyCoverage(
PolicyCoverageID INT,
CoverageID INT,
PolicyID INT,
Active VARCHAR(10),
CreatedDate DATE,
PRIMARY KEY(PolicyCoverageID),
CONSTRAINT covfk FOREIGN KEY (PolicyCoverageID) REFERENCES Coverage(CoverageID),
CONSTRAINT polfk FOREIGN KEY (PolicyID) REFERENCES Policy(PolicyID)
);


-- 53
CREATE TABLE Claim(
ClaimID INT,
PatientID INT,
InsuranceCompanyID INT,
ExpiryDate DATE,
InsuranceCardNo INT,
BillID INT,
PRIMARY KEY(ClaimID),
CONSTRAINT pt4fk FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
CONSTRAINT inscfk FOREIGN KEY (InsuranceCompanyID) REFERENCES InsuranceCompany(InsuranceCompanyID),
CONSTRAINT bill4fk FOREIGN KEY (BillID) REFERENCES Bill(BillID)
);


-- 54
CREATE TABLE PolicyEditLog(
PolicyEditLogID INT,
EditDate DATE,
AdditionalInfo VARCHAR(50),
EditedBy VARCHAR(50),
PRIMARY KEY(PolicyEditLogID)
);

-- 55
CREATE TABLE RefClaimStatus(
ClaimStatusID INT,
ClaimStatusDescription VARCHAR(50),
ClaimID INT,
PRIMARY KEY(ClaimStatusID),
CONSTRAINT claim2fk FOREIGN KEY (ClaimID) REFERENCES Claim(ClaimID)
);

-- 56
CREATE TABLE DisputeArea(
DisputeAreaCode VARCHAR(40),
DisputeAreaDescription VARCHAR(40),
DisputeArea VARCHAR(50),
PRIMARY KEY(DisputeAreaCode)
);



-- 57
CREATE TABLE ClaimProcessingStage(
ClaimProcessingStageID INT,
ClaimProcessingDate DATE,
DisputeAreaCode VARCHAR(40),
StartDate DATE,
EndDate DATE,
ProcessingDescription VARCHAR(30),
ClaimID INT,
PRIMARY KEY(ClaimProcessingStageID),
CONSTRAINT dspt2fk FOREIGN KEY (DisputeAreaCode) REFERENCES DisputeArea(DisputeAreaCode),
CONSTRAINT claim3fk FOREIGN KEY (ClaimID) REFERENCES Claim(ClaimID)
);
