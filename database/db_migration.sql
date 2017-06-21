ALTER TABLE aluno
ADD COLUMN senha VARCHAR(60) AFTER email,
ADD COLUMN google_places_json VARCHAR(10000) AFTER senha,
ADD COLUMN endereco_google VARCHAR(255) AFTER google_places_json,
ADD COLUMN cadastro_atualizado TINYINT(1) AFTER id_aluno
