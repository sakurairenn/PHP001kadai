-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2025-01-16 07:45:10
-- サーバのバージョン： 10.4.28-MariaDB
-- PHP のバージョン: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `board`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `home` varchar(100) NOT NULL,
  `away` varchar(100) NOT NULL,
  `home_score` int(11) NOT NULL,
  `away_score` int(11) NOT NULL,
  `pk_home` int(11) DEFAULT NULL,
  `pk_away` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `games`
--

INSERT INTO `games` (`id`, `date`, `home`, `away`, `home_score`, `away_score`, `pk_home`, `pk_away`) VALUES
(1, '2022-12-03', 'オランダ', 'アメリカ', 3, 1, NULL, NULL),
(2, '2022-12-05', '日本', 'クロアチア', 1, 1, 1, 3),
(3, '2022-12-05', 'ブラジル', '韓国', 4, 1, NULL, NULL),
(4, '2022-12-04', 'イングランド', 'セネガル', 3, 0, NULL, NULL),
(5, '2022-12-04', 'フランス', 'ポーランド', 3, 1, NULL, NULL),
(6, '2022-12-06', 'モロッコ', 'スペイン', 0, 0, 3, 0),
(7, '2022-12-06', 'ポルトガル', 'スイス', 6, 1, NULL, NULL),
(8, '2022-12-09', 'オランダ', 'アルゼンチン', 2, 2, 3, 4),
(9, '2022-12-09', 'クロアチア', 'ブラジル', 1, 1, 4, 2),
(10, '2022-12-10', 'イングランド', 'フランス', 1, 2, NULL, NULL),
(11, '2022-12-10', 'モロッコ', 'ポルトガル', 1, 0, NULL, NULL),
(12, '2022-12-13', 'アルゼンチン', 'クロアチア', 3, 0, NULL, NULL),
(13, '2022-12-14', 'フランス', 'モロッコ', 2, 0, NULL, NULL),
(14, '2022-12-18', 'アルゼンチン', 'フランス', 3, 3, 4, 2),
(15, '2022-12-17', 'クロアチア', 'モロッコ', 2, 1, NULL, NULL),
(16, '2018-06-30', 'ウルグアイ', 'ポルトガル', 2, 1, NULL, NULL),
(17, '2018-06-30', 'フランス', 'アルゼンチン', 4, 3, NULL, NULL),
(18, '2018-07-02', 'ブラジル', 'メキシコ', 2, 0, NULL, NULL),
(19, '2018-07-02', 'ベルギー', '日本', 3, 2, NULL, NULL),
(20, '2018-07-01', 'スペイン', 'ロシア', 1, 1, 3, 4),
(21, '2018-07-01', 'クロアチア', 'デンマーク', 1, 1, 3, 2),
(22, '2018-07-03', 'スウェーデン', 'スイス', 1, 0, NULL, NULL),
(23, '2018-07-03', 'コロンビア', 'イングランド', 1, 1, 3, 4),
(24, '2018-07-06', 'ウルグアイ', 'フランス', 2, 1, NULL, NULL),
(25, '2018-07-06', 'ブラジル', 'ベルギー', 3, 2, NULL, NULL),
(26, '2018-07-07', 'ロシア', 'クロアチア', 2, 2, 3, 4),
(28, '2018-07-07', 'スウェーデン', 'イングランド', 0, 2, NULL, NULL),
(29, '2018-07-10', 'フランス', 'ベルギー', 1, 0, NULL, NULL),
(30, '2018-07-11', 'クロアチア', 'イングランド', 2, 1, NULL, NULL),
(31, '2018-07-15', 'フランス', 'クロアチア', 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- テーブルの構造 `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- テーブルの AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
