# Use Node.js 18 Alpine para imagem mais leve
FROM node:18-alpine

# Instalar FFmpeg e outras dependências do sistema
RUN apk add --no-cache \
    ffmpeg \
    ffprobe \
    python3 \
    make \
    g++ \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    musl-dev \
    giflib-dev \
    pixman-dev \
    pangomm-dev \
    libjpeg-turbo-dev \
    freetype-dev

# Criar diretório da aplicação
WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production && npm cache clean --force

# Copiar código da aplicação
COPY . .

# Criar diretórios necessários
RUN mkdir -p /app/temp /app/hls /home/ftp/videos /home/Shinobi/videos

# Criar usuário não-root para segurança
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nextjs -u 1001

# Alterar permissões dos diretórios
RUN chown -R nextjs:nodejs /app /home/ftp/videos /home/Shinobi/videos

# Mudar para usuário não-root
USER nextjs

# Expor porta
EXPOSE 3010

# Comando de saúde
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node -e "require('http').get('http://localhost:3010/health', (res) => { process.exit(res.statusCode === 200 ? 0 : 1) }).on('error', () => process.exit(1))"

# Comando para iniciar a aplicação
CMD ["npm", "start"]