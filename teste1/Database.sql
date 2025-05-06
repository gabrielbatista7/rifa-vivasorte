-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 16/12/2024 às 00:11
-- Versão do servidor: 5.7.43-log
-- Versão do PHP: 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `grxpay`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `tax_min` decimal(10,6) DEFAULT NULL,
  `tax_cashin` int(11) DEFAULT NULL,
  `tax_cashout` int(11) DEFAULT NULL,
  `tax_internal` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `favicon` varchar(128) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  `togglelogo` varchar(128) DEFAULT NULL,
  `name_pay_logo` int(11) DEFAULT NULL,
  `primary_color` varchar(50) DEFAULT NULL,
  `secondary_color` varchar(50) DEFAULT NULL,
  `anti_fraude_min` decimal(20,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `config`
--

INSERT INTO `config` (`id`, `tax_min`, `tax_cashin`, `tax_cashout`, `tax_internal`, `name`, `favicon`, `logo`, `togglelogo`, `name_pay_logo`, `primary_color`, `secondary_color`, `anti_fraude_min`) VALUES
(0, 0.800000, 3, 1, 0, 'R4 Intermediadora', 'https://i.imgur.com/3lbt8wI.png', 'https://i.imgur.com/lcDCybN.png', 'https://i.imgur.com/3lbt8wI.png', 0, '249, 175, 55', '187, 130, 38', 1000.000000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ip_whitelist`
--

CREATE TABLE `ip_whitelist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(50) NOT NULL,
  `end2end` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `amount` decimal(20,6) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `confirmed_date` varchar(50) DEFAULT '0000-00-00 00:00:00',
  `tax` decimal(20,6) DEFAULT '0.000000',
  `status` enum('PAID','PENDING','CANCELLED','REVERSED') DEFAULT 'PENDING',
  `type` enum('DEPOSIT','WITHDRAW','INTERNAL_TRANSFER') DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `api` int(11) DEFAULT NULL,
  `document` varchar(50) DEFAULT NULL,
  `internal` int(11) DEFAULT NULL,
  `postback_url` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `end2end`, `external_id`, `user_id`, `amount`, `created_at`, `confirmed_date`, `tax`, `status`, `type`, `nome`, `descricao`, `api`, `document`, `internal`, `postback_url`) VALUES
('4355a5127c050900de0em4g4cxi14w3d', NULL, '9265736892', 78253552, 1.000000, '2024-12-08 18:32:02', '0000-00-00 00:00:00', 0.800000, 'PENDING', 'DEPOSIT', 'Monkey D. Luffy', '', 1, '99999999999', NULL, 'https://your.route'),
('78aab569e12928942bc9m4g4ekqq4x4g', 'E2024120821331400D6XI1U', '6567018113', 78253552, 1.000000, '2024-12-08 18:33:19', NULL, 0.800000, 'PENDING', 'DEPOSIT', 'Monkey D. Luffy', '', 1, '99999999999', NULL, 'https://your.route'),
('e189eecc992f061cc97703907bdxnde1v', 'E202412150320060sEJ2lSn', '675dda633e733', 78253552, 1.000000, '2024-12-14 16:20:06', '2024-12-15 03:21:07', 0.800000, 'REVERSED', 'DEPOSIT', 'Manoel Cavalcante', '', NULL, '104.720.863-67', NULL, NULL),
('e1d4235365035bdf0c66e8b90666y3k0x', 'E20241215213227xT9jqciZ', '675eda6a7a0ad', 69012074, 100.000000, '2024-12-15 10:32:27', '0000-00-00 00:00:00', 3.000000, 'PENDING', 'DEPOSIT', 'teste', '', NULL, '066.648.685-98', NULL, NULL),
('e6b3bc30fe44220ef67c062f2c4lpt8ak', 'E20241209225839n8NLcB6x', '6757680b1dc20', 78253552, 5.000000, '2024-12-09 18:58:39', '0000-00-00 00:00:00', 0.800000, 'REVERSED', 'DEPOSIT', 'Manoel Cavalcante', '', NULL, '104.720.863-67', NULL, NULL),
('e84ebb8702694adf6c37a75626cj3cr4d', 'E20241209225759K7JatE60', '675767e3628f9', 78253552, 1.000000, '2024-12-08 18:57:59', '0000-00-00 00:00:00', 0.800000, 'PAID', 'DEPOSIT', 'Manoel Cavalcante', '', NULL, '104.720.863-67', NULL, NULL),
('e9ef561dc3bd5408c2bf1beebe7k0zb7d', 'E202412150323445aUh39xt', '675ddb3d77d09', 78253552, 1.000000, '2024-12-14 16:23:44', '2024-12-15 03:24:21', 0.800000, 'PAID', 'DEPOSIT', 'Manoel Cavalcante', '', NULL, '104.720.863-67', NULL, NULL),
('ebb2ec3f22cbdb74e7176cafc2e373usj', 'E2024120821351070FTIH6F', '5546408243', 78253552, 1.000000, '2024-12-08 18:35:13', NULL, 0.800000, 'PENDING', 'WITHDRAW', 'João do teste', 'Pagamento de teste', 1, '09422185319', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `faturamento` varchar(50) DEFAULT NULL,
  `documents_checked` int(11) DEFAULT '0',
  `pin` varchar(50) DEFAULT NULL,
  `cash_in_active` int(11) DEFAULT '0',
  `cash_out_active` int(11) DEFAULT '0',
  `balance` decimal(20,6) DEFAULT '0.000000',
  `role` enum('USER','ADMIN') DEFAULT 'USER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `telefone`, `cnpj`, `faturamento`, `documents_checked`, `pin`, `cash_in_active`, `cash_out_active`, `balance`, `role`) VALUES
(14770164, 'carlosdanieal', 'Cavalo321+-', 'CARLOS DANIEL PEREIRA JAGIELSKI', 'elondigital883@gmail.com', '(47) 88466-3554', '083.665.679-23', '4', 1, NULL, 1, 1, 0.000000, 'USER'),
(28050807, 'Luanfavaro', 'Thmpv@1234', 'Luan Fávaro ', 'luan_favaro@hotmail.com', '(43) 99664-0895', '090.748.669-05', '2', 0, NULL, 0, 0, 0.000000, 'USER'),
(28357673, 'CarlosPassone', 'Carlos123@', 'Carlos Passone', 'carlospassonenh@gmail.com', '(17) 99708-3396', '48.315.245/0001-34', '1', 0, NULL, 0, 0, 0.000000, 'USER'),
(45260676, 'Hhgug545', 'vhvvc54$%@*', 'Vvbb hgg', 'Hufyufv@gmail.vom', '(63) 76666-6455', '35.635.824/0001-12', '4', 0, '000000', 0, 0, 0.000000, 'USER'),
(46515184, 'joao3', '12312312', 'carlos gomes', 'joao@gmail.com', '(63) 90899-7122', '991.290.351-04', '4', 0, NULL, 0, 0, 0.000000, 'USER'),
(47227388, 'Joao', 'De@250584', 'Teste', 'Joaodasil@gmail.com', '(72) 82272-7282', '00.000.000/0000-00', '4', 0, NULL, 0, 0, 0.000000, 'USER'),
(53396851, 'Bshshhgmailcom', 'gugu09', 'Usjshxjxbx', 'Bhshh@gmail.com', '(82) 73728-2873', '176.078.120-75', '4', 0, NULL, 0, 0, 0.000000, 'USER'),
(69012074, 'Yarkan', 'fake12322', 'Yarkan Marley de Farias', 'yarkanpessoal@gmail.com', '(71) 99636-9369', '066.648.685-98', '0', 1, NULL, 1, 1, 0.000000, 'ADMIN'),
(72438820, 'Hjshshsj', 'gugu09', '4bzhdh', 'Bshshh@gmail.com', '(72) 52278-2726', '428.740.550-18', '4', 0, NULL, 0, 0, 0.000000, 'USER'),
(78253552, 'manoel', '123', 'Manoel Cavalcante', 'manoeldev14@gmail.com', '(88) 99979-1277', '104.720.863-67', '4', 1, '308080', 1, 1, -1.600000, 'ADMIN'),
(85232928, 'Gustavo1234', 'gustavo09', 'Gustavo', 'gustavomoraes9278@gmail.com', '(65) 66777-7778', '867.817.350-55', '1', 0, NULL, 0, 0, 0.000000, 'USER');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_documents`
--

CREATE TABLE `users_documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) DEFAULT NULL,
  `formFile` binary(50) DEFAULT NULL,
  `file_content` varchar(50) DEFAULT NULL,
  `file_path` varchar(128) DEFAULT NULL,
  `approved` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users_documents`
--

INSERT INTO `users_documents` (`id`, `user_id`, `document_id`, `formFile`, `file_content`, `file_path`, `approved`) VALUES
(8, 78253552, 1, NULL, NULL, 'C:\\xampp\\htdocs\\libs\\funcoes\\documentos/uploads/pix_491217.png', 1),
(9, 78253552, 2, NULL, NULL, 'C:\\xampp\\htdocs\\libs\\funcoes\\documentos/uploads/toggle-dark_399913.png', 1),
(11, 78253552, 4, NULL, NULL, 'C:\\xampp\\htdocs\\libs\\funcoes\\documentos/uploads/pix_653222.pdf', 1),
(13, 78253552, 3, NULL, NULL, 'C:\\xampp\\htdocs\\libs\\funcoes\\documentos/uploads/toggle-dark_374131.png', 1),
(14, 69012074, 1, NULL, NULL, '/www/wwwroot/grxpay.com/libs/funcoes/documentos/uploads/jackpot_custom_988222.png', 1),
(15, 69012074, 2, NULL, NULL, '/www/wwwroot/grxpay.com/libs/funcoes/documentos/uploads/jackpot_custom_107500.png', 1),
(16, 69012074, 3, NULL, NULL, '/www/wwwroot/grxpay.com/libs/funcoes/documentos/uploads/jackpot_custom_625955.png', 1),
(17, 69012074, 4, NULL, NULL, '/www/wwwroot/grxpay.com/libs/funcoes/documentos/uploads/R4 Intermediadora - Perfil_613341.pdf', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_integration_keys`
--

CREATE TABLE `users_integration_keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` varchar(50) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  `access_token` varchar(256) DEFAULT NULL,
  `expires_in` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users_integration_keys`
--

INSERT INTO `users_integration_keys` (`id`, `user_id`, `client_id`, `client_secret`, `name`, `description`, `created_at`, `domain`, `access_token`, `expires_in`) VALUES
(5, 78253552, 'admin_3928173708', 'a7b79eb6d6b67442220e3fdab05d42e7f1fed97f696516c8e9c4e088ee8cad5e', 'test', 'htt', '2024-12-08 16:22:42', 'https://dominio.com', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhZG1pbl8zOTI4MTczNzA4Iiwic3ViIjoiTUM0ek1qTTNNek0wTVRJNU9ETTNPVFUyTlE9PSIsInVzZXJfaWQiOjc4MjUzNTUyLCJpYXQiOjE3MzM2OTM0OTgsImV4cCI6MTczMzY5NTI5OH0.2CFFUtCvJdBOlv9Qqvl8gGb1go9ULGABC2QmlNdTeMs', '1733695298');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `ip_whitelist`
--
ALTER TABLE `ip_whitelist`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users_documents`
--
ALTER TABLE `users_documents`
  ADD UNIQUE KEY `id` (`id`);

--
-- Índices de tabela `users_integration_keys`
--
ALTER TABLE `users_integration_keys`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `userId` (`user_id`) USING BTREE,
  ADD UNIQUE KEY `client_id` (`client_id`),
  ADD UNIQUE KEY `client_secret` (`client_secret`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ip_whitelist`
--
ALTER TABLE `ip_whitelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `users_documents`
--
ALTER TABLE `users_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `users_integration_keys`
--
ALTER TABLE `users_integration_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
