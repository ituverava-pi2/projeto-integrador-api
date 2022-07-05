use pi2;

-- Estrutura da tabela `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `est_id` int NOT NULL AUTO_INCREMENT,
  `est_sigla` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `est_nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `estados`
--

INSERT INTO `estados` (`est_id`, `est_sigla`, `est_nome`) VALUES
(1, 'SP', 'São Paulo'),
(2, 'MG', 'Minas Gerais'),
(3, 'RJ', 'rio de Janeiro');

-- --------------------------------------------------------



--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
  `cid_id` int NOT NULL AUTO_INCREMENT,
  `est_id` int NOT NULL,
  `cid_nome` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cid_id`),
  KEY `fk_cidades_estados` (`est_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cidades`
--

INSERT INTO `cidades` (`cid_id`, `est_id`, `cid_nome`) VALUES
(1, 1, 'Ituverava'),
(2, 1, 'Guará'),
(3, 1, 'São Joaquim da Barra'),
(4, 1, 'Orlândia'),
(5, 1, 'Morro Agudo'),
(6, 1, 'Franca');

-- --------------------------------------------------------


--
-- Estrutura da tabela `unidades`
--

DROP TABLE IF EXISTS `tabela`;
CREATE TABLE `tabela` (
  `tab_id` int NOT NULL AUTO_INCREMENT,
  `tab_codigo` int NOT NULL,
  `est_id` int NOT NULL,
  `cid_id` int NOT NULL,
  `tab_data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tab_data_modificacao` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `tab_numero_casos` int DEFAULT '0',
  `tab_confirmados` int DEFAULT '0',
  `tab_analise` int DEFAULT '0',
  `tab_obitos` int DEFAULT '0' COLLATE utf8mb4_unicode_ci DEFAULT '0',
  PRIMARY KEY (`tab_id`),
  UNIQUE KEY `tab_codigo` (`tab_codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
--
-- Extraindo dados da tabela `unidades`
--

INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (1, 1, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 208, 157, 0, 0,'http://rtiinformatica.dev.br/images/flags/1.png');
INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (2, 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 10, 0, 0, 0,'http://rtiinformatica.dev.br/images/flags/2.png');
INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (3, 3, 1, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88, 6, 0, 0,'http://rtiinformatica.dev.br/images/flags/3.png');
INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (4, 4, 1, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134, 120, 0, 0,'http://rtiinformatica.dev.br/images/flags/4.png');
INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (5, 5, 1, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 474, 191, 0, 0,'http://rtiinformatica.dev.br/images/flags/5.png');
INSERT INTO `tabela` (`tab_id`, `tab_codigo`, `est_id`, `cid_id`, `tab_data_criacao`, `tab_data_modificacao`, `tab_numero_casos`, `tab_confirmados`, `tab_analise`, `tab_obitos`, `tab_imagem`) VALUES (6, 6, 1, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 4516, 3857, 0, 0,'http://rtiinformatica.dev.br/images/flags/6.png');

-- --------------------------------------------------------
