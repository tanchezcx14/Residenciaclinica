-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-06-2023 a las 22:34:17
-- Versión del servidor: 10.5.19-MariaDB-cll-lve
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u366692306_tanchez`
--
CREATE DATABASE clinicaComunitarias;
USE clinicaComunitarias;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `idCiudad` int(11) NOT NULL,
  `nombreCiudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudad`, `nombreCiudad`) VALUES
(1, 'Tijuana'),
(2, 'Tecate'),
(3, 'Mexicali'),
(4, 'Ensenada'),
(5, 'Rosarito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicas`
--

CREATE TABLE `clinicas` (
  `idClinica` int(11) NOT NULL,
  `nombreClinica` varchar(100) DEFAULT NULL,
  `direccionClinica` text DEFAULT NULL,
  `donacionClinica` int(11) DEFAULT NULL,
  `idCiudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clinicas`
--

INSERT INTO `clinicas` (`idClinica`, `nombreClinica`, `direccionClinica`, `donacionClinica`, `idCiudad`) VALUES
(1, 'Premier', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d817.0744890902214!2d-117.02057123200284!3d32.524374215687004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80d94845865a96ff%3A0xd105e1d1005f2e1f!2sCentro%20M%C3%A9dico%20Premier!5e0!3m2!1ses!2smx!4v1676312220589!5m2!1ses!2smx\" width=\"250\" height=\"250\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 1),
(2, 'Angeles', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3364.3029110195735!2d-117.01010228445936!3d32.51805590445078!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80d9480141af4fb7%3A0xd4400072dc537040!2sHospital%20Angeles%20Tijuana!5e0!3m2!1ses!2smx!4v1676312389551!5m2!1ses!2smx\" width=\"250\" height=\"250\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clinicatienemedicamento`
--

CREATE TABLE `clinicatienemedicamento` (
  `idClinica` int(11) NOT NULL DEFAULT 1,
  `idUsuario` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  `cantidadMedicamento` int(11) DEFAULT NULL,
  `loteMedicamento` varchar(100) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `fechadecaducidadMedicamento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clinicatienemedicamento`
--

INSERT INTO `clinicatienemedicamento` (`idClinica`, `idUsuario`, `idMedicamento`, `cantidadMedicamento`, `loteMedicamento`, `marca`, `fechadecaducidadMedicamento`) VALUES
(1, 1, 1, 185, '1456', 'Pfizer', '2025-05-02'),
(1, 1, 2, 20, '34', 'Similares2', '2024-12-24'),
(1, 1, 2, 20, '34', 'Similares2', '2024-12-24'),
(1, 1, 3, 422, '34', 'tempra forte', '2023-07-20'),
(1, 1, 4, 103, '566', 'Erispanf', '2023-09-02'),
(1, 1, 5, 450, '90', 'X', '2023-10-20'),
(1, 1, 6, 59, '90', 'test', '2023-11-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dosis`
--

CREATE TABLE `dosis` (
  `idDosis` int(11) NOT NULL,
  `nombreDosis` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `dosis`
--

INSERT INTO `dosis` (`idDosis`, `nombreDosis`) VALUES
(1, 'Oral'),
(2, 'Inyectada'),
(3, 'Intravenosa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `txid` int(11) NOT NULL,
  `idMedicamento` int(11) NOT NULL,
  `ingrediente_activo` varchar(60) DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `lote` varchar(60) DEFAULT NULL,
  `controlado` varchar(60) DEFAULT NULL,
  `dosis` varchar(60) DEFAULT NULL,
  `presentacion` varchar(60) DEFAULT NULL,
  `unidades` varchar(60) DEFAULT NULL,
  `fecha_caducidad` date DEFAULT NULL,
  `via_administracion` varchar(60) DEFAULT NULL,
  `usuario` varchar(60) DEFAULT NULL,
  `timepo` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`txid`, `idMedicamento`, `ingrediente_activo`, `marca`, `lote`, `controlado`, `dosis`, `presentacion`, `unidades`, `fecha_caducidad`, `via_administracion`, `usuario`, `timepo`, `comentario`) VALUES

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `idMedicamento` int(11) NOT NULL,
  `nombrecomercialMedicamento` varchar(100) DEFAULT NULL,
  `activoprincipalMedicamento` varchar(100) DEFAULT NULL,
  `dosis` varchar(30) DEFAULT NULL,
  `idDosis` int(11) NOT NULL,
  `idPresentacion` int(11) NOT NULL,
  `controlMedicamento` int(11) DEFAULT NULL,
  `ubicacion` text NOT NULL,
  `notas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`idMedicamento`, `nombrecomercialMedicamento`, `activoprincipalMedicamento`, `dosis`, `idDosis`, `idPresentacion`, `controlMedicamento`, `ubicacion`, `notas`) VALUES
(1, 'Aspirina', 'Ácido acetilsalicilico', '300 mg', 1, 1, 1, '', 'Tomar Con Precaución, tapa dañada '),
(2, '', 'Metformina', '800 mg', 1, 1, 2, '', 'Hello'),
(3, NULL, 'paracetamoless', '300dmg', 1, 3, 1, 'test', 'sPrueba uno'),
(4, NULL, 'loratadinat', '35mg', 2, 2, 2, 'cancun q.roo', 'Aver'),
(5, NULL, 'Cafe', '200ml', 2, 1, 1, 'Casa', ''),
(6, NULL, 'Pueba', '500Mg', 1, 1, 1, 'Casa', 'esta cerrado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `idPresentacion` int(11) NOT NULL,
  `nombrePresentacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`idPresentacion`, `nombrePresentacion`) VALUES
(1, 'Tableta'),
(2, 'Capsula'),
(3, 'Supositorio'),
(4, 'Pomada'),
(5, 'Crema'),
(6, 'Jarabe');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(60) DEFAULT NULL,
  `cargo` varchar(30) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `claveUsuario` varchar(32) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `recibe_alertas` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `cargo`, `correo`, `claveUsuario`, `expiration_date`, `recibe_alertas`) VALUES
(1, 'Administrador del sistema', 'Administrador', 'admin@mail.com', '21232f297a57a5a743894a0e4a801fc3', NULL, 1),
(2, 'Max', 'Administrador', 'luis.tanchez17@tectijuana.edu.mx', 'b52c65dd4dd62dc1ab054cccaa820f82', '2023-06-03', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`idCiudad`);

--
-- Indices de la tabla `clinicas`
--
ALTER TABLE `clinicas`
  ADD PRIMARY KEY (`idClinica`);

--
-- Indices de la tabla `dosis`
--
ALTER TABLE `dosis`
  ADD PRIMARY KEY (`idDosis`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`txid`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`idMedicamento`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`idPresentacion`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `idCiudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clinicas`
--
ALTER TABLE `clinicas`
  MODIFY `idClinica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `dosis`
--
ALTER TABLE `dosis`
  MODIFY `idDosis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `txid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `idMedicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `idPresentacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
