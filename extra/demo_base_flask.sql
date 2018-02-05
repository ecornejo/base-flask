
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de datos: `demo_base_flask`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=13 ;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombres`, `apellidos`, `fecha_inscripcion`, `activo`) VALUES
(1, 'Eduardo', 'Cornejo', '2018-01-30 20:12:29', 1),
(2, 'Juan', 'Perez', '2018-01-30 20:12:29', 1),
(3, 'Daniela', 'Aure', '2018-01-30 20:15:41', 1),
(4, 'Nicole', 'Astudillo', '2018-01-30 20:15:41', 1),
(5, 'Jorge', 'Martel', '2018-01-30 20:15:41', 1),
(6, 'Francisco', 'Ferrada', '2018-01-30 20:15:41', 1),
(7, 'Laura', 'Rojas', '2018-01-30 20:15:41', 1),
(8, 'Camila', 'Ulloa', '2018-01-30 20:15:41', 1),
(9, 'Marcela', 'Contreras', '2018-01-30 20:15:41', 1),
(10, 'Matilda', 'Diaz', '2018-01-30 20:15:41', 1),
(12, 'Sofia', 'Rojas', '2018-02-01 20:27:14', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_curso`
--

CREATE TABLE IF NOT EXISTS `alumno_curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_alumno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_curso` (`id_curso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=36 ;

--
-- Volcado de datos para la tabla `alumno_curso`
--

INSERT INTO `alumno_curso` (`id`, `id_alumno`, `id_curso`) VALUES
(7, 1, 2),
(8, 1, 3),
(9, 1, 4),
(10, 1, 5),
(12, 1, 7),
(14, 2, 2),
(15, 2, 3),
(17, 3, 5),
(18, 3, 7),
(20, 4, 7),
(22, 5, 3),
(23, 6, 2),
(24, 7, 4),
(25, 7, 7),
(27, 9, 3),
(28, 9, 4),
(29, 9, 5),
(32, 10, 2),
(33, 10, 3),
(34, 10, 4),
(35, 10, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `id_profesor` int(11) NOT NULL,
  `nivel` smallint(6) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id_profesor` (`id_profesor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre`, `id_profesor`, `nivel`, `activo`) VALUES
(2, 'Arte', 2, 0, 1),
(3, 'Musica', 3, 0, 1),
(4, 'Ingles', 4, 0, 1),
(5, 'Quimica', 5, 0, 1),
(7, 'Biologia', 9, 0, 1),
(8, 'Literatura', 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE IF NOT EXISTS `profesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=14 ;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`id`, `nombres`, `apellidos`, `activo`) VALUES
(1, 'Gloria', 'Hermosilla', 1),
(2, 'Pablo', 'Rubio', 1),
(3, 'Monica', 'Vial', 1),
(4, 'Juana', 'Galleguillos', 1),
(5, 'Roberto', 'Mendoza', 1),
(6, 'Catalina', 'Valenzuela', 1),
(7, 'Sebastian', 'Hernandez', 1),
(8, 'Olga', 'Farias', 1),
(9, 'Casandra', 'Rios', 1),
(11, 'Benito', 'Prunes', 1),
(12, 'Victor', 'Escobar', 1),
(13, 'Victoria', 'Escobar', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno_curso`
--
ALTER TABLE `alumno_curso`
  ADD CONSTRAINT `alumno_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_curso_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `curso_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `profesor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
