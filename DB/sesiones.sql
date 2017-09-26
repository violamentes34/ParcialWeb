-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-09-2017 a las 05:38:50
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sesiones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bienes`
--

CREATE TABLE `bienes` (
  `id_bienes` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `jefe_area` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_responsable` int(11) DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_bienes`
--

CREATE TABLE `cotizacion_bienes` (
  `cotizacion_id_cotizacion` int(11) NOT NULL,
  `bienes_id_bienes` int(11) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `id_ingreso` int(11) NOT NULL,
  `fecha_ingreso` varchar(45) DEFAULT NULL,
  `id_orden_compra` int(11) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `valor_total` varchar(45) DEFAULT NULL,
  `id_bienes` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL,
  `codigo_unico` varchar(45) DEFAULT NULL,
  `id_bienes` int(11) DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `fecha_ingreso` varchar(45) DEFAULT NULL,
  `id_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_compra`
--

CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_bienes` int(11) DEFAULT NULL,
  `aprovado` tinyint(1) DEFAULT NULL,
  `id_cotizacion` int(11) DEFAULT NULL,
  `id_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `ID` int(3) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `ID_usuarios` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`ID`, `nombre`, `apellido`, `genero`, `ID_usuarios`) VALUES
(1, 'a', 'a', 'Masculino', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nro_orden` varchar(45) DEFAULT NULL,
  `ruc` int(11) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `fecha_orden` datetime DEFAULT NULL,
  `monto_total` double DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `id_responsable` int(11) NOT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `id_solicitud` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_responsable` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_bienes`
--

CREATE TABLE `solicitud_bienes` (
  `id_solicitud_bienes` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `id_bienes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(3) NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `rol` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `email`, `password`, `rol`) VALUES
(1, 'a@a.com', 'a', 'Lectura, Creacion de usuarios, Edicion de usuarios y Eliminar');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bienes`
--
ALTER TABLE `bienes`
  ADD PRIMARY KEY (`id_bienes`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id_cargo`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `id_solicitud` (`id_solicitud`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Indices de la tabla `cotizacion_bienes`
--
ALTER TABLE `cotizacion_bienes`
  ADD PRIMARY KEY (`cotizacion_id_cotizacion`),
  ADD KEY `bienes_id_bienes` (`bienes_id_bienes`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`id_ingreso`),
  ADD KEY `id_orden_compra` (`id_orden_compra`),
  ADD KEY `id_bienes` (`id_bienes`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_inventario`),
  ADD KEY `id_bienes` (`id_bienes`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Indices de la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD PRIMARY KEY (`id_orden_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_bienes` (`id_bienes`),
  ADD KEY `id_responsable` (`id_responsable`),
  ADD KEY `id_cotizacion` (`id_cotizacion`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_usuarios` (`ID_usuarios`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id_responsable`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`id_solicitud`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Indices de la tabla `solicitud_bienes`
--
ALTER TABLE `solicitud_bienes`
  ADD PRIMARY KEY (`id_solicitud_bienes`),
  ADD KEY `id_bienes` (`id_bienes`),
  ADD KEY `id_solicitud` (`id_solicitud`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`),
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`);

--
-- Filtros para la tabla `cotizacion_bienes`
--
ALTER TABLE `cotizacion_bienes`
  ADD CONSTRAINT `cotizacion_bienes_ibfk_1` FOREIGN KEY (`cotizacion_id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `cotizacion_bienes_ibfk_2` FOREIGN KEY (`cotizacion_id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `cotizacion_bienes_ibfk_3` FOREIGN KEY (`cotizacion_id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`),
  ADD CONSTRAINT `cotizacion_bienes_ibfk_4` FOREIGN KEY (`bienes_id_bienes`) REFERENCES `bienes` (`id_bienes`),
  ADD CONSTRAINT `cotizacion_bienes_ibfk_5` FOREIGN KEY (`cotizacion_id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`);

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`),
  ADD CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`id_bienes`) REFERENCES `bienes` (`id_bienes`),
  ADD CONSTRAINT `ingreso_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_bienes`) REFERENCES `bienes` (`id_bienes`),
  ADD CONSTRAINT `inventario_ibfk_2` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`);

--
-- Filtros para la tabla `orden_compra`
--
ALTER TABLE `orden_compra`
  ADD CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  ADD CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`id_bienes`) REFERENCES `bienes` (`id_bienes`),
  ADD CONSTRAINT `orden_compra_ibfk_3` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`),
  ADD CONSTRAINT `orden_compra_ibfk_4` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`ID_usuarios`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `responsable_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`);

--
-- Filtros para la tabla `solicitud_bienes`
--
ALTER TABLE `solicitud_bienes`
  ADD CONSTRAINT `solicitud_bienes_ibfk_1` FOREIGN KEY (`id_bienes`) REFERENCES `bienes` (`id_bienes`),
  ADD CONSTRAINT `solicitud_bienes_ibfk_2` FOREIGN KEY (`id_solicitud`) REFERENCES `solicitud` (`id_solicitud`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
