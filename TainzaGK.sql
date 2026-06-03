-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 09:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gktrainza`
--

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `from_station` varchar(255) NOT NULL,
  `to_station` varchar(255) NOT NULL,
  `class` varchar(50) NOT NULL,
  `travel_date` date NOT NULL,
  `passengers_count` int(11) NOT NULL,
  `passenger_names` text DEFAULT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `total_fare` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `ticket_status` enum('pending','confirmed','canceled','expired','verified') NOT NULL DEFAULT 'pending',
  `otp_code` varchar(10) DEFAULT NULL,
  `otp_expiry` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trains`
--

CREATE TABLE `trains` (
  `id` int(11) NOT NULL,
  `train_name` varchar(255) NOT NULL,
  `train_number` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trains`
--

INSERT INTO `trains` (`id`, `train_name`, `train_number`, `category`) VALUES
(1, 'Ajmer Shatabdi Express', '12015', 'Shatabdi Express'),
(2, 'Mandore Express', '12461', 'Superfast Express'),
(3, 'Marudhar Express', '14853', 'Express'),
(4, 'Chetak Express', '12981', 'Superfast Express'),
(5, 'Ashram Express', '12915', 'Superfast Express'),
(6, 'Ranthambore Express', '12465', 'Superfast Express'),
(7, 'Udaipur City Express', '19601', 'Express'),
(8, 'Bikaner Intercity Express', '22471', 'Superfast Express'),
(9, 'Jaipur Duronto Express', '12239', 'Duronto Express'),
(10, 'Ananya Express', '12315', 'Superfast Express'),
(11, 'Jaisalmer Express', '14659', 'Express'),
(12, 'Barmer Express', '14888', 'Express'),
(13, 'Pali Express', '14821', 'Express'),
(14, 'Bikaner Shatabdi Express', '12055', 'Shatabdi Express'),
(15, 'Jodhpur Intercity Express', '14864', 'Express'),
(16, 'Bandra Terminus - Jaipur Express', '12979', 'Superfast Express'),
(17, 'Delhi Sarai Rohilla - Jodhpur Express', '22478', 'Superfast Express'),
(18, 'Jaisalmer - Howrah Express', '12372', 'Superfast Express'),
(19, 'Jodhpur - Varanasi Express', '14866', 'Express'),
(20, 'Udaipur - Haridwar Express', '19609', 'Express');

-- --------------------------------------------------------

--
-- Table structure for table `train_stations`
--

CREATE TABLE `train_stations` (
  `id` int(11) NOT NULL,
  `train_id` int(11) NOT NULL,
  `station_name` varchar(255) NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `stop_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `train_stations`
--

INSERT INTO `train_stations` (`id`, `train_id`, `station_name`, `arrival_time`, `departure_time`, `stop_order`) VALUES
(106, 1, 'New Delhi (NDLS)', NULL, '06:10:00', 1),
(107, 1, 'Delhi Cantt (DEC)', '06:38:00', '06:40:00', 2),
(108, 1, 'Gurgaon (GGN)', '06:56:00', '06:58:00', 3),
(109, 1, 'Rewari Junction (RE)', '07:45:00', '07:47:00', 4),
(110, 1, 'Alwar Junction (AWR)', '08:32:00', '08:35:00', 5),
(111, 1, 'Bandikui Junction (BKI)', '09:19:00', '09:21:00', 6),
(112, 1, 'Gandhinagar Jaipur (GADJ)', '10:17:00', '10:20:00', 7),
(113, 1, 'Jaipur Junction (JP)', '10:35:00', '10:45:00', 8),
(114, 1, 'Kishangarh (KSG)', '12:03:00', '12:05:00', 9),
(115, 1, 'Ajmer Junction (AII)', '01:00:00', NULL, 10),
(116, 2, 'Old Delhi Junction (DLI)', NULL, '21:15:00', 1),
(117, 2, 'Delhi Cantt (DEC)', '21:44:00', '21:46:00', 2),
(118, 2, 'Gurgaon (GGN)', '22:03:00', '22:05:00', 3),
(119, 2, 'Rewari Junction (RE)', '22:55:00', '22:57:00', 4),
(120, 2, 'Alwar Junction (AWR)', '23:58:00', NULL, 5),
(121, 2, 'Bandikui Junction (BKI)', '00:58:00', '01:00:00', 6),
(122, 2, 'Dausa (DO)', '01:23:00', '01:25:00', 7),
(123, 2, 'Gandhinagar Jaipur (GADJ)', '02:01:00', '02:03:00', 8),
(124, 2, 'Jaipur Junction (JP)', '02:20:00', '02:30:00', 9),
(125, 2, 'Phulera Junction (FL)', '03:13:00', '03:15:00', 10),
(126, 2, 'Kishangarh (KSG)', '03:53:00', '03:55:00', 11),
(127, 2, 'Ajmer Junction (AII)', '04:30:00', '04:35:00', 12),
(128, 2, 'Beawar (BER)', '05:13:00', '05:15:00', 13),
(129, 2, 'Marwar Junction (MJ)', '06:08:00', '06:10:00', 14),
(130, 2, 'Luni Junction (LUNI)', '06:48:00', '06:50:00', 15),
(131, 2, 'Jodhpur Junction (JU)', '07:50:00', NULL, 16),
(132, 3, 'Varanasi City (BCY)', NULL, '16:25:00', 1),
(133, 3, 'Varanasi Junction (BSB)', '16:45:00', '16:50:00', 2),
(134, 3, 'Babatpur (BTP)', '17:16:00', '17:18:00', 3),
(135, 3, 'Jaunpur Junction (JNU)', '18:16:00', '18:18:00', 4),
(136, 3, 'Shahganj Junction (SHG)', '18:53:00', '18:55:00', 5),
(137, 3, 'Akbarpur (ABP)', '19:33:00', '19:35:00', 6),
(138, 3, 'Goshainganj (GGJ)', '19:54:00', '19:56:00', 7),
(139, 3, 'Ayodhya Dham (AY)', '20:26:00', '20:28:00', 8),
(140, 3, 'Ayodhya Cantt (AYC)', '20:48:00', '20:53:00', 9),
(141, 3, 'Rudauli (RDL)', '21:26:00', '21:28:00', 10),
(142, 3, 'Barabanki Junction (BBK)', '22:52:00', '22:54:00', 11),
(143, 3, 'Lucknow (LKO)', NULL, '00:15:00', 12),
(144, 3, 'Unnao Junction (ON)', '01:23:00', '01:25:00', 13),
(145, 3, 'Kanpur Central (CNB)', '02:00:00', '02:05:00', 14),
(146, 3, 'Etawah (ETW)', '04:05:00', '04:07:00', 15),
(147, 3, 'Shikohabad Junction (SKB)', '05:00:00', '05:02:00', 16),
(148, 3, 'Tundla Junction (TDL)', '05:50:00', '05:55:00', 17),
(149, 3, 'Agra Fort (AF)', '06:35:00', '06:45:00', 18),
(150, 3, 'Idgah Agra Junction (IDH)', '07:02:00', '07:04:00', 19),
(151, 3, 'Achhnera Junction (AH)', '07:30:00', '07:32:00', 20),
(152, 3, 'Bharatpur Junction (BTE)', '08:05:00', '08:10:00', 21),
(153, 3, 'Nadbai (NBI)', '08:38:00', '08:40:00', 22),
(154, 3, 'Kherli (KL)', '08:53:00', '08:55:00', 23),
(155, 3, 'Mandawar Mahwa Road (MURD)', '09:08:00', '09:10:00', 24),
(156, 3, 'Bandikui Junction (BKI)', '10:25:00', '10:30:00', 25),
(157, 3, 'Dausa (DO)', '10:54:00', '10:56:00', 26),
(158, 3, 'Gandhinagar Jaipur (GADJ)', '11:38:00', '11:41:00', 27),
(159, 3, 'Jaipur Junction (JP)', '12:00:00', '12:10:00', 28),
(160, 3, 'Dhanakya (DNK)', '12:29:00', '12:31:00', 29),
(161, 3, 'Phulera Junction (FL)', '13:33:00', '13:35:00', 30),
(162, 3, 'Sambhar Lake (SBR)', '13:53:00', '13:55:00', 31),
(163, 3, 'Nawa City (NAC)', '14:17:00', '14:19:00', 32),
(164, 3, 'Kuchaman City (KMNC)', '14:33:00', '14:35:00', 33),
(165, 3, 'Makrana Junction (MKN)', '14:47:00', '14:50:00', 34),
(166, 3, 'Degana Junction (DNA)', '15:20:00', '15:23:00', 35),
(167, 3, 'Ren (REN)', '15:44:00', '15:46:00', 36),
(168, 3, 'Merta Road Junction (MTD)', '16:00:00', '16:05:00', 37),
(169, 3, 'Gotan (GOTN)', '16:26:00', '16:28:00', 38),
(170, 3, 'Jodhpur Junction (JU)', '18:15:00', NULL, 39),
(171, 4, 'Delhi Sarai Rohilla (DEE)', NULL, '19:35:00', 1),
(172, 4, 'Delhi Cantt (DEC)', '19:53:00', '19:55:00', 2),
(173, 4, 'Gurgaon (GGN)', '20:13:00', '20:15:00', 3),
(174, 4, 'Rewari (RE)', '21:05:00', '21:10:00', 4),
(175, 4, 'Alwar (AWR)', '22:13:00', '22:15:00', 5),
(176, 4, 'Bandikui Junction (BKI)', '23:18:00', '23:20:00', 6),
(177, 4, 'Dausa (DO)', '23:54:00', '23:56:00', 7),
(178, 4, 'Gandhinagar Jaipur (GADJ)', '00:38:00', '00:40:00', 8),
(179, 4, 'Jaipur Junction (JP)', '01:00:00', '01:10:00', 9),
(180, 4, 'Phulera Junction (FL)', '01:53:00', '01:55:00', 10),
(181, 4, 'Kishangarh (KSG)', '02:28:00', '02:30:00', 11),
(182, 4, 'Ajmer Junction (AII)', '03:10:00', '03:20:00', 12),
(183, 4, 'Nasirabad (NSD)', '03:43:00', '03:45:00', 13),
(184, 4, 'Bijainagar (BJNR)', '04:08:00', '04:10:00', 14),
(185, 4, 'Bhilwara (BHL)', '05:00:00', '05:05:00', 15),
(186, 4, 'Chanderiya (CNA)', '06:00:00', '06:05:00', 16),
(187, 4, 'Mavli Junction (MVJ)', '07:00:00', '07:05:00', 17),
(188, 4, 'Ranapratapnagar (RPZ)', '07:35:00', '07:37:00', 18),
(189, 4, 'Udaipur City (UDZ)', '07:50:00', NULL, 19),
(190, 5, 'Sabarmati BG (SBIB)', NULL, '19:45:00', 1),
(191, 5, 'Ahmedabad Junction (ADI)', '19:58:00', '20:10:00', 2),
(192, 5, 'Mahesana Junction (MSH)', '21:18:00', '21:20:00', 3),
(193, 5, 'Unjha (UJA)', '21:38:00', '21:40:00', 4),
(194, 5, 'Siddhpur (SID)', '21:54:00', '21:56:00', 5),
(195, 5, 'Palanpur Junction (PNU)', '22:50:00', '22:55:00', 6),
(196, 5, 'Abu Road (ABR)', '23:48:00', '23:58:00', 7),
(197, 5, 'Falna (FA)', '01:13:00', '01:15:00', 8),
(198, 5, 'Marwar Junction (MJ)', '02:10:00', '02:12:00', 9),
(199, 5, 'Pali Marwar (PMY)', '02:58:00', '03:00:00', 10),
(200, 5, 'Luni Junction (LUNI)', '03:38:00', '03:40:00', 11),
(201, 5, 'Jodhpur Junction (JU)', '04:30:00', '04:40:00', 12),
(202, 5, 'Merta Road Junction (MTD)', '06:08:00', '06:10:00', 13),
(203, 5, 'Degana Junction (DNA)', '06:43:00', '06:45:00', 14),
(204, 5, 'Makrana Junction (MKN)', '07:08:00', '07:10:00', 15),
(205, 5, 'Kuchaman City (KMNC)', '07:23:00', '07:25:00', 16),
(206, 5, 'Phulera Junction (FL)', '08:08:00', '08:10:00', 17),
(207, 5, 'Jaipur Junction (JP)', '09:00:00', '09:10:00', 18),
(208, 5, 'Gandhinagar Jaipur (GADJ)', '09:21:00', '09:23:00', 19),
(209, 5, 'Dausa (DO)', '10:04:00', '10:06:00', 20),
(210, 5, 'Bandikui Junction (BKI)', '10:30:00', '10:32:00', 21),
(211, 5, 'Alwar (AWR)', '11:18:00', '11:20:00', 22),
(212, 5, 'Rewari (RE)', '12:25:00', '12:30:00', 23),
(213, 5, 'Gurgaon (GGN)', '13:13:00', '13:15:00', 24),
(214, 5, 'Delhi Cantt (DEC)', '13:33:00', '13:35:00', 25),
(215, 5, 'Old Delhi (DLI)', '14:00:00', NULL, 26),
(216, 6, 'Indore Junction BG (INDB)', NULL, '06:00:00', 1),
(217, 6, 'Dewas (DWX)', '06:26:00', '06:28:00', 2),
(218, 6, 'Ujjain Junction (UJN)', '07:25:00', '07:30:00', 3),
(219, 6, 'Nagda Junction (NAD)', '08:45:00', '09:00:00', 4),
(220, 6, 'Mahidpur Road (MEP)', '09:13:00', '09:15:00', 5),
(221, 6, 'Vikramgarh Alot (VMA)', '09:38:00', '09:40:00', 6),
(222, 6, 'Chau Mahla (CMU)', '10:08:00', '10:10:00', 7),
(223, 6, 'Shamgarh (SGZ)', '10:28:00', '10:30:00', 8),
(224, 6, 'Suwasra (SVA)', '10:43:00', '10:45:00', 9),
(225, 6, 'Garot (GOH)', '10:58:00', '11:00:00', 10),
(226, 6, 'Bhawani Mandi (BWM)', '11:18:00', '11:20:00', 11),
(227, 6, 'Ramganj Mandi (RMA)', '11:43:00', '11:45:00', 12),
(228, 6, 'Dara (DARA)', '12:03:00', '12:05:00', 13),
(229, 6, 'Kota Junction (KOTA)', '12:50:00', '13:00:00', 14),
(230, 6, 'Indargarh Sumerganj Mandi (IDG)', '13:38:00', '13:40:00', 15),
(231, 6, 'Sawai Madhopur Junction (SWM)', '14:25:00', '14:35:00', 16),
(232, 6, 'Chauth Ka Barwara (CKB)', '14:53:00', '14:55:00', 17),
(233, 6, 'Isarda (ISA)', '15:08:00', '15:10:00', 18),
(234, 6, 'Banasthali Niwai (BNLW)', '15:28:00', '15:30:00', 19),
(235, 6, 'Chaksu (CKS)', '15:48:00', '15:50:00', 20),
(236, 6, 'Sanganer (SNGN)', '16:08:00', '16:10:00', 21),
(237, 6, 'Durgapura (DPA)', '16:18:00', '16:20:00', 22),
(238, 6, 'Jaipur Junction (JP)', '16:35:00', '16:45:00', 23),
(239, 6, 'Phulera Junction (FL)', '17:28:00', '17:30:00', 24),
(240, 6, 'Sambhar Lake (SBR)', '17:43:00', '17:45:00', 25),
(241, 6, 'Nawa City (NAC)', '18:03:00', '18:05:00', 26),
(242, 6, 'Kuchaman City (KMNC)', '18:23:00', '18:25:00', 27),
(243, 6, 'Makrana Junction (MKN)', '18:38:00', '18:40:00', 28),
(244, 6, 'Degana Junction (DNA)', '19:08:00', '19:10:00', 29),
(245, 6, 'Merta Road Junction (MTD)', '19:43:00', '19:45:00', 30),
(246, 6, 'Gotan (GOTN)', '20:03:00', '20:05:00', 31),
(247, 6, 'Kharia Khangarh (KXG)', '20:23:00', '20:25:00', 32),
(248, 6, 'Pipar Road Junction (PPR)', '20:38:00', '20:40:00', 33),
(249, 6, 'Salawas (SZ)', '21:08:00', '21:10:00', 34),
(250, 6, 'Basni (BANE)', '21:23:00', '21:25:00', 35),
(251, 6, 'Bhagat Ki Kothi (BGKT)', '22:20:00', NULL, 36),
(252, 7, 'Udaipur City (UDZ)', NULL, '00:45:00', 1),
(253, 7, 'Rana Pratap Nagar (RPZ)', '00:52:00', '00:54:00', 2),
(254, 7, 'Mavli Junction (MVJ)', '01:25:00', '01:27:00', 3),
(255, 7, 'Kapasan (KIN)', '01:53:00', '01:54:00', 4),
(256, 7, 'Chanderiya (CNA)', '02:50:00', '02:55:00', 5),
(257, 7, 'Bhilwara (BHL)', '03:55:00', '04:00:00', 6),
(258, 7, 'Bijainagar (BJNR)', '04:43:00', '04:45:00', 7),
(259, 7, 'Nasirabad (NSD)', '05:15:00', '05:17:00', 8),
(260, 7, 'Ajmer Junction (AII)', '06:15:00', '06:25:00', 9),
(261, 7, 'Jaipur Junction (JP)', '09:05:00', '09:15:00', 10),
(262, 7, 'Alwar Junction (AWR)', '11:18:00', '11:21:00', 11),
(263, 7, 'Rewari Junction (RE)', '12:40:00', '12:43:00', 12),
(264, 7, 'Gurgaon (GGN)', '13:31:00', '13:33:00', 13),
(265, 7, 'Delhi Cantt (DEC)', '13:57:00', '13:59:00', 14),
(266, 7, 'Delhi Junction (DLI)', '14:55:00', '15:10:00', 15),
(267, 7, 'Moradabad Junction (MB)', '18:00:00', '18:08:00', 16),
(268, 7, 'Bareilly Junction (BE)', '19:49:00', '19:51:00', 17),
(269, 7, 'Lucknow NR (LKO)', '23:35:00', '23:45:00', 18),
(270, 7, 'Barabanki Junction (BBK)', '00:36:00', '00:38:00', 19),
(271, 7, 'Gorakhpur Junction (GKP)', '04:45:00', '04:55:00', 20),
(272, 7, 'Deoria Sadar (DEOS)', '05:50:00', '05:55:00', 21),
(273, 7, 'Siwan Junction (SV)', '06:50:00', '06:55:00', 22),
(274, 7, 'Chhapra Junction (CPR)', '07:50:00', '07:55:00', 23),
(275, 7, 'Hajipur Junction (HJP)', '09:10:00', '09:15:00', 24),
(276, 7, 'Muzaffarpur Junction (MFP)', '10:05:00', '10:10:00', 25),
(277, 7, 'Samastipur Junction (SPJ)', '11:12:00', '11:17:00', 26),
(278, 7, 'Khagaria Junction (KGG)', '13:00:00', '13:05:00', 27),
(279, 7, 'Katihar Junction (KIR)', '15:15:00', '15:25:00', 28),
(280, 7, 'Kishanganj (KNE)', '16:48:00', '16:50:00', 29),
(281, 7, 'New Jalpaiguri (NJP)', '18:35:00', NULL, 30),
(282, 8, 'Bikaner Junction (BKN)', NULL, '09:25:00', 1),
(283, 8, 'Napasar (NPS)', '09:49:00', '09:51:00', 2),
(284, 8, 'Sudsar (SDF)', '10:03:00', '10:05:00', 3),
(285, 8, 'Sri Dungargarh (SDGH)', '10:22:00', '10:24:00', 4),
(286, 8, 'Rajaldesar (RJR)', '11:01:00', '11:03:00', 5),
(287, 8, 'Ratangarh Junction (RTGH)', '11:28:00', '11:30:00', 6),
(288, 8, 'Churu Junction (CUR)', '12:05:00', '12:08:00', 7),
(289, 8, 'Sadulpur Junction (SDLP)', '12:58:00', '13:00:00', 8),
(290, 8, 'Loharu Junction (LHU)', '13:45:00', '13:47:00', 9),
(291, 8, 'Mahendragarh (MHRG)', '14:10:00', '14:12:00', 10),
(292, 8, 'Ateli (AEL)', '14:24:00', '14:26:00', 11),
(293, 8, 'Rewari Junction (RE)', '15:10:00', '15:15:00', 12),
(294, 8, 'Gurgaon (GGN)', '15:53:00', '15:55:00', 13),
(295, 8, 'Delhi Cantt (DEC)', '16:09:00', '16:11:00', 14),
(296, 8, 'Delhi Sarai Rohilla (DEE)', '16:35:00', NULL, 15),
(297, 9, 'Mumbai Central (MMCT)', NULL, '23:10:00', 1),
(298, 9, 'Vadodara Junction (BRC)', '03:24:00', '03:34:00', 2),
(299, 9, 'Ratlam Junction (RTM)', '07:00:00', '07:05:00', 3),
(300, 9, 'Kota Junction (KOTA)', '10:00:00', '10:05:00', 4),
(301, 9, 'Sawai Madhopur Junction (SWM)', '11:35:00', '11:50:00', 5),
(302, 9, 'Jaipur Junction (JP)', '13:40:00', '13:50:00', 6),
(303, 9, 'Ringas Junction (RGS)', '14:35:00', '14:38:00', 7),
(304, 9, 'Sikar Junction (SIKR)', '15:35:00', '15:40:00', 8),
(305, 9, 'Jhunjhunu (JJN)', '16:26:00', '16:28:00', 9),
(306, 9, 'Loharu (LHU)', '17:35:00', '17:38:00', 10),
(307, 9, 'Sadulpur Junction (SDLP)', '18:35:00', '19:00:00', 11),
(308, 9, 'Hisar (HSR)', '20:20:00', NULL, 12),
(309, 10, 'Kolkata Chitpur (KOAA)', NULL, '13:10:00', 1),
(310, 10, 'Barddhaman Junction (BWN)', '14:29:00', '14:31:00', 2),
(311, 10, 'Asansol Junction (ASN)', '15:52:00', '15:57:00', 3),
(312, 10, 'Madhupur Junction (MDP)', '17:03:00', '17:05:00', 4),
(313, 10, 'Jasidih Junction (JSME)', '17:33:00', '17:35:00', 5),
(314, 10, 'Jhajha (JAJ)', '18:55:00', '19:00:00', 6),
(315, 10, 'Patna Junction (PNBE)', '21:30:00', '21:40:00', 7),
(316, 10, 'Pt. Deen Dayal Upadhyaya Jn (DDU)', '01:45:00', '01:55:00', 8),
(317, 10, 'Prayagraj Junction (PRYJ)', '04:00:00', '04:05:00', 9),
(318, 10, 'Kanpur Central (CNB)', '06:25:00', '06:30:00', 10),
(319, 10, 'Tundla Junction (TDL)', '09:15:00', '09:20:00', 11),
(320, 10, 'Agra Fort (AF)', '09:55:00', '10:00:00', 12),
(321, 10, 'Sawai Madhopur (SWM)', '13:30:00', '13:40:00', 13),
(322, 10, 'Jaipur (JP)', '15:55:00', '16:05:00', 14),
(323, 10, 'Ajmer Junction (AII)', '18:05:00', '18:15:00', 15),
(324, 10, 'Nasirabad (NSD)', '18:40:00', '18:42:00', 16),
(325, 10, 'Bijainagar (BJNR)', '19:22:00', '19:24:00', 17),
(326, 10, 'Bhilwara (BHL)', '20:10:00', '20:15:00', 18),
(327, 10, 'Chanderiya (CNA)', '21:45:00', '21:50:00', 19),
(328, 10, 'Mavli Junction (MVJ)', '23:18:00', '23:20:00', 20),
(329, 10, 'Rana Pratap Nagar (RPZ)', '23:51:00', '23:53:00', 21),
(330, 10, 'Udaipur City (UDZ)', '00:25:00', NULL, 22),
(331, 11, 'Old Delhi (DLI)', NULL, '17:35:00', 1),
(332, 11, 'Delhi Sarai Rohilla (DEE)', '17:48:00', '17:50:00', 2),
(333, 11, 'Delhi Cantt (DEC)', '18:05:00', '18:07:00', 3),
(334, 11, 'Palam (PM)', '18:14:00', '18:16:00', 4),
(335, 11, 'Gurgaon (GGN)', '18:30:00', '18:32:00', 5),
(336, 11, 'Garhi Harsaru (GHH)', '18:41:00', '18:43:00', 6),
(337, 11, 'Pataudi Road (PTRD)', '18:58:00', '19:00:00', 7),
(338, 11, 'Khalilpur (KIP)', '19:10:00', '19:12:00', 8),
(339, 11, 'Rewari (RE)', '19:43:00', '19:45:00', 9),
(340, 11, 'Bawal (BWL)', '19:59:00', '20:01:00', 10),
(341, 11, 'Harsauli (HSI)', '20:18:00', '20:20:00', 11),
(342, 11, 'Khairthal (KRH)', '20:29:00', '20:31:00', 12),
(343, 11, 'Alwar (AWR)', '20:52:00', '20:55:00', 13),
(344, 11, 'Malakhera (MKH)', '21:08:00', '21:10:00', 14),
(345, 11, 'Rajgarh (RHG)', '21:24:00', '21:26:00', 15),
(346, 11, 'Baswa (BU)', '21:42:00', '21:44:00', 16),
(347, 11, 'Bandikui Junction (BKI)', '21:57:00', '21:59:00', 17),
(348, 11, 'Dausa (DO)', '22:19:00', '22:21:00', 18),
(349, 11, 'Gandhinagar Jaipur (GADJ)', '23:09:00', '23:11:00', 19),
(350, 11, 'Jaipur (JP)', '23:35:00', '23:45:00', 20),
(351, 11, 'Asalpur Jobner (JOB)', '00:11:00', '00:13:00', 21),
(352, 11, 'Phulera Junction (FL)', '00:58:00', '01:00:00', 22),
(353, 11, 'Nawa City (NAC)', '01:26:00', '01:28:00', 23),
(354, 11, 'Makrana Junction (MKN)', '01:54:00', '01:56:00', 24),
(355, 11, 'Degana Junction (DNA)', '02:33:00', '02:36:00', 25),
(356, 11, 'Merta Road Junction (MTD)', '03:35:00', '03:40:00', 26),
(357, 11, 'Gotan (GOTN)', '03:55:00', '03:57:00', 27),
(358, 11, 'Raika Bagh (RKB)', '04:50:00', '04:52:00', 28),
(359, 11, 'Jodhpur Junction (JU)', '05:05:00', '05:30:00', 29),
(360, 11, 'Marwar Mathanya (MMY)', '06:04:00', '06:06:00', 30),
(361, 11, 'Tivari (TIW)', '06:15:00', '06:17:00', 31),
(362, 11, 'Osiyan (OSN)', '06:32:00', '06:34:00', 32),
(363, 11, 'Marwar Lohwat (MWT)', '07:07:00', '07:09:00', 33),
(364, 11, 'Phalodi Junction (PLCJ)', '07:33:00', '07:38:00', 34),
(365, 11, 'Ramdevra (RDRA)', '08:14:00', '08:16:00', 35),
(366, 11, 'Pokran (POK)', '08:43:00', '09:08:00', 36),
(367, 11, 'Ashapura Gomat (AQG)', '09:12:00', '09:14:00', 37),
(368, 11, 'Shri Bhadriya Lathi (SBLT)', '09:42:00', '09:44:00', 38),
(369, 11, 'Jaisalmer (JSM)', '11:15:00', NULL, 39),
(370, 12, 'Barmer (BME)', NULL, '08:15:00', 1),
(371, 12, 'Baytu (BUT)', '08:52:00', '08:54:00', 2),
(372, 12, 'Balotra Junction (BLT)', '09:30:00', '09:35:00', 3),
(373, 12, 'Samdhari Junction (SMR)', '10:00:00', '10:05:00', 4),
(374, 12, 'Dundara (DOR)', '10:31:00', '10:33:00', 5),
(375, 12, 'Luni Junction (LUNI)', '10:52:00', '10:54:00', 6),
(376, 12, 'Jodhpur Junction (JU)', '11:30:00', '11:45:00', 7),
(377, 12, 'Pipar Road Junction (PPR)', '12:24:00', '12:26:00', 8),
(378, 12, 'Gotan (GOTN)', '12:50:00', '12:52:00', 9),
(379, 12, 'Merta Road Junction (MTD)', '13:10:00', '13:15:00', 10),
(380, 12, 'Nagaur (NGO)', '13:50:00', '13:55:00', 11),
(381, 12, 'Nokha (NOK)', '14:52:00', '14:54:00', 12),
(382, 12, 'Deshnok (DSO)', '15:18:00', '15:20:00', 13),
(383, 12, 'Bikaner Junction (BKN)', '16:40:00', '16:55:00', 14),
(384, 12, 'Lalgarh Junction (LGH)', '17:05:00', '17:07:00', 15),
(385, 12, 'Lunkaransar (LKS)', '18:05:00', '18:07:00', 16),
(386, 12, 'Mahajan (MHJ)', '18:32:00', '18:34:00', 17),
(387, 12, 'Arjansar (AS)', '18:48:00', '18:50:00', 18),
(388, 12, 'Suratgarh Junction (SOG)', '19:55:00', '20:00:00', 19),
(389, 12, 'Pili Bangan (PGK)', '20:24:00', '20:26:00', 20),
(390, 12, 'Hanumangarh Junction (HMH)', '21:00:00', '21:05:00', 21),
(391, 12, 'Manaksar (MNSR)', '21:23:00', '21:25:00', 22),
(392, 12, 'Sangaria (SGRA)', '21:38:00', '21:40:00', 23),
(393, 12, 'Dhaban (DABN)', '21:50:00', '21:52:00', 24),
(394, 12, 'Mandi Dabwali (MBY)', '22:05:00', '22:10:00', 25),
(395, 12, 'Bathinda Junction (BTI)', '23:10:00', '23:35:00', 26),
(396, 12, 'Bhuchchu (BCU)', '23:48:00', '23:50:00', 27),
(397, 12, 'Rampura Phul (PUL)', '00:02:00', '00:04:00', 28),
(398, 12, 'Barnala (BNN)', '00:28:00', '00:30:00', 29),
(399, 12, 'Dhuri Junction (DUI)', '01:07:00', '01:12:00', 30),
(400, 12, 'Nabha (NBA)', '01:32:00', '01:34:00', 31),
(401, 12, 'Patiala (PTA)', '02:05:00', '02:10:00', 32),
(402, 12, 'Rajpura Junction (RPJ)', '02:46:00', '02:48:00', 33),
(403, 12, 'Ambala City (UBC)', '03:18:00', '03:20:00', 34),
(404, 12, 'Ambala Cantt Junction (UMB)', '03:45:00', '03:59:00', 35),
(405, 12, 'Yamunanagar Jagadhri (YJUD)', '05:05:00', '05:10:00', 36),
(406, 12, 'Saharanpur (SRE)', '05:45:00', '06:00:00', 37),
(407, 12, 'Roorkee (RK)', '06:50:00', '06:55:00', 38),
(408, 12, 'Jwalapur (JWP)', '07:56:00', '07:58:00', 39),
(409, 12, 'Haridwar Junction (HW)', '08:10:00', '08:20:00', 40),
(410, 12, 'Motichur (MOTC)', '08:28:00', '08:30:00', 41),
(411, 12, 'Raiwala (RWL)', '08:49:00', '08:51:00', 42),
(412, 12, 'Rishikesh (RKSH)', '09:40:00', NULL, 43),
(413, 13, 'Jodhpur Junction (JU)', NULL, '09:40:00', 1),
(414, 13, 'Bhagat Ki Kothi (BGKT)', '09:46:00', '09:48:00', 2),
(415, 13, 'Basni (BANE)', '09:53:00', '09:55:00', 3),
(416, 13, 'Salawas (SZ)', '10:05:00', '10:06:00', 4),
(417, 13, 'Hanwant (HWT)', '10:14:00', '10:15:00', 5),
(418, 13, 'Luni Junction (LUNI)', '10:22:00', '10:25:00', 6),
(419, 13, 'Rohat (RT)', '10:37:00', '10:39:00', 7),
(420, 13, 'Kairla (KAI)', '10:49:00', '10:51:00', 8),
(421, 13, 'Pali Marwar (PMY)', '11:05:00', '11:10:00', 9),
(422, 13, 'Bomadra (BOM)', '11:22:00', '11:24:00', 10),
(423, 13, 'Rajkiawas (RKZ)', '11:43:00', '11:45:00', 11),
(424, 13, 'Marwar Junction (MJ)', '12:05:00', '12:15:00', 12),
(425, 13, 'Auwa (AUWA)', '12:24:00', '12:25:00', 13),
(426, 13, 'Bhinwaliya (BWA)', '12:39:00', '12:40:00', 14),
(427, 13, 'Somesar (SOS)', '12:47:00', '12:48:00', 15),
(428, 13, 'Jawali (JAL)', '12:57:00', '12:58:00', 16),
(429, 13, 'Rani (RANI)', '13:10:00', '13:12:00', 17),
(430, 13, 'Khimel (KZQ)', '13:19:00', '13:20:00', 18),
(431, 13, 'Falna (FA)', '13:35:00', '13:40:00', 19),
(432, 13, 'Biroliya (BRLY)', '13:48:00', '13:49:00', 20),
(433, 13, 'Jawai Bandh (JWB)', '13:57:00', '13:59:00', 21),
(434, 13, 'Mori Bera (MOI)', '14:08:00', '14:09:00', 22),
(435, 13, 'Nana (NANA)', '14:23:00', '14:24:00', 23),
(436, 13, 'Keshavganj (KVJ)', '14:33:00', '14:34:00', 24),
(437, 13, 'Pindwara (PDWA)', '14:43:00', '14:45:00', 25),
(438, 13, 'Banas (BNS)', '14:55:00', '14:56:00', 26),
(439, 13, 'Swarupganj (SRPJ)', '15:05:00', '15:06:00', 27),
(440, 13, 'Bhimana (BMN)', '15:15:00', '15:16:00', 28),
(441, 13, 'Kivarli (KWI)', '15:24:00', '15:25:00', 29),
(442, 13, 'Morthala (MXO)', '15:32:00', '15:33:00', 30),
(443, 13, 'Abu Road (ABR)', '15:50:00', '16:00:00', 31),
(444, 13, 'Maval (MAA)', '16:10:00', '16:11:00', 32),
(445, 13, 'Shri Amirgadh (SIM)', '16:19:00', '16:20:00', 33),
(446, 13, 'Sarotra Road (SZA)', '16:27:00', '16:28:00', 34),
(447, 13, 'Iqbal Gadh (IQG)', '16:36:00', '16:37:00', 35),
(448, 13, 'Jethi (JTY)', '16:44:00', '16:45:00', 36),
(449, 13, 'Chitrasani (CTT)', '16:51:00', '16:52:00', 37),
(450, 13, 'Karjoda (KRJD)', '16:59:00', '17:00:00', 38),
(451, 13, 'Palanpur Junction (PNU)', '17:20:00', '17:22:00', 39),
(452, 13, 'Umardashi (UM)', '17:28:00', '17:30:00', 40),
(453, 13, 'Chhapi (CHP)', '17:39:00', '17:40:00', 41),
(454, 13, 'Siddhpur (SID)', '17:55:00', '17:57:00', 42),
(455, 13, 'Unjha (UJA)', '18:28:00', '18:30:00', 43),
(456, 13, 'Mahesana Junction (MSH)', '19:00:00', '19:02:00', 44),
(457, 13, 'Ambliyasan (UMN)', '19:20:00', '19:22:00', 45),
(458, 13, 'Dangarwa (DNW)', '19:30:00', '19:31:00', 46),
(459, 13, 'Jhulasan (JUL)', '19:40:00', '19:41:00', 47),
(460, 13, 'Kalol Junction (KLL)', '19:55:00', '19:57:00', 48),
(461, 13, 'Khodiyar (KHDB)', '20:10:00', '20:12:00', 49),
(462, 13, 'Sabarmati BG (SBIB)', '20:45:00', NULL, 50),
(463, 14, 'New Delhi (NDLS)', NULL, '15:20:00', 1),
(464, 14, 'Ghaziabad (GZB)', '15:53:00', '15:55:00', 2),
(465, 14, 'Meerut City (MTC)', '16:32:00', '16:34:00', 3),
(466, 14, 'Muzaffarnagar (MOZ)', '17:12:00', '17:14:00', 4),
(467, 14, 'Deoband (DBD)', '17:32:00', '17:34:00', 5),
(468, 14, 'Tapri (TPZ)', '18:09:00', '18:11:00', 6),
(469, 14, 'Roorkee (RK)', '18:46:00', '18:48:00', 7),
(470, 14, 'Haridwar Junction (HW)', '19:33:00', '19:38:00', 8),
(471, 14, 'Dehradun (DDN)', '21:10:00', NULL, 9),
(472, 15, 'Jodhpur Junction (JU)', NULL, '08:25:00', 1),
(473, 15, 'Raika Bagh (RKB)', '08:31:00', '08:33:00', 2),
(474, 15, 'Gotan (GOTN)', '09:26:00', '09:28:00', 3),
(475, 15, 'Merta Road Junction (MTD)', '09:45:00', '09:50:00', 4),
(476, 15, 'Ren (REN)', '10:05:00', '10:07:00', 5),
(477, 15, 'Degana Junction (DNA)', '10:28:00', '10:31:00', 6),
(478, 15, 'Makrana Junction (MKN)', '11:01:00', '11:04:00', 7),
(479, 15, 'Kuchaman City (KMNC)', '11:20:00', '11:22:00', 8),
(480, 15, 'Nawa City (NAC)', '11:34:00', '11:36:00', 9),
(481, 15, 'Phulera Junction (FL)', '12:20:00', '12:25:00', 10),
(482, 15, 'Asalpur Jobner (JOB)', '12:39:00', '12:41:00', 11),
(483, 15, 'Kanakpura (KKU)', '13:11:00', '13:13:00', 12),
(484, 15, 'Jaipur Junction (JP)', '13:35:00', '13:45:00', 13),
(485, 15, 'Gandhinagar Jaipur (GADJ)', '13:55:00', '13:57:00', 14),
(486, 15, 'Dausa (DO)', '14:35:00', '14:37:00', 15),
(487, 15, 'Bandikui Junction (BKI)', '15:00:00', '15:05:00', 16),
(488, 15, 'Alwar Junction (AWR)', '15:55:00', '15:58:00', 17),
(489, 15, 'Khairthal (KRH)', '16:18:00', '16:20:00', 18),
(490, 15, 'Rewari (RE)', '17:05:00', '17:10:00', 19),
(491, 15, 'Bhiwani Junction (BNW)', '18:10:00', '18:15:00', 20),
(492, 15, 'Hisar (HSR)', '19:35:00', '19:40:00', 21),
(493, 15, 'Tohana (TUN)', '20:38:00', '20:40:00', 22),
(494, 15, 'Jakhal Junction (JHL)', '20:55:00', '20:57:00', 23),
(495, 15, 'Sangrur (SAG)', '21:25:00', '21:27:00', 24),
(496, 15, 'Dhuri Junction (DUI)', '21:50:00', '21:55:00', 25),
(497, 15, 'Malerkotla (MET)', '22:10:00', '22:12:00', 26),
(498, 15, 'Ahmedgarh (AHH)', '22:24:00', '22:26:00', 27),
(499, 15, 'Ludhiana Junction (LDH)', '23:10:00', '23:20:00', 28),
(500, 15, 'Phagwara Junction (PGW)', '23:48:00', '23:50:00', 29),
(501, 15, 'Jalandhar Cantt (JRC)', '00:08:00', '00:10:00', 30),
(502, 15, 'Jalandhar City (JUC)', '00:20:00', '00:30:00', 31),
(503, 15, 'Beas (BEAS)', '01:08:00', '01:10:00', 32),
(504, 15, 'Amritsar Junction (ASR)', '02:00:00', NULL, 33),
(505, 16, 'Bandra Terminus (BDTS)', NULL, '17:05:00', 1),
(506, 16, 'Andheri (ADH)', '17:11:00', '17:13:00', 2),
(507, 16, 'Borivali (BVI)', '17:37:00', '17:40:00', 3),
(508, 16, 'Palghar (PLG)', '18:26:00', '18:28:00', 4),
(509, 16, 'Vapi (VAPI)', '19:14:00', '19:17:00', 5),
(510, 16, 'Valsad (BL)', '19:40:00', '19:45:00', 6),
(511, 16, 'Surat (ST)', '20:35:00', '20:40:00', 7),
(512, 16, 'Vadodara Junction (BRC)', '22:20:00', '22:30:00', 8),
(513, 16, 'Godhra Junction (GDA)', '23:33:00', '23:35:00', 9),
(514, 16, 'Dahod (DHD)', '00:23:00', '00:25:00', 10),
(515, 16, 'Meghnagar (MGN)', '00:49:00', '00:51:00', 11),
(516, 16, 'Ratlam Junction (RTM)', '02:10:00', '02:15:00', 12),
(517, 16, 'Nagda Junction (NAD)', '03:03:00', '03:05:00', 13),
(518, 16, 'Kota Junction (KOTA)', '05:25:00', '05:30:00', 14),
(519, 16, 'Sawai Madhopur (SWM)', '07:00:00', '07:20:00', 15),
(520, 16, 'Durgapura (DPA)', '09:01:00', '09:04:00', 16),
(521, 16, 'Jaipur Junction (JP)', '09:45:00', NULL, 17),
(522, 17, 'Delhi Sarai Rohilla (DEE)', NULL, '23:10:00', 1),
(523, 17, 'Delhi Cantt. (DEC)', '23:25:00', '23:27:00', 2),
(524, 17, 'Gurgaon (GGN)', '23:43:00', '23:45:00', 3),
(525, 17, 'Pataudi Road (PTRD)', '00:06:00', '00:08:00', 4),
(526, 17, 'Rewari (RE)', '00:35:00', '00:38:00', 5),
(527, 17, 'Mahendragarh (MHRG)', '01:16:00', '01:18:00', 6),
(528, 17, 'Loharu (LHU)', '01:50:00', '01:55:00', 7),
(529, 17, 'Sadulpur Junction (SDLP)', '02:45:00', '02:50:00', 8),
(530, 17, 'Churu (CUR)', '03:40:00', '03:50:00', 9),
(531, 17, 'Ratangarh Junction (RTGH)', '04:30:00', '04:35:00', 10),
(532, 17, 'Talchhapar (TLC)', '05:00:00', '05:02:00', 11),
(533, 17, 'Sujangarh (SUJH)', '05:12:00', '05:17:00', 12),
(534, 17, 'Ladnun (LAU)', '05:27:00', '05:32:00', 13),
(535, 17, 'Didwana (DIA)', '05:54:00', '05:59:00', 14),
(536, 17, 'Choti Khatu (CTKT)', '06:24:00', '06:26:00', 15),
(537, 17, 'Degana Junction (DNA)', '06:50:00', '06:53:00', 16),
(538, 17, 'Ren (REN)', '07:14:00', '07:16:00', 17),
(539, 17, 'Merta Road Junction (MTD)', '07:40:00', '07:45:00', 18),
(540, 17, 'Pipar Road Junction (PPR)', '08:22:00', '08:24:00', 19),
(541, 17, 'Jodhpur Junction (JU)', '09:35:00', NULL, 20),
(542, 18, 'Jaisalmer (JSM)', NULL, '01:25:00', 1),
(543, 18, 'Pokaran (POK)', '03:05:00', '03:07:00', 2),
(544, 18, 'Phalodi Junction (PLCJ)', '04:05:00', '04:07:00', 3),
(545, 18, 'Osiyan (OSN)', '05:05:00', '05:07:00', 4),
(546, 18, 'Jodhpur Junction (JU)', '06:45:00', '07:00:00', 5),
(547, 18, 'Pali Marwar (PMY)', '08:05:00', '08:07:00', 6),
(548, 18, 'Marwar Junction (MJ)', '09:05:00', '09:07:00', 7),
(549, 18, 'Sojat Road (SOD)', '09:25:00', '09:27:00', 8),
(550, 18, 'Beawar (BER)', '10:15:00', '10:17:00', 9),
(551, 18, 'Ajmer Junction (AII)', '11:20:00', '11:30:00', 10),
(552, 18, 'Kishangarh (KSG)', '12:00:00', '12:02:00', 11),
(553, 18, 'Phulera Junction (FL)', '12:45:00', '12:47:00', 12),
(554, 18, 'Jaipur Junction (JP)', '13:45:00', '13:55:00', 13),
(555, 18, 'Dausa (DO)', '14:38:00', '14:40:00', 14),
(556, 18, 'Bandikui Junction (BKI)', '15:00:00', '15:02:00', 15),
(557, 18, 'Alwar Junction (AWR)', '15:55:00', '15:57:00', 16),
(558, 18, 'Rewari (RE)', '17:05:00', '17:10:00', 17),
(559, 18, 'Gurgaon (GGN)', '18:00:00', '18:02:00', 18),
(560, 18, 'Delhi Cantt. (DEC)', '18:18:00', '18:20:00', 19),
(561, 18, 'Delhi Sarai Rohilla (DEE)', '18:50:00', '19:10:00', 20),
(562, 18, 'Ghaziabad (GZB)', '19:55:00', '19:57:00', 21),
(563, 18, 'Moradabad (MB)', '22:05:00', '22:13:00', 22),
(564, 18, 'Bareilly (BE)', '23:20:00', '23:22:00', 23),
(565, 18, 'Lucknow NR (LKO)', '02:10:00', '02:20:00', 24),
(566, 18, 'Varanasi Junction (BSB)', '06:00:00', '06:10:00', 25),
(567, 18, 'Gaya Junction (GAYA)', '09:00:00', '09:05:00', 26),
(568, 18, 'Dhanbad Junction (DHN)', '12:05:00', '12:10:00', 27),
(569, 18, 'Asansol Junction (ASN)', '13:17:00', '13:22:00', 28),
(570, 18, 'Durgapur (DGR)', '13:52:00', '13:54:00', 29),
(571, 18, 'Howrah Junction (HWH)', '16:55:00', NULL, 30),
(572, 19, 'Jodhpur Junction (JU)', NULL, '08:25:00', 1),
(573, 19, 'Bhagat Ki Kothi (BGKT)', '08:34:00', '08:36:00', 2),
(574, 19, 'Pipar Road Junction (PPR)', '09:28:00', '09:30:00', 3),
(575, 19, 'Gotan (GOTN)', '09:48:00', '09:50:00', 4),
(576, 19, 'Merta Road Junction (MTD)', '10:15:00', '10:20:00', 5),
(577, 19, 'Degana Junction (DNA)', '10:43:00', '10:45:00', 6),
(578, 19, 'Ren (REN)', '11:04:00', '11:06:00', 7),
(579, 19, 'Makrana Junction (MKN)', '11:24:00', '11:26:00', 8),
(580, 19, 'Kuchaman City (KMNC)', '11:38:00', '11:40:00', 9),
(581, 19, 'Nawa City (NAC)', '11:54:00', '11:56:00', 10),
(582, 19, 'Phulera Junction (FL)', '12:45:00', '12:50:00', 11),
(583, 19, 'Kanakpura (KKU)', '13:14:00', '13:16:00', 12),
(584, 19, 'Jaipur Junction (JP)', '13:45:00', '13:55:00', 13),
(585, 19, 'Gandhinagar Jaipur (GADJ)', '14:06:00', '14:08:00', 14),
(586, 19, 'Dausa (DO)', '14:38:00', '14:40:00', 15),
(587, 19, 'Bandikui Junction (BKI)', '15:00:00', '15:02:00', 16),
(588, 19, 'Alwar Junction (AWR)', '15:55:00', '15:57:00', 17),
(589, 19, 'Khairthal (KRH)', '16:16:00', '16:18:00', 18),
(590, 19, 'Rewari (RE)', '17:05:00', '17:10:00', 19),
(591, 19, 'Bhiwani Junction (BNW)', '18:10:00', '18:15:00', 20),
(592, 19, 'Rohtak Junction (ROK)', '19:18:00', '19:20:00', 21),
(593, 19, 'Gohana (GHNA)', '19:50:00', '19:52:00', 22),
(594, 19, 'Jind Junction (JIND)', '20:25:00', '20:30:00', 23),
(595, 19, 'Narwana Junction (NRW)', '21:00:00', '21:05:00', 24),
(596, 19, 'Tohana (TUN)', '21:25:00', '21:27:00', 25),
(597, 19, 'Jakhal Junction (JHL)', '21:45:00', '21:50:00', 26),
(598, 19, 'Sunam (SFM)', '22:18:00', '22:20:00', 27),
(599, 19, 'Sangrur (SAG)', '22:38:00', '22:40:00', 28),
(600, 19, 'Dhuri Junction (DUI)', '23:00:00', '23:05:00', 29),
(601, 19, 'Malerkotla (MET)', '23:23:00', '23:25:00', 30),
(602, 19, 'Ahmedgarh (AHH)', '23:35:00', '23:37:00', 31),
(603, 19, 'Ludhiana Junction (LDH)', '00:20:00', '00:30:00', 32),
(604, 19, 'Phagwara Junction (PGW)', '01:00:00', '01:02:00', 33),
(605, 19, 'Jalandhar Cantt. (JRC)', '01:20:00', '01:22:00', 34),
(606, 19, 'Jalandhar City Junction (JUC)', '01:35:00', '01:45:00', 35),
(607, 19, 'Beas (BEAS)', '02:20:00', '02:22:00', 36),
(608, 19, 'Amritsar Junction (ASR)', '03:10:00', NULL, 37),
(609, 20, 'Udaipur City (UDZ)', NULL, '13:05:00', 1),
(610, 20, 'Ranapratapnagar (RPZ)', '13:12:00', '13:13:00', 2),
(611, 20, 'Mavli Junction (MVJ)', '13:45:00', '13:47:00', 3),
(612, 20, 'Fatehnagar (FAN)', '13:56:00', '13:58:00', 4),
(613, 20, 'Bhupalsagar (BSJ)', '14:10:00', '14:11:00', 5),
(614, 20, 'Kapasan (KIN)', '14:21:00', '14:23:00', 6),
(615, 20, 'Chittaurgarh (COR)', '15:40:00', '16:05:00', 7),
(616, 20, 'Gangrar (GGR)', '16:41:00', '16:42:00', 8),
(617, 20, 'Hamirgarh (HMG)', '16:55:00', '16:56:00', 9),
(618, 20, 'Bhilwara (BHL)', '17:10:00', '17:12:00', 10),
(619, 20, 'Mandal (MDL)', '17:22:00', '17:23:00', 11),
(620, 20, 'Bijainagar (BJNR)', '18:11:00', '18:13:00', 12),
(621, 20, 'Nasirabad (NSD)', '18:46:00', '18:48:00', 13),
(622, 20, 'Ajmer Junction (AII)', '19:22:00', '19:45:00', 14),
(623, 20, 'Kishangarh (KSG)', '20:13:00', '20:15:00', 15),
(624, 20, 'Phulera Junction (FL)', '20:58:00', '21:00:00', 16),
(625, 20, 'Asalpur Jobner (JOB)', '21:14:00', '21:15:00', 17),
(626, 20, 'Jaipur (JP)', '21:50:00', '22:00:00', 18),
(627, 20, 'Gandhinagar Jaipur (GADJ)', '22:10:00', '22:13:00', 19),
(628, 20, 'Dausa (DO)', '22:49:00', '22:51:00', 20),
(629, 20, 'Bandikui Junction (BKI)', '23:15:00', '23:17:00', 21),
(630, 20, 'Rajgarh (RHG)', '23:33:00', '23:35:00', 22),
(631, 20, 'Alwar (AWR)', '00:10:00', '00:13:00', 23),
(632, 20, 'Rewari (RE)', '01:43:00', '01:45:00', 24),
(633, 20, 'Delhi Cantt (DEC)', '02:34:00', '02:36:00', 25),
(634, 20, 'Delhi (DLI)', '03:30:00', '03:45:00', 26),
(635, 20, 'Delhi Shahdara (DSA)', '03:59:00', '04:01:00', 27),
(636, 20, 'Baraut (BTU)', '05:10:00', '05:12:00', 28),
(637, 20, 'Shamli (SMQL)', '06:22:00', '06:27:00', 29),
(638, 20, 'Rampur Maniharan (RPMN)', '07:18:00', '07:20:00', 30),
(639, 20, 'Tapri (TPZ)', '08:13:00', '08:15:00', 31),
(640, 20, 'Roorkee (RK)', '09:22:00', '09:24:00', 32),
(641, 20, 'Haridwar Junction (HW)', '10:30:00', NULL, 33);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone_number`, `email`, `password`, `role`) VALUES
(1, 'admin', '9999999999', 'admin@gktrainza.com', '$2y$10$TkM/Rt7AUv80ugS3A/RP/u3l8G/wPr.pOiRqD2zxvalMdgycH.lNC', 1),
(2, 'user', '56454', 'user@gmail.com', '$2y$10$iL5XLSTlp75Z9cwWoAQflOfRjhEDc39xBeXXY5igZ3leAKGJRNxbS', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `trains`
--
ALTER TABLE `trains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `train_number` (`train_number`);

--
-- Indexes for table `train_stations`
--
ALTER TABLE `train_stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `train_id` (`train_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `trains`
--
ALTER TABLE `trains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `train_stations`
--
ALTER TABLE `train_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=642;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `train_stations`
--
ALTER TABLE `train_stations`
  ADD CONSTRAINT `train_stations_ibfk_1` FOREIGN KEY (`train_id`) REFERENCES `trains` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
