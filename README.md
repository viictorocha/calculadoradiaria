# **Calculadora Diária - Projeto de Estudos**

Este projeto tem como objetivo a criação de uma aplicação que realiza cálculos diários e mensais, utilizando **Docker** para o gerenciamento dos contêineres e **SQL Server** para o armazenamento de dados.

### **Estrutura do Projeto**
- **Aplicação C# (.NET)**: Responsável por realizar os cálculos.
- **SQL Server**: Banco de dados para armazenar as informações relacionadas aos cálculos.
- **Docker**: Para criar, gerenciar e isolar os contêineres de aplicação e banco de dados.

---

## **Pré-Requisitos**

- **Docker** instalado e em execução na sua máquina.
- **.NET SDK** para compilar a aplicação C#.

---

## **Passos para Rodar o Projeto**

### **1. Construir a Imagem da Aplicação**

Primeiro, é necessário construir a imagem Docker da aplicação **Calculadora Diária**:

docker build -t calculadora-diaria .
Isso criará a imagem com o nome calculadora-diaria.

### **2. Rodar o Contêiner da Aplicação**
Após a construção da imagem, você pode rodar a aplicação em um contêiner Docker. O contêiner será exposto na porta 5000:

docker run --name calculadora-diaria -d -p 5000:80 calculadora-diaria

Isso iniciará a aplicação C# em segundo plano (-d), vinculando a porta 5000 no seu computador à porta 80 do contêiner.

### **3. Rodar o Contêiner do SQL Server**
Agora, vamos rodar o contêiner do SQL Server. A senha do usuário sa é configurada com a variável de ambiente SA_PASSWORD:

docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=2025TesteDocker#" -p 1433:1433 --name sqlserver-db -d mcr.microsoft.com/mssql/server:2022-latest

Isso iniciará o contêiner SQL Server com a senha de administrador definida. O SQL Server estará disponível na porta 1433.

### 4. Conectar à Base de Dados
Para conectar a aplicação ao banco de dados SQL Server, utilize a seguinte string de conexão:

Server=localhost,1433;Database=master;User Id=sa;Password=2025TesteDocker#;

Lembre-se de substituir 2025TesteDocker# pela senha que você configurou no comando docker run do SQL Server.

### 5. Acessar a Aplicação
Depois de rodar ambos os contêineres, a aplicação estará acessível no navegador em http://localhost:5000.

Configuração do Banco de Dados

Banco de Dados no SQL Server

O contêiner do SQL Server é iniciado com a base de dados master.

Você pode criar outras bases de dados ou tabelas conforme necessário para os cálculos.

Notas Importantes
Segurança: Em um ambiente de produção, nunca compartilhe senhas simples em código ou configurações. Utilize métodos seguros para armazenar credenciais.

Este projeto é destinado para fins de estudo e pode ser utilizado para aprender sobre Docker, C# e SQL Server.
