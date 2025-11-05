# 🎬 Hollywood Mode - Guía de Inicio Rápido

## 📋 ¿Qué se ha creado?

### Scripts Ejecutables

| Script | Descripción | Uso |
|--------|-------------|-----|
| 🎯 **hollywood-ultimate.sh** | **RECOMENDADO** - Modo con menú interactivo (Básico/Avanzado/Ultimate/Custom) | `./hollywood-ultimate.sh` |
| 🎬 **hollywood-pro.sh** | Versión automática con 10 ventanas y auto-instalación | `./hollywood-pro.sh` |
| 📺 **hollywood-mac.sh** | Versión básica original (5-6 ventanas) | `./hollywood-mac.sh` |
| 📦 **hollywood-install-tools.sh** | Instalador completo de todas las herramientas | `./hollywood-install-tools.sh` |
| 🛑 **hollywood-stop.sh** | Detener todos los procesos Hollywood | `./hollywood-stop.sh` |
| ✅ **hollywood-check.sh** | Verificar qué herramientas están instaladas | `./hollywood-check.sh` |

### Documentación

| Archivo | Contenido |
|---------|-----------|
| 📖 **HOLLYWOOD-README.md** | Guía completa con instalación, uso y personalización |
| 📚 **HOLLYWOOD-TOOLS-REFERENCE.md** | Referencia detallada de todas las herramientas con atajos |
| 🚀 **HOLLYWOOD-QUICKSTART.md** | Esta guía de inicio rápido |

---

## 🚀 Inicio Rápido (3 pasos)

### Paso 1: Instalar Herramientas

```bash
# Instalar TODAS las herramientas de una vez
./hollywood-install-tools.sh
```

Este script instalará automáticamente:
- ⭐ **Esenciales**: cmatrix, htop
- ⚡ **Recomendadas**: btop, glances, bmon, nmap, duf, ncdu, lnav, jq
- 💎 **Opcionales**: Rust tools, Python tools, diversión (cowsay, figlet, etc)

**Tiempo estimado**: 5-10 minutos

### Paso 2: Verificar Instalación

```bash
# Ver qué está instalado
./hollywood-check.sh
```

Este comando mostrará:
- ✓ Herramientas instaladas (verde)
- ✗ Herramientas faltantes (rojo)
- % de completitud
- Scripts disponibles
- Próximos pasos

### Paso 3: Ejecutar Hollywood Mode

```bash
# Opción RECOMENDADA - Con menú interactivo
./hollywood-ultimate.sh

# Y selecciona:
# 1 = Básico (6 ventanas)
# 2 = Avanzado (12 ventanas)
# 3 = Ultimate (20+ ventanas) ⚠️ MÁXIMA POTENCIA
# 4 = Custom (tú eliges)
```

**Alternativas**:

```bash
# Ejecutar directamente sin menú
./hollywood-pro.sh      # 10 ventanas automáticamente
./hollywood-mac.sh      # 5-6 ventanas básicas
```

---

## 🎯 Modos Disponibles en hollywood-ultimate.sh

### 🎬 Modo BÁSICO (6 ventanas)
Perfecto para empezar o equipos con recursos limitados.

**Incluye**:
- Matrix effect (verde)
- Monitor de procesos (htop)
- Monitor de red (bmon)
- Monitor de disco (duf)
- Ping gráfico (gping)
- Logs del sistema

**Recursos**: Bajo ⚡

### 🎭 Modo AVANZADO (12 ventanas)
Balance perfecto entre impacto visual y rendimiento.

**Incluye todo lo anterior más**:
- Matrix efecto dual (verde + cian)
- Monitores avanzados (btop + glances)
- Análisis de red por proceso (bandwhich)
- Navegador de logs (lnav)
- Monitor de temperatura
- Fortune cow (diversión)

**Recursos**: Moderado ⚡⚡

### 🚀 Modo ULTIMATE (20+ ventanas)
**¡MÁXIMA POTENCIA!** Para demos, presentaciones o cuando quieres impresionar.

**Incluye TODO**:
- 4 efectos visuales (Matrix, pipes, cowsay animado)
- 4 monitores de sistema (btop, htop, glances, procs)
- 5 monitores de red (bmon, iftop, nethogs, bandwhich, gping)
- 3 analizadores de disco (duf, dust, ncdu)
- 3 visualizadores de logs
- Docker monitors (si está instalado)
- Git tools (si estás en repo)
- Hardware monitors
- Speed tests
- Efectos divertidos (asciiquarium, fortune figlet)

**Recursos**: Alto ⚡⚡⚡
**⚠️ Advertencia**: Consume bastante CPU y RAM

### 🎯 Modo CUSTOM
Tú decides qué ventanas abrir.

El script te preguntará una por una qué herramientas quieres ver.

---

## 💡 Tips Rápidos

### Organizar Ventanas Automáticamente

Si tienes **yabai** instalado:

```bash
# Después de lanzar Hollywood, ejecuta:
yabai -m space --layout bsp
```

Esto organizará todas las ventanas en un layout tipo mosaico automáticamente.

### Controles Esenciales

| Acción | Atajo |
|--------|-------|
| Cerrar ventana | `Cmd + W` |
| Salir de app | `Cmd + Q` |
| Pantalla completa | `Cmd + Ctrl + F` |
| Cambiar de ventana | `Cmd + Tab` |
| Cambiar de Space | `Ctrl + →/←` |

### Salir de Herramientas

| Herramienta | Cómo salir |
|-------------|------------|
| cmatrix | `Ctrl + C` |
| htop/btop/glances | `q` |
| Otras ventanas | `Ctrl + C` |
| TODO a la vez | `./hollywood-stop.sh` |

### Crear Alias

Añade a tu `~/.zshrc` o `~/.bashrc`:

```bash
# Hollywood Mode aliases
alias hollywood="~/hollywood-ultimate.sh"
alias hw-check="~/hollywood-check.sh"
alias hw-stop="~/hollywood-stop.sh"
alias hw-install="~/hollywood-install-tools.sh"
```

Luego ejecuta:
```bash
source ~/.zshrc  # o source ~/.bashrc
```

Ahora puedes usar simplemente:
```bash
hollywood        # En lugar de ./hollywood-ultimate.sh
hw-check         # En lugar de ./hollywood-check.sh
hw-stop          # En lugar de ./hollywood-stop.sh
```

---

## 🔧 Troubleshooting Rápido

### Problema: "Permission denied"
```bash
chmod +x ~/hollywood-*.sh
```

### Problema: "Command not found: brew"
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Problema: "Permission denied" con iftop/nethogs
```bash
# Estas herramientas necesitan sudo
sudo iftop
sudo nethogs
```

### Problema: Demasiadas ventanas abiertas
```bash
# Detener todos los procesos
./hollywood-stop.sh

# O usar modo básico en lugar de ultimate
./hollywood-ultimate.sh  # Selecciona opción 1
```

### Problema: Alto consumo de CPU/RAM
- Usa modo **Básico** en lugar de Ultimate
- Cierra ventanas que no necesites con `Cmd + W`
- Aumenta los intervalos de sleep en los scripts

---

## 📊 Estado Actual de tu Sistema

Según la última verificación:
- **9 de 36** herramientas instaladas (25%)
- **Herramientas que ya tienes**: brew, cmatrix, git, bat, jq, docker, asciiquarium, yabai, skhd
- **Herramientas faltantes**: htop, btop, glances, nmap, bmon, iftop, y 22 más

### Recomendación
Ejecuta el instalador para obtener el 100%:
```bash
./hollywood-install-tools.sh
```

---

## 🎓 Siguiente Nivel

Una vez que domines lo básico:

1. **Personaliza los scripts**: Edita `hollywood-ultimate.sh` para añadir tus propios monitores
2. **Lee la referencia completa**: `cat HOLLYWOOD-TOOLS-REFERENCE.md`
3. **Configura yabai**: Para organización automática de ventanas
4. **Crea combinaciones**: Combina herramientas con pipes y filtros

### Ejemplos de Personalización

```bash
# Añadir monitor de Kubernetes
osascript -e 'tell application "Terminal" to do script "watch kubectl get pods"' &

# Añadir monitor de logs custom
osascript -e 'tell application "Terminal" to do script "tail -f ~/mi-app/logs/*.log"' &

# Añadir monitor de Git
osascript -e 'tell application "Terminal" to do script "watch -n 5 git status"' &
```

---

## 📝 Checklist Completo

- [ ] Ejecutar `./hollywood-install-tools.sh`
- [ ] Verificar instalación con `./hollywood-check.sh`
- [ ] Probar modo básico: `./hollywood-ultimate.sh` → opción 1
- [ ] Probar modo avanzado: `./hollywood-ultimate.sh` → opción 2
- [ ] (Opcional) Probar modo ultimate: `./hollywood-ultimate.sh` → opción 3
- [ ] Configurar aliases en `~/.zshrc`
- [ ] Leer `HOLLYWOOD-TOOLS-REFERENCE.md` para aprender atajos
- [ ] (Opcional) Configurar yabai para organización automática
- [ ] ¡Disfrutar tu Hollywood Mode! 🎬

---

## 🎬 ¿Todo Listo?

```bash
# 1. Instalar herramientas
./hollywood-install-tools.sh

# 2. Verificar
./hollywood-check.sh

# 3. ¡ACCIÓN!
./hollywood-ultimate.sh
```

---

## 📚 Recursos

- **README completo**: `cat HOLLYWOOD-README.md`
- **Referencia de herramientas**: `cat HOLLYWOOD-TOOLS-REFERENCE.md`
- **Verificar estado**: `./hollywood-check.sh`
- **Ayuda**: Abre un issue en GitHub o revisa la documentación

---

**¡Disfruta de tu experiencia Hollywood en macOS!** 🎬✨🎭

*Made with ❤️ for terminal enthusiasts*
