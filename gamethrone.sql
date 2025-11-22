-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лис 22 2025 р., 15:19
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `gamethrone`
--

-- --------------------------------------------------------

--
-- Структура таблиці `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Heated Chairs', 'Chairs with heating function'),
(2, 'Cooling Chairs', 'Chairs with cooling function'),
(3, 'Massage Chairs', 'Chairs with massage function'),
(4, 'Premium Comfort', 'Super soft premium chairs'),
(5, 'Multi-Function', 'Chairs with multiple features');

-- --------------------------------------------------------

--
-- Структура таблиці `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `postal_code`, `country`, `created_at`, `updated_at`) VALUES
(1, 'Klaus', 'Schmidt', 'klaus.schmidt@email.de', '+49-30-111222', 'Berliner Str. 45', 'Berlin', '10115', 'Germany', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(2, 'Anna', 'Weber', 'anna.weber@email.de', '+49-89-333444', 'Münchner Allee 12', 'Munich', '80331', 'Germany', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(3, 'Michael', 'Fischer', 'm.fischer@email.de', '+49-69-555666', 'Frankfurter Weg 78', 'Frankfurt', '60311', 'Germany', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(4, 'Petra', 'Wagner', 'petra.w@email.de', '+49-221-777888', 'Kölner Str. 34', 'Cologne', '50667', 'Germany', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(5, 'Thomas', 'Becker', 'thomas.becker@email.de', '+49-40-999000', 'Hamburger Str. 56', 'Hamburg', '20095', 'Germany', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(6, 'Jan', 'Kowalski', 'jan.kowalski@email.pl', '+48-22-111222', 'ul. Warszawska 23', 'Warsaw', '00-001', 'Poland', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(7, 'Maria', 'Nowak', 'maria.nowak@email.pl', '+48-12-333444', 'ul. Krakowska 67', 'Krakow', '30-001', 'Poland', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(8, 'Piotr', 'Wisniewski', 'piotr.w@email.pl', '+48-61-555666', 'ul. Poznanska 45', 'Poznan', '60-001', 'Poland', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(9, 'Katarzyna', 'Lewandowska', 'kata.lew@email.pl', '+48-58-777888', 'ul. Gdanska 89', 'Gdansk', '80-001', 'Poland', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(10, 'Pierre', 'Dubois', 'pierre.dubois@email.fr', '+33-1-11223344', 'Rue de Paris 12', 'Paris', '75001', 'France', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(11, 'Sophie', 'Martin', 'sophie.martin@email.fr', '+33-4-22334455', 'Avenue Lyon 45', 'Lyon', '69001', 'France', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(12, 'Jacques', 'Bernard', 'j.bernard@email.fr', '+33-5-33445566', 'Boulevard Bordeaux 78', 'Bordeaux', '33000', 'France', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(13, 'Marie', 'Petit', 'marie.petit@email.fr', '+33-4-44556677', 'Rue Marseille 34', 'Marseille', '13001', 'France', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(14, 'Marco', 'Rossi', 'marco.rossi@email.it', '+39-02-1122334', 'Via Milano 23', 'Milan', '20121', 'Italy', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(15, 'Giulia', 'Bianchi', 'giulia.bianchi@email.it', '+39-06-2233445', 'Via Roma 67', 'Rome', '00184', 'Italy', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(16, 'Alessandro', 'Ferrari', 'a.ferrari@email.it', '+39-041-3344556', 'Calle Venezia 45', 'Venice', '30124', 'Italy', '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(17, 'Francesca', 'Romano', 'francesca.r@email.it', '+39-081-4455667', 'Via Napoli 89', 'Naples', '80132', 'Italy', '2025-11-22 14:17:20', '2025-11-22 14:17:20');

-- --------------------------------------------------------

--
-- Структура таблиці `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `phone`, `position`, `hire_date`, `salary`, `is_active`, `created_at`) VALUES
(1, 'Lars', 'Hansen', 'lars.hansen@company.de', '+49-40-100001', 'Sales Manager', '2022-01-15', 4500.00, 1, '2025-11-22 14:17:20'),
(2, 'Emma', 'Schulz', 'emma.schulz@company.de', '+49-40-100002', 'Sales Representative', '2022-03-20', 3200.00, 1, '2025-11-22 14:17:20'),
(3, 'Felix', 'Koch', 'felix.koch@company.de', '+49-40-100003', 'Sales Representative', '2022-06-10', 3200.00, 1, '2025-11-22 14:17:20'),
(4, 'Sarah', 'Hoffmann', 'sarah.h@company.de', '+49-40-100004', 'Customer Service', '2023-01-05', 2800.00, 1, '2025-11-22 14:17:20'),
(5, 'Lukas', 'Zimmermann', 'lukas.z@company.de', '+49-40-100005', 'Warehouse Manager', '2021-11-01', 3500.00, 1, '2025-11-22 14:17:20');

-- --------------------------------------------------------

--
-- Структура таблиці `inventory_transactions`
--

CREATE TABLE `inventory_transactions` (
  `transaction_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `transaction_type` enum('purchase','sale','return','adjustment') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `inventory_transactions`
--

INSERT INTO `inventory_transactions` (`transaction_id`, `product_id`, `transaction_type`, `quantity`, `transaction_date`, `reference_id`, `notes`) VALUES
(1, 1, 'purchase', 15, '2025-11-22 14:17:20', NULL, 'Initial stock from ComfortTech GmbH'),
(2, 2, 'purchase', 12, '2025-11-22 14:17:20', NULL, 'Initial stock from ComfortTech GmbH'),
(3, 6, 'purchase', 14, '2025-11-22 14:17:20', NULL, 'Initial stock from EuroFurniture SRL'),
(4, 11, 'purchase', 10, '2025-11-22 14:17:20', NULL, 'Initial stock from ChairMasters'),
(5, 16, 'purchase', 17, '2025-11-22 14:17:20', NULL, 'Initial stock from ComfortTech GmbH'),
(6, 21, 'purchase', 8, '2025-11-22 14:17:20', NULL, 'Initial stock from EuroFurniture SRL'),
(7, 1, 'sale', -2, '2025-11-22 14:17:20', 1, 'Sold via order #1'),
(8, 6, 'sale', -1, '2025-11-22 14:17:20', 2, 'Sold via order #2'),
(9, 11, 'sale', -3, '2025-11-22 14:17:20', 3, 'Sold via order #3'),
(10, 16, 'sale', -1, '2025-11-22 14:17:20', 4, 'Sold via order #4'),
(11, 21, 'sale', -2, '2025-11-22 14:17:20', 5, 'Sold via order #5');

-- --------------------------------------------------------

--
-- Структура таблиці `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `final_amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','card','bank_transfer','online') NOT NULL,
  `payment_status` enum('pending','paid','cancelled','refunded') DEFAULT 'pending',
  `order_status` enum('pending','processing','shipped','delivered','cancelled') DEFAULT 'pending',
  `delivery_address` text DEFAULT NULL,
  `delivery_city` varchar(100) DEFAULT NULL,
  `delivery_postal_code` varchar(20) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_amount`, `discount_amount`, `tax_amount`, `final_amount`, `payment_method`, `payment_status`, `order_status`, `delivery_address`, `delivery_city`, `delivery_postal_code`, `delivery_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-10-15 07:30:00', 13000.00, 0.00, 2470.00, 15470.00, 'bank_transfer', 'paid', 'delivered', 'Berliner Str. 45', 'Berlin', '10115', '2024-10-18', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(2, 2, '2024-10-16 11:20:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'paid', 'delivered', 'Münchner Allee 12', 'Munich', '80331', '2024-10-19', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(3, 3, '2024-10-18 06:15:00', 19500.00, 500.00, 3610.00, 22610.00, 'bank_transfer', 'paid', 'delivered', 'Frankfurter Weg 78', 'Frankfurt', '60311', '2024-10-21', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(4, 4, '2024-10-20 08:45:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'paid', 'shipped', 'Kölner Str. 34', 'Cologne', '50667', '2024-10-25', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(5, 5, '2024-10-22 13:30:00', 13000.00, 650.00, 2346.50, 14696.50, 'bank_transfer', 'paid', 'processing', 'Hamburger Str. 56', 'Hamburg', '20095', '2024-10-28', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(6, 6, '2024-10-25 07:00:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'paid', 'delivered', 'ul. Warszawska 23', 'Warsaw', '00-001', '2024-10-28', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(7, 7, '2024-10-26 10:20:00', 26000.00, 1000.00, 4750.00, 29750.00, 'bank_transfer', 'paid', 'delivered', 'ul. Krakowska 67', 'Krakow', '30-001', '2024-10-30', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(8, 8, '2024-10-28 13:45:00', 6500.00, 0.00, 1235.00, 7735.00, 'online', 'paid', 'delivered', 'ul. Poznanska 45', 'Poznan', '60-001', '2024-11-01', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(9, 9, '2024-10-29 07:30:00', 13000.00, 0.00, 2470.00, 15470.00, 'card', 'paid', 'shipped', 'ul. Gdanska 89', 'Gdansk', '80-001', '2024-11-05', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(10, 10, '2024-11-01 09:15:00', 6500.00, 0.00, 1235.00, 7735.00, 'bank_transfer', 'paid', 'delivered', 'Rue de Paris 12', 'Paris', '75001', '2024-11-04', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(11, 11, '2024-11-02 12:40:00', 19500.00, 975.00, 3519.75, 22044.75, 'card', 'paid', 'delivered', 'Avenue Lyon 45', 'Lyon', '69001', '2024-11-06', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(12, 12, '2024-11-04 08:20:00', 6500.00, 0.00, 1235.00, 7735.00, 'online', 'paid', 'delivered', 'Boulevard Bordeaux 78', 'Bordeaux', '33000', '2024-11-08', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(13, 13, '2024-11-05 14:50:00', 13000.00, 650.00, 2346.50, 14696.50, 'bank_transfer', 'paid', 'processing', 'Rue Marseille 34', 'Marseille', '13001', '2024-11-12', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(14, 14, '2024-11-07 07:10:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'paid', 'delivered', 'Via Milano 23', 'Milan', '20121', '2024-11-10', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(15, 15, '2024-11-08 10:30:00', 26000.00, 0.00, 4940.00, 30940.00, 'bank_transfer', 'paid', 'delivered', 'Via Roma 67', 'Rome', '00184', '2024-11-12', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(16, 16, '2024-11-10 13:20:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'paid', 'shipped', 'Calle Venezia 45', 'Venice', '30124', '2024-11-15', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(17, 17, '2024-11-11 08:45:00', 13000.00, 650.00, 2346.50, 14696.50, 'online', 'paid', 'delivered', 'Via Napoli 89', 'Naples', '80132', '2024-11-14', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(18, 1, '2024-11-12 12:15:00', 6500.00, 0.00, 1235.00, 7735.00, 'bank_transfer', 'paid', 'processing', 'Berliner Str. 45', 'Berlin', '10115', '2024-11-18', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(19, 3, '2024-11-13 09:00:00', 13000.00, 0.00, 2470.00, 15470.00, 'card', 'paid', 'delivered', 'Frankfurter Weg 78', 'Frankfurt', '60311', '2024-11-16', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(20, 6, '2024-11-14 14:30:00', 19500.00, 975.00, 3519.75, 22044.75, 'bank_transfer', 'paid', 'shipped', 'ul. Warszawska 23', 'Warsaw', '00-001', '2024-11-20', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(21, 10, '2024-11-15 07:20:00', 6500.00, 0.00, 1235.00, 7735.00, 'online', 'paid', 'delivered', 'Rue de Paris 12', 'Paris', '75001', '2024-11-18', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(22, 14, '2024-11-16 11:45:00', 13000.00, 650.00, 2346.50, 14696.50, 'card', 'paid', 'processing', 'Via Milano 23', 'Milan', '20121', '2024-11-22', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(23, 2, '2024-11-17 08:10:00', 6500.00, 0.00, 1235.00, 7735.00, 'bank_transfer', 'paid', 'delivered', 'Münchner Allee 12', 'Munich', '80331', '2024-11-20', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(24, 7, '2024-11-18 13:30:00', 26000.00, 1300.00, 4693.00, 29393.00, 'card', 'paid', 'shipped', 'ul. Krakowska 67', 'Krakow', '30-001', '2024-11-25', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(25, 11, '2024-11-19 09:50:00', 6500.00, 0.00, 1235.00, 7735.00, 'online', 'paid', 'delivered', 'Avenue Lyon 45', 'Lyon', '69001', '2024-11-21', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(26, 15, '2024-11-20 12:20:00', 13000.00, 0.00, 2470.00, 15470.00, 'bank_transfer', 'pending', 'pending', 'Via Roma 67', 'Rome', '00184', '2024-11-27', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(27, 4, '2024-11-21 07:40:00', 19500.00, 0.00, 3705.00, 23205.00, 'card', 'pending', 'pending', 'Kölner Str. 34', 'Cologne', '50667', '2024-11-28', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(28, 8, '2024-11-21 14:15:00', 6500.00, 0.00, 1235.00, 7735.00, 'online', 'pending', 'pending', 'ul. Poznanska 45', 'Poznan', '60-001', '2024-11-29', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(29, 12, '2024-11-22 08:30:00', 13000.00, 650.00, 2346.50, 14696.50, 'bank_transfer', 'pending', 'pending', 'Boulevard Bordeaux 78', 'Bordeaux', '33000', '2024-11-30', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(30, 16, '2024-11-22 11:00:00', 6500.00, 0.00, 1235.00, 7735.00, 'card', 'pending', 'pending', 'Calle Venezia 45', 'Venice', '30124', '2024-12-01', NULL, '2025-11-22 14:17:20', '2025-11-22 14:17:20');

-- --------------------------------------------------------

--
-- Структура таблиці `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `subtotal`) VALUES
(1, 1, 1, 2, 6500.00, 0.00, 13000.00),
(2, 2, 6, 1, 6500.00, 0.00, 6500.00),
(3, 3, 11, 3, 6500.00, 500.00, 19000.00),
(4, 4, 16, 1, 6500.00, 0.00, 6500.00),
(5, 5, 21, 2, 6500.00, 650.00, 12350.00),
(6, 6, 2, 1, 6500.00, 0.00, 6500.00),
(7, 7, 7, 4, 6500.00, 1000.00, 25000.00),
(8, 8, 12, 1, 6500.00, 0.00, 6500.00),
(9, 9, 17, 2, 6500.00, 0.00, 13000.00),
(10, 10, 22, 1, 6500.00, 0.00, 6500.00),
(11, 11, 3, 3, 6500.00, 975.00, 18525.00),
(12, 12, 8, 1, 6500.00, 0.00, 6500.00),
(13, 13, 13, 2, 6500.00, 650.00, 12350.00),
(14, 14, 18, 1, 6500.00, 0.00, 6500.00),
(15, 15, 23, 4, 6500.00, 0.00, 26000.00),
(16, 16, 4, 1, 6500.00, 0.00, 6500.00),
(17, 17, 9, 2, 6500.00, 650.00, 12350.00),
(18, 18, 14, 1, 6500.00, 0.00, 6500.00),
(19, 19, 19, 2, 6500.00, 0.00, 13000.00),
(20, 20, 24, 3, 6500.00, 975.00, 18525.00),
(21, 21, 5, 1, 6500.00, 0.00, 6500.00),
(22, 22, 10, 2, 6500.00, 650.00, 12350.00),
(23, 23, 15, 1, 6500.00, 0.00, 6500.00),
(24, 24, 20, 4, 6500.00, 1300.00, 24700.00),
(25, 25, 25, 1, 6500.00, 0.00, 6500.00),
(26, 26, 1, 2, 6500.00, 0.00, 13000.00),
(27, 27, 6, 3, 6500.00, 0.00, 19500.00),
(28, 28, 11, 1, 6500.00, 0.00, 6500.00),
(29, 29, 16, 2, 6500.00, 650.00, 12350.00),
(30, 30, 21, 1, 6500.00, 0.00, 6500.00);

-- --------------------------------------------------------

--
-- Структура таблиці `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `cost_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int(11) DEFAULT 0,
  `material` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `dimensions` varchar(100) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `category_id`, `description`, `price`, `cost_price`, `stock_quantity`, `material`, `color`, `dimensions`, `weight`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Premium Heated Office Chair', 1, 'Ergonomic office chair with heating', 6500.00, 3800.00, 15, 'Leather', 'Black', '120x70x65cm', 18.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(2, 'Deluxe Heated Gaming Chair', 1, 'Gaming chair with lumbar heating', 6500.00, 3900.00, 12, 'Faux Leather', 'Red', '125x75x70cm', 19.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(3, 'Executive Heated Chair', 1, 'Premium executive chair with heating', 6500.00, 3700.00, 10, 'Genuine Leather', 'Brown', '130x75x68cm', 20.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(4, 'Home Office Heated Chair', 1, 'Comfortable heated home office chair', 6500.00, 3850.00, 18, 'Fabric', 'Gray', '115x68x62cm', 17.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(5, 'Heated Conference Chair', 1, 'Professional conference chair with heating', 6500.00, 3750.00, 20, 'Leather', 'Black', '110x65x60cm', 16.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(6, 'Arctic Cool Office Chair', 2, 'Office chair with cooling technology', 6500.00, 3900.00, 14, 'Mesh', 'Blue', '118x70x64cm', 17.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(7, 'Summer Breeze Ergonomic Chair', 2, 'Ergonomic chair with cooling system', 6500.00, 3850.00, 16, 'Breathable Fabric', 'Gray', '122x72x66cm', 18.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(8, 'Cool Pro Gaming Chair', 2, 'Gaming chair with active cooling', 6500.00, 4000.00, 11, 'Mesh/Leather', 'Black/Blue', '126x74x69cm', 19.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(9, 'Executive Cool Chair', 2, 'Premium cooling executive chair', 6500.00, 3800.00, 13, 'Leather', 'White', '128x73x67cm', 19.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(10, 'Climate Control Office Chair', 2, 'Office chair with climate control', 6500.00, 3900.00, 15, 'Mesh', 'Charcoal', '120x71x65cm', 17.80, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(11, 'Shiatsu Massage Office Chair', 3, 'Office chair with shiatsu massage', 6500.00, 4100.00, 10, 'Leather', 'Black', '125x75x70cm', 21.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(12, 'Full Body Massage Chair', 3, 'Complete body massage functionality', 6500.00, 4200.00, 8, 'Premium Leather', 'Brown', '135x80x75cm', 24.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(13, 'Lumbar Massage Chair', 3, 'Focused lumbar massage chair', 6500.00, 3950.00, 14, 'Fabric', 'Navy', '120x70x65cm', 18.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(14, 'Executive Massage Chair', 3, 'Premium executive massage chair', 6500.00, 4150.00, 9, 'Leather', 'Burgundy', '130x76x68cm', 22.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(15, 'Therapeutic Massage Chair', 3, 'Therapeutic massage office chair', 6500.00, 4050.00, 12, 'Memory Foam', 'Gray', '123x72x66cm', 19.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(16, 'Cloud Comfort Chair', 4, 'Ultra-soft premium comfort chair', 6500.00, 3700.00, 17, 'Plush Fabric', 'Beige', '118x70x63cm', 17.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(17, 'Luxury Soft Office Chair', 4, 'Super soft luxury office chair', 6500.00, 3800.00, 15, 'Velvet', 'Gray', '121x71x65cm', 18.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(18, 'Ultimate Comfort Executive', 4, 'Ultimate soft executive chair', 6500.00, 3750.00, 13, 'Premium Fabric', 'Charcoal', '127x74x68cm', 19.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(19, 'Plush Pro Office Chair', 4, 'Professional plush office chair', 6500.00, 3850.00, 16, 'Memory Foam', 'Black', '119x69x64cm', 17.80, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(20, 'Soft Touch Gaming Chair', 4, 'Ultra-soft gaming chair', 6500.00, 3900.00, 12, 'Velour', 'Dark Blue', '124x73x67cm', 18.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(21, 'All-in-One Pro Chair', 5, 'Heating, cooling, and massage', 6500.00, 4300.00, 8, 'Leather', 'Black', '132x77x70cm', 23.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(22, 'Climate Massage Chair', 5, 'Heating/cooling with massage', 6500.00, 4250.00, 9, 'Premium Leather', 'Brown', '130x76x69cm', 22.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(23, 'Smart Comfort Chair', 5, 'Multi-function smart chair', 6500.00, 4200.00, 10, 'Tech Fabric', 'Gray', '128x75x68cm', 21.50, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(24, 'Executive Multi-Function', 5, 'All features executive chair', 6500.00, 4350.00, 7, 'Genuine Leather', 'Black', '135x78x71cm', 24.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20'),
(25, 'Pro Gamer Ultimate Chair', 5, 'Gaming chair with all functions', 6500.00, 4280.00, 9, 'Hybrid Material', 'Red/Black', '129x76x70cm', 22.00, 1, '2025-11-22 14:17:20', '2025-11-22 14:17:20');

-- --------------------------------------------------------

--
-- Структура таблиці `sales_employee`
--

CREATE TABLE `sales_employee` (
  `sale_employee_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `commission_rate` decimal(5,2) DEFAULT NULL,
  `commission_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `sales_employee`
--

INSERT INTO `sales_employee` (`sale_employee_id`, `order_id`, `employee_id`, `commission_rate`, `commission_amount`) VALUES
(1, 1, 2, 5.00, 650.00),
(2, 2, 3, 5.00, 325.00),
(3, 3, 2, 5.00, 950.00),
(4, 4, 3, 5.00, 325.00),
(5, 5, 2, 5.00, 617.50),
(6, 6, 3, 5.00, 325.00),
(7, 7, 2, 5.00, 1250.00),
(8, 8, 3, 5.00, 325.00),
(9, 9, 2, 5.00, 650.00),
(10, 10, 3, 5.00, 325.00),
(11, 11, 2, 5.00, 926.25),
(12, 12, 3, 5.00, 325.00),
(13, 13, 2, 5.00, 617.50),
(14, 14, 3, 5.00, 325.00),
(15, 15, 2, 5.00, 1300.00),
(16, 16, 3, 5.00, 325.00),
(17, 17, 2, 5.00, 617.50),
(18, 18, 3, 5.00, 325.00),
(19, 19, 2, 5.00, 650.00),
(20, 20, 3, 5.00, 926.25),
(21, 21, 2, 5.00, 325.00),
(22, 22, 3, 5.00, 617.50),
(23, 23, 2, 5.00, 325.00),
(24, 24, 3, 5.00, 1235.00),
(25, 25, 2, 5.00, 325.00),
(26, 26, 3, 5.00, 650.00),
(27, 27, 2, 5.00, 975.00),
(28, 28, 3, 5.00, 325.00),
(29, 29, 2, 5.00, 617.50),
(30, 30, 3, 5.00, 325.00);

-- --------------------------------------------------------

--
-- Структура таблиці `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `supplier_name` varchar(200) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `supplier_name`, `contact_person`, `email`, `phone`, `address`, `city`, `country`, `created_at`) VALUES
(1, 'ComfortTech GmbH', 'Hans Mueller', 'info@comforttech.de', '+49-40-123456', 'Industriestr. 45', 'Hamburg', 'Germany', '2025-11-22 14:17:20'),
(2, 'EuroFurniture SRL', 'Marco Rossi', 'sales@eurofurn.it', '+39-02-789012', 'Via Roma 123', 'Milan', 'Italy', '2025-11-22 14:17:20'),
(3, 'ChairMasters Sp.z.o.o', 'Anna Kowalska', 'contact@chairmasters.pl', '+48-22-345678', 'ul. Poznanska 67', 'Warsaw', 'Poland', '2025-11-22 14:17:20');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Індекси таблиці `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_customer_email` (`email`);

--
-- Індекси таблиці `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Індекси таблиці `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `idx_inventory_product` (`product_id`);

--
-- Індекси таблиці `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_order_date` (`order_date`),
  ADD KEY `idx_order_status` (`order_status`);

--
-- Індекси таблиці `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Індекси таблиці `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `idx_product_name` (`product_name`),
  ADD KEY `idx_product_category` (`category_id`);

--
-- Індекси таблиці `sales_employee`
--
ALTER TABLE `sales_employee`
  ADD PRIMARY KEY (`sale_employee_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Індекси таблиці `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблиці `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблиці `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблиці `sales_employee`
--
ALTER TABLE `sales_employee`
  MODIFY `sale_employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблиці `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `inventory_transactions`
--
ALTER TABLE `inventory_transactions`
  ADD CONSTRAINT `inventory_transactions_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Обмеження зовнішнього ключа таблиці `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Обмеження зовнішнього ключа таблиці `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Обмеження зовнішнього ключа таблиці `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Обмеження зовнішнього ключа таблиці `sales_employee`
--
ALTER TABLE `sales_employee`
  ADD CONSTRAINT `sales_employee_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `sales_employee_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
