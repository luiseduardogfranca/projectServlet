insert into adm (first_name, last_name, email, born, `password`, description) values ('Luís', 'Eduardo', 'luiseduardogfranca@gmail.com', '1998/11/23', '23111998', 'Amante da vida');
select * from adm;

insert into article (title, description, number_image, date_create, id_adm) values ('Utilizando Socket', 'É isso ae brow', 1, '2017-04-17',1);
insert into section (title, content, id_article) values ('Introdução', 'Neste capítulo, você vai conhecer a API de Sockets do java pelo pacote java.net.
Mais útil que conhecer a API, é você perceber que estamos usando, aqui, todos os conceitos e bibliotecas aprendidas durante os outros capítulos. Repare, também, que é relativamente simples aprender a utilizar uma API, agora que temos todos os conceitos necessários para tal.
Lembre-se de fazer esse apêndice com o javadoc aberto ao seu lado.', 1);
insert into section (title, content, id_article) values ('Desenvolvimento', 'Neste capítulo, você vai conhecer a API de Sockets do java pelo pacote java.net.
Mais útil que conhecer a API, é você perceber que estamos usando, aqui, todos os conceitos e bibliotecas aprendidas durante os outros capítulos. Repare, também, que é relativamente simples aprender a utilizar uma API, agora que temos todos os conceitos necessários para tal.
Lembre-se de fazer esse apêndice com o javadoc aberto ao seu lado.', 1);
insert into section (title, content, id_article) values ('Uma solução para o sistema de chat cliente-servidor com múltiplos clientes proposto nos desafios acima. Repare que a solução não está nem um pouco elegante: o main já faz tudo, além de não tratarmos as exceptions. O código visa apenas mostrar o uso de uma API. É uma péssima prática colocar toda a funcionalidade do seu programa no main e também de jogar exceções para trás.
Nesta listagem, faltam os devidos imports.Primeiro, as duas classes para o cliente. Repare que a única mudança grande é a classe nova, Recebedor:', 1);

-- insert into article (title, description, number_image, date_create, id_adm) values ('Utilizando bluetooth em Arduino', 'Vamos utilizar essa parada', 2, '2017-01-19',1);
-- 
-- 
-- insert into article (title, description, number_image, date_create, id_adm) values ('Apredendo sobre JDBC', 'Bora aprender pow', 1, '2017-02-20', 1);
-- 

select * from article;


