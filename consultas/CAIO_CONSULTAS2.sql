SELECT
    ins.ins_nome AS nome_instituicao,
    ROUND((SUM(CASE WHEN tip.tip_nome = 'BOLSA INTEGRAL' THEN 1 ELSE 0 END) / COUNT(bol.bol_id)) * 100, 2) AS porcentagem_bolsas_integral,
    ROUND((SUM(CASE WHEN tip.tip_nome = 'BOLSA PARCIAL 50%' THEN 1 ELSE 0 END) / COUNT(bol.bol_id)) * 100, 2) AS porcentagem_bolsas_parcial
FROM
    bolsas bol
INNER JOIN
    instituicoes_ensino ins ON bol.bol_ins_id = ins.ins_id
INNER JOIN
    tipos_bolsa tip ON bol.bol_tip_id = tip.tip_id
GROUP BY
    ins.ins_nome;
