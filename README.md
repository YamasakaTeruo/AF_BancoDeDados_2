# AF_BancoDeDados_2
## Sistema de Gerenciamento de Pedidos
Objetivo: Criar um sistema de gerenciamento de pedidos em um banco de dados utilizando stored procedures, triggers, views e JOINs no MySQL Workbench.

### Etapa 1: Criação de Tabelas e Inserção de Dados

Crie as tabelas "Clientes" e "Pedidos" com campos apropriados. Insira dados de exemplo nas tabelas para simular clientes e pedidos. 
Certifique-se de incluir uma chave primária em cada tabela.

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/095def0f-f502-4d8d-90d7-907964bcc30c)

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/1ebdafc1-b979-4e5a-b48f-1916755e29a1)

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/a5b7d5d0-a38f-4272-b513-cfc620b8824e)



### Etapa 2: Criação de Stored Procedure

Crie uma stored procedure chamada "InserirPedido" que permite inserir um novo pedido na tabela "Pedidos" com as informações apropriadas. 
A stored procedure deve receber parâmetros como o ID do cliente e os detalhes do pedido. Ao término teste o funcionamento da stored procedure criada inserindo um pedido.

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/454fb256-280d-47d7-b911-1a1b66449b31)

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/b68c6869-65ef-473f-a454-4a64f2b02dac)



### Etapa 3: Trigger

Crie uma trigger que seja acionada APÓS a inserção de um novo pedido na tabela "Pedidos". 
A trigger deve calcular o valor total dos pedidos para o cliente correspondente e
atualizar um campo "TotalPedidos" na tabela "Clientes" com o valor total. Teste a Trigger inserindo um novo pedido na tabela "Pedidos“.

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/7e53cd02-0390-42e6-a8c5-0f193c2648d9)

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/a0b2aa9b-26ad-4f8f-b656-9c8596f85e1a)



### Etapa 4: View

Crie uma view chamada "PedidosClientes" que combina informações das tabelas "Clientes" e "Pedidos" usando JOIN para mostrar os detalhes dos pedidos e os nomes dos clientes.

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/a0aa24ef-c94c-44aa-ab91-c1ce22eb04d7)
![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/1841fc2b-bce9-4b2f-9b0d-a150eae259de)


### Etapa 5: Consulta com JOIN

Escreva uma consulta SQL que utiliza JOIN para listar os detalhes dos pedidos de cada cliente, incluindo o nome do cliente e o valor total de seus pedidos.
Utilize a view "PedidosClientes" para essa consulta.

![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/fff6b623-4b21-4104-a735-49f9b79b1bb2)
![image](https://github.com/YamasakaTeruo/AF_BancoDeDados_2/assets/144747935/d0fb3e14-cc19-4bcc-9388-67ec8f25f660)


