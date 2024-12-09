# Usar uma imagem base simples
FROM alpine:latest

# Diretório de trabalho
WORKDIR /app

# Copiar arquivos do projeto para o container
COPY . /app

# Comando padrão para iniciar o container (apenas para testes simples)
CMD ["echo", "Container executado com sucesso!"]
