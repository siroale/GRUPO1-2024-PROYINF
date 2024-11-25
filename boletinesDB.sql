-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 08-11-2024 a las 22:34:41
-- Versión del servidor: 10.5.2-MariaDB-1:10.5.2+maria~bionic
-- Versión de PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `boletinesDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletin`
--

CREATE TABLE `boletin` IF NOT EXISTS(
  `id_boletin` int(11) NOT NULL,
  `ruta_archivo` varchar(600) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_publicacion` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `subido_por` int(11) NOT NULL,
  `veces_visitado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `boletin_fuente`
--

CREATE TABLE `boletin_fuente` IF NOT EXISTS(
  `id_boletin_fuente` int(11) NOT NULL,
  `id_boletin` int(11) NOT NULL,
  `id_fuente` int(11) NOT NULL,
  `proporcion_contenido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarga`
--

CREATE TABLE `descarga` IF NOT EXISTS(
  `id_descarga` int(11) NOT NULL,
  `id_boletin` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_descarga` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuente`
--

CREATE TABLE `fuente` IF NOT EXISTS(
  `id_fuente` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `categoria` varchar(45) NOT NULL,
  `url_fuente` varchar(600) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
docker-compose exec grupo1-2024-proyinf bash -c "mysql -u root -h mysql --password=123 boletinesDB < boletinesDB.sql"
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` IF NOT EXISTS(
  `id_usuario` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `tipo_usuario` varchar(45) NOT NULL,
  `fecha_registro` date NOT NULL,
  `usuario_google` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `email`, `nombre`, `password`, `tipo_usuario`, `fecha_registro`, `usuario_google`) VALUES
(1, 'insano@gmail.com', 'elInsanoo', '$2y$10$aStacyOHC6KWT43TtT1lYeCx07pBcpN5vQY8kCAiyz9c9P56.G56a', 'normal', '2024-10-17', 0),
(3, 'goms@gmail.com', 'goms', '$2y$10$c/nmJgduVCjBYCcY3s7YsuD5z/EefxNVJZx87n23TWSxRnvvqtyBW', 'normal', '2024-10-17', 0),
(4, 'admin@gmail.com', 'acmon', '$2y$10$sIo6yYEHY9sLbXbRZatSIuiNFJ0mhoQa8sZT4bzJ0NFr4bBlvx8OO', 'admin', '2024-10-17', 0),
(6, 'segs@gmail.com', 'segsins', '$2y$10$hWUHlDsg/GgaMQbgD8D01.V/C3MHU5xToQ2YqF2x6O0BnYsFtn3ty', 'normal', '2024-11-06', 0),
(9, 'insano3@gmail.com', 'insano3', '$2y$10$ItmsvL6fTz0Crbs7eEipjOEI0B/dHKunqur2ZGAShRe.OW9yv/pPy', 'normal', '2024-11-06', 0);


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `boletin`
--
ALTER TABLE `boletin`
  ADD PRIMARY KEY (`id_boletin`),
  ADD KEY `fk_boletines_usuarios_idx` (`subido_por`);

--
-- Indices de la tabla `boletin_fuente`
--
ALTER TABLE `boletin_fuente`
  ADD PRIMARY KEY (`id_boletin_fuente`),
  ADD KEY `fk_boletin_fuente_boletin1_idx` (`id_boletin`),
  ADD KEY `fk_boletin_fuente_fuente1_idx` (`id_fuente`);

--
-- Indices de la tabla `descarga`
--
ALTER TABLE `descarga`
  ADD PRIMARY KEY (`id_descarga`),
  ADD KEY `fk_descargas_boletines1_idx` (`id_boletin`),
  ADD KEY `fk_descargas_usuarios1_idx` (`id_usuario`);

--
-- Indices de la tabla `fuente`
--
ALTER TABLE `fuente`
  ADD PRIMARY KEY (`id_fuente`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boletin`
--
ALTER TABLE `boletin`
  MODIFY `id_boletin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `boletin_fuente`
--
ALTER TABLE `boletin_fuente`
  MODIFY `id_boletin_fuente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descarga`
--
ALTER TABLE `descarga`
  MODIFY `id_descarga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuente`
--
ALTER TABLE `fuente`
  MODIFY `id_fuente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boletin`
--
ALTER TABLE `boletin`
  ADD CONSTRAINT `fk_boletines_usuarios` FOREIGN KEY (`subido_por`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `boletin_fuente`
--
ALTER TABLE `boletin_fuente`
  ADD CONSTRAINT `fk_boletin_fuente_boletin1` FOREIGN KEY (`id_boletin`) REFERENCES `boletin` (`id_boletin`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_boletin_fuente_fuente1` FOREIGN KEY (`id_fuente`) REFERENCES `fuente` (`id_fuente`);

--
-- Filtros para la tabla `descarga`
--
ALTER TABLE `descarga`
  ADD CONSTRAINT `fk_descargas_boletines1` FOREIGN KEY (`id_boletin`) REFERENCES `boletin` (`id_boletin`),
  ADD CONSTRAINT `fk_descargas_usuarios1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
