-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2024 at 03:50 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasakhir`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokumens`
--

CREATE TABLE `dokumens` (
  `id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `judul_dokumen` varchar(255) NOT NULL,
  `deskripsi_dokumen` text NOT NULL,
  `kategori_dokumen` varchar(255) NOT NULL,
  `validasi_dokumen` varchar(255) NOT NULL,
  `tahun_dokumen` year(4) NOT NULL,
  `dokumen_file` varchar(255) DEFAULT NULL,
  `dokumen_link` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokumens`
--

INSERT INTO `dokumens` (`id`, `created_by`, `judul_dokumen`, `deskripsi_dokumen`, `kategori_dokumen`, `validasi_dokumen`, `tahun_dokumen`, `dokumen_file`, `dokumen_link`, `tags`, `view`, `status`, `created_at`, `updated_at`) VALUES
(102, 'super user', 'Perbaikkan', 'Deskripsi Dokumen tujuan', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen tujuan.pdf', '', 'dokumen tujuan', '', 'active', '2024-06-19 01:29:10', '2024-06-19 01:29:54'),
(106, 'dosen1', 'Kurikulum TEKKOM', 'Deskripsi kurikulum', 'Dokumen Pendidikan', 'Ketua Jurusan', 2024, 'Dokumen Materi.pdf', '', 'kurikulum, Tekkom', '', 'active', '2024-06-19 02:34:50', '2024-06-19 02:43:36'),
(108, 'dosen1', 'Materi TRPL', 'Dokumen materi', 'Dokumen Pendidikan', 'Ketua Program Studi', 2023, 'Dokumen Materi.pdf', '', 'materi, TRPL', 'Sekretaris Jurusan', 'active', '2024-06-19 02:43:22', '2024-06-27 03:21:03'),
(110, 'mhs1', 'sertifikat penghargaan', 'sertifikat nasional', 'Dokumen Pendidikan', 'Lainnya', 2021, 'Dokumen sertifikat.pdf', '', 'sertifikat, dokumen', '', 'active', '2024-06-19 02:51:02', '2024-06-19 02:51:02'),
(112, 'adm1', 'absensi mahasiswa', 'absensi mahasiswa jurusan', 'Dokumen Pendidikan', 'Ketua Jurusan', 2022, 'Dokumen absensi.pdf', '', 'absensi, jurusan,absensi', '', 'active', '2024-06-19 03:14:11', '2024-06-19 03:14:11'),
(113, 'Kaprodi2', 'pembangunan kelas', 'deskripsi', 'Dokumen Sarana Prasarana', 'Lainnya', 2024, 'Dokumen_mahasiswa.pdf', '', 'pembangunan, kelas', '', 'active', '2024-06-19 03:17:16', '2024-06-24 10:39:42'),
(115, 'admin', 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen_pembangunan.pdf', NULL, 'tag, dokumen', 'Sekretaris Jurusan', 'active', '2024-06-19 03:47:45', '2024-06-27 02:39:39'),
(116, 'super user', 'Dokumen testing', 'Ini adalah deskripsi dokumen testing', 'Dokumen Tata Pamong', 'Ketua Jurusan', 2023, 'Kartu Pendaftaran DTS.pdf', '', 'testing, satu, dua', '', 'active', '2024-06-19 05:07:59', '2024-06-19 05:07:59'),
(117, 'Kaprodi1', 'Dokumen Keuangan', 'Deskripsi Dokumen', 'Dokumen Keuangan', 'Ketua Jurusan', 2025, 'Dokumen absensi.pdf', '', 'keuangan jurusan', '', 'active', '2024-06-19 21:41:50', '2024-06-19 22:11:29'),
(120, 'super user', 'Dokumen testing', 'Ini adalah deskripsi dokumen testing', 'Dokumen Tata Pamong', 'Ketua Jurusan', 2023, 'Kartu Pendaftaran DTS.pdf', '', 'testing, satu, dua', '', 'active', '2024-06-20 06:21:52', '2024-06-20 06:21:52'),
(121, 'super user', 'Dokumen Keuangan edit', 'Dokumen berisi keuangan', 'Dokumen Keuangan', 'Direktur', 2023, 'Dokumen pembangunan.pdf', '', 'Keuangan', '', 'active', '2024-06-20 07:43:08', '2024-06-20 07:43:08'),
(123, 'super user', 'visi misi jurusan', 'Deksripsi Dokumen', 'Dokumen Visi Misi', 'Ketua Jurusan', 2023, 'Dokumen tujuan.pdf', '', 'visi misi', '', 'active', '2024-06-20 08:06:33', '2024-06-20 08:06:33'),
(124, 'super user', 'Dokumen Penelitian', 'Dokumen berisi penelitian', 'Dokumen Penelitian', 'Direktur', 2023, 'Dokumen Internal.pdf', '', 'Penelitian', '', 'active', '2024-06-20 08:22:36', '2024-06-20 08:22:36'),
(125, 'super user', 'Dokumen testing', 'Ini adalah deskripsi dokumen testing', 'Dokumen Tata Pamong', 'Ketua Jurusan', 2023, 'Kartu Pendaftaran DTS.pdf', '', 'testing, satu, dua', '', 'active', '2024-06-20 12:11:12', '2024-06-20 12:11:12'),
(126, 'super user', 'Dokumen Edit', 'Dokumen berisi laporan', 'Dokumen Mahasiswa', 'Direktur', 2023, 'Dokumen pembangunan.pdf', '', 'dokumen', '', 'active', '2024-06-20 12:23:46', '2024-06-20 12:23:46'),
(127, 'mahasiswa2', 'Sertifikat', 'berisi sertifikat', 'Dokumen Pendidikan', 'Direktur', 2020, 'Dokumen mahasiswa.pdf', '', 'sertifikat', 'Sekretaris Jurusan', 'active', '2024-06-22 03:13:31', '2024-06-27 03:30:56'),
(129, 'Kaprodi1', 'dokumen private', 'deskripsi', 'Dokumen Tujuan', 'Ketua Program Studi', 2023, 'Dokumen Internal.pdf', '', 'private', 'Ketua Program Studi,Ketua Jurusan', 'active', '2024-06-24 01:56:51', '2024-06-27 02:41:24'),
(131, 'Kaprodi2', 'Kurikulum MI update file', 'Deskripsi kurikulum', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen_Kurikulum.pdf', '', 'kurikulum, dokumen, mi', '', 'active', '2024-06-24 09:28:07', '2024-06-25 09:56:00'),
(137, 'Kaprodi2', 'Dokumen Absen', 'Deskripsi Dokumen', 'Dokumen Strategi', 'Direktur', 2022, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'sertifikat, mahasiswa', 'kaprodi', 'active', '2024-06-25 03:54:14', '2024-06-26 01:37:42'),
(138, 'Kaprodi2', 'Sertifikat', 'deskripsi dokumen sertifikat', 'Dokumen Pendidikan', 'Ketua Program Studi', 2022, 'Dokumen_Internal.pdf', NULL, 'sertifikat, mahasiswa', 'kajur', 'active', '2024-06-25 04:02:32', '2024-06-26 01:35:51'),
(141, 'Kaprodi2', 'Dokumen Mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'sertifikat, mahasiswa', 'sekjur,kaprodi', 'active', '2024-06-25 05:50:05', '2024-06-26 01:33:42'),
(146, 'Kaprodi2', 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'dokumen, laporan', 'kajur,sekjur', 'active', '2024-06-26 00:11:04', '2024-06-26 01:29:32'),
(147, 'Ketua Jurusan1', 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'kegiatan', 'kajur,sekjur', 'active', '2024-06-26 02:06:50', '2024-06-26 02:22:57'),
(148, 'Ketua Jurusan1', 'Dokumen Laporan', 'Deskripsi Dokumen', 'Dokumen Mahasiswa', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'dokumen, laporan', 'kajur,sekjur,kaprodi', 'active', '2024-06-26 04:24:29', '2024-06-26 04:25:19'),
(149, 'Kaprodi2', 'absensi mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'dokumen, laporan', '', 'active', '2024-06-26 21:38:23', '2024-06-26 21:38:43'),
(150, 'Kaprodi2', 'absensi mahasiswa TRPL', 'Deskripsi Dokumen', 'Dokumen Mahasiswa', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Tenaga Pendidik,Administrasi', 'active', '2024-06-26 22:44:57', '2024-06-26 22:44:57'),
(151, 'Kaprodi2', 'absensi mahasiswa MI', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA-FINAL-BANGET', 'dokumen, laporan', 'Dosen', 'active', '2024-06-27 00:37:35', '2024-06-27 00:37:35'),
(153, 'Ketua Jurusan1', 'absensi mahasiswa MI', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Jurusan', 'active', '2024-06-27 00:45:59', '2024-06-27 00:45:59'),
(154, 'Ketua Jurusan1', 'absensi mahasiswa MI', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Jurusan', 'active', '2024-06-27 00:47:04', '2024-06-27 00:47:04'),
(155, 'Sekjur1', 'absensi mahasiswa TEKKOM', 'Deskripsi Dokumen', 'Dokumen Tata Pamong', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Ketua Jurusan,Dosen', 'active', '2024-06-27 00:50:39', '2024-06-27 00:50:39'),
(156, 'Ketua Jurusan1', 'absensi mahasiswa Jurusan', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen_Internal.pdf', NULL, 'dokumen, laporan', '', 'active', '2024-06-27 01:01:13', '2024-06-27 20:30:29'),
(157, 'dosen1', 'absensi mahasiswa Jurusan TI', 'Deskripsi Dokumen', 'Dokumen Pendidikan', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Program Studi', 'active', '2024-06-27 01:11:57', '2024-06-27 03:22:45'),
(158, 'dosen1', 'Judul Dokumen', 'Deskripsi Dokumen', 'Dokumen Pendidikan', 'Ketua Jurusan', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen', 'Ketua Program Studi', 'active', '2024-06-27 01:24:23', '2024-06-27 01:24:23'),
(159, 'Kaprodi1', 'Judul Dokumen test', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA-FINAL-BANGET', 'dokumen', 'Ketua Jurusan', 'active', '2024-06-27 01:39:25', '2024-06-27 01:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `id` int(11) NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `judul_dokumen` varchar(225) CHARACTER SET utf8mb4 NOT NULL,
  `deskripsi_dokumen` text CHARACTER SET utf8mb4 NOT NULL,
  `kategori_dokumen` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `validasi_dokumen` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `tahun_dokumen` year(4) NOT NULL,
  `dokumen_file` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `status` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `draft`
--

INSERT INTO `draft` (`id`, `created_by`, `judul_dokumen`, `deskripsi_dokumen`, `kategori_dokumen`, `validasi_dokumen`, `tahun_dokumen`, `dokumen_file`, `tags`, `status`, `updated_at`, `created_at`) VALUES
(31, 'Ketua Jurusan', 'Dokumen Contoh', 'Contoh', 'Dokumen Keuangan', 'Kelompok Bidang Keahlian', 2022, 'DAFTAR PUSTAKA.pdf', 'Contoh', 'draft', '2024-06-16 20:44:30', '2024-06-16 20:44:30'),
(37, 'Ketua Jurusan', 'Dokumen Mahasiswa', 'Dokumen berisi mahasiswa', 'Dokumen Mahasiswa', 'Ketua Jurusan', 2023, 'Dokumen Mahasiswa.pdf', 'Mahasiswa', 'draft', '2024-06-19 01:36:25', '2024-06-19 01:36:25'),
(38, 'Sekjur1', 'Mahasiswa Jurusan TI', 'Deksripsi Dokumen', 'Dokumen Mahasiswa', 'Ketua Jurusan', 2020, 'Dokumen mahasiswa.pdf', 'mahasiswa, dokumen', 'draft', '2024-06-19 01:39:46', '2024-06-19 01:39:46'),
(47, 'Adm', 'Dokumen Tata Pamong', 'Dokumen berisi tata pamong', 'Dokumen Tata Pamong', 'Adm', 2023, 'Dokumen Tata Pamong.pdf', 'Tata Pamong', 'draft', '2024-06-19 07:29:19', '2024-06-19 07:29:19'),
(55, 'Mahasiswa', 'Dokumen Pengabdian Kepada Masyarakat', 'Dokumen berisi pengabdian kepada masyarakat', 'Dokumen Pengabdian Kepada Masyarakat', 'Mahasiswa', 2023, 'Dokumen Pengabdian Kepada Masyarakat.pdf', 'Pengabdian Kepada Masyarakat', 'draft', '2024-06-20 08:04:57', '2024-06-20 08:04:57'),
(57, 'Enji', 'Dokumen Pendidikan', 'Dokumen berisi pendidikan', 'Dokumen Pendidikan', 'Ketua Jurusan', 2023, 'Dokumen Pendidikan.pdf', 'Pendidikan', 'draft', '2024-06-20 12:21:02', '2024-06-20 12:21:02'),
(59, 'super user', 'Dokumen Visi Misi', 'Dokumen berisi visi dan misi', 'Dokumen Visi Misi', 'Direktur', 2023, 'Dokumen tujuan.pdf', 'Visi Misi', 'draft', '2024-06-20 13:08:23', '2024-06-20 13:08:23'),
(60, 'Kaprodi1', 'Dokumen Internal', 'Deskripsi Internal', 'Dokumen Tata Kelola', 'Direktur', 2024, 'Kartu Pendaftaran DTS.pdf', 'edited_tag', 'draft', '2024-06-22 04:45:55', '2024-06-22 04:45:55'),
(61, 'Ketua Jurusan1', 'Dokumen SDM Update', 'Deskripsi Dokumen', 'Dokumen Sumber Daya Manusia', 'Direktur', 2023, 'Dokumen Internal.pdf', 'Dokumen, SDM', 'draft', '2024-06-24 01:54:42', '2024-06-24 01:54:42'),
(62, 'Kaprodi2', 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Kerjasama', 'Direktur', 2023, NULL, 'dokumen, laporan', 'draft', '2024-06-25 23:49:58', '2024-06-25 23:49:58'),
(63, 'Kaprodi2', 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Tata Kelola', 'Ketua Jurusan', 2023, NULL, 'dokumen, laporan', 'draft', '2024-06-25 23:50:27', '2024-06-25 23:50:27'),
(64, 'Kaprodi2', 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, 'dokumen, laporan', 'draft', '2024-06-26 00:06:55', '2024-06-26 00:06:55'),
(65, 'Kaprodi2', 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, 'dokumen, laporan', 'draft', '2024-06-26 00:10:50', '2024-06-26 00:10:50'),
(66, 'Ketua Jurusan1', 'absensi mahasiswa MI', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'dokumen, laporan', 'draft', '2024-06-27 00:41:32', '2024-06-27 00:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `dokumen_id` int(11) NOT NULL,
  `judul_dokumen` varchar(255) NOT NULL,
  `deskripsi_dokumen` text NOT NULL,
  `kategori_dokumen` varchar(255) NOT NULL,
  `validasi_dokumen` varchar(255) NOT NULL,
  `tahun_dokumen` int(11) NOT NULL,
  `dokumen_file` varchar(255) DEFAULT NULL,
  `dokumen_link` varchar(255) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `histories`
--

INSERT INTO `histories` (`id`, `created_by`, `dokumen_id`, `judul_dokumen`, `deskripsi_dokumen`, `kategori_dokumen`, `validasi_dokumen`, `tahun_dokumen`, `dokumen_file`, `dokumen_link`, `tags`, `view`, `created_at`, `updated_at`) VALUES
(23, NULL, 102, 'Perbaikkan', 'Deskripsi Dokumen tujuan', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen tujuan.pdf', NULL, 'dokumen tujuan', NULL, '2024-06-19 01:29:34', '2024-06-19 01:29:34'),
(24, NULL, 102, 'Perbaikkan', 'Deskripsi Dokumen tujuan', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen Internal.pdf', NULL, 'dokumen tujuan', NULL, '2024-06-19 01:29:54', '2024-06-19 01:29:54'),
(30, NULL, 106, 'Kurikulum TEKKOM', 'Deskripsi kurikulum', 'Dokumen Pendidikan', 'Ketua Jurusan', 2024, 'Dokumen Kurikulum.pdf', NULL, 'kurikulum, Tekkom', NULL, '2024-06-19 02:43:36', '2024-06-19 02:43:36'),
(33, NULL, 113, 'pembangunan kelas', 'deskripsi', 'Dokumen Sarana Prasarana', 'Lainnya', 2024, 'Dokumen pembangunan.pdf', NULL, 'pembangunan, kelas', NULL, '2024-06-19 03:18:00', '2024-06-19 03:18:00'),
(44, NULL, 115, 'Tujuan Test dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', NULL, 'tag', NULL, '2024-06-19 03:50:40', '2024-06-19 03:50:40'),
(45, NULL, 115, 'Tujuan Test dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', NULL, 'tag, dokumen', NULL, '2024-06-19 03:58:29', '2024-06-19 03:58:29'),
(46, NULL, 117, 'Dokumen Keuangan Tahunan', 'Deskripsi Dokumen', 'Dokumen Keuangan', 'Ketua Jurusan', 2024, 'Dokumen pembangunan.pdf', NULL, 'keuangan', NULL, '2024-06-19 21:42:11', '2024-06-19 21:42:11'),
(47, 'admin', 117, 'Dokumen Keuangan', 'Deskripsi Dokumen', 'Dokumen Keuangan', 'Ketua Jurusan', 2024, 'Dokumen absensi.pdf', NULL, 'keuangan', NULL, '2024-06-19 22:10:58', '2024-06-19 22:10:58'),
(48, 'Kaprodi1', 117, 'Dokumen Keuangan', 'Deskripsi Dokumen', 'Dokumen Keuangan', 'Ketua Jurusan', 2024, 'Dokumen absensi.pdf', NULL, 'keuangan jurusan', NULL, '2024-06-19 22:11:29', '2024-06-19 22:11:29'),
(71, 'mahasiswa2', 127, 'Sertifikat', 'berisi sertifikat', 'Dokumen Pendidikan', 'Lainnya', 2020, 'Dokumen mahasiswa.pdf', NULL, 'sertifikat', NULL, '2024-06-22 03:16:28', '2024-06-22 03:16:28'),
(84, 'admin', 113, 'pembangunan kelas', 'deskripsi', 'Dokumen Sarana Prasarana', 'Lainnya', 2024, 'Dokumen Internal.pdf', NULL, 'pembangunan, kelas', NULL, '2024-06-24 10:39:42', '2024-06-24 10:39:42'),
(93, 'Kaprodi2', 131, 'Kurikulum MI update file', 'Deskripsi kurikulum', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen tujuan.pdf', NULL, 'kurikulum, dokumen, mi', NULL, '2024-06-25 09:56:00', '2024-06-25 09:56:00'),
(97, NULL, 137, 'Dokumen Absen', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', NULL, '2024-06-25 03:54:35', '2024-06-25 03:54:35'),
(114, 'Kaprodi2', 138, 'Sertifikat', 'deskripsi dokumen sertifikat', 'Dokumen Pendidikan', 'Ketua Program Studi', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', NULL, '2024-06-25 05:35:46', '2024-06-25 05:35:46'),
(119, 'Kaprodi2', 141, 'Dokumen Mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', NULL, '2024-06-25 05:50:18', '2024-06-25 05:50:18'),
(120, 'Kaprodi2', 141, 'Dokumen Mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', 'sekjur,kaprodi,dosen', '2024-06-25 05:51:45', '2024-06-25 05:51:45'),
(121, 'Kaprodi2', 141, 'Dokumen Mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', 'sekjur,kaprodi', '2024-06-25 05:55:12', '2024-06-25 05:55:12'),
(122, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 00:37:56', '2024-06-26 00:37:56'),
(123, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 00:38:13', '2024-06-26 00:38:13'),
(124, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 00:41:32', '2024-06-26 00:41:32'),
(125, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 00:50:06', '2024-06-26 00:50:06'),
(126, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 00:59:59', '2024-06-26 00:59:59'),
(127, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 01:10:21', '2024-06-26 01:10:21'),
(128, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 01:17:03', '2024-06-26 01:17:03'),
(129, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 01:20:11', '2024-06-26 01:20:11'),
(130, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, NULL, NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 01:28:54', '2024-06-26 01:28:54'),
(131, 'Kaprodi2', 146, 'Dokumen Laporan', 'Dokumen berisi laporan kegiatan', 'Dokumen Visi Misi', 'Direktur', 2023, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'kajur,sekjur,kaprodi', '2024-06-26 01:29:32', '2024-06-26 01:29:32'),
(132, 'Kaprodi2', 141, 'Dokumen Mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', 'sekjur,kaprodi', '2024-06-26 01:33:42', '2024-06-26 01:33:42'),
(133, 'Kaprodi2', 138, 'Sertifikat', 'deskripsi dokumen sertifikat', 'Dokumen Pendidikan', 'Ketua Program Studi', 2022, 'Dokumen_baru.pdf', NULL, 'sertifikat, mahasiswa', '', '2024-06-26 01:35:51', '2024-06-26 01:35:51'),
(134, 'Kaprodi2', 137, 'Dokumen Absen', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2022, 'Dokumen_mahasiswa.pdf', NULL, 'sertifikat, mahasiswa', NULL, '2024-06-26 01:37:42', '2024-06-26 01:37:42'),
(135, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:07:19', '2024-06-26 02:07:19'),
(136, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:08:29', '2024-06-26 02:08:29'),
(137, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:11:02', '2024-06-26 02:11:02'),
(138, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:12:56', '2024-06-26 02:12:56'),
(139, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:13:07', '2024-06-26 02:13:07'),
(140, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'kegiatan', 'all,kajur,sekjur,kaprodi,dosen,adm,mahasiswa', '2024-06-26 02:14:10', '2024-06-26 02:14:10'),
(141, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, NULL, NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:16:56', '2024-06-26 02:16:56'),
(142, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, NULL, NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:19:41', '2024-06-26 02:19:41'),
(143, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, NULL, NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:19:58', '2024-06-26 02:19:58'),
(144, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Internal.pdf', NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:20:14', '2024-06-26 02:20:14'),
(145, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Internal.pdf', NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:22:24', '2024-06-26 02:22:24'),
(146, 'Ketua Jurusan1', 147, 'Dokumen Kegiatan', 'Kegiatan tahunan', 'Dokumen Kerjasama', 'Direktur', 2024, 'Dokumen_Internal.pdf', NULL, 'kegiatan', 'kajur,sekjur', '2024-06-26 02:22:57', '2024-06-26 02:22:57'),
(147, 'Ketua Jurusan1', 148, 'Dokumen Laporan', 'Deskripsi Dokumen', 'Dokumen Mahasiswa', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 04:24:53', '2024-06-26 04:24:53'),
(148, 'Ketua Jurusan1', 148, 'Dokumen Laporan', 'Deskripsi Dokumen', 'Dokumen Mahasiswa', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'kajur,sekjur', '2024-06-26 04:25:19', '2024-06-26 04:25:19'),
(149, 'Kaprodi2', 149, 'absensi mahasiswa', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA2-FINAL', 'dokumen, laporan', 'Admin,Kajur,Sekjur', '2024-06-26 21:38:43', '2024-06-26 21:38:43'),
(150, 'admin', 115, 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', '', 'tag, dokumen', '', '2024-06-26 22:20:24', '2024-06-26 22:20:24'),
(151, 'dosen1', 108, 'Materi TRPL', 'Dokumen materi', 'Dokumen Pendidikan', 'Ketua Program Studi', 2023, 'Dokumen Materi.pdf', '', 'materi, TRPL', '', '2024-06-27 01:19:54', '2024-06-27 01:19:54'),
(152, 'dosen1', 157, 'absensi mahasiswa Jurusan TI', 'Deskripsi Dokumen', 'Dokumen Pendidikan', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Jurusan', '2024-06-27 01:21:29', '2024-06-27 01:21:29'),
(153, 'admin', 115, 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', '', 'tag, dokumen', '', '2024-06-27 02:38:24', '2024-06-27 02:38:24'),
(154, 'admin', 115, 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', '', 'tag, dokumen', '', '2024-06-27 02:38:39', '2024-06-27 02:38:39'),
(155, 'admin', 115, 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', '', 'tag, dokumen', '', '2024-06-27 02:39:12', '2024-06-27 02:39:12'),
(156, 'admin', 115, 'Tujuan dokumen', 'Deskripsi Dokumen', 'Dokumen Tujuan', 'Ketua Jurusan', 2024, 'Dokumen sertifikat.pdf', '', 'tag, dokumen', 'Sekretaris Jurusan', '2024-06-27 02:39:39', '2024-06-27 02:39:39'),
(157, 'Kaprodi1', 129, 'dokumen private', 'deskripsi', 'Dokumen Tujuan', 'Ketua Program Studi', 2023, 'Dokumen Internal.pdf', '', 'private', '', '2024-06-27 02:41:24', '2024-06-27 02:41:24'),
(158, 'Ketua Jurusan1', 156, 'absensi mahasiswa Jurusan', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, 'https://github.com/EnziMarni/TA-FINAL-BANGET', 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Jurusan,19', '2024-06-27 02:42:38', '2024-06-27 02:42:38'),
(159, 'dosen1', 108, 'Materi TRPL', 'Dokumen materi', 'Dokumen Pendidikan', 'Ketua Program Studi', 2023, 'Dokumen Materi.pdf', '', 'materi, TRPL', 'kajur', '2024-06-27 03:21:03', '2024-06-27 03:21:03'),
(160, 'dosen1', 157, 'absensi mahasiswa Jurusan TI', 'Deskripsi Dokumen', 'Dokumen Pendidikan', 'Direktur', 2024, 'Dokumen_baru.pdf', NULL, 'dokumen, laporan', '', '2024-06-27 03:22:45', '2024-06-27 03:22:45'),
(161, 'mahasiswa2', 127, 'Sertifikat', 'berisi sertifikat', 'Dokumen Pendidikan', 'Lainnya', 2020, 'Dokumen mahasiswa.pdf', '', 'sertifikat', '', '2024-06-27 03:30:56', '2024-06-27 03:30:56'),
(162, 'Ketua Jurusan1', 156, 'absensi mahasiswa Jurusan', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, NULL, NULL, 'dokumen, laporan', 'Sekretaris Jurusan,Ketua Program Studi,Ketua Jurusan', '2024-06-27 20:26:13', '2024-06-27 20:26:13'),
(163, 'Ketua Jurusan1', 156, 'absensi mahasiswa Jurusan', 'Deskripsi Dokumen', 'Dokumen Visi Misi', 'Direktur', 2024, 'Dokumen_Materi.pdf', NULL, 'dokumen, laporan', '', '2024-06-27 20:30:29', '2024-06-27 20:30:29');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `nama_jabatan` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `nama_jabatan`, `created_at`) VALUES
(1, 'Ketua Jurusan', '2024-06-28 01:26:17'),
(2, 'Sekretaris Jurusan', '2024-06-28 03:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_dokumen`
--

CREATE TABLE `kategori_dokumen` (
  `id` int(11) NOT NULL,
  `nama_dokumen` varchar(225) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_dokumen`
--

INSERT INTO `kategori_dokumen` (`id`, `nama_dokumen`, `created_at`) VALUES
(1, 'dokumen pendidikan', '2024-06-28 00:38:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `approved`, `password`, `jabatan`, `created_at`, `updated_at`) VALUES
(1, 'super user', 'superuser@example.com', 1, '$2y$12$3U52mGDwQa42EB7wGtvEoev4OG3WqRFwtggZ1ynhrcg8OVNQfoNQO', 'Admin', '2024-05-08 17:52:21', '2024-06-13 10:56:47'),
(10, 'Sekretaris Jurusan', 'sekjur@example.com', 1, '$2y$12$EXIc0IEb8MP4dY.YFcAbDO8uxs9DwzoYf31sQQu./hYZQUsYBWYqO', 'Sekretaris Jurusan', '2024-06-14 07:53:19', '2024-06-26 21:29:45'),
(11, 'Kaprodi', 'kaprodi@example.com', 1, '$2y$12$weC3nWpMLcMtrEXTj/mTr.TbvYKS3.Gnc6ZwzFt50ek/ED1Xop1q2', 'Ketua Program Studi', '2024-06-14 07:55:14', '2024-06-26 21:13:20'),
(13, 'Adm', 'adm@example.com', 1, '$2y$12$DaVdHSAzSxjYs1F1z.JdWOUwRWMTipe2UvXg5myiZm2FMFU86x9ge', 'Adm', '2024-06-14 08:01:14', '2024-06-26 01:49:04'),
(15, 'Admin', 'admin@example.com', 1, '$2y$12$UWVkYaZzPqs5FEOETedIK.gAULspUIrtq23Bkqqdaksp4EZLzY.ia', 'Admin', '2024-06-14 08:02:41', '2024-06-16 11:14:36'),
(19, 'Ketua Jurusan1', 'ketuajurusan@gmail.com', 1, '$2y$12$dUBwfRKdQHH2stLv.akqJuEaUTSbh4zMPWHmdQ/fRe9pQXyxgJqI2', 'Ketua Jurusan', '2024-06-19 01:31:58', '2024-06-26 21:12:51'),
(20, 'Sekjur1', 'sekjur1@gmail.com', 1, '$2y$12$yBGfUzwTGsmd8avem3w10uH2HDddiU7sJIw7RS5CsMXTSAuJv/XfO', 'Sekretaris Jurusan', '2024-06-19 01:35:59', '2024-06-26 21:43:00'),
(21, 'Kaprodi1', 'kaprodi@gmail.com', 1, '$2y$12$qmweKnimoRuUvr9UjYwdGekv3DND39VPLyplIK2v7ymmnZWgkMW0a', 'Ketua Program Studi', '2024-06-19 02:29:03', '2024-06-26 22:26:32'),
(22, 'dosen1', 'dosen@gmail.com', 1, '$2y$12$7SWXO/yYkBBYKt7XW7kUv.FRHfVRqbO7DcoNqJFv.t0TccIgQYIqm', 'Dosen', '2024-06-19 02:36:22', '2024-06-22 04:47:44'),
(24, 'adm1', 'admjurusan@gmail.com', 1, '$2y$12$PDOKuWQQg28b4BRZtxLlJ.YXxJP6ILSqbXYhjmvOYtERwvbbCJ5FC', 'Administrasi', '2024-06-19 03:11:30', '2024-06-26 22:16:48'),
(26, 'admin', 'admin@gmail.com', 1, '$2y$12$RTdR4PgGDF.l24MrlhHRl.Q1N5ri8kAqdwaTUjjOCS2l8C81UmqWy', 'Admin', '2024-06-19 21:41:05', '2024-06-19 21:42:44'),
(28, 'Test Tendik', 'tendiktest@example.com', 1, '$2y$12$CeQPmWwl4/Qo5Hu5qAcxye5YuLEIWQJPSF/usYxQaWGFdnHMTyoAa', 'Tenaga Pendidik', '2024-06-20 13:26:41', '2024-06-27 02:31:57'),
(30, 'mahasiswa2', 'mahasiswa2@gmail.com', 1, '$2y$12$xMxfE8ccYUw6WfC.FUF76OlwEdM0Syb8q8ey5In.pVNMaQHK7UQ7K', 'Mahasiswa', '2024-06-22 03:20:11', '2024-06-26 02:05:20'),
(31, 'dosen1', 'dosen1@gmail.com', 1, '$2y$12$co/C50ByOZ2kPGcTZ0jCBeaDGnFnxxiEunNSyFx.CZYZdW6n1uEke', 'Dosen', '2024-06-22 03:24:39', '2024-06-22 04:47:37'),
(32, 'Kaprodi2', 'kaprodi2@gmail.com', 1, '$2y$12$ECtlDp/qa/hUCSJzjoSfKupMRg0xZbCpa7ei6Ed/lQiUPzDge/FNW', 'Kaprodi', '2024-06-24 02:08:16', '2024-06-24 02:08:35'),
(33, 'sekjur2', 'sekretaris@gmail.com', 1, '$2y$12$MRs3RGtDL4iLR1Tj4xYgLOGLJAoyghiDJiWFxhPgRhRm14JwT0wCa', 'Sekretaris Jurusan', '2024-06-27 01:03:10', '2024-06-27 01:03:30'),
(34, 'tendik 2', 'tendiktest2@gmail.com', 1, '$2y$12$EeO6FgM9U93yjqNn0EiS8ewO./QODWX.5MbWDtrG5KH8WWjzbuucW', 'Tenaga Pendidik', '2024-06-27 03:34:39', '2024-06-27 03:34:52'),
(35, 'test test', 'testtest@gmail.com', 1, '$2y$12$KjgDIp2Un9J39ARa4R61vuXuKcEYiq8s0kE4v88cUyLd0/3SPHV9O', 'Mahasiswa', '2024-06-27 03:43:17', '2024-06-27 18:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `validasi_dokumen`
--

CREATE TABLE `validasi_dokumen` (
  `id` int(11) NOT NULL,
  `validasi_dokumen` varchar(225) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `validasi_dokumen`
--

INSERT INTO `validasi_dokumen` (`id`, `validasi_dokumen`, `created_at`) VALUES
(2, 'Ketua Jurusan', '2024-06-28 04:02:43'),
(3, 'Ketua Program Studi', '2024-06-28 04:31:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokumens`
--
ALTER TABLE `dokumens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dokumen_id` (`dokumen_id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori_dokumen`
--
ALTER TABLE `kategori_dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `validasi_dokumen`
--
ALTER TABLE `validasi_dokumen`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokumens`
--
ALTER TABLE `dokumens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `draft`
--
ALTER TABLE `draft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kategori_dokumen`
--
ALTER TABLE `kategori_dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `validasi_dokumen`
--
ALTER TABLE `validasi_dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `histories`
--
ALTER TABLE `histories`
  ADD CONSTRAINT `histories_ibfk_1` FOREIGN KEY (`dokumen_id`) REFERENCES `dokumens` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
