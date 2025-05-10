# Usar imagem base do .NET SDK para o build
FROM mcr.microsoft.com/dotnet/nightly/sdk:9.0 AS build-env

WORKDIR /app

# Copiar o projeto e restaurar dependências
COPY ./src/*.csproj ./
RUN dotnet restore

# Copiar o restante dos arquivos da aplicação
COPY ./src/. ./

# Publicar o projeto para produção
RUN dotnet publish -c Release -o out

# Definir o diretório de trabalho
WORKDIR /app/out

# Configurar o comando de inicialização da aplicação .NET
ENTRYPOINT ["dotnet", "CalculadoraDiaria.dll"]

