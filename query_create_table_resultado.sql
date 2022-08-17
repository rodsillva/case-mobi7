CREATE TABLE public.resultado(
	id SERIAL NOT NULL,
	id_veiculo INT NULL,
	total_viagens_realizadas INT NULL,
	total_km_percorrido NUMERIC NULL,
	total_tempo_movimento INT NULL,
	total_tempo_parado INT NULL,
	mes INT NULL,
	ano INT NULL,
	CONSTRAINT resultado_pk PRIMARY KEY (id)
);
