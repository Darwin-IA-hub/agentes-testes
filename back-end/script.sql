CREATE TABLE Planos (
    frequenciaSemanaPlanos NUMERIC DEFAULT 0 NOT NULL,
    valorMensalPlanos NUMERIC DEFAULT 0 NOT NULL,
    valorTrimestralPlanos NUMERIC DEFAULT 0 NOT NULL,
    valorSemestralPlanos NUMERIC DEFAULT 0 NOT NULL,
    idPlanos SERIAL PRIMARY KEY,
    fk_Modalidades_idModalidades INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE Professores (
    idProfessores SERIAL PRIMARY KEY,
    nomeProfessores TEXT  DEFAULT '' NOT NULL,
    fk_Modalidades_idModalidades INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE Modalidades (
    nomeEsporteModalidades TEXT  DEFAULT '' NOT NULL,
    descricaoModalidades TEXT  DEFAULT '' NOT NULL,
    idModalidades SERIAL PRIMARY KEY
);

CREATE TABLE Quadras (
    nomeQuadras TEXT  DEFAULT '' NOT NULL,
    descricaoQuadras TEXT  DEFAULT '' NOT NULL,
    idQuadras SERIAL PRIMARY KEY
);

CREATE TABLE Turmas (
    nivelTecnicoTurmas TEXT  DEFAULT '' NOT NULL,
    tipoGeneroTurmas TEXT  DEFAULT '' NOT NULL,
    horarioTurmas TEXT  DEFAULT '' NOT NULL,
    tamanhoTurmas TEXT  DEFAULT '' NOT NULL,
    diaSemanaTurmas TEXT  DEFAULT '' NOT NULL,
    idTurmas SERIAL PRIMARY KEY,
    fk_Professores_idProfessores INTEGER DEFAULT 0 NOT NULL,
    fk_Quadras_idQuadras INTEGER DEFAULT 0 NOT NULL
);

CREATE TABLE Cliente (
    telefoneCliente TEXT PRIMARY KEY,
    nomeCliente TEXT  DEFAULT '' NOT NULL,
    datanascimentoCliente DATE DEFAULT CURRENT_DATE NOT NULL,
    generoCliente TEXT  DEFAULT '' NOT NULL,
    nivelTecnicoCliente TEXT  DEFAULT '' NOT NULL,
    interesseCliente TEXT  DEFAULT '' NOT NULL,
    disponibilidadeCliente TEXT  DEFAULT '' NOT NULL
);

CREATE TABLE Clientes_Turmas (
    fk_Turmas_idTurmas INTEGER DEFAULT 0 NOT NULL,
    fk_Cliente_telefoneCliente TEXT DEFAULT '' NOT NULL
);

CREATE TABLE Modalidade_Quadra (
    fk_Modalidades_idModalidades INTEGER DEFAULT 0 NOT NULL,
    fk_Quadras_idQuadras INTEGER DEFAULT 0 NOT NULL
);
 
ALTER TABLE Planos ADD CONSTRAINT FK_Planos_2
    FOREIGN KEY (fk_Modalidades_idModalidades)
    REFERENCES Modalidades (idModalidades)
    ON DELETE RESTRICT;
 
ALTER TABLE Professores ADD CONSTRAINT FK_Professores_2
    FOREIGN KEY (fk_Modalidades_idModalidades)
    REFERENCES Modalidades (idModalidades)
    ON DELETE RESTRICT;
 
ALTER TABLE Turmas ADD CONSTRAINT FK_Turmas_2
    FOREIGN KEY (fk_Professores_idProfessores)
    REFERENCES Professores (idProfessores)
    ON DELETE CASCADE;
 
ALTER TABLE Turmas ADD CONSTRAINT FK_Turmas_3
    FOREIGN KEY (fk_Quadras_idQuadras)
    REFERENCES Quadras (idQuadras)
    ON DELETE CASCADE;
 
ALTER TABLE Clientes_Turmas ADD CONSTRAINT FK_Clientes_Turmas_1
    FOREIGN KEY (fk_Turmas_idTurmas)
    REFERENCES Turmas (idTurmas)
    ON DELETE SET NULL;
 
ALTER TABLE Clientes_Turmas ADD CONSTRAINT FK_Clientes_Turmas_2
    FOREIGN KEY (fk_Cliente_telefoneCliente)
    REFERENCES Cliente (telefoneCliente)
    ON DELETE SET NULL;
 
ALTER TABLE Modalidade_Quadra ADD CONSTRAINT FK_Modalidade_Quadra_1
    FOREIGN KEY (fk_Modalidades_idModalidades)
    REFERENCES Modalidades (idModalidades)
    ON DELETE RESTRICT;
 
ALTER TABLE Modalidade_Quadra ADD CONSTRAINT FK_Modalidade_Quadra_2
    FOREIGN KEY (fk_Quadras_idQuadras)
    REFERENCES Quadras (idQuadras)
    ON DELETE SET NULL;


SELECT * FROM cliente;
SELECT * FROM clientes_turmas;
SELECT * FROM clientesbloqueados;
SELECT * FROM contatos;
SELECT * FROM conversas;
SELECT * FROM mensagens;
SELECT * FROM modalidade_quadra;
SELECT * FROM modalidades;
SELECT * FROM planos;
SELECT * FROM professores;
SELECT * FROM quadras;
SELECT * FROM turmas;