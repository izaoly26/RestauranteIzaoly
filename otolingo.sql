-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2026 at 05:00 PM
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
-- Database: `otolingo`
--

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id_curso` smallint(4) NOT NULL,
  `idioma` char(8) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id_curso`, `idioma`, `descripcion`) VALUES
(100, 'otomi', 'curso basico de otomi del estado de mexico');

-- --------------------------------------------------------

--
-- Table structure for table `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id_ejercicio` smallint(4) NOT NULL,
  `tipo` varchar(30) NOT NULL,
  `pregunta` varchar(50) NOT NULL,
  `respuesta_correcta` varchar(20) NOT NULL,
  `id_unidad` smallint(4) NOT NULL,
  `id_curso` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ejercicio`
--

INSERT INTO `ejercicio` (`id_ejercicio`, `tipo`, `pregunta`, `respuesta_correcta`, `id_unidad`, `id_curso`) VALUES
(1, 'opcion multiple', '¿cual es Roxa?', 'Roxa', 1, 100),
(2, 'opcion multiple', '¿cual es cafe en otomi?', 'Boxo', 1, 100),
(3, 'pregunta abierta', 'escribe en español naraxa', 'naranja', 1, 100),
(4, 'pregunta abierta', 'escribe en otomi cafe', 'Boxo', 1, 100),
(5, 'opcion multiple', '¿cual es rosa en otomi?', 'Roxa', 1, 100),
(6, 'opcion multiple ', 'selecciona buenos dias en otomi', 'hanin\'su', 2, 100),
(7, 'opcion multiple', '¿cual es mama en otomi?', 'M\'e', 2, 100),
(8, 'opcion multiple', 'selecciona T \'a en español ', 'papa', 2, 100),
(9, 'completa la frase', 'a completa la frase \"Buenos días\"', 'hanin\' su m\'e', 2, 100),
(10, 'completa la frase', 'completa la frase \"Buenos días papa\"', 'hanin\'su t\'a', 2, 100);

-- --------------------------------------------------------

--
-- Table structure for table `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` smallint(4) NOT NULL,
  `porcentaje` smallint(2) NOT NULL,
  `experiencia` int(20) NOT NULL,
  `racha` int(3) NOT NULL,
  `fecha_registro` date NOT NULL,
  `id_usuario` smallint(4) NOT NULL,
  `id_curso` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `porcentaje`, `experiencia`, `racha`, `fecha_registro`, `id_usuario`, `id_curso`) VALUES
(1, 1, 300, 1, '2026-10-19', 7, 100),
(2, 36, 190, 8, '2026-10-25', 5, 100);

-- --------------------------------------------------------

--
-- Table structure for table `respuesta_usuario`
--

CREATE TABLE `respuesta_usuario` (
  `id_respuesta` smallint(4) NOT NULL,
  `respuesta_de_usuario` varchar(30) NOT NULL,
  `respuesta_correcta` varchar(30) NOT NULL,
  `fecha_respuesta` date NOT NULL,
  `id_ejercicio` smallint(4) NOT NULL,
  `id_usuario` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unidad`
--

CREATE TABLE `unidad` (
  `id_unidad` smallint(4) NOT NULL,
  `titulo` varchar(20) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_curso` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unidad`
--

INSERT INTO `unidad` (`id_unidad`, `titulo`, `descripcion`, `id_curso`) VALUES
(1, 'colores ', 'colores en otomi del estado de mexico', 100),
(2, 'saludos', 'saludos en otomi del estado de mexico', 100);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` smallint(4) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `contraseña` varchar(6) NOT NULL,
  `fecha_registro` date NOT NULL,
  `fecha_nac` date NOT NULL,
  `pais` varchar(20) NOT NULL,
  `nivel` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `contraseña`, `fecha_registro`, `fecha_nac`, `pais`, `nivel`) VALUES
(1, 'Josue', 'josue@gmail.com', '123456', '2026-10-25', '2006-10-03', 'Mexico', 1),
(5, 'Izaoly', 'izaoly@gmail.com', '123456', '2026-11-04', '5555-05-05', 'Italia', 1),
(7, 'Ingrid Verne', 'ingridverne99@gmail.', '123456', '2026-10-19', '2009-08-04', 'corea del sur', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`),
  ADD KEY `id_unidad` (`id_unidad`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `respuesta_usuario`
--
ALTER TABLE `respuesta_usuario`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_ejercicio` (`id_ejercicio`);

--
-- Indexes for table `unidad`
--
ALTER TABLE `unidad`
  ADD PRIMARY KEY (`id_unidad`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `id_ejercicio` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `respuesta_usuario`
--
ALTER TABLE `respuesta_usuario`
  MODIFY `id_respuesta` smallint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unidad`
--
ALTER TABLE `unidad`
  MODIFY `id_unidad` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` smallint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
