--drop database
Drop database if exists Vets;
Show databases;
--create a database using utf8 charset
create database Vets character set utf8mb4 COLLATE utf8mb4_general_ci;
--use database
use Vets;
Show tables;


--drop owner table
Drop table if exists Owners;
--create owner table
create table Owners (
    ownerName char(30),
    ownerAddress char(100),
    pets char(60),
    scan longblob, --scan longblob

    PRIMARY Key (ownerName) --set ownerName to primary key

)COLLATE utf8mb4_general_ci, Engine=InnoDB;

Insert into Owners (ownerName, ownerAddress, pets, scan) values
('Kyle Boyle', '23 Glasan, BallyBane, Galway City', 'Spike', load_file("C:/Blobs/owner1Blob.jpg")),
('Zach McGill', '34 Tir na Gcappal, BallyBrit, Galway City', 'Max', load_file("C:/Blobs/owner2Blob.jpg")),
('Connor Gavigan', '51 Dun Aras, Galway City', 'Jimmy', load_file("C:/Blobs/owner3Blob.jpg")),
('Brian McHugh', '98 Glasan, BallyBane, Galway City', 'Ruby', load_file("C:/Blobs/owner4Blob.jpg")),
('Peter Bennett', '12 Cuirt na Rasai, BallyBrit, Galway City', 'Lady', load_file("C:/Blobs/owner5Blob.jpg")),
('John McHugh', '42 Cuirt na Rasai, BallyBrit, Galway City', 'Null', load_file("C:/Blobs/owner6Blob.jpg")),
('Hugh Smith', '23 BallyBrit Court, BallyBrit, Galway City', 'Null', load_file("C:/Blobs/owner7Blob.jpg"));


Drop table if exists Animals;

create table Animals (
    pid integer auto_increment, --auto_inc int for patient id number
    speciesName char(8),
    petName char(10),
    breed char(40),
    gender char(10),
    age smallint unsigned not null, 
    petWeight varchar(20),
    ownerName char(30),
    ownerAddress char(100),
    Scan LongBlob,
   

    PRIMARY Key (pid),
    FOREIGN KEY (ownerName) REFERENCES Owners(ownerName)
   

)COLLATE utf8mb4_general_ci, Engine=InnoDB;



Insert into Animals (speciesName, petName, breed, gender, age, petWeight, ownerName, ownerAddress, Scan) values
('Dog', 'Spike', 'Bulldog', 'Male', '6', '23kg', 'Kyle Boyle', '23 Glasan, BallyBane, Galway City', load_file("C:/Blobs/BullDogBlob.jpg")),
('Dog', 'Max', 'German Shepard', 'Male', '8', '35kg', 'Zach McGill', '34 Tir na Gcappal, BallyBrit, Galway City', load_file("C:/Blobs/GermanSheperd.jpg")),
('Dog', 'Jimmy', 'Border Collie', 'Male', '8', '25kg', 'Connor Gavigan', '51 Dun Aras, Galway City', load_file("C/Blobs/BorderCollieBlob.jpg")),
('Dog', 'Ruby', 'Red Setter', 'Female', '4', '23kg', 'Brian McHugh', '98 Glasan, BallyBane, Galway City', load_file("C/Blobs/RedSetterBlob.jpg")),
('Dog', 'Lady', 'King Charles cavalier', 'Female', '11', '8.6kg', 'Peter Bennett', '12 Cuirt na Rasai, BallyBrit, Galway City', load_file("C/Blobs/KingCharlesBlob.jpg")),
('Cow', 'Null', 'Holstein Friesian', 'Female', '4', '580kg', 'John McHugh', '42 Cuirt na Rasai, BallyBrit, Galway City', load_file("C:/Blobs/HolsteinFriesianBlob.jpg")),
('Sheep', 'Null', 'Texel', 'Female', '5', '75kg', 'Hugh Smith', '23 BallyBrit Court, BallyBrit, Galway City', load_file("C:/Blobs/TexelBlob.jpg"));

Drop table if exists Appointment;

CREATE TABLE Appointment (
    ownerName varchar(30),
    petName varchar(30),
    appointmentType ENUM ('Checkup','Emergency','Farm Visit','Euthanasia', 'Surgery'),
    appointmentDate DATE not null,
    appointmentTime TIME not null,
    vetName char(20),
    symptoms char(30),
    diagnosis char(30),
    treatment char(150),

    PRIMARY KEY (ownerName),
    FOREIGN KEY (ownerName) REFERENCES Owners(ownerName)
) COLLATE utf8mb4_general_ci, ENGINE=InnoDB;

INSERT INTO Appointment (ownerName, petName, appointmentType, appointmentDate, appointmentTime, vetName, symptoms, diagnosis, treatment) VALUES
('Kyle Boyle', 'Spike', 'Checkup', '2023-03-09', '09:00:00', 'Joe O’Donnell', 'Puking, Cut Leg', 'Infection', '2 week course antibiotics'),
('Zach McGill', 'Max', 'Surgery', '2023-03-09', '09:45:00', 'Joe O’Donnell', 'Injured front right paw', 'Broken leg', 'set for 6 weeks'),
('Connor Gavigan', 'Jimmy', 'Checkup', '2023-03-09', '09:45:00', 'David Burke', 'Injured back jumping over wire', 'arthritus', '8 week steroid injections'),
('Brian McHugh', 'Ruby', 'Emergency', '2023-03-09', '10:30:00', 'David Burke', 'Difficulty breathing', 'Alergic reaction', '230mg epinephrine'),
('Peter Bennett', 'Lady', 'Euthanasia', '2023-03-09', '11:00:00', 'David Burke', 'not eating, Tired', 'Bowel Cancer', 'euthanasia'),
('John McHugh', 'Null', 'Farm Visit', '2023-03-09', '11:30:00', 'Carl Flyne', 'sore foot', 'Cyst in foot', 'Drain cyst, 1 week course penicillin'),
('Hugh Smith', 'Null', 'Farm Visit', '2023-03-09', '13:00:00', 'Carl Flyne', 'scabs on back', 'sheep scab', '2 week course macrocyclic lactone anthelmintics');


Drop table if exists Billing;

create table Billing (

    billId smallint unsigned Not Null,
    ownerName char(40),
    ownerAddress char(100),
    appointmentDate DATE,
    paymentMethod ENUM('Card','Cash','Cheque','Revolut') Not Null,
    totalCost DECIMAL(6,2) unsigned,# 6 is the total number of digits and 2 is the number of digits after the decimal point, values that can be stored in the totalCost column range from 0 to 9999.99


    PRIMARY KEY (billId),
    FOREIGN Key (ownerName) REFERENCES Owners(ownerName)
   
)COLLATE utf8mb4_general_ci, Engine=InnoDB;

INSERT INTO Billing (billId, ownerName, ownerAddress, appointmentDate, paymentMethod, totalCost)
VALUES
(245, 'Kyle Boyle', '23 Glasan, BallyBane, Galway City', '2023-03-09', 'Card', 70.50),
(362, 'Zach McGill', '34 Tir na Gcappal, BallyBrit, Galway City', '2023-03-09', 'Revolut', 100.00),
(023, 'Connor Gavigan', '51 Dun Aras, Galway City', '2023-03-09', 'Card', 320.90),
(111, 'Brian McHugh', '98 Glasan, BallyBane, Galway City', '2023-03-09', 'Revolut', 80.00),
(352, 'Peter Bennett', '12 Cuirt na Rasai, BallyBrit, Galway City', '2023-03-09', 'Cash', 110.00),
(021, 'John McHugh', '42 Cuirt na Rasai, BallyBrit, Galway City', '2023-03-09', 'Cash', 130.00),
(462, 'Hugh Smith', '23 BallyBrit Court, BallyBrit, Galway City', '2023-03-09', 'Card', 150.80);

Drop table if exists Medication;

create table Medication (
    pid integer auto_increment,
    billId smallint unsigned not null,
    ownerName char(30),
    treatment char(150),
    price DECIMAL(6,2) unsigned,# 6 is the total number of digits and 2 is the number of digits after the decimal point, values that can be stored in the cost column range from 0 to 9999.99
    duration int,


    PRIMARY KEY (pid),
    FOREIGN Key (billId) REFERENCES Billing(billId),
    FOREIGN Key (ownerName) REFERENCES Owners(ownerName)

) COLLATE utf8mb4_general_ci, Engine=InnoDB;

INSERT INTO Medication (billId, ownerName, treatment, price, duration) VALUES 
(245, 'Kyle Boyle', '2 week course antibiotics',  70.50, 14),
(362, 'Zach McGill', 'set for 6 weeks', 100.00, 42),
(023, 'Connor Gavigan', '8 week steroid injections', 320.90, 56),
(111, 'Brian McHugh', '230mg epinephrine', 80.00, 1),
(352, 'Peter Bennett', 'euthanasia', 110.00, 1),
(021, 'John McHugh', 'Drain cyst, 1 week course penicillin', 130.00, 7),
(462, 'Hugh Smith', '2 week course macrocyclic lactone anthelmintics', 150.00, 14);


Drop table if exists Staff;

create table Staff (
    sid integer auto_increment,
    empName char(20),
    empAddress char(100),
    staffRole ENUM ('Vet','Veterinary Nurse','Receptionist') Not Null,
    salary DECIMAL(8,2) unsigned,# 8 is the total number of digits and 2 is the number of digits after the decimal point, values that can be stored in the salary column range from 0 to 999999.99
    iban varchar(20),
    scan longblob,


    PRIMARY Key (sid)


) COLLATE utf8mb4_general_ci, Engine=InnoDB;

insert into Staff (empName, empAddress, staffRole, salary, iban, scan) values
('Joe O’Donnell', '52 parkmore court, Parkmore, Galway City', 'Vet', 105000.00, 'IE70BOFI900017335837', load_file("C:/Blobs/vet1Blob.jpg")),
('David Burke', '23 Glean na Ri, Murrough, Galway City', 'Vet', 65000.00, 'IE11BOFI900017754678', load_file("C:/Blobs/vet2Blob.jpg") ),
('Carl Flyne', 'Blackthorn Park, Renmore, Galway City', 'Vet', 69000.00, 'IE82BOFI900017651356', load_file("C:/Blobs/vet3Blob.jpg") ),
('Dianne Hegarty', '14 Holly Grove, Renmore, Galway City', 'Veterinary Nurse', 25245.00, 'IE93BOFI900017597129', load_file("C:/Blobs/nurse1Blob.jpg") ),
('Frank Hynes', '51 Renmore Park, Renmore, Galway City', 'Veterinary Nurse', 24970.00, 'IE28BOFI900017614498', load_file("C:/Blobs/nurse3Blob.jpg")  ),
('Maria Quinn', '87 Cuirt na Rasai BallyBrit, Galway City', 'Veterinary Nurse', 26400.00, 'IE73BOFI900017674119', load_file("C:/Blobs/nurse2Blob.jpg")),
('Paula Smith', '53 Wellpark Road, Renmore, Galway City', 'Receptionist', 22300.00, 'IE64BOFI900017398316', load_file("C:/Blobs/receptionistBlob.jpg"));


 