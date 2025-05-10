# Calculadora Diária

Este projeto consiste em uma aplicação desenvolvida em C# com .NET e SQL Server para realizar cálculos diários e mensais. A aplicação é containerizada usando Docker para facilitar a distribuição e o gerenciamento.

## Funcionalidades

* **Execução Contínua:** Mantém-se em execução para realização de cálculos programados.
* **Conexão com Banco de Dados:** Integração com SQL Server para armazenamento de dados.
* **Arquitetura Modular:** Separado em contêineres independentes para aplicação e banco de dados.
* **Cálculos Automatizados:** Rotinas diárias e mensais que serão implementadas futuramente.

## Requisitos

* .NET SDK 9.0
* Docker e Docker Compose
* SQL Server (imagem de contêiner utilizada: `mcr.microsoft.com/mssql/server:2022-latest`)

## Estrutura do Projeto

```plaintext
.
├── src/
│   ├── Program.cs
│   ├── CalculadoraDiaria.csproj
├── Dockerfile
├── docker-compose.yml
└── README.md
```

## Configuração do Ambiente

### 1. Clonar o Repositório

```bash
git clone https://github.com/viictorocha/calculadoradiaria.git
cd calculadora-diaria
```

### 2. Configurar o Docker

Certifique-se de ter o Docker e o Docker Compose instalados. Para configurar os contêineres:

#### Dockerfile (Aplicação C#)

```dockerfile
FROM mcr.microsoft.com/dotnet/nightly/sdk:9.0 AS build-env
WORKDIR /app

COPY ./src/*.csproj ./
RUN dotnet restore

COPY ./src/. ./
RUN dotnet publish -c Release -o out

WORKDIR /app/out
ENTRYPOINT ["dotnet", "CalculadoraDiaria.dll"]
```

#### docker-compose.yml (Orquestração de Contêineres)

```yaml
version: "3.9"
services:
  app:
    build: .
    ports:
      - "5000:80"
    depends_on:
      - db
  db:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      SA_PASSWORD: "your_password"
      ACCEPT_EULA: "Y"
    ports:
      - "1433:1433"
```

### 3. Construir e Rodar os Contêineres

```bash
docker-compose up --build
```

A aplicação estará acessível em `http://localhost:5000`.

### 4. Verificar os Logs

Para verificar a saída dos contêineres:

```bash
docker logs -f <container_id>
```

## Roadmap

* [x] Configuração inicial da aplicação
* [x] Containerização com Docker
* [ ] Implementação dos cálculos diários
* [ ] Implementação dos cálculos mensais
* [ ] Criação de APIs para consumo de dados
* [ ] Documentação detalhada das rotinas de cálculo

## Contribuição

Contribuições são bem-vindas! Por favor, abra uma issue ou envie um pull request com melhorias ou correções.

## Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo LICENSE para mais informações.
