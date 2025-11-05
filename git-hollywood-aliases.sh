#!/bin/bash
# git-hollywood-aliases.sh - Aliases de Git con efectos visuales para Hollywood Mode

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}"
cat << "EOF"
╔════════════════════════════════════════════════════════╗
║                                                        ║
║       🌿 GIT HOLLYWOOD ALIASES INSTALLER 🌿            ║
║                                                        ║
╚════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

# Detectar shell
SHELL_RC=""
if [ -n "$ZSH_VERSION" ]; then
    SHELL_RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_RC="$HOME/.bashrc"
else
    echo -e "${YELLOW}⚠️  Shell no detectado. Usando ~/.bashrc${NC}"
    SHELL_RC="$HOME/.bashrc"
fi

echo -e "${GREEN}✓ Shell detectado: $SHELL_RC${NC}"
echo ""

# Crear backup
cp "$SHELL_RC" "$SHELL_RC.backup-$(date +%Y%m%d-%H%M%S)"
echo -e "${GREEN}✓ Backup creado: $SHELL_RC.backup-$(date +%Y%m%d-%H%M%S)${NC}"
echo ""

# Añadir aliases
echo -e "${BLUE}📝 Añadiendo aliases de Git Hollywood...${NC}"
echo ""

cat >> "$SHELL_RC" << 'ALIASES'

# ═══════════════════════════════════════════════════════════
# 🎬 HOLLYWOOD MODE - GIT ALIASES
# ═══════════════════════════════════════════════════════════

# Git log básico con bat
alias glog='git log --graph --oneline --color=always | bat'
alias gloga='git log --graph --oneline --all --color=always | bat'

# Git log detallado
alias glogd='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(blue)%an%Creset %C(green)%ar%Creset - %s" --color=always | bat'
alias glogda='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(blue)%an%Creset %C(green)%ar%Creset - %s" --all --color=always | bat'

# Git log con stats
alias glogs='git log --graph --stat --color=always | bat'

# Git log últimos N commits
alias glog5='git log --graph --oneline -5 --color=always | bat'
alias glog10='git log --graph --oneline -10 --color=always | bat'
alias glog20='git log --graph --oneline -20 --color=always | bat'

# Git log con fechas
alias glogdate='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset %C(blue)%an%Creset - %s" --date=short --color=always | bat'

# Git log decorado (ultra fancy)
alias glogf='git log --graph --pretty=format:"%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --color=always | bat'
alias glogfa='git log --graph --pretty=format:"%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --all --color=always | bat'

# Git diff con bat
alias gdiff='git diff --color=always | bat'
alias gdiffs='git diff --staged --color=always | bat'

# Git show con bat
alias gshow='git show --color=always | bat'

# Git status con bat (opcional, solo el output)
alias gstatus='git status --short --branch | bat'

# Git log con grep
gloggrep() {
    git log --graph --oneline --all --color=always | grep -i "$1" | bat
}

# Git log por autor
glogauthor() {
    git log --graph --author="$1" --pretty=format:"%C(yellow)%h%Creset %C(green)%ar%Creset - %s" --color=always | bat
}

# Git log desde fecha
glogsince() {
    git log --graph --since="$1" --pretty=format:"%C(yellow)%h%Creset %C(cyan)%ad%Creset - %s" --date=short --color=always | bat
}

# Git log archivo específico
glogfile() {
    git log --graph --oneline --color=always -- "$1" | bat
}

# Git log con búsqueda en commits
glogsearch() {
    git log --graph --grep="$1" --pretty=format:"%C(yellow)%h%Creset %C(green)%ar%Creset - %s" --color=always | bat
}

# ═══════════════════════════════════════════════════════════
# 🎬 HOLLYWOOD MODE - GENERAL ALIASES
# ═══════════════════════════════════════════════════════════

# Hollywood Mode scripts
alias hollywood='~/hollywood-ultimate.sh'
alias hw-pro='~/hollywood-pro.sh'
alias hw-check='~/hollywood-check.sh'
alias hw-stop='~/hollywood-stop.sh'
alias hw-install='~/hollywood-install-tools.sh'

# System monitoring shortcuts
alias sys='btop'
alias sysmon='glances'
alias net='bmon'
alias disk='duf'
alias temp='osx-cpu-temp'
alias processes='procs --sortd cpu'

# Fun shortcuts
alias matrix='cmatrix -b -C green'
alias aquarium='asciiquarium'
alias pipes='pipes.sh'
alias train='sl'
alias quote='fortune | cowsay | lolcat'

# Enhanced commands
alias cat='bat'
alias ls='ls -G'
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ping='gping'

# Docker shortcuts (si usas Docker)
alias dps='docker ps'
alias dlogs='docker logs -f'
alias dexec='docker exec -it'
alias dstop='docker stop $(docker ps -q)'
alias dclean='docker system prune -af'
alias lzd='lazydocker'

# Git shortcuts adicionales
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gm='git merge'

# Network shortcuts
alias ports='sudo lsof -i -P | grep LISTEN'
alias myip='curl -s ifconfig.me'
alias speedtest='speedtest-cli'

ALIASES

echo -e "${GREEN}✓ Aliases añadidos correctamente${NC}"
echo ""

echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ INSTALACIÓN COMPLETADA${NC}"
echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"
echo ""

echo -e "${YELLOW}📝 ALIASES DE GIT + BAT INSTALADOS:${NC}"
echo ""
echo -e "${GREEN}Git Log Básico:${NC}"
echo "  glog           - Log gráfico simple con bat"
echo "  gloga          - Log gráfico de todas las ramas"
echo "  glog5/10/20    - Últimos 5/10/20 commits"
echo ""
echo -e "${GREEN}Git Log Avanzado:${NC}"
echo "  glogd          - Log detallado con autor y fecha"
echo "  glogf          - Log ultra fancy decorado"
echo "  glogfa         - Log fancy todas las ramas"
echo "  glogs          - Log con estadísticas"
echo ""
echo -e "${GREEN}Git Búsqueda:${NC}"
echo "  gloggrep <texto>    - Buscar en commits"
echo "  glogauthor <autor>  - Log por autor"
echo "  glogsince <fecha>   - Log desde fecha"
echo "  glogfile <archivo>  - Log de archivo específico"
echo ""
echo -e "${GREEN}Git Diff/Show:${NC}"
echo "  gdiff          - Diff con bat"
echo "  gdiffs         - Diff staged con bat"
echo "  gshow          - Show commit con bat"
echo ""
echo -e "${GREEN}Hollywood Mode:${NC}"
echo "  hollywood      - Lanzar Hollywood Ultimate"
echo "  hw-check       - Verificar instalación"
echo "  hw-stop        - Detener procesos"
echo ""
echo -e "${GREEN}Monitoreo:${NC}"
echo "  sys            - btop"
echo "  net            - bmon"
echo "  disk           - duf"
echo "  temp           - temperatura CPU"
echo ""
echo -e "${GREEN}Diversión:${NC}"
echo "  matrix         - Efecto Matrix"
echo "  quote          - Fortune cow con colores"
echo "  aquarium       - Acuario ASCII"
echo ""

echo -e "${YELLOW}💡 Para activar los aliases:${NC}"
echo "  source $SHELL_RC"
echo ""
echo -e "${YELLOW}O simplemente abre una nueva terminal${NC}"
echo ""

echo -e "${BLUE}🎬 Ejemplos de uso:${NC}"
echo ""
echo "  # Ver log gráfico"
echo "  glog"
echo ""
echo "  # Ver log fancy de todas las ramas"
echo "  glogfa"
echo ""
echo "  # Buscar commits con 'fix'"
echo "  gloggrep fix"
echo ""
echo "  # Ver commits de un autor"
echo "  glogauthor 'John Doe'"
echo ""
echo "  # Ver últimos 10 commits"
echo "  glog10"
echo ""

echo -e "${GREEN}🎭 ¡Disfruta de tus nuevos aliases de Git Hollywood!${NC}"
