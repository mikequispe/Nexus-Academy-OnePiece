-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2026 a las 11:15:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nexus_academy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `nota_final` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `apellido`, `celular`, `nota_final`) VALUES
(1, 'Luffy', 'Monkey D.', 'Mushi-001', 5.00),
(2, 'Zoro', 'Roronoa', 'Mushi-002', 9.50),
(3, 'Nami', 'Navegante', 'Mushi-003', 96.00),
(4, 'Usopp', 'God', 'Mushi-004', 4.50),
(5, 'Sanji', 'Vinsmoke', 'Mushi-005', 8.00),
(6, 'Chopper', 'Tony Tony', 'Mushi-006', 10.00),
(7, 'Robin', 'Nico', 'Mushi-007', 9.80),
(8, 'Franky', 'Cyborg', 'Mushi-008', 7.00),
(9, 'Brook', 'Soul King', 'Mushi-009', 6.50),
(10, 'Jinbe', 'Caballero Mar', 'Mushi-010', 9.00),
(11, 'Buggy', 'El Payaso', 'Mushi-011', 2.00),
(12, 'Law', 'Trafalgar D.', 'Mushi-012', 9.50),
(13, 'Kid', 'Eustass', 'Mushi-013', 3.50),
(14, 'Hancock', 'Boa', 'Mushi-014', 8.50),
(15, 'Ace', 'Portgas D.', 'Mushi-015', 7.50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
