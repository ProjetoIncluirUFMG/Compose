ALTER TABLE aluno
ADD COLUMN senha VARCHAR(60) AFTER email,
ADD COLUMN google_places_json VARCHAR(10000) AFTER senha,
ADD COLUMN cadastro_atualizado TINYINT(1) AFTER id_aluno,
ADD COLUMN recuperar_senha_token VARCHAR(255) AFTER cadastro_atualizado
