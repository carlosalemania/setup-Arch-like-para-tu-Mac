# 🎬 Hollywood Tools - Referencia Rápida

## 📦 Instalación

```bash
# Instalar TODAS las herramientas
./hollywood-install-tools.sh

# O instalar manualmente las básicas
brew install cmatrix htop nmap bmon jq speedtest-cli
```

---

## 🎯 Scripts Disponibles

| Script | Descripción | Ventanas |
|--------|-------------|----------|
| `./hollywood-mac.sh` | Versión básica original | 5-6 |
| `./hollywood-pro.sh` | Versión mejorada con auto-install | 10 |
| `./hollywood-ultimate.sh` | **RECOMENDADO** - Máxima potencia | 6-20+ |
| `./hollywood-stop.sh` | Detener todos los procesos | - |

---

## 🛠️ Herramientas por Categoría

### 🎨 EFECTOS VISUALES

```bash
cmatrix -b -C green        # Efecto Matrix verde clásico
cmatrix -b -C cyan         # Efecto Matrix cian
pipes.sh                   # Pipes animadas screensaver
asciiquarium               # Acuario ASCII animado

# Diversión
fortune | cowsay           # Vaca con frase aleatoria
fortune | cowsay | lolcat  # Lo mismo pero con arcoíris
figlet "HOLLYWOOD"         # Texto ASCII grande
sl                         # Tren animado (typo de 'ls')
```

**Atajos cmatrix:**
- `Ctrl+C` - Salir
- `b` - Bold characters
- `1-9` - Velocidad

---

### 📊 MONITOREO DE SISTEMA

#### HTOP - Monitor de procesos clásico
```bash
htop
```

**Atajos htop:**
- `F1` - Ayuda
- `F6` - Ordenar por (CPU, memoria, etc)
- `F9` - Matar proceso
- `F10` - Salir
- `/` - Buscar
- `Space` - Marcar proceso
- `u` - Filtrar por usuario
- `t` - Vista de árbol
- `k` - Enviar señal

#### BTOP - Monitor visual moderno
```bash
btop
```

**Atajos btop:**
- `Esc` / `q` - Salir
- `m` - Menú
- `+/-` - Escalar gráficos
- `h/j/k/l` - Navegación vim
- `f` - Filtrar procesos

#### GLANCES - Monitor todo-en-uno
```bash
glances                    # Modo normal
glances -t 2               # Actualizar cada 2 segundos
glances --disable-process  # Sin lista de procesos
```

**Atajos glances:**
- `q` - Salir
- `h` - Ayuda
- `a` - Auto-sort
- `c` - CPU
- `m` - Memoria
- `n` - Red
- `d` - Disco
- `f` - Sistema de archivos
- `s` - Sensores
- `1` - CPU por core
- `z` - Reiniciar stats

#### BOTTOM (btm) - Sistema en Rust
```bash
btm                        # Básico
btm --battery              # Con batería
btm -b                     # Modo básico (menos recursos)
```

#### PROCS - Reemplazo moderno de 'ps'
```bash
procs                      # Todos los procesos
procs firefox              # Buscar proceso
procs --sortd cpu          # Ordenar por CPU descendente
procs --tree               # Vista de árbol
procs --watch 1            # Actualizar cada segundo
```

---

### 🌐 MONITOREO DE RED

#### BMON - Monitor de ancho de banda
```bash
bmon                       # Monitor básico
bmon -p eth0               # Interface específica
```

**Atajos bmon:**
- `d` - Cambiar display
- `g` - Cambiar gráfico
- `q` - Salir

#### IFTOP - Tráfico de red en tiempo real
```bash
sudo iftop                 # Interface por defecto
sudo iftop -i en0          # Interface específica (WiFi en Mac)
sudo iftop -n              # Sin resolver nombres
sudo iftop -P              # Mostrar puertos
```

**Atajos iftop:**
- `h` - Ayuda
- `n` - Resolver nombres on/off
- `s` - Mostrar/ocultar origen
- `d` - Mostrar/ocultar destino
- `t` - Cambiar display
- `p` - Mostrar/ocultar puertos
- `P` - Pausar
- `q` - Salir

#### NETHOGS - Uso de red por proceso
```bash
sudo nethogs               # Todas las interfaces
sudo nethogs en0           # Interface específica
sudo nethogs -d 2          # Actualizar cada 2 segundos
```

**Atajos nethogs:**
- `m` - Cambiar unidades (KB/s, KB, B, MB)
- `r` - Ordenar por recibido
- `s` - Ordenar por enviado
- `q` - Salir

#### BANDWHICH - Monitor avanzado de red
```bash
sudo bandwhich             # Básico
sudo bandwhich -i en0      # Interface específica
```

**Atajos bandwhich:**
- `Tab` - Cambiar vista
- `Space` - Pausar
- `q` - Salir

#### GPING - Ping con gráfico
```bash
gping google.com                           # Un host
gping google.com 1.1.1.1 8.8.8.8          # Múltiples hosts
gping google.com --simple-graphics         # Gráficos simples
```

#### NMAP - Escáner de red y puertos
```bash
# Escaneo básico
nmap 192.168.1.1

# Escaneo rápido de red local
nmap -sn 192.168.1.0/24

# Escaneo de puertos comunes
nmap -F 192.168.1.1

# Escaneo completo con OS detection
sudo nmap -A 192.168.1.1

# Escaneo específico de puertos
nmap -p 80,443,22 192.168.1.1
```

#### SPEEDTEST-CLI - Test de velocidad
```bash
speedtest-cli              # Test básico
speedtest-cli --simple     # Output simple
speedtest-cli --list       # Listar servers
speedtest-cli --server 123 # Usar server específico
```

---

### 💾 DISCO Y ALMACENAMIENTO

#### DUF - Visualizador de uso de disco
```bash
duf                        # Vista general
duf --only local           # Solo discos locales
duf -hide-fs tmpfs,devtmpfs # Ocultar tipos
```

#### DUST - Analizador de uso (du moderno)
```bash
dust                       # Directorio actual
dust ~                     # Home directory
dust -d 1                  # Profundidad 1
dust -n 20                 # Top 20 archivos
dust -r                    # Reverso (más grande último)
```

#### NCDU - Analizador interactivo
```bash
ncdu                       # Directorio actual
ncdu ~                     # Home directory
ncdu /                     # Todo el sistema
```

**Atajos ncdu:**
- `Enter` - Entrar a directorio
- `Arrow Up/Down` - Navegar
- `d` - Eliminar archivo/directorio
- `g` - Mostrar porcentajes
- `n` - Ordenar por nombre
- `s` - Ordenar por tamaño
- `q` - Salir

---

### 📝 LOGS Y DEBUGGING

#### LNAV - Visor de logs avanzado
```bash
lnav                                    # Logs del sistema
lnav /var/log/system.log                # Archivo específico
lnav /var/log/*.log                     # Múltiples archivos
```

**Atajos lnav:**
- `?` - Ayuda
- `/` - Buscar
- `n` / `N` - Siguiente/anterior
- `e` / `E` - Error siguiente/anterior
- `w` / `W` - Warning siguiente/anterior
- `:filter-in <pattern>` - Filtrar
- `:filter-out <pattern>` - Excluir
- `q` - Salir

#### BAT - Cat con syntax highlighting
```bash
bat archivo.js             # Ver archivo
bat -n archivo.py          # Con números de línea
bat -A archivo.txt         # Mostrar caracteres no imprimibles
bat -d archivo.sh          # Solo diff (sin pager)
```

#### LOG STREAM - Logs macOS en tiempo real
```bash
# Todos los logs
log stream

# Logs con niveles específicos
log stream --level debug

# Filtrar por predicado
log stream --predicate 'eventMessage contains "error"'

# Estilo específico
log stream --style syslog --color always

# Por proceso
log stream --process Safari

# JSON para procesamiento
log stream --style json | jq
```

---

### 🐳 DOCKER

#### LAZYDOCKER - Terminal UI para Docker
```bash
lazydocker
```

**Atajos lazydocker:**
- `x` - Ver menú
- `Enter` - Ver detalles
- `]` - Siguiente tab
- `[` - Tab anterior
- `d` - Eliminar container/image
- `e` - Exec en container
- `s` - Stop/Start container
- `r` - Restart container
- `l` - Ver logs
- `q` - Salir

#### CTOP - Container top
```bash
ctop                       # Todos los containers
ctop -a                    # Incluir stopped
ctop -i 5                  # Actualizar cada 5 segundos
```

**Atajos ctop:**
- `a` - Toggle mostrar todos
- `s` - Ordenar
- `f` - Filtrar
- `Enter` - Ver menú container
- `h` - Ayuda
- `q` - Salir

---

### 🌳 GIT

#### LAZYGIT - Terminal UI simple para Git
```bash
lazygit
```

**Atajos lazygit:**
- `?` - Ayuda
- `Space` - Stage/unstage
- `a` - Stage todos
- `c` - Commit
- `P` - Push
- `p` - Pull
- `x` - Ver menú
- `Enter` - Ver detalles
- `q` - Salir

#### TIG - Interfaz texto para Git
```bash
tig                        # Vista principal
tig log                    # Ver log
tig status                 # Ver status
tig blame archivo          # Git blame
```

**Atajos tig:**
- `Enter` - Ver detalles
- `j/k` - Arriba/abajo
- `J/K` - Siguiente/anterior
- `m` - Vista main
- `d` - Diff
- `l` - Log
- `s` - Status
- `h` - Ayuda
- `q` - Salir

---

### 🛠️ UTILIDADES JSON Y DATOS

#### JQ - Procesador JSON
```bash
# Pretty print
echo '{"name":"john","age":30}' | jq

# Extraer campo
echo '{"name":"john","age":30}' | jq '.name'

# Filtrar array
echo '[{"age":25},{"age":30}]' | jq '.[] | select(.age > 26)'

# Procesar archivo
cat data.json | jq '.items[] | .name'

# Colorear
cat data.json | jq -C
```

#### FX - Visor JSON interactivo
```bash
fx data.json               # Abrir archivo
echo '{"a":1}' | fx        # Desde pipe
```

**Atajos fx:**
- `?` - Ayuda
- `g/G` - Inicio/fin
- `j/k` - Arriba/abajo
- `/` - Buscar
- `.` - Empezar query
- `q` - Salir

---

### 🌡️ TEMPERATURA Y HARDWARE

#### OSX-CPU-TEMP - Temperatura del CPU
```bash
osx-cpu-temp               # Temperatura actual
osx-cpu-temp -c            # Solo Celsius
osx-cpu-temp -f            # Fahrenheit
```

#### SYSCTL - Info del sistema
```bash
# CPU info
sysctl -a | grep cpu

# Memoria
sysctl -a | grep mem

# Hardware
sysctl -a | grep hw

# Temperatura
sysctl -a | grep temperature
```

#### MEMORY_PRESSURE - Presión de memoria
```bash
memory_pressure            # Ver presión actual
```

#### VM_STAT - Estadísticas de memoria virtual
```bash
vm_stat                    # Snapshot
vm_stat 2                  # Cada 2 segundos
```

---

### 🔧 OTRAS UTILIDADES

#### TOKEI - Contador de líneas de código
```bash
tokei                      # Directorio actual
tokei ~/proyectos          # Directorio específico
tokei --sort lines         # Ordenar por líneas
```

#### HYPERFINE - Benchmarking de comandos
```bash
hyperfine 'comando1' 'comando2'
hyperfine --warmup 3 'my-command'
```

#### M-CLI - Utilidades macOS
```bash
m help                     # Ver comandos
m battery                  # Estado batería
m network                  # Info de red
m volume                   # Control volumen
m sleep                    # Dormir Mac
```

---

## 🎬 Ejecutar Hollywood Mode

```bash
# Instalar herramientas primero
./hollywood-install-tools.sh

# Luego ejecutar el modo que prefieras
./hollywood-ultimate.sh    # RECOMENDADO - Con menú interactivo
./hollywood-pro.sh         # Automático con 10 ventanas
./hollywood-mac.sh         # Básico con 5-6 ventanas

# Detener
./hollywood-stop.sh
```

---

## 💡 Tips y Combinaciones

### Combinar herramientas con pipes

```bash
# Logs con errores coloreados
log stream | grep --color=always -E "error|fail|ERROR"

# Ver procesos que usan más CPU
procs --sortd cpu | head -n 10

# Monitor de red con filtro
sudo nethogs | grep -v "0.0"

# Análisis de disco con filtro
dust | grep -v ".git"

# JSON pretty con color
cat data.json | jq -C | less -R
```

### Crear aliases útiles

```bash
# Agregar a ~/.zshrc o ~/.bashrc
alias hollywood="~/hollywood-ultimate.sh"
alias hw-stop="~/hollywood-stop.sh"
alias sys="btop"
alias net="bmon"
alias disk="duf"
alias temp="osx-cpu-temp"
```

### Organizar ventanas con yabai

```bash
# Después de lanzar Hollywood
yabai -m space --layout bsp    # Binary Space Partition
yabai -m space --layout stack  # Stack
yabai -m space --layout float  # Float
```

---

## 🚨 Troubleshooting

### Herramienta no encontrada
```bash
brew install nombre-herramienta
```

### Permisos necesarios (iftop, nethogs, etc)
```bash
sudo comando
```

### Alto uso de CPU
- Cierra ventanas que no necesites
- Aumenta intervalos de actualización
- Usa versión básica en lugar de ultimate

### Homebrew no instalado
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

---

## 📚 Recursos

- [Homebrew](https://brew.sh)
- [BTOP GitHub](https://github.com/aristocratos/btop)
- [Glances Docs](https://nicolargo.github.io/glances/)
- [Yabai WM](https://github.com/koekeishiya/yabai)

---

**¡Disfruta de tu experiencia Hollywood!** 🎬🎭✨
