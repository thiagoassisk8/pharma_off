
--Estabelecimento 
INSERT INTO public.tb_estabelecimento( nme_estabelecimento, rating_estabelecimento, "endereço_estabelecimento", img_estabelecimento, sts_estabelecimento)
	VALUES ('Pacheco',6,'Rua das farmácias','pacheco.png', true);

--Estabelecimento Parceiro
INSERT INTO public.tb_estabelecimentoparceiro(id_estabelecimentoparceiro, isparceiro)
	VALUES (1, true);

--PRODUTOS
INSERT INTO public.ta_produto(nme_produto, preco_produto, desc_produto, img_produto, isfavourite, ispopular, cod_categoria, cod_estabelecimento, onsale)
	VALUES ( 'Paracetamol 750mg',5.99 , 'O paracetamol reduz a febre atuando no centro regulador da temperatura no Sistema Nervoso Central (SNC) e diminui a sensibilidade para a dor. Seu efeito tem início 15 a 30 minutos após a administração oral e permanece por um período de 4 a 6 horas.', 'paracetamol.png', true,true, 3, 1,true);
INSERT INTO public.ta_produto(nme_produto, preco_produto, desc_produto, img_produto, isfavourite, ispopular, cod_categoria, cod_estabelecimento, onsale)
	VALUES ( 'Colgate Sensitive Pro-alivio', 15.25, 'O Creme Dental Colgate Sensitive Pro alivio Imediato Origina,l sua fórmula funciona vedando os canais que levam ao centro do dente, bloqueando a sensibilidade. Fórmula clinicamente comprovada e desenvolvida com o poder da tecnologia da Arginina para uma ação imediata e eficaz contra o desconforto causado pela sensibilidade nos dentes.', 'paracetamol.png', true,true, 3, 1,true);

INSERT INTO public.ta_produto(nme_produto, preco_produto, desc_produto, img_produto, isfavourite, ispopular, cod_categoria, cod_estabelecimento, onsale)
	VALUES ( 'Creme Facial Nivea Nutritivo 100G', 28.87, 'O Creme Facial Nutritivo Nivea possui fórmula ultra leve com Tecnologia Hydro-Waxes à base de água e karité. Proporciona hidratação intensa por até 24 horas sem deixar sensação oleosa e ainda prepara a pele para a maquiagem, para uma pele bonita e com aspecto saudável.', 'creme.png', true,true, 2, 2,false);


--Lista Desejo Produto
INSERT INTO public.ta_listadesejos_produtos( cod_listadesejos, cod_produto, qtd_produto)
	VALUES ( 1, 2, 1);