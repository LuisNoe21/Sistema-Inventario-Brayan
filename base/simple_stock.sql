-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para simple_stock
CREATE DATABASE IF NOT EXISTS `simple_stock` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `simple_stock`;

-- Volcando estructura para tabla simple_stock.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(255) NOT NULL,
  `descripcion_categoria` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_stock.categorias: 2 rows
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
	(1, 'Solido', 'equipo para aseo', '2022-02-27 21:06:37'),
	(4, 'Liquido', 'equipo para aseo', '2022-02-27 21:06:37');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla simple_stock.historial
CREATE TABLE IF NOT EXISTS `historial` (
  `id_historial` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `nota` varchar(255) NOT NULL,
  `referencia` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `fk_id_producto` FOREIGN KEY (`id_producto`) REFERENCES `products` (`id_producto`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_stock.historial: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`) VALUES
	(22, 7, 2, '2022-01-27 07:57:42', 'Brayan agregÃ³ 29 producto(s) al inventario', '01', 29),
	(23, 7, 2, '2022-01-27 07:58:00', 'Brayan presto 2 producto(s) del inventario', 'Juan Perez', 2),
	(24, 7, 2, '2022-01-27 08:26:29', 'Brayan presto 2 producto(s) del inventario', 'Pablo', 2),
	(25, 7, 2, '2022-01-27 08:26:40', 'Brayan agregÃ³ 2 producto(s) al inventario', 'Pablo', 2),
	(26, 8, 2, '2022-01-27 09:18:46', 'Brayan agregÃ³ 30 producto(s) al inventario', '09', 30),
	(27, 9, 3, '2022-02-07 07:30:38', 'Brayan agregÃ³ 30 producto(s) al inventario', '03', 30),
	(28, 11, 3, '2022-02-07 07:31:40', 'Brayan agregÃ³ 54 producto(s) al inventario', '10', 54);
/*!40000 ALTER TABLE `historial` ENABLE KEYS */;

-- Volcando estructura para tabla simple_stock.products
CREATE TABLE IF NOT EXISTS `products` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_stock.products: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `precio_producto`, `stock`, `id_categoria`) VALUES
	(7, '01', 'Agua', '2022-01-27 07:57:42', 89, 27, 4),
	(8, '09', 'Jabon', '2022-01-27 09:18:46', 300, 30, 4),
	(9, '03', 'Escobas', '2022-02-07 07:30:38', 150, 30, 4),
	(11, '10', 'Trapeador', '2022-02-07 07:31:40', 239, 54, 1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Volcando estructura para tabla simple_stock.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `firstname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `user_password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `user_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- Volcando datos para la tabla simple_stock.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
	(2, 'Brayan', 'Alvarez', 'admin', '$2y$10$i3J8btWBNX7F2MIcOlySVeiU17vEI4Q5E7GgXDbAMw4UHFsDj7RYu', 'brayan@brayan.com', '2022-01-27 07:53:50'),
	(3, 'Brayan', 'Rodriguez', 'admin1234', '$2y$10$.K8vmWiolb1.51S.kPyF/O4b28HGKfG7CgrbNA3ijAwnMzob9NfjC', 'brayanr@brayan.com', '2022-02-07 07:27:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
