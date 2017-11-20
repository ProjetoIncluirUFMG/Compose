ALTER TABLE aluno
ADD COLUMN senha VARCHAR(60) AFTER email,
ADD COLUMN google_places_json VARCHAR(10000) AFTER senha,
ADD COLUMN cadastro_atualizado TINYINT(1) AFTER id_aluno,
ADD COLUMN recuperar_senha_token VARCHAR(255) AFTER cadastro_atualizado;

CREATE TABLE configuracao_cadastro (
  id int(1) NOT NULL,
  texto_inicial text NOT NULL,
  somente_veterano tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE configuracao_cadastro
  ADD PRIMARY KEY (`id`);

INSERT INTO configuracao_cadastro (`id`, `texto_inicial`, `somente_veterano`) VALUES ('1', 'Texto inicial', '1');
