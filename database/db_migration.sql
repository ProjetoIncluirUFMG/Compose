ALTER TABLE aluno
ADD COLUMN senha VARCHAR(60) AFTER email,
ADD COLUMN google_places_json VARCHAR(10000) AFTER senha,
ADD COLUMN cadastro_atualizado TINYINT(1) AFTER id_aluno,
ADD COLUMN recuperar_senha_token VARCHAR(255) AFTER cadastro_atualizado;

ALTER TABLE disciplina
ADD COLUMN vagas_do_curso INT(10) DEFAULT 0 AFTER status,
ADD COLUMN fila_de_nivelamento INT(10) DEFAULT 0 AFTER vagas_do_curso,
ADD COLUMN fila_de_espera INT(10) DEFAULT 0 AFTER fila_de_nivelamento,
ADD COLUMN total_vagas_do_curso INT(10) DEFAULT 0 AFTER fila_de_espera,
ADD COLUMN total_fila_de_nivelamento INT(10) DEFAULT 0 AFTER total_vagas_do_curso,
ADD COLUMN total_fila_de_espera INT(10) DEFAULT 0 AFTER total_fila_de_nivelamento,
ADD COLUMN idade_minima INT(3) DEFAULT 0 AFTER total_fila_de_espera;

CREATE TABLE configuracao_cadastro (
  id int(1) NOT NULL,
  texto_inicial text NOT NULL,
  somente_veterano tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE configuracao_cadastro
  ADD PRIMARY KEY (`id`);

INSERT INTO configuracao_cadastro (`id`, `texto_inicial`, `somente_veterano`) VALUES ('1', 'Texto inicial', '1');

CREATE TABLE pre_matricula ( `numero_comprovante` INT(10) NOT NULL , `aluno_cpf` VARCHAR(15) NOT NULL , `nome_curso` VARCHAR(45) NOT NULL , `id_curso` INT(11) NOT NULL , `nome_disciplina` VARCHAR(100) NOT NULL , `id_disciplina` INT(11) NOT NULL , `nome_turma` VARCHAR(100) NOT NULL , `id_turma` INT(11) NOT NULL , `veterano` BOOLEAN NOT NULL , `vaga_garantida` BOOLEAN NOT NULL , `fila_nivelamento` BOOLEAN NOT NULL , `fila_espera` BOOLEAN NOT NULL , `nome_aluno` VARCHAR(100) NOT NULL , `id_aluno` INT(11) NOT NULL , PRIMARY KEY (`numero_comprovante`)) ENGINE = InnoDB;

ALTER TABLE pre_matricula ADD CONSTRAINT `fk_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplina`(`id_disciplina`) ON DELETE NO ACTION ON UPDATE NO ACTION; ALTER TABLE `matricula` ADD CONSTRAINT `fk_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `aluno`(`id_aluno`) ON DELETE NO ACTION ON UPDATE NO ACTION; ALTER TABLE `matricula` ADD CONSTRAINT `fk_curso` FOREIGN KEY (`id_curso`) REFERENCES `curso`(`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION; ALTER TABLE `matricula` ADD CONSTRAINT `fk_turma` FOREIGN KEY (`id_turma`) REFERENCES `turma`(`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;
