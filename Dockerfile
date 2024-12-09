# Use uma imagem base mínima e estável
FROM alpine:latest

# Defina o diretório de trabalho
WORKDIR /app

# Copie todos os arquivos do diretório atual para o container
COPY . .

# Exponha uma porta (opcional, dependendo da aplicação)
EXPOSE 8080

# Comando padrão para executar ao iniciar o container
CMD ["echo", "Container simples criado com sucesso!"]
