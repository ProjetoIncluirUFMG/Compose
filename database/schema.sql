-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 24, 2018 at 12:17 PM
-- Server version: 5.6.38
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projeto_incluir_db`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=CURRENT_USER FUNCTION `removeInvalidsCharacters` (`val` VARCHAR(300)) RETURNS VARCHAR(300) CHARSET latin1 READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE invalids_val VARCHAR(100);
	DECLARE corrects_val VARCHAR(100);
	DECLARE invalids_val_clear VARCHAR(100);
	DECLARE pos INT;
	SET pos = 1;
	SET invalids_val = "áàãâäéèêëíìîïóòõôöúùûüçÁÀÃÂÄÉÈÊËÍÌÎÏÓÒÕÖÔÚÙÛÜÇ";
	SET corrects_val = "aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC";
	SET invalids_val_clear = ",/[]{}+=()@!$%*|&.";
	WHILE pos <= length(invalids_val) DO
		set val = replace(val, SUBSTRING(invalids_val, pos, 1), SUBSTRING(corrects_val, pos, 1));
		set pos = pos+1;
	END WHILE;
	set pos = 1;
	WHILE pos <= length(invalids_val_clear) DO
		set val = replace(val, SUBSTRING(invalids_val_clear, pos, 1), "");
		set pos = pos+1;
	END WHILE;
RETURN val;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nome_admin` varchar(100) NOT NULL,
  `login_admin` varchar(100) NOT NULL,
  `senha_admin` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administrador`
--

INSERT INTO `administrador` (`id_admin`, `nome_admin`, `login_admin`, `senha_admin`) VALUES
(8, 'Administrador', 'admin', '1f43e0b25d2dde8f9b0414dc4db045d5'),
(9, 'Teste', 'teste', '827ccb0eea8a706c4c34a16891f84e7b'),
(10, 'pablo', 'pablo', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `alimento`
--

CREATE TABLE `alimento` (
  `id_alimento` int(11) NOT NULL,
  `nome_alimento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aluno`
--

CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL COMMENT 'Código',
  `nome_aluno` varchar(100) NOT NULL COMMENT 'Nome',
  `sexo` tinyint(1) DEFAULT NULL,
  `cpf` varchar(15) NOT NULL,
  `is_cpf_responsavel` tinyint(1) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL COMMENT 'Telefone residencial',
  `celular` varchar(20) DEFAULT NULL COMMENT 'Celular',
  `data_nascimento` date DEFAULT NULL COMMENT 'Data de nascimento',
  `email` varchar(45) DEFAULT NULL COMMENT 'E-mail',
  `endereco` varchar(150) DEFAULT NULL COMMENT 'Endereço',
  `numero` int(10) UNSIGNED DEFAULT NULL COMMENT 'Número do endereço',
  `complemento` varchar(50) DEFAULT NULL COMMENT 'Complemento do endereço',
  `bairro` varchar(150) DEFAULT NULL COMMENT 'Bairro',
  `cidade` varchar(100) DEFAULT NULL COMMENT 'Código da cidade',
  `cep` varchar(20) DEFAULT NULL COMMENT 'CEP',
  `data_registro` date DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT 'Status',
  `data_desligamento` date DEFAULT NULL,
  `motivo_desligamento` varchar(300) DEFAULT NULL,
  `escolaridade` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `nome_responsavel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Cadastro comum de associados';

-- --------------------------------------------------------

--
-- Table structure for table `atividade`
--

CREATE TABLE `atividade` (
  `id_atividade` int(11) NOT NULL,
  `data_funcionamento` date NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `valor_total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nome_curso` varchar(45) NOT NULL,
  `descricao_curso` varchar(300) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datas_funcionamento`
--

CREATE TABLE `datas_funcionamento` (
  `data_funcionamento` date NOT NULL,
  `id_periodo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `datas_lancamentos_frequencias_turmas`
--

CREATE TABLE `datas_lancamentos_frequencias_turmas` (
  `id_data_lancamento` int(11) NOT NULL,
  `data_funcionamento` date NOT NULL,
  `id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disciplina`
--

CREATE TABLE `disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `nome_disciplina` varchar(100) NOT NULL,
  `ementa_disciplina` varchar(300) DEFAULT NULL,
  `id_curso` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disciplina_pre_requisitos`
--

CREATE TABLE `disciplina_pre_requisitos` (
  `id_disciplina` int(11) NOT NULL,
  `id_disciplina_pre_requisito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `escala_frequencia_voluntario`
--

CREATE TABLE `escala_frequencia_voluntario` (
  `id_frequencia` int(11) NOT NULL DEFAULT '0',
  `data_funcionamento` date NOT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `is_presente` tinyint(1) DEFAULT NULL,
  `id_voluntario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `falta`
--

CREATE TABLE `falta` (
  `id_falta` int(11) NOT NULL,
  `id_turma_aluno` int(11) NOT NULL,
  `data_funcionamento` date NOT NULL,
  `observacao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id_log` int(11) NOT NULL,
  `data_log` date NOT NULL,
  `tipo_tarefa` varchar(100) NOT NULL,
  `nome_usuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nota_aluno`
--

CREATE TABLE `nota_aluno` (
  `id_nota` int(11) NOT NULL,
  `id_turma_aluno` int(11) NOT NULL,
  `id_atividades_turma` int(11) NOT NULL,
  `valor_nota` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `valor_pago` float NOT NULL,
  `situacao` tinyint(1) NOT NULL,
  `condicao` int(11) NOT NULL,
  `tipo_isencao_pendencia` int(11) DEFAULT NULL,
  `num_recibo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagamento_alimentos`
--

CREATE TABLE `pagamento_alimentos` (
  `id_pagamento` int(11) NOT NULL,
  `id_alimento` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `periodo`
--

CREATE TABLE `periodo` (
  `id_periodo` int(11) NOT NULL,
  `nome_periodo` varchar(45) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date DEFAULT NULL,
  `is_atual` tinyint(1) DEFAULT NULL,
  `valor_liberacao_periodo` float NOT NULL,
  `freq_min_aprov` int(11) NOT NULL,
  `total_pts_periodo` int(11) NOT NULL,
  `min_pts_aprov` int(11) NOT NULL,
  `quantidade_alimentos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `permissao`
--

CREATE TABLE `permissao` (
  `id_permissao` int(11) NOT NULL,
  `titulo_permissao` varchar(45) NOT NULL,
  `controller` varchar(45) NOT NULL,
  `action` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turma`
--

CREATE TABLE `turma` (
  `id_turma` int(11) NOT NULL,
  `nome_turma` varchar(100) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `horario_inicio` time DEFAULT NULL,
  `horario_fim` time DEFAULT NULL,
  `status` int(11) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `sala` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turma_alunos`
--

CREATE TABLE `turma_alunos` (
  `id_turma_aluno` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_pagamento` int(11) NOT NULL,
  `aprovado` tinyint(1) DEFAULT NULL,
  `liberacao` tinyint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `turma_atividades`
--

CREATE TABLE `turma_atividades` (
  `id_atividades_turma` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL,
  `id_atividade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `login_usuario` varchar(100) NOT NULL,
  `senha_usuario` varchar(100) NOT NULL,
  `id_voluntario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usuario_permissoes`
--

CREATE TABLE `usuario_permissoes` (
  `id_usuario` int(11) NOT NULL,
  `id_voluntario` int(11) NOT NULL,
  `id_usuario_permissao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voluntario`
--

CREATE TABLE `voluntario` (
  `id_voluntario` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `formacao` varchar(45) DEFAULT NULL,
  `profissao` varchar(45) DEFAULT NULL,
  `telefone_fixo` varchar(45) DEFAULT NULL,
  `telefone_celular` varchar(45) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `funcao_informatica` varchar(100) DEFAULT NULL,
  `funcao_rh` varchar(100) DEFAULT NULL,
  `funcao_secretaria` varchar(100) DEFAULT NULL,
  `funcao_marketing` varchar(100) DEFAULT NULL,
  `carga_horaria` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_desligamento` date DEFAULT NULL,
  `motivo_desligamento` varchar(300) DEFAULT NULL,
  `disponibilidade` text,
  `conhecimento` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voluntario_disciplinas`
--

CREATE TABLE `voluntario_disciplinas` (
  `id_voluntario` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voluntario_turmas`
--

CREATE TABLE `voluntario_turmas` (
  `id_voluntario` int(11) NOT NULL,
  `id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id_alimento`);

--
-- Indexes for table `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`id_aluno`);

--
-- Indexes for table `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`id_atividade`),
  ADD KEY `fk_atividade_datas_funcionamento1_idx` (`data_funcionamento`);

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indexes for table `datas_funcionamento`
--
ALTER TABLE `datas_funcionamento`
  ADD PRIMARY KEY (`data_funcionamento`),
  ADD KEY `fk_datas_funcionamento_periodo1_idx` (`id_periodo`);

--
-- Indexes for table `datas_lancamentos_frequencias_turmas`
--
ALTER TABLE `datas_lancamentos_frequencias_turmas`
  ADD PRIMARY KEY (`id_data_lancamento`),
  ADD KEY `data_funcionamento` (`data_funcionamento`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Indexes for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD PRIMARY KEY (`id_disciplina`),
  ADD KEY `fk_disciplina_modulo1_idx` (`id_curso`);

--
-- Indexes for table `disciplina_pre_requisitos`
--
ALTER TABLE `disciplina_pre_requisitos`
  ADD PRIMARY KEY (`id_disciplina`,`id_disciplina_pre_requisito`),
  ADD KEY `fk_disciplina_has_disciplina_disciplina2_idx` (`id_disciplina_pre_requisito`),
  ADD KEY `fk_disciplina_has_disciplina_disciplina1_idx` (`id_disciplina`);

--
-- Indexes for table `escala_frequencia_voluntario`
--
ALTER TABLE `escala_frequencia_voluntario`
  ADD PRIMARY KEY (`id_frequencia`),
  ADD KEY `fk_frequencia_voluntario_voluntario1_idx` (`id_voluntario`),
  ADD KEY `fk_escala_frequencia_voluntario_datas_funcionamento1_idx` (`data_funcionamento`);

--
-- Indexes for table `falta`
--
ALTER TABLE `falta`
  ADD PRIMARY KEY (`id_falta`,`id_turma_aluno`,`data_funcionamento`),
  ADD KEY `fk_falta_turma_aluno1_idx` (`id_turma_aluno`),
  ADD KEY `fk_falta_datas_funcionamento1_idx` (`data_funcionamento`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `nota_aluno`
--
ALTER TABLE `nota_aluno`
  ADD PRIMARY KEY (`id_nota`,`id_turma_aluno`,`id_atividades_turma`),
  ADD KEY `fk_nota_turma_aluno1_idx` (`id_turma_aluno`),
  ADD KEY `fk_nota_turma_atividades1_idx` (`id_atividades_turma`);

--
-- Indexes for table `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Indexes for table `pagamento_alimentos`
--
ALTER TABLE `pagamento_alimentos`
  ADD PRIMARY KEY (`id_pagamento`,`id_alimento`),
  ADD KEY `fk_pagamento_has_alimento_alimento1_idx` (`id_alimento`),
  ADD KEY `fk_pagamento_has_alimento_pagamento1_idx` (`id_pagamento`);

--
-- Indexes for table `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indexes for table `permissao`
--
ALTER TABLE `permissao`
  ADD PRIMARY KEY (`id_permissao`);

--
-- Indexes for table `turma`
--
ALTER TABLE `turma`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `fk_turma_periodo2_idx` (`id_periodo`),
  ADD KEY `fk_turma_disciplina1_idx` (`id_disciplina`);

--
-- Indexes for table `turma_alunos`
--
ALTER TABLE `turma_alunos`
  ADD PRIMARY KEY (`id_turma_aluno`),
  ADD KEY `fk_turma_has_aluno_aluno1_idx` (`id_aluno`),
  ADD KEY `fk_turma_has_aluno_turma1_idx` (`id_turma`),
  ADD KEY `fk_turma_alunos_pagamento1_idx` (`id_pagamento`);

--
-- Indexes for table `turma_atividades`
--
ALTER TABLE `turma_atividades`
  ADD PRIMARY KEY (`id_atividades_turma`),
  ADD KEY `fk_turma_has_Atividade_turma1_idx` (`id_turma`),
  ADD KEY `fk_turma_atividades_atividade1_idx` (`id_atividade`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`,`id_voluntario`),
  ADD KEY `fk_usuario_voluntario1_idx` (`id_voluntario`);

--
-- Indexes for table `usuario_permissoes`
--
ALTER TABLE `usuario_permissoes`
  ADD PRIMARY KEY (`id_usuario`,`id_voluntario`,`id_usuario_permissao`),
  ADD KEY `fk_usuario_has_usuario_permissao_usuario_permissao1_idx` (`id_usuario_permissao`),
  ADD KEY `fk_usuario_has_usuario_permissao_usuario1_idx` (`id_usuario`,`id_voluntario`);

--
-- Indexes for table `voluntario`
--
ALTER TABLE `voluntario`
  ADD PRIMARY KEY (`id_voluntario`);

--
-- Indexes for table `voluntario_disciplinas`
--
ALTER TABLE `voluntario_disciplinas`
  ADD PRIMARY KEY (`id_voluntario`,`id_disciplina`),
  ADD KEY `fk_voluntario_has_disciplina_disciplina1_idx` (`id_disciplina`),
  ADD KEY `fk_voluntario_has_disciplina_voluntario1_idx` (`id_voluntario`);

--
-- Indexes for table `voluntario_turmas`
--
ALTER TABLE `voluntario_turmas`
  ADD PRIMARY KEY (`id_voluntario`,`id_turma`),
  ADD KEY `fk_voluntario_has_turma_turma1_idx` (`id_turma`),
  ADD KEY `fk_voluntario_has_turma_voluntario1_idx` (`id_voluntario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `alimento`
--
ALTER TABLE `alimento`
  MODIFY `id_alimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `aluno`
--
ALTER TABLE `aluno`
  MODIFY `id_aluno` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código', AUTO_INCREMENT=4699;
--
-- AUTO_INCREMENT for table `atividade`
--
ALTER TABLE `atividade`
  MODIFY `id_atividade` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1139;
--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `datas_lancamentos_frequencias_turmas`
--
ALTER TABLE `datas_lancamentos_frequencias_turmas`
  MODIFY `id_data_lancamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10101;
--
-- AUTO_INCREMENT for table `disciplina`
--
ALTER TABLE `disciplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `falta`
--
ALTER TABLE `falta`
  MODIFY `id_falta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51847;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nota_aluno`
--
ALTER TABLE `nota_aluno`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35651;
--
-- AUTO_INCREMENT for table `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15996;
--
-- AUTO_INCREMENT for table `periodo`
--
ALTER TABLE `periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `permissao`
--
ALTER TABLE `permissao`
  MODIFY `id_permissao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `turma`
--
ALTER TABLE `turma`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;
--
-- AUTO_INCREMENT for table `turma_alunos`
--
ALTER TABLE `turma_alunos`
  MODIFY `id_turma_aluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16507;
--
-- AUTO_INCREMENT for table `turma_atividades`
--
ALTER TABLE `turma_atividades`
  MODIFY `id_atividades_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1109;
--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;
--
-- AUTO_INCREMENT for table `voluntario`
--
ALTER TABLE `voluntario`
  MODIFY `id_voluntario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=609;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_datas_funcionamento1` FOREIGN KEY (`data_funcionamento`) REFERENCES `datas_funcionamento` (`data_funcionamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `datas_funcionamento`
--
ALTER TABLE `datas_funcionamento`
  ADD CONSTRAINT `fk_datas_funcionamento_periodo1` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `datas_lancamentos_frequencias_turmas`
--
ALTER TABLE `datas_lancamentos_frequencias_turmas`
  ADD CONSTRAINT `datas_lancamentos_frequencias_turmas_ibfk_1` FOREIGN KEY (`data_funcionamento`) REFERENCES `datas_funcionamento` (`data_funcionamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `datas_lancamentos_frequencias_turmas_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disciplina`
--
ALTER TABLE `disciplina`
  ADD CONSTRAINT `fk_disciplina_modulo1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `disciplina_pre_requisitos`
--
ALTER TABLE `disciplina_pre_requisitos`
  ADD CONSTRAINT `disciplina_pre_requisitos_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disciplina_pre_requisitos_ibfk_2` FOREIGN KEY (`id_disciplina_pre_requisito`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `escala_frequencia_voluntario`
--
ALTER TABLE `escala_frequencia_voluntario`
  ADD CONSTRAINT `fk_escala_frequencia_voluntario_datas_funcionamento1` FOREIGN KEY (`data_funcionamento`) REFERENCES `datas_funcionamento` (`data_funcionamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_frequencia_voluntario_voluntario1` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `falta`
--
ALTER TABLE `falta`
  ADD CONSTRAINT `fk_falta_datas_funcionamento1` FOREIGN KEY (`data_funcionamento`) REFERENCES `datas_funcionamento` (`data_funcionamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_falta_turma_aluno1` FOREIGN KEY (`id_turma_aluno`) REFERENCES `turma_alunos` (`id_turma_aluno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nota_aluno`
--
ALTER TABLE `nota_aluno`
  ADD CONSTRAINT `fk_nota_turma_aluno1` FOREIGN KEY (`id_turma_aluno`) REFERENCES `turma_alunos` (`id_turma_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nota_turma_atividades1` FOREIGN KEY (`id_atividades_turma`) REFERENCES `turma_atividades` (`id_atividades_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pagamento_alimentos`
--
ALTER TABLE `pagamento_alimentos`
  ADD CONSTRAINT `fk_pagamento_has_alimento_alimento1` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pagamento_alimentos_ibfk_1` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turma`
--
ALTER TABLE `turma`
  ADD CONSTRAINT `fk_turma_disciplina1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_periodo` FOREIGN KEY (`id_periodo`) REFERENCES `periodo` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turma_alunos`
--
ALTER TABLE `turma_alunos`
  ADD CONSTRAINT `fk_turma_alunos_pagamento1` FOREIGN KEY (`id_pagamento`) REFERENCES `pagamento` (`id_pagamento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_has_aluno_aluno1` FOREIGN KEY (`id_aluno`) REFERENCES `aluno` (`id_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_has_aluno_turma1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turma_atividades`
--
ALTER TABLE `turma_atividades`
  ADD CONSTRAINT `fk_turma_atividades_atividade1` FOREIGN KEY (`id_atividade`) REFERENCES `atividade` (`id_atividade`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turma_has_Atividade_turma1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_voluntario1` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario_permissoes`
--
ALTER TABLE `usuario_permissoes`
  ADD CONSTRAINT `fk_usuario_has_usuario_permissao_usuario1` FOREIGN KEY (`id_usuario`,`id_voluntario`) REFERENCES `usuario` (`id_usuario`, `id_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_has_usuario_permissao_usuario_permissao1` FOREIGN KEY (`id_usuario_permissao`) REFERENCES `permissao` (`id_permissao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `voluntario_disciplinas`
--
ALTER TABLE `voluntario_disciplinas`
  ADD CONSTRAINT `fk_voluntario_has_disciplina_disciplina1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina` (`id_disciplina`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_voluntario_has_disciplina_voluntario1` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `voluntario_turmas`
--
ALTER TABLE `voluntario_turmas`
  ADD CONSTRAINT `fk_voluntario_has_turma_turma1` FOREIGN KEY (`id_turma`) REFERENCES `turma` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_voluntario_has_turma_voluntario1` FOREIGN KEY (`id_voluntario`) REFERENCES `voluntario` (`id_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
