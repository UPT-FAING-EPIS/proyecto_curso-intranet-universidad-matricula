-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sistema_matricula
CREATE DATABASE IF NOT EXISTS `sistema_matricula` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sistema_matricula`;

-- Volcando estructura para tabla sistema_matricula.cursos
CREATE TABLE IF NOT EXISTS `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `creditos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.cursos: ~6 rows (aproximadamente)
INSERT INTO `cursos` (`id_curso`, `nombre`, `codigo`, `descripcion`, `creditos`) VALUES
	(1, 'Problemas y Desafios del Peru en un Mundo Global', 'EG-781', '3', 3),
	(2, 'Sistemas Operativos II', 'SI-782', '4', 4),
	(3, 'Base de Datos II', 'SI-783', '4', 4),
	(4, 'Calidad y Pruebas de Software', 'SI-784', '3', 3),
	(5, 'Gestion de Proyectos de TI', 'SI-785', '4', 4),
	(6, 'Programacion Web I', 'SI-786', '4', 4);

-- Volcando estructura para tabla sistema_matricula.detalle_matricula
CREATE TABLE IF NOT EXISTS `detalle_matricula` (
  `id_detalle` int(11) NOT NULL,
  `fkidmatricula` int(11) DEFAULT NULL,
  `fkidcurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`) USING BTREE,
  KEY `FK_detalle_matricula_matriculas` (`fkidmatricula`),
  KEY `FK_detalle_matricula_cursos` (`fkidcurso`),
  CONSTRAINT `FK_detalle_matricula_cursos` FOREIGN KEY (`fkidcurso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_detalle_matricula_matriculas` FOREIGN KEY (`fkidmatricula`) REFERENCES `matriculas` (`id_matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.detalle_matricula: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_matricula.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=2020066917 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.estudiantes: ~1 rows (aproximadamente)
INSERT INTO `estudiantes` (`id_estudiante`, `nombre`, `apellido`, `dni`, `fecha_nacimiento`, `direccion`, `telefono`, `email`, `contrasena`) VALUES
	(2020066916, 'Gustavo Alonso', 'Valle Bustamante', '12345678', '2002-09-27', NULL, NULL, NULL, 'test');

-- Volcando estructura para tabla sistema_matricula.matriculas
CREATE TABLE IF NOT EXISTS `matriculas` (
  `id_matricula` int(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(11) NOT NULL,
  `id_seccion` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `estatus` enum('activo','inactivo','aprobado','reprobado') NOT NULL DEFAULT 'activo',
  `fecha_matricula` date NOT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_semestre` (`id_semestre`),
  KEY `id_curso` (`id_seccion`) USING BTREE,
  CONSTRAINT `FK_matriculas_secciones` FOREIGN KEY (`id_seccion`) REFERENCES `secciones` (`id_seccion`),
  CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`),
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`id_semestre`) REFERENCES `semestres` (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.matriculas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_matricula.pagos
CREATE TABLE IF NOT EXISTS `pagos` (
  `id_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_estudiante` int(11) NOT NULL,
  `id_matricula` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha_pago` date NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `id_estudiante` (`id_estudiante`),
  KEY `id_matricula` (`id_matricula`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiantes` (`id_estudiante`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_matricula`) REFERENCES `matriculas` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.pagos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla sistema_matricula.secciones
CREATE TABLE IF NOT EXISTS `secciones` (
  `id_seccion` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `aula` varchar(50) DEFAULT NULL,
  `fkid_curso` int(11) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `fkid_semestre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `FK_secciones_cursos` (`fkid_curso`),
  KEY `FK_secciones_semestres` (`fkid_semestre`),
  CONSTRAINT `FK_secciones_cursos` FOREIGN KEY (`fkid_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_secciones_semestres` FOREIGN KEY (`fkid_semestre`) REFERENCES `semestres` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.secciones: ~2 rows (aproximadamente)
INSERT INTO `secciones` (`id_seccion`, `nombre`, `aula`, `fkid_curso`, `capacidad`, `fkid_semestre`) VALUES
	(1, 'A', 'Lab C', 2, 25, 1),
	(2, 'A', 'Lab D', 3, 25, 1);

-- Volcando estructura para tabla sistema_matricula.semestres
CREATE TABLE IF NOT EXISTS `semestres` (
  `id_semestre` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla sistema_matricula.semestres: ~1 rows (aproximadamente)
INSERT INTO `semestres` (`id_semestre`, `nombre`, `fecha_inicio`, `fecha_fin`) VALUES
	(1, '2023-I', '2023-03-13', '2023-07-07');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
