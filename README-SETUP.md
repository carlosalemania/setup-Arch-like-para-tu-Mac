# 🚀 Transformación Completa de macOS

## 📖 Descripción

Este repositorio contiene todo lo necesario para transformar tu Mac en un entorno tipo **Arch Linux + Hyprland (2025)** con herramientas profesionales para **flujos de trabajo en ventas**.

## 📦 Contenido

### Archivos principales:

1. **`install-full-setup.sh`** - Script maestro de instalación automática
2. **`arch-macos-setup-2025.md`** - Guía completa del entorno Arch-like
3. **`sales-workflow-cli-guide.md`** - Comandos CLI para ventas

## ⚡ Instalación Rápida

### Opción 1: Instalación automática (Recomendado)

```bash
# Ejecutar el script de instalación
./install-full-setup.sh
```

El script instalará automáticamente:
- ✅ yabai + skhd (Window Manager tipo Hyprland)
- ✅ Kitty terminal con tema Catppuccin
- ✅ Zsh con Oh My Zsh y plugins
- ✅ Starship prompt
- ✅ CLI tools esenciales (ripgrep, fd, fzf, bat, eza, etc.)
- ✅ Herramientas de ventas (csvkit, duckdb, miller, etc.)
- ✅ Scripts personalizados para productividad

### Opción 2: Instalación manual

Lee las guías paso a paso:
1. Primero: `arch-macos-setup-2025.md`
2. Luego: `sales-workflow-cli-guide.md`

## 🔧 Configuración Inicial

### 1. Después de la instalación

```bash
# Recargar configuración de shell
source ~/.zshrc

# O reinicia tu terminal
```

### 2. ⚠️ IMPORTANTE: Deshabilitar SIP para yabai

Para que yabai funcione al 100%, necesitas deshabilitar System Integrity Protection:

1. Reinicia en **Recovery Mode** (mantén presionado **Cmd+R** al arrancar)
2. Abre **Terminal** desde Utilidades
3. Ejecuta:
   ```bash
   csrutil disable
   ```
4. Reinicia normalmente
5. Ejecuta en terminal:
   ```bash
   sudo yabai --load-sa
   ```

### 3. Iniciar servicios manualmente (si es necesario)

```bash
# Iniciar yabai
yabai --start-service

# Iniciar skhd
skhd --start-service

# Verificar estado
brew services list | grep -E 'yabai|skhd'
```

## 🎮 Atajos de Teclado

### Navegación de ventanas (estilo Vim)
- **Alt + h/j/k/l** - Mover foco entre ventanas
- **Shift + Alt + h/j/k/l** - Mover ventana
- **Ctrl + Alt + h/j/k/l** - Redimensionar ventana

### Workspaces
- **Alt + 1/2/3/4/5** - Cambiar a workspace
- **Shift + Alt + 1/2/3/4/5** - Mover ventana a workspace

### Acciones de ventana
- **Alt + f** - Fullscreen/zoom
- **Alt + t** - Toggle floating
- **Alt + r** - Rotar árbol de ventanas
- **Shift + Alt + 0** - Balancear ventanas

### Aplicaciones
- **Cmd + Return** - Abrir Kitty terminal

## 🛠️ Scripts Personalizados

Después de la instalación, tendrás estos scripts en `~/bin`:

### `lead-score`
Califica leads automáticamente:
```bash
lead-score "email@company.com" "Company Name" "Technology" 250
# Output: Lead Score: 75 - 🔥 HOT
```

### `meeting-notes`
Crea notas de reunión estructuradas:
```bash
meeting-notes "Acme Corp"
# Abre editor con template de notas
```

## 📊 Herramientas de Ventas CLI

### CRM desde terminal

```bash
# Salesforce
sf data query --query "SELECT Name, Amount FROM Opportunity"

# HubSpot
hs deals list --limit 10
```

### Análisis de datos

```bash
# CSV analysis
csvstat ventas.csv
mlr --csv stats1 -a sum,mean -f Revenue ventas.csv

# SQL en CSV
duckdb -c "SELECT * FROM 'ventas.csv' WHERE Amount > 10000"

# JSON processing
cat deals.json | jq '[.[] | select(.stage == "Won")]'
```

### Automatización de email

```bash
# Enviar email con adjunto
echo "Mensaje" | mutt -s "Asunto" -a propuesta.pdf -- cliente@empresa.com
```

## 🎨 Personalización

### Cambiar tema de kitty

```bash
# Ver temas disponibles
ls ~/.config/kitty/themes/

# Editar configuración
nvim ~/.config/kitty/kitty.conf
```

### Modificar atajos de yabai/skhd

```bash
# Editar atajos
nvim ~/.skhdrc

# Recargar configuración
skhd --reload

# Editar comportamiento de ventanas
nvim ~/.yabairc
yabai --restart-service
```

### Personalizar prompt de Starship

```bash
nvim ~/.config/starship.toml
```

## 📚 Aliases útiles instalados

### Arch-style package management
```bash
pacman-S <package>      # brew install
pacman-R <package>      # brew uninstall  
pacman-Syu             # brew update && brew upgrade
pacman-Ss <term>       # brew search
pacman-Qi <package>    # brew info
```

### Modern CLI replacements
```bash
ls → eza --icons
cat → bat
find → fd
grep → rg
top → btop
cd → z (zoxide - cd inteligente)
```

### Git shortcuts
```bash
gs    # git status
ga    # git add
gc    # git commit
gp    # git push
gl    # git pull
gd    # git diff
lg    # lazygit (TUI)
```

## 🔄 Mantenimiento

### Actualizar todo el sistema

```bash
# Actualizar paquetes (estilo Arch)
pacman-Syu

# O el comando completo
brew update && brew upgrade && brew cleanup
```

### Limpiar caché

```bash
brew cleanup -s
rm -rf "$(brew --cache)"
```

### Verificar salud del sistema

```bash
brew doctor
```

### Backup de configuraciones

```bash
# Respaldar dotfiles importantes
cp ~/.yabairc ~/dotfiles-backup/
cp ~/.skhdrc ~/dotfiles-backup/
cp ~/.zshrc ~/dotfiles-backup/
cp ~/.config/kitty/kitty.conf ~/dotfiles-backup/
cp ~/.config/starship.toml ~/dotfiles-backup/
```

## 🐛 Troubleshooting

### yabai no inicia

```bash
# Verificar permisos
yabai --check-sa

# Ver logs
tail -f /tmp/yabai_*.log

# Reiniciar servicio
yabai --restart-service
```

### skhd no responde

```bash
# Ver logs
tail -f /tmp/skhd_*.log

# Reiniciar
skhd --restart-service

# Verificar sintaxis
skhd --check
```

### Terminal no muestra íconos

```bash
# Instalar Nerd Font
brew install --cask font-jetbrains-mono-nerd-font

# Configurar en preferencias de terminal
# Font: JetBrainsMono Nerd Font
```

### Zsh plugins no funcionan

```bash
# Recargar configuración
source ~/.zshrc

# Verificar instalación de plugins
ls ~/.oh-my-zsh/custom/plugins/
```

## 📖 Recursos Adicionales

### Documentación oficial
- [yabai Wiki](https://github.com/koekeishiya/yabai/wiki)
- [skhd Repo](https://github.com/koekeishiya/skhd)
- [Kitty Docs](https://sw.kovidgoyal.net/kitty/)
- [Starship Config](https://starship.rs/config/)

### Inspiración
- [r/unixporn](https://reddit.com/r/unixporn) - Screenshots de setups
- [dotfiles.github.io](https://dotfiles.github.io/) - Colección de dotfiles

### Comunidad
- [yabai Discussions](https://github.com/koekeishiya/yabai/discussions)
- [Homebrew Discourse](https://discourse.brew.sh/)

## 🎯 Próximos Pasos

1. ✅ Ejecutar `install-full-setup.sh`
2. ✅ Deshabilitar SIP
3. ✅ Reiniciar terminal
4. 📖 Leer guías completas
5. 🎨 Personalizar a tu gusto
6. 🚀 Disfrutar tu nuevo entorno

## 💡 Tips Pro

### Flujo de trabajo eficiente

1. **Usa workspaces**: Separa proyectos en diferentes espacios
2. **Master CLI**: Todo lo que hagas con UI, intenta hacerlo en CLI
3. **Automatiza**: Crea scripts para tareas repetitivas
4. **Dotfiles en Git**: Versiona tus configuraciones

### Ejemplo de workflow diario

```bash
# Morning routine
pacman-Syu                    # Actualizar sistema
task project:sales list       # Ver tareas del día
calcurse -d 1                 # Ver agenda

# Durante el día
lead-score ...                # Calificar leads
meeting-notes "Client"        # Notas de reunión
sf data query "..."           # Consultar CRM

# End of day
git add . && gc -m "EOD"      # Commit trabajo
```

## 🤝 Contribuir

Si mejoras algún script o configuración, considera:
1. Crear un fork
2. Hacer tus cambios
3. Compartir con la comunidad

## 📄 Licencia

Este setup es libre para usar, modificar y distribuir.

---

**¡Disfruta tu nuevo entorno de trabajo tipo Arch Linux en macOS! 🎉**

*Última actualización: 2025-11-02*
