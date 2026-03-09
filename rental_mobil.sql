CREATE DATABASE rental_mobil;

USE rental_mobil;

-- TABEL MOBIL
CREATE TABLE mobil(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    warna VARCHAR(50) NOT NULL,
    harga INT NOT NULL,
    status ENUM('Tersedia', 'Disewa') DEFAULT 'Tersedia'
);

CREATE TABLE akun (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('admin','user') NOT NULL
);

-- DATA MOBIL
INSERT INTO mobil (kode, nama, warna, harga, status) VALUES
('M01', 'Toyota Avanza', 'Hitam', 475000, 'Tersedia'),
('M02', 'Honda Brio', 'Putih', 375000, 'Tersedia'),
('M03', 'Suzuki Ertiga', 'Silver', 450000, 'Tersedia'),
('M04', 'Mitsubishi Pajero', 'Hitam', 900000, 'Disewa'),
('M05', 'Toyota Fortuner', 'Putih', 850000, 'Tersedia');

-- DATA AKUN
INSERT INTO akun (username, password, role) VALUES
('admin', 'admin123', 'admin'),
('user', 'ardi123', 'user');