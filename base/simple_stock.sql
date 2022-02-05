-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.37-log - MySQL Community Server (GPL)
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_stock.categorias: 3 rows
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` (`id_categoria`, `nombre_categoria`, `descripcion_categoria`, `date_added`) VALUES
	(1, 'Liquidos', 'Equipos para el hogar', '2022-02-05 10:03:22'),
	(4, 'Otros', 'Equipos stihl', '2022-02-05 10:03:22'),
	(5, 'Accesorios', 'Accesorios ', '2022-02-05 10:03:22'),
	(10, 'Solidos', 'Aseo', '2022-02-05 10:03:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla simple_stock.historial: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historial` DISABLE KEYS */;
INSERT INTO `historial` (`id_historial`, `id_producto`, `user_id`, `fecha`, `nota`, `referencia`, `cantidad`) VALUES
	(60, 8, 2, '2022-02-05 10:56:14', 'Brayan agregÃ³ 200 producto(s) al inventario', '01', 200),
	(61, 9, 2, '2022-02-05 11:24:49', 'Brayan agregÃ³ 98 producto(s) al inventario', '09', 98),
	(62, 8, 2, '2022-02-05 11:26:17', 'Brayan agregÃ³ 20 producto(s) al inventario', 'Brayan', 20),
	(63, 8, 2, '2022-02-05 11:26:33', 'Brayan sacÃ³ 6 producto(s) del inventario', 'Juan', 6);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla simple_stock.products: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id_producto`, `codigo_producto`, `nombre_producto`, `date_added`, `precio_producto`, `stock`, `id_categoria`) VALUES
	(8, '01', 'Agua', '2022-02-05 10:56:14', 300, 214, 5),
	(9, '09', 'Jabon', '2022-02-05 11:24:49', 300, 98, 5);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- Volcando datos para la tabla simple_stock.users: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `firstname`, `lastname`, `user_name`, `user_password_hash`, `user_email`, `date_added`) VALUES
	(1, 'Obed', 'Alvarado', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', '2016-12-19 15:06:00'),
	(2, 'Brayan', 'Rodriguez', 'admin123', '$2y$10$BCsoFUTNybDhIJT1M4Ato.9uzfRgRvoY6Hkcrbt9VBTKHdmSfbm4W', 'luisnoe.rodriguez09@gmail.com', '2022-02-05 10:54:50');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
