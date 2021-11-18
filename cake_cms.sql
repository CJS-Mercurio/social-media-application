-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Nov 18, 2021 at 04:47 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cake_cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` text DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `body`, `published`, `created`, `modified`) VALUES
(1, 1, 'First Post', 'first-post', 'This is the first post.', 1, '2021-11-17 20:09:11', '2021-11-17 20:09:11'),
(2, 1, 'Example', 'Example', 'First example article.', 0, '2021-11-17 14:07:50', '2021-11-17 14:15:33'),
(4, 1, 'Christ John Mercurio', 'Christ-John-Mercurio', 'Example Article', 0, '2021-11-17 14:27:40', '2021-11-18 13:19:57'),
(9, 1, 'HAHHAHAHAHHAHAHAH', 'HAHHAHAHAHHAHAHAH', 'HEHEHHEHEHEHEHHEHEHE', 0, '2021-11-18 14:42:56', '2021-11-18 14:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `articles_tags`
--

CREATE TABLE `articles_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
(1, 1),
(2, 2),
(4, 4),
(9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'People', '2021-11-17 15:01:23', '2021-11-17 15:01:23'),
(2, 'Example', '2021-11-17 15:01:39', '2021-11-17 15:21:46'),
(3, 'My Tag', '2021-11-17 15:01:49', '2021-11-17 15:01:49'),
(4, 'funny', '2021-11-17 15:21:08', '2021-11-17 15:21:08'),
(5, 'Idunno', '2021-11-17 16:00:36', '2021-11-17 16:00:36'),
(6, 'Ah', '2021-11-18 08:59:06', '2021-11-18 08:59:06'),
(7, 'wrewrwrw', '2021-11-18 12:55:08', '2021-11-18 12:55:08'),
(8, 'Sample Tag', '2021-11-18 13:02:16', '2021-11-18 13:02:16'),
(9, 'Lamaw', '2021-11-18 14:42:56', '2021-11-18 14:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'cakephp@example.com', '$2y$10$JVA6D.GUYsPYoDlYNNP5U.kOMvMYdVlhfJkGN8JbXgmF625OeWahK', '2021-11-17 20:09:11', '2021-11-18 12:54:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_key` (`user_id`);

--
-- Indexes for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `article_key` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `tag_key` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
