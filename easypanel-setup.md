# 🚀 Configuração EasyPanel - Replay Server

## 📋 Pré-requisitos

1. **Conta no EasyPanel** configurada
2. **Repositório GitHub** com o código
3. **Domínio configurado** (replay.replayzone.com.br)

## 🔧 Configuração Passo a Passo

### 1. Preparar o Repositório GitHub

```bash
# Adicionar todos os arquivos ao Git
git add .
git commit -m "feat: adicionar configuração Docker e EasyPanel"
git push origin main
```

### 2. Configurar no EasyPanel

#### 2.1 Criar Nova Aplicação
1. Acesse seu painel EasyPanel
2. Clique em **"New Service"**
3. Selecione **"App"**
4. Escolha **"From GitHub Repository"**

#### 2.2 Configurações do Repositório
- **Repository**: `seu-usuario/replay-server`
- **Branch**: `main`
- **Build Method**: `Dockerfile`
- **Dockerfile Path**: `./Dockerfile`

#### 2.3 Configurações da Aplicação
- **Service Name**: `replay-server`
- **Port**: `3010`
- **Domain**: `replay.replayzone.com.br`

#### 2.4 Variáveis de Ambiente
Adicione as seguintes variáveis de ambiente:

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

#### 2.5 Volumes Persistentes
Configure os seguintes volumes:

| Nome | Caminho no Container | Tamanho |
|------|---------------------|---------|
| shinobi-videos | `/app/data/shinobi` | 50GB |
| ftp-videos | `/app/data/ftp` | 50GB |
| temp-files | `/app/temp` | 10GB |
| hls-files | `/app/hls` | 20GB |

#### 2.6 Recursos
- **CPU**: 1000m (1 core)
- **Memory**: 2Gi (2GB)

### 3. Deploy Automático

#### 3.1 Configurar Webhook (Opcional)
1. No EasyPanel, vá em **Settings** da aplicação
2. Copie a **Webhook URL**
3. No GitHub, vá em **Settings** > **Webhooks**
4. Adicione a URL do webhook
5. Selecione eventos: `push` e `pull_request`

#### 3.2 Deploy Manual
```bash
# Fazer alterações no código
git add .
git commit -m "feat: nova funcionalidade"
git push origin main

# O EasyPanel fará o deploy automaticamente
```

## 🔍 Monitoramento

### Health Check
- **URL**: `https://replay.replayzone.com.br/health`
- **Intervalo**: 30s
- **Timeout**: 10s

### Logs
```bash
# Ver logs em tempo real no EasyPanel
# Ou via CLI se disponível
easypanel logs replay-server --follow
```

## 🛠️ Comandos Úteis

### Build Local
```bash
# Testar build localmente
docker build -t replay-server .
docker run -p 3010:3010 --env-file .env replay-server
```

### Debug
```bash
# Executar em modo desenvolvimento
docker-compose -f docker-compose.dev.yml up
```

## 🔒 Segurança

### Variáveis Sensíveis
- ✅ Tokens do Telegram configurados como variáveis de ambiente
- ✅ Credenciais do banco configuradas como variáveis de ambiente
- ✅ Usuário não-root no container
- ✅ Health checks configurados

### Backup
- Configure backup automático dos volumes no EasyPanel
- Especialmente importante para `shinobi-videos` e `ftp-videos`

## 🚨 Troubleshooting

### Container não inicia
1. Verifique logs no EasyPanel
2. Confirme variáveis de ambiente
3. Verifique se o banco está acessível

### Problemas de volume
1. Confirme permissões dos volumes
2. Verifique espaço em disco
3. Teste acesso aos diretórios

### Problemas de rede
1. Confirme configuração do domínio
2. Verifique firewall
3. Teste conectividade com banco

## 📞 Suporte

Para problemas específicos do EasyPanel, consulte:
- [Documentação EasyPanel](https://easypanel.io/docs)
- [Suporte EasyPanel](https://easypanel.io/support)