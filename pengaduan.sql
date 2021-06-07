-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Waktu pembuatan: 07. Juni 2021 jam 03:10
-- Versi Server: 5.5.16
-- Versi PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pengaduan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `password` varchar(64) COLLATE utf8_bin NOT NULL,
  `divisi` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`),
  KEY `divisi` (`divisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `divisi`) VALUES
(0, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 0),
(1, 'admin1', '25f43b1486ad95a1398e3eeb3d83bc4010015fcc9bedb35b432e00298d5021f7', 1),
(2, 'admin2', '1c142b2d01aa34e9a36bde480645a57fd69e14155dacfab5a3f9257b77fdc8d8', 2),
(3, 'admin3', '4fc2b5673a201ad9b1fc03dcb346e1baad44351daa0503d5534b4dfdcc4332e0', 3),
(4, 'admin4', '110198831a426807bccd9dbdf54b6dcb5298bc5d31ac49069e0ba3d210d970ae', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `divisi`
--

CREATE TABLE IF NOT EXISTS `divisi` (
  `id_divisi` int(11) NOT NULL,
  `nama_divisi` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_divisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data untuk tabel `divisi`
--

INSERT INTO `divisi` (`id_divisi`, `nama_divisi`) VALUES
(0, 'Super Admin'),
(1, 'Poli Gigi'),
(2, 'Poli THT'),
(3, 'Poli Penyakit Dalam'),
(4, 'Poli Kulit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(64) COLLATE utf8_bin NOT NULL,
  `email` varchar(64) COLLATE utf8_bin NOT NULL,
  `telpon` varchar(12) COLLATE utf8_bin NOT NULL,
  `alamat` varchar(256) COLLATE utf8_bin NOT NULL,
  `tujuan` int(11) NOT NULL,
  `isi` varchar(2048) COLLATE utf8_bin NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tujuan` (`tujuan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `laporan`
--

INSERT INTO `laporan` (`id`, `nama`, `email`, `telpon`, `alamat`, `tujuan`, `isi`, `tanggal`, `status`) VALUES
(3, 'Didik Alfianto', 'didikalfianto29@gmail.com', '082243183418', 'JL Borobudur rt 05 rw 12', 4, 'proses antri terlalu lama karena penanganan bertele - tele.', '2021-05-11 05:23:36', 'Ditanggapi'),
(4, 'Feni arum', 'feni@gmail.com', '089881345765', 'kampung kebonharjo', 1, 'lama prosesnya', '2021-05-11 03:40:05', 'Ditanggapi'),
(5, 'umar faiz', 'umarfaiz@gmail.com', '123456789111', 'kampung bandengan kendal', 4, 'suster tidak peduli terhadap pasien', '2021-05-11 04:02:56', 'Menunggu'),
(6, 'luthfiya', 'fiya@gmail.com', '098987987987', 'taman karonsih raya', 4, 'dokter nya telat 1 jam', '2021-05-11 05:13:37', 'Menunggu'),
(7, 'budi santoso', 'budi@gmail.com', '098876678908', 'puspogiwang raya', 2, 'susternya galak', '2021-05-11 05:21:50', 'Menunggu'),
(8, 'ISMIYATI', 'anipfindra@gmail.com', '082243183418', 'taman karonsih', 1, 'antrian lama, petugas tidak tanggap', '2021-05-11 05:46:27', 'Ditanggapi'),
(9, 'TES WAHYU', 'wahyu@gml.cm', '123456789012', 'kendal', 1, 'ini tes pengajuan', '2021-05-31 04:40:19', 'Menunggu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggapan`
--

CREATE TABLE IF NOT EXISTS `tanggapan` (
  `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT,
  `id_laporan` int(11) NOT NULL,
  `admin` varchar(64) COLLATE utf8_bin NOT NULL,
  `isi_tanggapan` varchar(2048) COLLATE utf8_bin NOT NULL,
  `tanggal_tanggapan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tanggapan`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data untuk tabel `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_laporan`, `admin`, `isi_tanggapan`, `tanggal_tanggapan`) VALUES
(3, 4, 'Admin', 'mohon maaf atas ketidak nyamanannya, kami akan evaluasi kembali kinerja perawat kami', '2021-05-11 03:40:05'),
(4, 3, 'Admin', 'baik mohon maaf atas ketidaknyamannya', '2021-05-11 05:23:36'),
(5, 8, 'Admin', 'baik mohon maaf atas ketidaknyamanannnya, kami akan perbaiki kualitas pegawai', '2021-05-11 05:46:27');

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`divisi`) REFERENCES `divisi` (`id_divisi`);

--
-- Ketidakleluasaan untuk tabel `laporan`
--
ALTER TABLE `laporan`
  ADD CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`tujuan`) REFERENCES `divisi` (`id_divisi`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
