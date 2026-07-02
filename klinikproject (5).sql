-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2026 at 03:39 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinikproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int NOT NULL,
  `id_pasien` int DEFAULT NULL,
  `id_dokter` int DEFAULT NULL,
  `tanggal_antrian` date NOT NULL,
  `no_antrian` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `keluhan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `id_pasien`, `id_dokter`, `tanggal_antrian`, `no_antrian`, `status`, `keluhan`) VALUES
(1, 1, 1, '2024-05-20', 1, 'Diverifikasi', 'Demam tinggi semenjak kemarin malam'),
(2, 2, 1, '2024-05-21', 2, 'Diverifikasi', 'Batuk kering disertai radang tenggorokan'),
(3, 3, 1, '2024-05-22', 3, 'Selesai', 'Sakit kepala sebelah kiri (migrain)'),
(8, 1, 1, '2026-06-12', 2, 'menunggu', NULL),
(9, 1, 2, '2026-06-12', 1, 'menunggu', NULL),
(10, 1, 1, '2026-06-12', 3, 'menunggu', NULL),
(11, 1, 1, '2026-06-12', 4, 'menunggu', NULL),
(12, 2, 2, '2026-06-15', 1, 'menunggu', NULL),
(25, 23, 1, '2026-06-29', 1, 'Menunggu Verifikasi', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `no_izin_praktek` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `id_user`, `nama_dokter`, `no_hp`, `no_izin_praktek`) VALUES
(1, 2, 'dr. Andi', '08198765432', '123/IZIN-P/2025'),
(2, 6, 'dr. Ayu', '08123456789', '456/IZIN-P/2026');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_konsultasi`
--

CREATE TABLE `jadwal_konsultasi` (
  `id_jadwal` int NOT NULL,
  `id_dokter` int NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `status` enum('Aktif','Tidak Aktif') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Aktif',
  `ruang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_konsultasi`
--

INSERT INTO `jadwal_konsultasi` (`id_jadwal`, `id_dokter`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `status`, `ruang`) VALUES
(1, 1, '2026-01-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(2, 2, '2026-01-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(3, 1, '2026-01-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(4, 2, '2026-01-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(5, 1, '2026-01-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(6, 2, '2026-01-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(7, 1, '2026-01-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(8, 2, '2026-01-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(9, 1, '2026-01-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(10, 2, '2026-01-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(11, 1, '2026-01-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(12, 2, '2026-01-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(13, 1, '2026-01-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(14, 2, '2026-01-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(15, 1, '2026-01-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(16, 2, '2026-01-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(17, 1, '2026-01-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(18, 2, '2026-01-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(19, 1, '2026-01-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(20, 2, '2026-01-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(21, 1, '2026-01-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(22, 2, '2026-01-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(23, 1, '2026-01-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(24, 2, '2026-01-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(25, 1, '2026-01-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(26, 2, '2026-01-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(27, 1, '2026-01-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(28, 2, '2026-01-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(29, 1, '2026-01-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(30, 2, '2026-01-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(31, 1, '2026-01-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(32, 2, '2026-01-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(33, 1, '2026-01-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(34, 2, '2026-01-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(35, 1, '2026-01-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(36, 2, '2026-01-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(37, 1, '2026-01-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(38, 2, '2026-01-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(39, 1, '2026-01-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(40, 2, '2026-01-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(41, 1, '2026-01-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(42, 2, '2026-01-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(43, 1, '2026-01-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(44, 2, '2026-01-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(45, 1, '2026-02-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(46, 2, '2026-02-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(47, 1, '2026-02-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(48, 2, '2026-02-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(49, 1, '2026-02-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(50, 2, '2026-02-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(51, 1, '2026-02-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(52, 2, '2026-02-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(53, 1, '2026-02-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(54, 2, '2026-02-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(55, 1, '2026-02-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(56, 2, '2026-02-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(57, 1, '2026-02-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(58, 2, '2026-02-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(59, 1, '2026-02-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(60, 2, '2026-02-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(61, 1, '2026-02-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(62, 2, '2026-02-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(63, 1, '2026-02-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(64, 2, '2026-02-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(65, 1, '2026-02-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(66, 2, '2026-02-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(67, 1, '2026-02-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(68, 2, '2026-02-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(69, 1, '2026-02-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(70, 2, '2026-02-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(71, 1, '2026-02-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(72, 2, '2026-02-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(73, 1, '2026-02-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(74, 2, '2026-02-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(75, 1, '2026-02-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(76, 2, '2026-02-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(77, 1, '2026-02-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(78, 2, '2026-02-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(79, 1, '2026-02-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(80, 2, '2026-02-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(81, 1, '2026-02-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(82, 2, '2026-02-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(83, 1, '2026-02-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(84, 2, '2026-02-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(85, 1, '2026-03-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(86, 2, '2026-03-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(87, 1, '2026-03-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(88, 2, '2026-03-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(89, 1, '2026-03-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(90, 2, '2026-03-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(91, 1, '2026-03-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(92, 2, '2026-03-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(93, 1, '2026-03-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(94, 2, '2026-03-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(95, 1, '2026-03-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(96, 2, '2026-03-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(97, 1, '2026-03-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(98, 2, '2026-03-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(99, 1, '2026-03-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(100, 2, '2026-03-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(101, 1, '2026-03-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(102, 2, '2026-03-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(103, 1, '2026-03-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(104, 2, '2026-03-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(105, 1, '2026-03-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(106, 2, '2026-03-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(107, 1, '2026-03-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(108, 2, '2026-03-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(109, 1, '2026-03-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(110, 2, '2026-03-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(111, 1, '2026-03-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(112, 2, '2026-03-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(113, 1, '2026-03-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(114, 2, '2026-03-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(115, 1, '2026-03-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(116, 2, '2026-03-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(117, 1, '2026-03-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(118, 2, '2026-03-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(119, 1, '2026-03-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(120, 2, '2026-03-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(121, 1, '2026-03-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(122, 2, '2026-03-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(123, 1, '2026-03-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(124, 2, '2026-03-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(125, 1, '2026-03-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(126, 2, '2026-03-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(127, 1, '2026-03-31', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(128, 2, '2026-03-31', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(129, 1, '2026-04-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(130, 2, '2026-04-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(131, 1, '2026-04-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(132, 2, '2026-04-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(133, 1, '2026-04-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(134, 2, '2026-04-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(135, 1, '2026-04-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(136, 2, '2026-04-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(137, 1, '2026-04-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(138, 2, '2026-04-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(139, 1, '2026-04-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(140, 2, '2026-04-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(141, 1, '2026-04-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(142, 2, '2026-04-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(143, 1, '2026-04-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(144, 2, '2026-04-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(145, 1, '2026-04-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(146, 2, '2026-04-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(147, 1, '2026-04-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(148, 2, '2026-04-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(149, 1, '2026-04-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(150, 2, '2026-04-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(151, 1, '2026-04-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(152, 2, '2026-04-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(153, 1, '2026-04-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(154, 2, '2026-04-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(155, 1, '2026-04-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(156, 2, '2026-04-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(157, 1, '2026-04-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(158, 2, '2026-04-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(159, 1, '2026-04-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(160, 2, '2026-04-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(161, 1, '2026-04-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(162, 2, '2026-04-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(163, 1, '2026-04-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(164, 2, '2026-04-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(165, 1, '2026-04-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(166, 2, '2026-04-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(167, 1, '2026-04-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(168, 2, '2026-04-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(169, 1, '2026-04-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(170, 2, '2026-04-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(171, 1, '2026-04-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(172, 2, '2026-04-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(173, 1, '2026-05-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(174, 2, '2026-05-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(175, 1, '2026-05-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(176, 2, '2026-05-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(177, 1, '2026-05-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(178, 2, '2026-05-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(179, 1, '2026-05-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(180, 2, '2026-05-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(181, 1, '2026-05-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(182, 2, '2026-05-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(183, 1, '2026-05-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(184, 2, '2026-05-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(185, 1, '2026-05-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(186, 2, '2026-05-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(187, 1, '2026-05-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(188, 2, '2026-05-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(189, 1, '2026-05-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(190, 2, '2026-05-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(191, 1, '2026-05-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(192, 2, '2026-05-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(193, 1, '2026-05-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(194, 2, '2026-05-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(195, 1, '2026-05-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(196, 2, '2026-05-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(197, 1, '2026-05-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(198, 2, '2026-05-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(199, 1, '2026-05-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(200, 2, '2026-05-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(201, 1, '2026-05-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(202, 2, '2026-05-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(203, 1, '2026-05-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(204, 2, '2026-05-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(205, 1, '2026-05-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(206, 2, '2026-05-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(207, 1, '2026-05-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(208, 2, '2026-05-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(209, 1, '2026-05-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(210, 2, '2026-05-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(211, 1, '2026-05-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(212, 2, '2026-05-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(213, 1, '2026-05-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(214, 2, '2026-05-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(215, 1, '2026-06-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(216, 2, '2026-06-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(217, 1, '2026-06-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(218, 2, '2026-06-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(219, 1, '2026-06-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(220, 2, '2026-06-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(221, 1, '2026-06-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(222, 2, '2026-06-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(223, 1, '2026-06-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(224, 2, '2026-06-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(225, 1, '2026-06-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(226, 2, '2026-06-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(227, 1, '2026-06-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(228, 2, '2026-06-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(229, 1, '2026-06-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(230, 2, '2026-06-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(231, 1, '2026-06-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(232, 2, '2026-06-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(233, 1, '2026-06-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(234, 2, '2026-06-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(235, 1, '2026-06-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(236, 2, '2026-06-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(237, 1, '2026-06-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(238, 2, '2026-06-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(239, 1, '2026-06-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(240, 2, '2026-06-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(241, 1, '2026-06-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(242, 2, '2026-06-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(243, 1, '2026-06-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(244, 2, '2026-06-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(245, 1, '2026-06-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(246, 2, '2026-06-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(247, 1, '2026-06-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(248, 2, '2026-06-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(249, 1, '2026-06-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(250, 2, '2026-06-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(251, 1, '2026-06-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(252, 2, '2026-06-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(253, 1, '2026-06-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(254, 2, '2026-06-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(255, 1, '2026-06-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(256, 2, '2026-06-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(257, 1, '2026-06-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(258, 2, '2026-06-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(259, 1, '2026-07-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(260, 2, '2026-07-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(261, 1, '2026-07-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(262, 2, '2026-07-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(263, 1, '2026-07-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(264, 2, '2026-07-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(265, 1, '2026-07-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(266, 2, '2026-07-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(267, 1, '2026-07-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(268, 2, '2026-07-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(269, 1, '2026-07-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(270, 2, '2026-07-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(271, 1, '2026-07-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(272, 2, '2026-07-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(273, 1, '2026-07-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(274, 2, '2026-07-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(275, 1, '2026-07-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(276, 2, '2026-07-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(277, 1, '2026-07-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(278, 2, '2026-07-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(279, 1, '2026-07-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(280, 2, '2026-07-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(281, 1, '2026-07-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(282, 2, '2026-07-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(283, 1, '2026-07-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(284, 2, '2026-07-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(285, 1, '2026-07-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(286, 2, '2026-07-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(287, 1, '2026-07-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(288, 2, '2026-07-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(289, 1, '2026-07-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(290, 2, '2026-07-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(291, 1, '2026-07-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(292, 2, '2026-07-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(293, 1, '2026-07-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(294, 2, '2026-07-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(295, 1, '2026-07-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(296, 2, '2026-07-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(297, 1, '2026-07-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(298, 2, '2026-07-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(299, 1, '2026-07-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(300, 2, '2026-07-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(301, 1, '2026-07-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(302, 2, '2026-07-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(303, 1, '2026-07-31', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(304, 2, '2026-07-31', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(305, 1, '2026-08-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(306, 2, '2026-08-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(307, 1, '2026-08-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(308, 2, '2026-08-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(309, 1, '2026-08-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(310, 2, '2026-08-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(311, 1, '2026-08-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(312, 2, '2026-08-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(313, 1, '2026-08-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(314, 2, '2026-08-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(315, 1, '2026-08-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(316, 2, '2026-08-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(317, 1, '2026-08-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(318, 2, '2026-08-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(319, 1, '2026-08-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(320, 2, '2026-08-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(321, 1, '2026-08-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(322, 2, '2026-08-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(323, 1, '2026-08-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(324, 2, '2026-08-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(325, 1, '2026-08-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(326, 2, '2026-08-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(327, 1, '2026-08-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(328, 2, '2026-08-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(329, 1, '2026-08-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(330, 2, '2026-08-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(331, 1, '2026-08-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(332, 2, '2026-08-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(333, 1, '2026-08-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(334, 2, '2026-08-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(335, 1, '2026-08-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(336, 2, '2026-08-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(337, 1, '2026-08-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(338, 2, '2026-08-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(339, 1, '2026-08-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(340, 2, '2026-08-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(341, 1, '2026-08-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(342, 2, '2026-08-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(343, 1, '2026-08-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(344, 2, '2026-08-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(345, 1, '2026-08-31', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(346, 2, '2026-08-31', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(347, 1, '2026-09-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(348, 2, '2026-09-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(349, 1, '2026-09-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(350, 2, '2026-09-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(351, 1, '2026-09-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(352, 2, '2026-09-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(353, 1, '2026-09-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(354, 2, '2026-09-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(355, 1, '2026-09-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(356, 2, '2026-09-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(357, 1, '2026-09-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(358, 2, '2026-09-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(359, 1, '2026-09-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(360, 2, '2026-09-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(361, 1, '2026-09-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(362, 2, '2026-09-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(363, 1, '2026-09-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(364, 2, '2026-09-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(365, 1, '2026-09-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(366, 2, '2026-09-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(367, 1, '2026-09-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(368, 2, '2026-09-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(369, 1, '2026-09-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(370, 2, '2026-09-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(371, 1, '2026-09-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(372, 2, '2026-09-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(373, 1, '2026-09-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(374, 2, '2026-09-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(375, 1, '2026-09-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(376, 2, '2026-09-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(377, 1, '2026-09-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(378, 2, '2026-09-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(379, 1, '2026-09-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(380, 2, '2026-09-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(381, 1, '2026-09-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(382, 2, '2026-09-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(383, 1, '2026-09-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(384, 2, '2026-09-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(385, 1, '2026-09-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(386, 2, '2026-09-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(387, 1, '2026-09-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(388, 2, '2026-09-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(389, 1, '2026-09-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(390, 2, '2026-09-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(391, 1, '2026-10-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(392, 2, '2026-10-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(393, 1, '2026-10-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(394, 2, '2026-10-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(395, 1, '2026-10-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(396, 2, '2026-10-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(397, 1, '2026-10-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(398, 2, '2026-10-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(399, 1, '2026-10-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(400, 2, '2026-10-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(401, 1, '2026-10-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(402, 2, '2026-10-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(403, 1, '2026-10-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(404, 2, '2026-10-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(405, 1, '2026-10-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(406, 2, '2026-10-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(407, 1, '2026-10-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(408, 2, '2026-10-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(409, 1, '2026-10-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(410, 2, '2026-10-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(411, 1, '2026-10-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(412, 2, '2026-10-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(413, 1, '2026-10-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(414, 2, '2026-10-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(415, 1, '2026-10-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(416, 2, '2026-10-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(417, 1, '2026-10-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(418, 2, '2026-10-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(419, 1, '2026-10-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(420, 2, '2026-10-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(421, 1, '2026-10-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(422, 2, '2026-10-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(423, 1, '2026-10-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(424, 2, '2026-10-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(425, 1, '2026-10-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(426, 2, '2026-10-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(427, 1, '2026-10-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(428, 2, '2026-10-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(429, 1, '2026-10-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(430, 2, '2026-10-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(431, 1, '2026-10-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(432, 2, '2026-10-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(433, 1, '2026-10-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(434, 2, '2026-10-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(435, 1, '2026-11-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(436, 2, '2026-11-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(437, 1, '2026-11-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(438, 2, '2026-11-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(439, 1, '2026-11-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(440, 2, '2026-11-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(441, 1, '2026-11-05', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(442, 2, '2026-11-05', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(443, 1, '2026-11-06', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(444, 2, '2026-11-06', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(445, 1, '2026-11-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(446, 2, '2026-11-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(447, 1, '2026-11-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(448, 2, '2026-11-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(449, 1, '2026-11-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(450, 2, '2026-11-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(451, 1, '2026-11-12', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(452, 2, '2026-11-12', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(453, 1, '2026-11-13', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(454, 2, '2026-11-13', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(455, 1, '2026-11-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(456, 2, '2026-11-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(457, 1, '2026-11-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(458, 2, '2026-11-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(459, 1, '2026-11-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(460, 2, '2026-11-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(461, 1, '2026-11-19', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(462, 2, '2026-11-19', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(463, 1, '2026-11-20', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(464, 2, '2026-11-20', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(465, 1, '2026-11-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(466, 2, '2026-11-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(467, 1, '2026-11-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(468, 2, '2026-11-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(469, 1, '2026-11-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(470, 2, '2026-11-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(471, 1, '2026-11-26', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(472, 2, '2026-11-26', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(473, 1, '2026-11-27', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(474, 2, '2026-11-27', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(475, 1, '2026-11-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(476, 2, '2026-11-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(477, 1, '2026-12-01', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(478, 2, '2026-12-01', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(479, 1, '2026-12-02', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(480, 2, '2026-12-02', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(481, 1, '2026-12-03', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(482, 2, '2026-12-03', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(483, 1, '2026-12-04', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(484, 2, '2026-12-04', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(485, 1, '2026-12-07', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(486, 2, '2026-12-07', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(487, 1, '2026-12-08', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(488, 2, '2026-12-08', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(489, 1, '2026-12-09', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(490, 2, '2026-12-09', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(491, 1, '2026-12-10', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(492, 2, '2026-12-10', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(493, 1, '2026-12-11', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(494, 2, '2026-12-11', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(495, 1, '2026-12-14', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(496, 2, '2026-12-14', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(497, 1, '2026-12-15', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(498, 2, '2026-12-15', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(499, 1, '2026-12-16', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(500, 2, '2026-12-16', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(501, 1, '2026-12-17', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(502, 2, '2026-12-17', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(503, 1, '2026-12-18', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(504, 2, '2026-12-18', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(505, 1, '2026-12-21', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(506, 2, '2026-12-21', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(507, 1, '2026-12-22', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(508, 2, '2026-12-22', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(509, 1, '2026-12-23', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(510, 2, '2026-12-23', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(511, 1, '2026-12-24', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(512, 2, '2026-12-24', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(513, 1, '2026-12-25', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(514, 2, '2026-12-25', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(515, 1, '2026-12-28', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(516, 2, '2026-12-28', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(517, 1, '2026-12-29', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(518, 2, '2026-12-29', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2'),
(519, 1, '2026-12-30', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 1'),
(520, 2, '2026-12-30', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 2'),
(521, 1, '2026-12-31', '13:00:00', '17:00:00', 'Aktif', 'Poliklinik Umum 1'),
(522, 2, '2026-12-31', '08:00:00', '11:00:00', 'Aktif', 'Poliklinik Umum 2');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text,
  `nik` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `id_user`, `nama_pasien`, `jenis_kelamin`, `no_hp`, `tanggal_lahir`, `alamat`, `nik`) VALUES
(1, 3, 'Minggu', 'Laki-laki', '081222333444', '1998-05-20', 'Jl. Sehat No. 5', ''),
(2, 4, 'Jono', 'Laki-laki', '081555666777', '1999-06-21', 'Jl. Maju No. 2', ''),
(3, 5, 'Aisyah', 'Perempuan', '081777888999', '2001-08-22', 'Jl. Indah No. 3', ''),
(23, 49, 'Guruh', 'Laki-laki', '08813719233', '2002-06-18', 'JL SELAMET PERUMAHAN RANCABALI NO. 40', '3203012503770011');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `id_pemeriksaan` int NOT NULL,
  `id_antrian` int DEFAULT NULL,
  `id_user` int NOT NULL,
  `diagnosa` text,
  `tindakan` text,
  `tanggal_pemeriksaan` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemeriksaan`
--

INSERT INTO `pemeriksaan` (`id_pemeriksaan`, `id_antrian`, `id_user`, `diagnosa`, `tindakan`, `tanggal_pemeriksaan`) VALUES
(1, 1, 0, 'Common Cold', 'Pemberian obat flu dan vitamin C', '2024-05-20 09:30:00'),
(2, 2, 0, 'Bronchitis', 'Pemberian ekspektoran dan antibiotik', '2024-05-21 10:15:00'),
(3, 3, 0, 'Migraine', 'Pemberian parasetamol dan anjuran istirahat', '2024-05-22 11:00:00'),
(4, 4, 0, 'demam', 'memberi obat demam', '2026-06-12 01:54:13'),
(5, 5, 0, '1. diare', '1. memberi obat', '2026-06-12 08:13:40'),
(6, 7, 0, '1. pilek', '1. dikasih obat alergi', '2026-06-12 20:42:27'),
(7, 3, 1, '1. migrain', '1. pemberian obat', '2026-06-18 16:27:27');

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_rekam_medis` int NOT NULL,
  `id_pasien` int DEFAULT NULL,
  `id_dokter` int DEFAULT NULL,
  `id_pemeriksaan` int DEFAULT NULL,
  `tanggal` date NOT NULL,
  `keluhan` text,
  `diagnosa` text,
  `tindakan` text,
  `catatan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id_rekam_medis`, `id_pasien`, `id_dokter`, `id_pemeriksaan`, `tanggal`, `keluhan`, `diagnosa`, `tindakan`, `catatan`) VALUES
(1, 1, 1, 1, '2024-05-20', 'Demam tinggi semenjak kemarin malam', 'Common Cold', 'Pemberian obat flu dan vitamin C', 'Pasien dianjurkan istirahat selama 3 hari.'),
(2, 2, 1, 2, '2024-05-21', 'Batuk kering disertai radang tenggorokan', 'Bronchitis', 'Pemberian ekspektoran dan antibiotik', 'Kontrol kembali jika batuk berlanjut lebih dari 7 hari.'),
(3, 3, 1, 3, '2024-05-22', 'Sakit kepala sebelah kiri (migrain)', 'Migraine', 'Pemberian parasetamol dan anjuran istirahat', 'Hindari paparan cahaya berlebih saat sakit kepala menyerang.'),
(7, 3, 1, 7, '2026-06-18', 'Sakit kepala sebelah kiri (migrain)', '1. migrain', '1. pemberian obat', '');

-- --------------------------------------------------------

--
-- Table structure for table `resep_obat`
--

CREATE TABLE `resep_obat` (
  `id_resep` int NOT NULL,
  `id_pasien` int DEFAULT NULL,
  `id_dokter` int DEFAULT NULL,
  `obat` text NOT NULL,
  `aturan_pakai` varchar(255) DEFAULT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `resep_obat`
--

INSERT INTO `resep_obat` (`id_resep`, `id_pasien`, `id_dokter`, `obat`, `aturan_pakai`, `tanggal`) VALUES
(1, 1, 1, 'Paracetamol 500mg, Vitamin C 500mg', '3x1 tablet setelah makan', '2024-05-20'),
(2, 2, 1, 'Amoxicillin 500mg, Bromhexine HCL', '3x1 tablet setelah makan (Amoxicillin harus dihabiskan)', '2024-05-21'),
(3, 3, 1, 'Ibuprofen 400mg', '2x1 tablet setelah makan jika sakit kepala menyerang', '2024-05-22'),
(4, 2, 1, 'mefenamic acid 500mg', '3x sehari 1 kapsul', '2026-06-12'),
(7, 3, 1, '1. paracetamol 500mg (Jml: 10)', 'paracetamol: 3x sehari 1 tablet', '2026-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `surat_rujukan`
--

CREATE TABLE `surat_rujukan` (
  `id_rujukan` int NOT NULL,
  `id_pasien` int DEFAULT NULL,
  `id_dokter` int DEFAULT NULL,
  `rs_tujuan` varchar(150) NOT NULL,
  `diagnosa` text NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `surat_rujukan`
--

INSERT INTO `surat_rujukan` (`id_rujukan`, `id_pasien`, `id_dokter`, `rs_tujuan`, `diagnosa`, `tanggal`) VALUES
(1, 1, 1, 'RS Umum Daerah', 'Penyakit dalam tingkat lanjut', '2023-11-05'),
(2, 2, 1, 'RSUD KOTA DEPOK', 'Bronchitis Kronis - Evaluasi Spesialis Paru', '2024-05-21'),
(3, 3, 1, 'RS ADVENT BANDUNG', 'Migraine Spesifik - Evaluasi Spesialis Saraf', '2024-05-22');

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` int NOT NULL,
  `id_pasien` int DEFAULT NULL,
  `id_antrian` int DEFAULT NULL,
  `biaya_pemeriksaan` decimal(10,2) NOT NULL,
  `biaya_admin` decimal(10,2) NOT NULL,
  `total_tagihan` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `id_pasien`, `id_antrian`, `biaya_pemeriksaan`, `biaya_admin`, `total_tagihan`, `status`, `tanggal`) VALUES
(1, 1, 1, '100000.00', '15000.00', '115000.00', 'Lunas', '2024-05-20'),
(2, 2, 2, '150000.00', '15000.00', '165000.00', 'Lunas', '2024-05-21'),
(3, 3, 3, '120000.00', '15000.00', '135000.00', 'Lunas', '2024-05-22'),
(7, 3, 3, '100000.00', '15000.00', '115000.00', 'Lunas', '2026-06-18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `nama_role` enum('admin','dokter','pasien') NOT NULL DEFAULT 'pasien',
  `id_pasien` int DEFAULT NULL,
  `id_dokter` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_admin`, `no_hp`, `nama_role`, `id_pasien`, `id_dokter`) VALUES
(1, 'admin', 'admin', '', '', 'admin', NULL, NULL),
(2, 'dokter1', 'dokter', '', '', 'dokter', NULL, 1),
(3, 'pasien1', 'pasien1', '', '', 'pasien', 1, NULL),
(4, 'pasien2', 'pasien', '', '', 'pasien', 2, NULL),
(5, 'pasien3', 'pasien', '', '', 'pasien', 3, NULL),
(49, '08813719233', '123456', '-', '08813719233', 'pasien', 23, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id_antrian`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`id_pemeriksaan`),
  ADD KEY `id_antrian` (`id_antrian`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id_rekam_medis`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pemeriksaan` (`id_pemeriksaan`);

--
-- Indexes for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD PRIMARY KEY (`id_resep`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `surat_rujukan`
--
ALTER TABLE `surat_rujukan`
  ADD PRIMARY KEY (`id_rujukan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_antrian` (`id_antrian`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `fk_user_pasien` (`id_pasien`),
  ADD KEY `fk_user_dokter` (`id_dokter`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id_antrian` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  MODIFY `id_jadwal` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  MODIFY `id_pemeriksaan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id_rekam_medis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `resep_obat`
--
ALTER TABLE `resep_obat`
  MODIFY `id_resep` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `surat_rujukan`
--
ALTER TABLE `surat_rujukan`
  MODIFY `id_rujukan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tagihan`
--
ALTER TABLE `tagihan`
  MODIFY `id_tagihan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `antrian_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `antrian_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `jadwal_konsultasi`
--
ALTER TABLE `jadwal_konsultasi`
  ADD CONSTRAINT `jadwal_konsultasi_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pasien`
--
ALTER TABLE `pasien`
  ADD CONSTRAINT `pasien_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD CONSTRAINT `pemeriksaan_ibfk_1` FOREIGN KEY (`id_antrian`) REFERENCES `antrian` (`id_antrian`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `rekam_medis_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `rekam_medis_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `rekam_medis_ibfk_3` FOREIGN KEY (`id_pemeriksaan`) REFERENCES `pemeriksaan` (`id_pemeriksaan`);

--
-- Constraints for table `resep_obat`
--
ALTER TABLE `resep_obat`
  ADD CONSTRAINT `resep_obat_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `resep_obat_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `surat_rujukan`
--
ALTER TABLE `surat_rujukan`
  ADD CONSTRAINT `surat_rujukan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `surat_rujukan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `tagihan_ibfk_2` FOREIGN KEY (`id_antrian`) REFERENCES `antrian` (`id_antrian`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_user_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
