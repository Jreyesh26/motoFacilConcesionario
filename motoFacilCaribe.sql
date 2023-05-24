-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2023 a las 19:05:46
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `motofacilcaribe`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombreCliente` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concesionario`
--

CREATE TABLE `concesionario` (
  `idConcesionario` int(11) NOT NULL,
  `nombreConcesionario` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nombreAdministrador` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialservicio`
--

CREATE TABLE `historialservicio` (
  `idhistorial` int(11) NOT NULL,
  `idServicio` int(11) NOT NULL,
  `idMoto` int(11) NOT NULL,
  `fechaS` date NOT NULL,
  `pago` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moto`
--

CREATE TABLE `moto` (
  `idMoto` int(11) NOT NULL,
  `idConcesionario` int(11) NOT NULL,
  `vin` int(11) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `modelo` int(11) NOT NULL,
  `cilindrada` int(11) NOT NULL,
  `color` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `imagen` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repuesto`
--

CREATE TABLE `repuesto` (
  `idRepuesto` int(11) NOT NULL,
  `nombreRepuesto` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `precio` float NOT NULL,
  `idConcesionario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `serviciotaller`
--

CREATE TABLE `serviciotaller` (
  `idServicio` int(11) NOT NULL,
  `nombreServicio` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precioServicio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventamoto`
--

CREATE TABLE `ventamoto` (
  `idVenta` int(11) NOT NULL,
  `idMoto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `formaPago` varchar(255) NOT NULL,
  `pagoEstimado` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventarepuesto`
--

CREATE TABLE `ventarepuesto` (
  `idventaR` int(11) NOT NULL,
  `idRepuesto` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `concesionario`
--
ALTER TABLE `concesionario`
  ADD PRIMARY KEY (`idConcesionario`);

--
-- Indices de la tabla `historialservicio`
--
ALTER TABLE `historialservicio`
  ADD PRIMARY KEY (`idhistorial`),
  ADD KEY `idServicio` (`idServicio`),
  ADD KEY `idMoto` (`idMoto`);

--
-- Indices de la tabla `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`idMoto`),
  ADD KEY `idConcesionario` (`idConcesionario`);

--
-- Indices de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD PRIMARY KEY (`idRepuesto`),
  ADD KEY `idConcesionario` (`idConcesionario`);

--
-- Indices de la tabla `serviciotaller`
--
ALTER TABLE `serviciotaller`
  ADD PRIMARY KEY (`idServicio`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `ventamoto`
--
ALTER TABLE `ventamoto`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idMoto` (`idMoto`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `ventarepuesto`
--
ALTER TABLE `ventarepuesto`
  ADD PRIMARY KEY (`idventaR`),
  ADD KEY `idRepuesto` (`idRepuesto`),
  ADD KEY `idCliente` (`idCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `concesionario`
--
ALTER TABLE `concesionario`
  MODIFY `idConcesionario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historialservicio`
--
ALTER TABLE `historialservicio`
  MODIFY `idhistorial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `moto`
--
ALTER TABLE `moto`
  MODIFY `idMoto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repuesto`
--
ALTER TABLE `repuesto`
  MODIFY `idRepuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `serviciotaller`
--
ALTER TABLE `serviciotaller`
  MODIFY `idServicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventamoto`
--
ALTER TABLE `ventamoto`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventarepuesto`
--
ALTER TABLE `ventarepuesto`
  MODIFY `idventaR` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historialservicio`
--
ALTER TABLE `historialservicio`
  ADD CONSTRAINT `historialservicio_ibfk_1` FOREIGN KEY (`idServicio`) REFERENCES `serviciotaller` (`idServicio`),
  ADD CONSTRAINT `historialservicio_ibfk_2` FOREIGN KEY (`idMoto`) REFERENCES `moto` (`idMoto`);

--
-- Filtros para la tabla `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`idConcesionario`) REFERENCES `concesionario` (`idConcesionario`);

--
-- Filtros para la tabla `repuesto`
--
ALTER TABLE `repuesto`
  ADD CONSTRAINT `repuesto_ibfk_1` FOREIGN KEY (`idConcesionario`) REFERENCES `concesionario` (`idConcesionario`);

--
-- Filtros para la tabla `ventamoto`
--
ALTER TABLE `ventamoto`
  ADD CONSTRAINT `ventamoto_ibfk_1` FOREIGN KEY (`idMoto`) REFERENCES `moto` (`idMoto`),
  ADD CONSTRAINT `ventamoto_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `ventarepuesto`
--
ALTER TABLE `ventarepuesto`
  ADD CONSTRAINT `ventarepuesto_ibfk_1` FOREIGN KEY (`idRepuesto`) REFERENCES `repuesto` (`idRepuesto`),
  ADD CONSTRAINT `ventarepuesto_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
