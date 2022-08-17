INSERT INTO public.resultado(
  id_veiculo, total_viagens_realizadas, 
  total_km_percorrido, total_tempo_movimento, 
  total_tempo_parado, mes, ano
) 
SELECT 
	DISTINCT vehicle_id AS id_veiculo, 
	SUM(journey_size) AS total_viagens_realizadas,  
	SUM(total_distance) AS total_km_percorrido,		-- unidade de medida em quilometros
	SUM(total_moving) AS total_tempo_movimento,		-- unidade de medida em segundos
	SUM(total_idle) AS total_tempo_parado, 			-- unidade de medida em segundos
	07, 
	EXTRACT(
		YEAR 
		FROM NOW()
	)
FROM 
	trip
GROUP BY 
	id_veiculo 
ORDER BY 
	id_veiculo ASC;
