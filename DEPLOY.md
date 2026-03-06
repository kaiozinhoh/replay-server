# 🚀 Deploy Rápido - Replay Server

## ⚡ Setup Rápido (5 minutos)

### 1. Preparar o Código
```bash
# Clone e configure
git clone https://github.com/seu-usuario/replay-server.git
cd replay-server
cp .env.example .env

# Edite o .env com suas configurações
# Commit e push
git add .
git commit -m "feat: configuração inicial"
git push origin main
```

### 2. EasyPanel - Configuração Automática

#### 2.1 Criar App no EasyPanel
1. **New Service** → **App** → **From GitHub**
2. **Repository**: `seu-usuario/replay-server`
3. **Branch**: `main`
4. **Build Method**: `Dockerfile`

#### 2.2 Configurações Essenciais
```yaml
# Porta
Port: 3010

# Domínio
Domain: replay.replayzone.com.br

# Recursos
CPU: 1000m
Memory: 2Gi
```

#### 2.3 Variáveis de Ambiente (Copie e Cole)
```env
NODE_ENV=production
PORT=3010
DB_HOST=db.replayzone.com.br
DB_USER=replayzone
DB_PASSWORD=Kaio@3005
DB_NAME=replayzone
DB_CONNECTION_LIMIT=10
TELEGRAM_ERROR_TOKEN=7952969691:AAEJsQhzLuX6o6yYbz9lwkCbHvj5VNFrBNU
TELEGRAM_SUCCESS_TOKEN=8043330772:AAF0Rdzx0mjXnpvaDo_yeCoiYu1N7EG5QXA
BASE_URL=https://replay.replayzone.com.br
SHINOBI_VIDEOS_PATH=/app/data/shinobi
FTP_VIDEOS_PATH=/app/data/ftp
TEMP_PATH=/app/temp
HLS_PATH=/app/hls
```

#### 2.4 Volumes (Configurar no EasyPanel)
| Nome | Caminho | Tamanho |
|------|---------|---------|
| `shinobi-videos` | `/app/data/shinobi` | 50GB |
| `ftp-videos` | `/app/data/ftp` | 50GB |
| `temp-files` | `/app/temp` | 10GB |
| `hls-files` | `/app/hls` | 20GB |

### 3. Deploy Automático

#### 3.1 GitHub Webhook (Opcional)
1. EasyPanel → App Settings → Webhook URL (copiar)
2. GitHub → Settings → Webhooks → Add webhook
3. Cole a URL e salve

#### 3.2 Deploy Manual
```bash
git add .
git commit -m "feat: nova funcionalidade"
git push origin main
# Deploy automático será executado
```

## ✅ Verificação

### 1. Teste de Funcionamento
```bash
# Health check
curl https://replay.replayzone.com.br/health

# Deve retornar:
{
  "status": "OK",
  "timestamp": "2026-03-06T...",
  "hlsDir": "/app/hls"
}
```

### 2. Teste de Live Stream
```bash
# URL de teste no VLC
https://replay.replayzone.com.br/live/9/index.m3u8
```

### 3. Logs
- EasyPanel → App → Logs
- Verificar se não há erros de conexão

## 🔧 Troubleshooting Rápido

### Container não inicia
```bash
# 1. Verificar variáveis de ambiente
# 2. Verificar se o banco está acessível
# 3. Verificar logs no EasyPanel
```

### Stream não funciona
```bash
# 1. Verificar se FFmpeg está instalado no container
# 2. Verificar conectividade com a fonte do stream
# 3. Verificar espaço em disco dos volumes
```

### Deploy não funciona
```bash
# 1. Verificar webhook do GitHub
# 2. Verificar se o Dockerfile está correto
# 3. Verificar logs do build no EasyPanel
```

## 📞 Suporte Rápido

### Links Úteis
- [EasyPanel Docs](https://easypanel.io/docs)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [GitHub Actions](https://docs.github.com/en/actions)

### Comandos Úteis
```bash
# Testar localmente
docker build -t replay-server .
docker run -p 3010:3010 --env-file .env replay-server

# Ver logs
docker logs container-name

# Debug container
docker exec -it container-name /bin/sh
```

---

**🎯 Tempo total de deploy: ~5 minutos**

**✨ Deploy automático configurado: Toda vez que você fizer push na branch main, o EasyPanel fará o deploy automaticamente!**