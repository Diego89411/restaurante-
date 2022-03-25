-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 25-03-2022 a las 14:17:13
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nom_cliente` varchar(40) NOT NULL,
  `ape_cliente` varchar(45) NOT NULL,
  `tel_cliente` int(11) NOT NULL,
  `dire_cliente` varchar(45) NOT NULL,
  `restaurante_id_restaurante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nom_cliente`, `ape_cliente`, `tel_cliente`, `dire_cliente`, `restaurante_id_restaurante`) VALUES
(12324, 'juan', 'perez', 12342232, 'manzana i casa 20', 127834),
(8238992, 'diego', 'bustos', 112383, 'calle 25 a sur', 127834);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_reserva`
--

CREATE TABLE `clientes_reserva` (
  `clientes_id_cliente` int(11) NOT NULL,
  `reserva_num_reserva` int(11) NOT NULL,
  `id_cliente_reserva` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes_reserva`
--

INSERT INTO `clientes_reserva` (`clientes_id_cliente`, `reserva_num_reserva`, `id_cliente_reserva`) VALUES
(8238992, 2344545, '2212121'),
(12324, 122443443, '12131');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas_restaurante`
--

CREATE TABLE `mesas_restaurante` (
  `id_mesa` int(11) NOT NULL,
  `precio_mesa` int(11) NOT NULL,
  `menu_mesa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mesas_restaurante`
--

INSERT INTO `mesas_restaurante` (`id_mesa`, `precio_mesa`, `menu_mesa`) VALUES
(331323, 500, 'arroz con papa'),
(3434343, 300, 'sopa de frijo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `num_reserva` int(11) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `fecha_reserva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`num_reserva`, `hora_entrada`, `hora_salida`, `fecha_reserva`) VALUES
(2344545, '19:08:25', '20:08:25', '2022-03-03'),
(122443443, '06:08:25', '08:08:25', '2022-03-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_mesas_restaurante`
--

CREATE TABLE `reserva_mesas_restaurante` (
  `reserva_num_reserva` int(11) NOT NULL,
  `mesas_restaurante_id_mesa` int(11) NOT NULL,
  `id_mesa_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `reserva_mesas_restaurante`
--

INSERT INTO `reserva_mesas_restaurante` (`reserva_num_reserva`, `mesas_restaurante_id_mesa`, `id_mesa_reserva`) VALUES
(2344545, 331323, 36),
(122443443, 3434343, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `id_restaurante` int(11) NOT NULL,
  `direc_restaurante` varchar(45) NOT NULL,
  `tel_restaurante` int(11) NOT NULL,
  `nom_restaurante` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `restaurante`
--

INSERT INTO `restaurante` (`id_restaurante`, `direc_restaurante`, `tel_restaurante`, `nom_restaurante`) VALUES
(23232, 'calle 15 casa 3', 232323, 'doña pepa'),
(127834, 'mansana 58 sur', 23232233, 'los frijoles negros');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`,`restaurante_id_restaurante`),
  ADD KEY `fk_clientes_restaurante_idx` (`restaurante_id_restaurante`);

--
-- Indices de la tabla `clientes_reserva`
--
ALTER TABLE `clientes_reserva`
  ADD PRIMARY KEY (`clientes_id_cliente`,`reserva_num_reserva`,`id_cliente_reserva`),
  ADD KEY `fk_clientes_has_reserva_reserva1_idx` (`reserva_num_reserva`),
  ADD KEY `fk_clientes_has_reserva_clientes1_idx` (`clientes_id_cliente`);

--
-- Indices de la tabla `mesas_restaurante`
--
ALTER TABLE `mesas_restaurante`
  ADD PRIMARY KEY (`id_mesa`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`num_reserva`);

--
-- Indices de la tabla `reserva_mesas_restaurante`
--
ALTER TABLE `reserva_mesas_restaurante`
  ADD PRIMARY KEY (`reserva_num_reserva`,`mesas_restaurante_id_mesa`,`id_mesa_reserva`),
  ADD KEY `fk_reserva_has_mesas_restaurante_mesas_restaurante1_idx` (`mesas_restaurante_id_mesa`),
  ADD KEY `fk_reserva_has_mesas_restaurante_reserva1_idx` (`reserva_num_reserva`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id_restaurante`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_restaurante` FOREIGN KEY (`restaurante_id_restaurante`) REFERENCES `restaurante` (`id_restaurante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes_reserva`
--
ALTER TABLE `clientes_reserva`
  ADD CONSTRAINT `fk_clientes_has_reserva_clientes1` FOREIGN KEY (`clientes_id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_has_reserva_reserva1` FOREIGN KEY (`reserva_num_reserva`) REFERENCES `reserva` (`num_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reserva_mesas_restaurante`
--
ALTER TABLE `reserva_mesas_restaurante`
  ADD CONSTRAINT `fk_reserva_has_mesas_restaurante_mesas_restaurante1` FOREIGN KEY (`mesas_restaurante_id_mesa`) REFERENCES `mesas_restaurante` (`id_mesa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_reserva_has_mesas_restaurante_reserva1` FOREIGN KEY (`reserva_num_reserva`) REFERENCES `reserva` (`num_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
