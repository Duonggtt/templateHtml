-- Tạo bảng Role
CREATE TABLE Role (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  role_name VARCHAR(255)
);

-- Tạo bảng User
CREATE TABLE User (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  email VARCHAR(255),
  role_id INTEGER REFERENCES Role(id)
);

-- Tạo bảng Customer
CREATE TABLE Customer (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER REFERENCES User(id),
  fullName VARCHAR(255),
  address VARCHAR(255),
  phone VARCHAR(20),
  birth_date DATE,
  CMND VARCHAR(200),
  visaCreated BOOLEAN
);

-- Tạo bảng Employee
CREATE TABLE Employee (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  user_id INTEGER REFERENCES User(id),
  position VARCHAR(255)
);

-- Tạo bảng Address
CREATE TABLE Address (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  city VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL,
  amount FLOAT,
  requiresVisa BOOLEAN NOT NULL
);

-- Tạo bảng Flight
CREATE TABLE Flight (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  departureAddressID INTEGER REFERENCES Address(id),
  arrivalAddressID INTEGER REFERENCES Address(id),
  flightTime INT,
  departureTime DATETIME,
  arrivalTime DATETIME,
  availableSeats INT,
  totalSeats INT
);

-- Tạo bảng seatClass
CREATE TABLE seatClass (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  seat_clazz VARCHAR(200),
  amount FLOAT
);

-- Tạo bảng Booking
CREATE TABLE Booking (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  customer_id INTEGER REFERENCES Customer(id),
  flight_id INTEGER REFERENCES Flight(id),
  seat_class_id INTEGER REFERENCES seatClass(id),
  bookingDate DATE,
  seatNumber VARCHAR(10),
  roundTrip BOOLEAN
);

-- Tạo bảng Invoice
CREATE TABLE Invoice (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  booking_id INTEGER REFERENCES Booking(id),
  totalAmount FLOAT,
  paymentStatus VARCHAR(50)
);

-- Tạo bảng PaymentPartner
CREATE TABLE PaymentPartner (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  partner_name VARCHAR(200),
  partner_thumbnail VARCHAR(250)
);
