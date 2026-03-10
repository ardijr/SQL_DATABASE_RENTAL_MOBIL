# SQL_DATABASE_RENTAL_MOBIL

## Database  Sistem Rental Mobil

Dokumentasi ini menjelaskan struktur dan konfigurasi database MySQL yang digunakan dalam aplikasi Sistem Rental Mobil berbasis Python. Database digunakan untuk menyimpan dan mengelola data mobil serta akun pengguna yang dapat mengakses sistem.

Database ini dirancang untuk mendukung operasi dasar CRUD (Create, Read, Update, Delete) yang dilakukan oleh aplikasi Python.

Teknologi Database

Database yang digunakan dalam project ini adalah:

MySQL sebagai sistem manajemen database

mysql-connector-python sebagai library untuk menghubungkan Python dengan MySQL

Library ini memungkinkan aplikasi Python untuk menjalankan query SQL seperti:

INSERT

SELECT

UPDATE

DELETE

langsung ke database MySQL.

Install library yang dibutuhkan:

pip install mysql-connector-python
Koneksi Database

Aplikasi Python terhubung ke database menggunakan kode berikut:

import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="ardijr123",
    database="rental_mobil"
)

cursor = db.cursor(dictionary=True)

Penjelasan parameter koneksi:

Parameter	Penjelasan
host	Alamat server database (localhost karena database berjalan di komputer lokal)
user	Username MySQL
password	Password MySQL
database	Nama database yang digunakan oleh aplikasi

cursor(dictionary=True) digunakan agar hasil query dikembalikan dalam bentuk dictionary, sehingga lebih mudah diolah di dalam Python.

Struktur Database

Database yang digunakan bernama:

rental_mobil

Database ini terdiri dari dua tabel utama:

mobil

akun

Tabel Mobil

Tabel mobil digunakan untuk menyimpan data kendaraan yang tersedia dalam sistem rental.

## Struktur tabel:

CREATE TABLE mobil(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    warna VARCHAR(50) NOT NULL,
    harga INT NOT NULL,
    status ENUM('Tersedia','Disewa') DEFAULT 'Tersedia'
);

Penjelasan field:

Field	Tipe Data	Deskripsi
id	INT	Primary key yang dibuat otomatis
kode	VARCHAR	Kode unik untuk setiap mobil
nama	VARCHAR	Nama atau tipe mobil
warna	VARCHAR	Warna mobil
harga	INT	Harga sewa mobil
status	ENUM	Status mobil (Tersedia atau Disewa)

Status mobil digunakan untuk mengetahui apakah mobil sedang disewa atau masih tersedia.

## Tabel Akun

Tabel akun digunakan untuk menyimpan data pengguna yang dapat mengakses sistem.

Struktur tabel:

CREATE TABLE akun(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('admin','user') NOT NULL
);

## Penjelasan field:

Field	Tipe Data	Deskripsi
id	INT	Primary key akun
username	VARCHAR	Username untuk login
password	VARCHAR	Password akun
role	ENUM	Hak akses pengguna (admin atau user)

Role digunakan untuk menentukan hak akses pengguna terhadap sistem.

## Data Awal (Initial Data)

Database juga memiliki data awal untuk akun pengguna.

INSERT INTO akun (username, password, role) VALUES
('admin','admin123','admin'),
('user','ardi123','user');


admin memiliki akses penuh terhadap sistem

user hanya memiliki akses terbatas

Relasi Data

Dalam versi sistem saat ini, tabel mobil dan akun belum memiliki relasi langsung.

Namun pada pengembangan selanjutnya, sistem dapat ditambahkan tabel baru seperti:

tabel transaksi

tabel penyewaan

tabel pembayaran

yang akan menghubungkan data mobil dengan pengguna yang melakukan penyewaan.

## Setup Database

Untuk menyiapkan database, jalankan perintah berikut di MySQL:

CREATE DATABASE rental_mobil;
USE rental_mobil;

CREATE TABLE mobil(
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) NOT NULL UNIQUE,
    nama VARCHAR(100) NOT NULL,
    warna VARCHAR(50) NOT NULL,
    harga INT NOT NULL,
    status ENUM('Tersedia','Disewa') DEFAULT 'Tersedia'
);

CREATE TABLE akun(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    role ENUM('admin','user') NOT NULL
);

Setelah itu tambahkan data awal akun:

INSERT INTO akun (username, password, role) VALUES
('admin','admin123','admin'),
('user','ardi123','user');
