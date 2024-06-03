-----------------------------------------------------COMMIT

CREATE TABLE CAMPEAO(
	ID NUMBER NOT NULL PRIMARY KEY,
	NOME VARCHAR2(50) NOT NULL UNIQUE
);

CREATE SEQUENCE SEQ_CAMPEAO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE BUILD(
	ID NUMBER NOT NULL PRIMARY KEY,
--	ID_CAMPEAO NUMBER NOT NULL,
	NOME VARCHAR2(100) NOT NULL
--	CONSTRAINT FK_BUILD_CAMPEAO FOREIGN KEY (ID_CAMPEAO) REFERENCES CAMPEAO(ID)
);

CREATE SEQUENCE SEQ_BUILD
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE REL_CAMPEAO_BUILD(
	ID NUMBER NOT NULL PRIMARY KEY,
	ID_CAMPEAO NUMBER NOT NULL,
	ID_BUILD NUMBER NOT NULL,
	CONSTRAINT FK_REL_CAMP_BUILD_CAMPEAO FOREIGN KEY (ID_CAMPEAO) REFERENCES CAMPEAO(ID),
	CONSTRAINT FK_REL_CAMP_BUILD_BUILD FOREIGN KEY (ID_BUILD) REFERENCES BUILD(ID)
);

CREATE SEQUENCE SEQ_REL_CAMPEAO_BUILD
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;


CREATE TABLE MATCHUP(
	ID NUMBER NOT NULL PRIMARY KEY,
	ID_CAMPEAO_ESCOLHIDO NUMBER NOT NULL,
	ID_CAMPEAO_INIMIGO NUMBER NOT NULL,
	ID_BUILD NUMBER NOT NULL,
	LANE VARCHAR2(3) NOT NULL,
	VITORIA CHAR(1) NOT NULL,
	CONSTRAINT FK_MATCHUP_CAMPEAO_ESCOLHIDO FOREIGN KEY (ID_CAMPEAO_ESCOLHIDO) REFERENCES CAMPEAO(ID),
	CONSTRAINT FK_MATCHUP_CAMPEAO_INIMIGO FOREIGN KEY (ID_CAMPEAO_INIMIGO) REFERENCES CAMPEAO(ID),
	CONSTRAINT FK_MATCHUP_BUILD FOREIGN KEY (ID_BUILD) REFERENCES BUILD(ID)
);

CREATE SEQUENCE SEQ_MATCHUP
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE ELO(
	ID NUMBER NOT NULL PRIMARY KEY,
	NOME VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE SEQ_ELO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE DIVISAO(
	ID NUMBER NOT NULL PRIMARY KEY,
	NUMERO VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE SEQ_DIVISAO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE REL_ELO_DIVISAO(
	ID NUMBER NOT NULL PRIMARY KEY,
	ID_ELO NUMBER NOT NULL,
	ID_DIVISAO NUMBER NULL,
	CONSTRAINT FK_REL_ELO_DIV_ELO FOREIGN KEY (ID_ELO) REFERENCES ELO(ID),
	CONSTRAINT FK_REL_ELO_DIV_DIV FOREIGN KEY (ID_DIVISAO) REFERENCES DIVISAO(ID)
);

CREATE SEQUENCE SEQ_REL_ELO_DIVISAO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE USUARIO(
    ID NUMBER NOT NULL PRIMARY KEY,
    NOME VARCHAR2(50) NOT NULL,
    NOME_INVOCADOR VARCHAR2(50) NOT NULL UNIQUE,
    PDL NUMBER(3,0) NOT NULL,
    ID_REL_ELO_DIVISAO NUMBER NOT NULL,
    CONSTRAINT FK_USUARIO_ELO_DIVISAO FOREIGN KEY (ID_REL_ELO_DIVISAO) REFERENCES REL_ELO_DIVISAO(ID)
);

CREATE SEQUENCE SEQ_USUARIO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;


CREATE TABLE PARTIDA_RANQUEADA(
	ID NUMBER NOT NULL PRIMARY KEY,
	DATA TIMESTAMP NOT NULL,
	VITORIA CHAR(1) NOT NULL,
	PDL NUMBER(2) NOT NULL,
	ID_MATCHUP NUMBER NOT NULL,
	ID_USUARIO NUMBER NOT NULL,
	CONSTRAINT FK_PARTIDA_RANQUEADA_MATCHUP FOREIGN KEY (ID_MATCHUP) REFERENCES MATCHUP(ID),
	CONSTRAINT FK_PARTIDA_RANQUEADA_USUARIO FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO(ID)
);

CREATE SEQUENCE SEQ_PARTIDA_RANQUEADA
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

CREATE TABLE LOG_ELO(
	ID NUMBER NOT NULL PRIMARY KEY,
	DATA_ALTERACAO TIMESTAMP NOT NULL,
	ELO_DIVISAO VARCHAR2(20) NOT NULL
);

CREATE SEQUENCE SEQ_LOG_ELO
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
MINVALUE 1
MAXVALUE 99999999;

-------------------------------------------------------------------------------------------
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'KLED');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'URGOT');
INSERT INTO LOL.CAMPEAO(ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'DARIUS');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'GAREN');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'MORDEKAISER');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'CAMILLE');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'JAX');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'FIORA');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'TEEMO');
INSERT INTO LOL.CAMPEAO (ID, NOME) VALUES(SEQ_CAMPEAO.NEXTVAL, 'SETT');

INSERT INTO LOL.BUILD (ID, NOME) VALUES(SEQ_BUILD.NEXTVAL, 'BUILD NÃO INFORMADA');
INSERT INTO LOL.BUILD (ID, NOME) VALUES(SEQ_BUILD.NEXTVAL, 'LETALIDADE/CRITICO');
INSERT INTO LOL.BUILD (ID, NOME) VALUES(SEQ_BUILD.NEXTVAL, 'LUTADOR');

INSERT INTO LOL.REL_CAMPEAO_BUILD (ID, ID_CAMPEAO, ID_BUILD) VALUES(SEQ_REL_CAMPEAO_BUILD.NEXTVAL, 1, 1);
INSERT INTO LOL.REL_CAMPEAO_BUILD (ID, ID_CAMPEAO, ID_BUILD) VALUES(SEQ_REL_CAMPEAO_BUILD.NEXTVAL, 1, 2);

INSERT INTO LOL.MATCHUP (ID, ID_CAMPEAO_ESCOLHIDO, ID_CAMPEAO_INIMIGO, ID_BUILD, LANE, VITORIA) VALUES(SEQ_MATCHUP.NEXTVAL, 1, 2, 2, 'TOP', 'S');
INSERT INTO LOL.MATCHUP (ID, ID_CAMPEAO_ESCOLHIDO, ID_CAMPEAO_INIMIGO, ID_BUILD, LANE, VITORIA) VALUES(SEQ_MATCHUP.NEXTVAL, 1, 3, 3, 'TOP', 'S');

INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'FERRO');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'BRONZE');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'PRATA');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'OURO');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'PLATINA');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'ESMERALDA');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'DIAMANTE');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'MESTRE');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'GRÃO-MESTRE');
INSERT INTO LOL.ELO (ID, NOME) VALUES(SEQ_ELO.NEXTVAL, 'DESAFIANTE');

INSERT INTO LOL.DIVISAO (ID, NUMERO) VALUES(SEQ_DIVISAO.NEXTVAL, 'I');
INSERT INTO LOL.DIVISAO (ID, NUMERO) VALUES(SEQ_DIVISAO.NEXTVAL, 'II');
INSERT INTO LOL.DIVISAO (ID, NUMERO) VALUES(SEQ_DIVISAO.NEXTVAL, 'III');
INSERT INTO LOL.DIVISAO (ID, NUMERO) VALUES(SEQ_DIVISAO.NEXTVAL, 'IV');

-- FERRO
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 1, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 1, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 1, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 1, 1);

-- BRONZE
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 2, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 2, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 2, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 2, 1);

-- PRATA
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 3, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 3, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 3, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 3, 1);

-- OURO
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 4, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 4, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 4, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 4, 1);

-- PLATINA
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 5, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 5, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 5, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 5, 1);

-- ESMERALDA
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 6, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 6, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 6, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 6, 1);

-- DIAMANTE
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 7, 4);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 7, 3);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 7, 2);
INSERT INTO LOL.REL_ELO_DIVISAO (ID, ID_ELO, ID_DIVISAO) VALUES(SEQ_REL_ELO_DIVISAO.NEXTVAL, 7, 1);

INSERT INTO USUARIO VALUES (SEQ_USUARIO.NEXTVAL, 'KEVEN ALLAN', 'SKYCRAZZY#SKY', 87, 
	(SELECT RED.ID 
	FROM REL_ELO_DIVISAO RED 
	INNER JOIN ELO E
		ON E.ID = RED.ID_ELO 
	INNER JOIN DIVISAO D
		ON D.ID = RED.ID_DIVISAO 
	WHERE
		E.NOME = 'PRATA'
		AND D.NUMERO = 'II'));
	
INSERT INTO USUARIO VALUES (SEQ_USUARIO.NEXTVAL, 'BRUNA LUIZA', 'IMBRUH#BR2', 24,
	(SELECT RED.ID 
	FROM REL_ELO_DIVISAO RED 
	INNER JOIN ELO E
		ON E.ID = RED.ID_ELO 
	INNER JOIN DIVISAO D
		ON D.ID = RED.ID_DIVISAO 
	WHERE
		E.NOME = 'PRATA'
		AND D.NUMERO = 'IV'));

INSERT INTO LOL.PARTIDA_RANQUEADA
(ID, "DATA", VITORIA, PDL, ID_MATCHUP, ID_USUARIO)
VALUES(SEQ_PARTIDA_RANQUEADA.NEXTVAL, SYSTIMESTAMP, 'S', 26, 1, 1);

INSERT INTO LOL.PARTIDA_RANQUEADA
(ID, "DATA", VITORIA, PDL, ID_MATCHUP, ID_USUARIO)
VALUES(SEQ_PARTIDA_RANQUEADA.NEXTVAL, SYSTIMESTAMP, 'N', 21, 1, 1);

INSERT INTO LOL.PARTIDA_RANQUEADA
(ID, "DATA", VITORIA, PDL, ID_MATCHUP, ID_USUARIO)
VALUES(SEQ_PARTIDA_RANQUEADA.NEXTVAL, SYSTIMESTAMP, 'S', 27, 2, 1);

----------------------------------------------ROLLBACK-----------------------------------------------------
DROP TABLE PARTIDA_RANQUEADA;
DROP SEQUENCE SEQ_PARTIDA_RANQUEADA;
DROP TABLE USUARIO;
DROP SEQUENCE SEQ_USUARIO;
DROP TABLE LOG_ELO;
DROP SEQUENCE SEQ_LOG_ELO;
DROP TABLE REL_ELO_DIVISAO;
DROP SEQUENCE SEQ_REL_ELO_DIVISAO;
DROP TABLE ELO;
DROP SEQUENCE SEQ_ELO;
DROP TABLE DIVISAO;
DROP SEQUENCE SEQ_DIVISAO;
DROP TABLE MATCHUP;
DROP SEQUENCE SEQ_MATCHUP;
DROP TABLE REL_CAMPEAO_BUILD;
DROP SEQUENCE SEQ_REL_CAMPEAO_BUILD;
DROP TABLE BUILD;
DROP SEQUENCE SEQ_BUILD;
DROP TABLE CAMPEAO;
DROP SEQUENCE SEQ_CAMPEAO;
 ---------------------------------------------------------------------------------------------------------

SELECT * 
FROM REL_CAMPEAO_BUILD RCB
INNER JOIN CAMPEAO C
	ON C.ID = RCB.ID_CAMPEAO 
INNER JOIN BUILD B
	ON B.ID = RCB.ID_BUILD 
INNER JOIN MATCHUP M
	ON M.ID_BUILD = B.ID
INNER JOIN PARTIDA_RANQUEADA R
	ON R.ID_MATCHUP = M.ID
;

SELECT RED.ID 
FROM REL_ELO_DIVISAO RED 
INNER JOIN ELO E
	ON E.ID = RED.ID_ELO 
INNER JOIN DIVISAO D
	ON D.ID = RED.ID_DIVISAO 
WHERE
	E.NOME = 'PRATA'
	AND D.NUMERO = 'II';
--------------------------------------------------------------CONSULTAS---------------------------------------------------------

--TUDO
SELECT 
    U.NOME_INVOCADOR AS NOME_INVOCADOR,
    (E.NOME || ' ' || D.NUMERO) AS ELO,
    u.PDL,
    R.DATA AS PARTIDA_RANQUEADA_DATA,
    CASE
	    WHEN R.VITORIA = 'S' THEN
	    	'VITORIA'
	    ELSE 
	    	'DERROTA'
	END AS RESULTADO_PARTIDA_RANQUEADA,
    FN_FORMATAR_EXIBICAO_PDL(R.VITORIA, R.PDL) AS PARTIDA_RANQUEADA_PDL,
    M.LANE AS MATCHUP_LANE,
    CASE 
	    WHEN M.VITORIA = 'S' THEN 
    	'VITORIA'
    	ELSE
    		'DERROTA'
    END AS RESULTADO_MATCHUP,
    CE.NOME AS CAMPEAO_ESCOLHIDO_NOME,
    CI.NOME AS CAMPEAO_INIMIGO_NOME,
    B.NOME AS BUILD_NOME
FROM USUARIO U
INNER JOIN PARTIDA_RANQUEADA R 
	ON U.ID = R.ID_USUARIO
INNER JOIN MATCHUP M 
	ON R.ID_MATCHUP = M.ID
INNER JOIN CAMPEAO CE 
	ON M.ID_CAMPEAO_ESCOLHIDO = CE.ID
INNER JOIN CAMPEAO CI 
	ON M.ID_CAMPEAO_INIMIGO = CI.ID
INNER JOIN BUILD B 
	ON M.ID_BUILD = B.ID
INNER JOIN REL_ELO_DIVISAO RED
	ON U.ID_REL_ELO_DIVISAO = RED.ID 
INNER JOIN ELO E
	ON RED.ID_ELO = E.ID 
INNER JOIN DIVISAO D
	ON RED.ID_DIVISAO = D.ID 
LEFT JOIN REL_CAMPEAO_BUILD RCB 
	ON CE.ID = RCB.ID_CAMPEAO 
	AND B.ID = RCB.ID_BUILD
;

--HISTORICO DE PARTIDAS
SELECT 
    U.NOME_INVOCADOR AS NOME_INVOCADOR,
--    (E.NOME || ' ' || D.NUMERO) AS ELO,
--    u.PDL,
    R.DATA AS PARTIDA_RANQUEADA_DATA,
    CASE
	    WHEN R.VITORIA = 'S' THEN
	    	'VITORIA'
	    ELSE 
	    	'DERROTA'
	END AS RESULTADO_PARTIDA_RANQUEADA,
    FN_FORMATAR_EXIBICAO_PDL(R.VITORIA, R.PDL) AS PARTIDA_RANQUEADA_PDL,
    M.LANE AS MATCHUP_LANE,
    CASE 
	    WHEN M.VITORIA = 'S' THEN 
    	'VITORIA'
    	ELSE
    		'DERROTA'
    END AS RESULTADO_MATCHUP,
    CE.NOME AS CAMPEAO_ESCOLHIDO_NOME,
    CI.NOME AS CAMPEAO_INIMIGO_NOME,
    B.NOME AS BUILD_NOME
FROM USUARIO U
INNER JOIN PARTIDA_RANQUEADA R 
	ON U.ID = R.ID_USUARIO
INNER JOIN MATCHUP M 
	ON R.ID_MATCHUP = M.ID
INNER JOIN CAMPEAO CE 
	ON M.ID_CAMPEAO_ESCOLHIDO = CE.ID
INNER JOIN CAMPEAO CI 
	ON M.ID_CAMPEAO_INIMIGO = CI.ID
INNER JOIN BUILD B 
	ON M.ID_BUILD = B.ID
INNER JOIN REL_ELO_DIVISAO RED
	ON U.ID_REL_ELO_DIVISAO = RED.ID 
INNER JOIN ELO E
	ON RED.ID_ELO = E.ID 
INNER JOIN DIVISAO D
	ON RED.ID_DIVISAO = D.ID 
LEFT JOIN REL_CAMPEAO_BUILD RCB 
	ON CE.ID = RCB.ID_CAMPEAO 
	AND B.ID = RCB.ID_BUILD
;


--PERFIL
SELECT * FROM USUARIO U
WHERE U.NOME = 'KEVEN ALLAN';

--ELO's
SELECT (E.NOME || ' ' || D.NUMERO) AS ELO FROM REL_ELO_DIVISAO RED
INNER JOIN ELO E
	ON RED.ID_ELO = E.ID 
INNER JOIN DIVISAO D
	ON RED.ID_DIVISAO = D.ID 
;

--MATCHUP
SELECT CE.NOME, CI.NOME, B.NOME FROM MATCHUP M
INNER JOIN CAMPEAO CE
	ON CE.ID = M.ID_CAMPEAO_ESCOLHIDO
INNER JOIN CAMPEAO CI
	ON CI.ID = M.ID_CAMPEAO_INIMIGO
INNER JOIN BUILD B
	ON B.ID = M.ID_BUILD
;
---------------------------------------------------------EXCEPTION---------------------------------------------------------
RAISE_APPLICATION_ERROR(-20001, 'MSG DE ERRO');


---------------------------------------------------------VIEW---------------------------------------------------------
CREATE OR REPLACE VIEW VIEW_PLAYER AS
SELECT U.NOME AS "USUARIO", U.NOME_INVOCADOR AS "NOME DE INVOCADOR", E.NOME AS "ELO", D.NUMERO AS "DIVISÃO", U.PDL AS "PDL'S"
FROM USUARIO U
INNER JOIN REL_ELO_DIVISAO RED 
	ON RED.ID = U.ID_REL_ELO_DIVISAO
INNER JOIN ELO E
	ON E.ID = RED.ID_ELO
INNER JOIN DIVISAO D
	ON D.ID = RED.ID_DIVISAO
;

SELECT * FROM VIEW_PLAYER vp;

---------------------------------------------------------FUNCTION---------------------------------------------------------
CREATE OR REPLACE FUNCTION FN_FORMATAR_EXIBICAO_PDL_PARTIDA(pVitoria IN PARTIDA_RANQUEADA.VITORIA%TYPE, pPdl IN PARTIDA_RANQUEADA.PDL%TYPE)
RETURN VARCHAR2
IS vPdlFormatado VARCHAR2(3);
BEGIN
	IF pVitoria = 'S' THEN
		vPdlFormatado := '+' || pPdl;
	ELSE
		vPdlFormatado := '-' || pPdl;
	END IF;
	RETURN vPdlFormatado;
EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('ERRO AO FORMATAR OS PDLs');
END;

SELECT FN_FORMATAR_EXIBICAO_PDL_PARTIDA('S',99) FROM DUAL;


CREATE OR REPLACE FUNCTION FN_RECALCULAR_ELO_PDL(
	pPdlAtual IN USUARIO.PDL%TYPE,
	pPdlPartida IN PARTIDA_RANQUEADA.PDL%TYPE,
	pStsVitoria IN PARTIDA_RANQUEADA.VITORIA%TYPE,
	oIdElo IN OUT USUARIO.ID_REL_ELO_DIVISAO%TYPE 
	) RETURN NUMBER 
IS 
	rPdlAtualizado NUMBER(3);
BEGIN
	IF pStsVitoria = 'S' THEN
		rPdlAtualizado := pPdlAtual + pPdlPartida;
	ELSE
		rPdlAtualizado := pPdlAtual - pPdlPartida;
	END IF;
	IF rPdlAtualizado > 100 THEN
		rPdlAtualizado := rPdlAtualizado - 100;
		oIdElo := oIdElo + 1;
	ELSIF rPdlAtualizado < 0 THEN
		rPdlAtualizado := rPdlAtualizado + 100;
	 	oIdElo := oIdElo - 1;
	END IF;
	RETURN rPdlAtualizado;
END;
/

DECLARE
	oIdElo USUARIO.ID_REL_ELO_DIVISAO%TYPE := 11;
BEGIN
	DBMS_OUTPUT.PUT_LINE(oIdElo);
	DBMS_OUTPUT.PUT_LINE(FN_RECALCULAR_ELO_PDL(80, 22, 'S',oIdElo));
	DBMS_OUTPUT.PUT_LINE('ELO' || oIdElo);
END;
	


---------------------------------------------------------PROCEDURE---------------------------------------------------------
--
DECLARE
	--PARTIDA_RANQUEADA
	pNomeInvocador USUARIO.NOME_INVOCADOR%TYPE := 'SKYCRAZZY#SKY';
	pVitoriaPartida PARTIDA_RANQUEADA.VITORIA%TYPE := 'S';
	pPdlPartida PARTIDA_RANQUEADA.PDL%TYPE := 80;
	pCampeaoEscolhido CAMPEAO.NOME%TYPE := 'KLED';
	pCampeaoInimigo CAMPEAO.NOME%TYPE := 'MORDEKAISER';
	pNomeBuild BUILD.NOME%TYPE := 'LUTADOR';
	pLane MATCHUP.LANE%TYPE := 'TOP';
	pVitoriaLane MATCHUP.VITORIA%TYPE := 'S';
	--OUT
	oIdMatchup MATCHUP.ID%TYPE;
BEGIN
--	PROC_CADASTRAR_MATCHUP(pCampeaoEscolhido, pCampeaoInimigo, pCampeaoInimigo, pLane, pVitoriaLane, oIdMatchup);
	PROC_CADASTRAR_PARTIDA_RANQUEADA(pNomeInvocador, pVitoriaPartida, pPdlPartida, pCampeaoEscolhido, pCampeaoInimigo, pNomeBuild, pLane, pVitoriaLane);
END;


CREATE OR REPLACE PROCEDURE PROC_CADASTRAR_MATCHUP(
	pNomeCampeaoEscolhido IN CAMPEAO.NOME%TYPE,
	pNomeCampeaoInimigo IN CAMPEAO.NOME%TYPE,
	pNomeBuild IN BUILD.NOME%TYPE,
	pLane IN MATCHUP.LANE%TYPE,
	pVitoriaLane IN MATCHUP.VITORIA%TYPE,
	opIdMatchup OUT MATCHUP.ID%TYPE) 
IS
	vIdSemBuild CONSTANT BUILD.ID%TYPE := 1;
	vIdBuild BUILD.ID%TYPE;
BEGIN
	IF pNomeBuild IS NULL THEN 
		vIdBuild :=1;
	ELSE
		SELECT COALESCE(MAX(B.ID), vIdSemBuild) INTO vIdBuild FROM BUILD B WHERE B.NOME = pNomeBuild;
	END IF;
	INSERT INTO LOL.MATCHUP (ID, ID_CAMPEAO_ESCOLHIDO, ID_CAMPEAO_INIMIGO, ID_BUILD, LANE, VITORIA) VALUES(SEQ_MATCHUP.NEXTVAL, 
	(SELECT C.ID FROM CAMPEAO C
	WHERE C.NOME = pNomeCampeaoEscolhido),
	(SELECT C.ID FROM CAMPEAO C
	WHERE C.NOME = pNomeCampeaoInimigo),
	vIdBuild, pLane, pVitoriaLane)
	RETURNING ID INTO opIdMatchup;
END;


--PROC PARA CADASTRO DE PARTIDA_RANQUEADA
CREATE OR REPLACE PROCEDURE PROC_CADASTRAR_PARTIDA_RANQUEADA(
	pNomeInvocador IN USUARIO.NOME_INVOCADOR%TYPE,
	pVitoriaPartida IN PARTIDA_RANQUEADA.VITORIA%TYPE,
	pPdlPartida IN PARTIDA_RANQUEADA.PDL%TYPE,
	pCampeaoEscolhido IN CAMPEAO.NOME%TYPE,
	pCampeaoInimigo IN CAMPEAO.NOME%TYPE,
	pNomeBuild IN BUILD.NOME%TYPE,
	pLane IN MATCHUP.LANE%TYPE,
	pVitoriaLane IN MATCHUP.VITORIA%TYPE
	)
IS
	vIdMatchup MATCHUP.ID%TYPE;
BEGIN 
	PROC_CADASTRAR_MATCHUP(pCampeaoEscolhido, pCampeaoInimigo, pNomeBuild, pLane, pVitoriaLane, vIdMatchup);
	INSERT INTO LOL.PARTIDA_RANQUEADA (ID, "DATA", VITORIA, PDL, ID_MATCHUP, ID_USUARIO)
	VALUES(SEQ_PARTIDA_RANQUEADA.NEXTVAL, SYSTIMESTAMP, pVitoriaPartida, pPdlPartida, vIdMatchup, (SELECT U.ID FROM USUARIO U WHERE U.NOME_INVOCADOR = pNomeInvocador));
END;


---------------------------------------------------------TRIGGER---------------------------------------------------------
CREATE OR REPLACE TRIGGER TRG_LOG_ELO
AFTER UPDATE ON USUARIO
FOR EACH ROW
BEGIN 
	IF :OLD.ID_REL_ELO_DIVISAO != :NEW.ID_REL_ELO_DIVISAO THEN
		INSERT INTO LOL.LOG_ELO (ID, DATA_ALTERACAO, ELO_DIVISAO) VALUES(SEQ_LOG_ELO.NEXTVAL, SYSTIMESTAMP,
		(SELECT (E.NOME || ' ' || D.NUMERO) AS ELO
		FROM  REL_ELO_DIVISAO RED
		INNER JOIN ELO E
			ON RED.ID_ELO  = E.ID
		INNER JOIN DIVISAO D
			ON RED.ID_DIVISAO = D.ID
		WHERE RED.ID = :NEW.ID_REL_ELO_DIVISAO));
	END IF;
END;


--CRIAR TRIGGER PARA QUANDO INSERIR UMA NOVA PARTIDA, RECALCULAR OS PDL'S E O ELO DO USUARIO
CREATE OR REPLACE TRIGGER TRG_CALCULAR_PDL_ELO
AFTER INSERT ON PARTIDA_RANQUEADA
FOR EACH ROW 
DECLARE
	vUsuario USUARIO%ROWTYPE;
	oIdElo USUARIO.ID_REL_ELO_DIVISAO%TYPE;
	vPdlAtualizado USUARIO.PDL%TYPE; 
BEGIN 
	SELECT * INTO vUsuario FROM USUARIO U WHERE U.ID = :NEW.ID_USUARIO;
	oIdElo := vUsuario.ID_REL_ELO_DIVISAO;
	DBMS_OUTPUT.PUT_LINE('id elo: ' || oIdElo);
	vPdlAtualizado := FN_RECALCULAR_ELO_PDL(vUsuario.pdl, :NEW.PDL, :NEW.VITORIA, oIdElo);
	DBMS_OUTPUT.PUT_LINE('id elo: ' || oIdElo);
	UPDATE USUARIO SET 
		PDL = vPdlAtualizado,
		ID_REL_ELO_DIVISAO = oIdElo
	WHERE ID = vUsuario.ID;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Usuário não encontrado para o ID: ' || :NEW.ID_USUARIO);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular PDL e Elo: ' || SQLERRM);
END;














