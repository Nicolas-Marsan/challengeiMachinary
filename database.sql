-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2022 a las 20:27:15
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `moviesi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies`
--

CREATE TABLE `movies` (
  `id` int(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `year` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`) VALUES
(1, 'matrix', '2001'),
(2, 'Rambo', '1984'),
(3, 'Rambo2', '1986'),
(4, 'Harry potter', '2000'),
(5, 'Terminator', '1983'),
(6, 'Comando', '1990');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies_actors`
--

CREATE TABLE `movies_actors` (
  `id` int(100) NOT NULL,
  `movies_id` int(100) NOT NULL,
  `person_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movies_actors`
--

INSERT INTO `movies_actors` (`id`, `movies_id`, `person_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 3),
(5, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies_directors`
--

CREATE TABLE `movies_directors` (
  `id` int(100) NOT NULL,
  `person_id` int(10) NOT NULL,
  `movies_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movies_directors`
--

INSERT INTO `movies_directors` (`id`, `person_id`, `movies_id`) VALUES
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movies_producers`
--

CREATE TABLE `movies_producers` (
  `id` int(100) NOT NULL,
  `person_id` int(10) NOT NULL,
  `movies_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movies_producers`
--

INSERT INTO `movies_producers` (`id`, `person_id`, `movies_id`) VALUES
(1, 2, 2),
(2, 2, 3),
(3, 2, 4),
(4, 3, 4),
(5, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `person`
--

CREATE TABLE `person` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `age` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `person`
--

INSERT INTO `person` (`id`, `name`, `last_name`, `age`) VALUES
(1, 'nicolas', 'marsan', 37),
(2, 'Jorge', 'Outro', 55),
(3, 'Pedro', 'Almo', 63),
(4, 'Carlos', 'Loco', 25),
(5, 'Maria', 'Moori', 34);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movies_actors`
--
ALTER TABLE `movies_actors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movies_id` (`movies_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indices de la tabla `movies_directors`
--
ALTER TABLE `movies_directors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `movies_id` (`movies_id`);

--
-- Indices de la tabla `movies_producers`
--
ALTER TABLE `movies_producers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `movies_id` (`movies_id`);

--
-- Indices de la tabla `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `movies_actors`
--
ALTER TABLE `movies_actors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movies_directors`
--
ALTER TABLE `movies_directors`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movies_producers`
--
ALTER TABLE `movies_producers`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `person`
--
ALTER TABLE `person`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movies_actors`
--
ALTER TABLE `movies_actors`
  ADD CONSTRAINT `movies_actors_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `movies_actors_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);

--
-- Filtros para la tabla `movies_directors`
--
ALTER TABLE `movies_directors`
  ADD CONSTRAINT `movies_directors_ibfk_1` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`),
  ADD CONSTRAINT `movies_directors_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`);

--
-- Filtros para la tabla `movies_producers`
--
ALTER TABLE `movies_producers`
  ADD CONSTRAINT `movies_producers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `movies_producers_ibfk_2` FOREIGN KEY (`movies_id`) REFERENCES `movies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;