CREATE TABLE Patient (
    patient_id INTEGER NOT NULL,
    patient_name VARCHAR(128),
    address VARCHAR(128),
    gender VARCHAR(128),
    date_of_birth DATE,
    email VARCHAR(128),
    PRIMARY KEY(patient_id),
    FOREIGN KEY(room_id) REFERENCES Room(room_id)
);

CREATE TABLE Doctor (
    doctor_id INTEGER,
    doctor_name VARCHAR(128),
    specialty VARCHAR(128)
);

CREATE TABLE BillingInfo (
    billing_id INTEGER NOT NULL,
    total_cost INTEGER,
    PRIMARY KEY(billing_id),
    FOREIGN KEY(patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES Doctor(doctor_id)
);

CREATE TABLE Room (
    room_id INTEGER NOT NULL,
    status VARCHAR(128),
    PRIMARY KEY(room_id),
    FOREIGN KEY(doctor_id) REFERENCES Doctor(doctor_id)
);

INSERT INTO Patient (patient_id, patient_name, address, gender, date_of_birth, email)
    VALUES('001', 'John Smith', '123 First Street', 'Male', '01-01-1999', 'johnsmith@gmail.com');
INSERT INTO Patient (patient_id, patient_name, address, gender, date_of_birth, email)
    VALUES('001', 'Jane Smith', '123 Second Street', 'Female', '05-23-1999', 'janeharris@gmail.com');
INSERT INTO Patient (patient_id, patient_name, address, gender, date_of_birth, email)
    VALUES('001', 'Derek Davis', '123 Third Street', 'Male', '12-10-1999', 'derekdavis@gmail.com');

UPDATE Patient SET room_id=001 WHERE patient_id=001;
UPDATE Patient SET room_id=002 WHERE patient_id=002;
UPDATE Patient SET room_id=003 WHERE patient_id=003;

INSERT INTO Doctor (doctor_id, doctor_name, specialty)
    VALUES('001', 'Tyler Him', 'Cardiology');
INSERT INTO Doctor (doctor_id, doctor_name, specialty)
    VALUES('002', 'Chuck Morris', 'Psychology');
INSERT INTO Doctor (doctor_id, doctor_name, specialty)
    VALUES('003', 'Destiny Bond', 'Neurology');

INSERT INTO BillingInfo (billing_id, total_cost)
    VALUES('001','2500');
INSERT INTO BillingInfo (billing_id, total_cost)
    VALUES('002','5350');
INSERT INTO BillingInfo (billing_id, total_cost)
    VALUES('003','8740');
    
UPDATE BillingInfo SET patient_id=001, doctor_id=001 WHERE billing_id=001;
UPDATE BillingInfo SET patient_id=002, doctor_id=002 WHERE billing_id=002;
UPDATE BillingInfo SET patient_id=003, doctor_id=003 WHERE billing_id=003;

INSERT INTO Room (room_id, status)
    VALUES('001', 'Occupied');
INSERT INTO Room (room_id, status)
    VALUES('002', 'Occupied');
INSERT INTO Room (room_id, status)
    VALUES('003', 'Occupied');
INSERT INTO Room (room_id, status)
    VALUES('004', 'Vacant');

UPDATE Room SET doctor_id=001 WHERE room_id=001;
UPDATE Room SET doctor_id=002 WHERE room_id=002;
UPDATE Room SET doctor_id=003 WHERE room_id=003;