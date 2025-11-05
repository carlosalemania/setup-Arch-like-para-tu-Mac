# 🎬 Hollywood Mode para macOS

Crea un efecto "Hollywood hacker" en tu Mac con múltiples ventanas de Terminal mostrando monitores del sistema en tiempo real.

## 📦 Instalación

### Requisitos previos
```bash
# Asegúrate de tener Homebrew instalado
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Instalar dependencias básicas
```bash
brew install cmatrix htop
```

### Dependencias opcionales (recomendadas)
```bash
brew install glances speedtest-cli osx-cpu-temp
```

## 🚀 Uso

### Versión básica
```bash
./hollywood-mac.sh
```

Esta versión abre:
- 🟢 Matrix effect (cmatrix)
- 📊 Monitor de procesos (htop)
- 📝 Logs del sistema
- 🌐 Actividad de red (nettop)
- 💾 Monitor de disco

### Versión PRO (recomendada)
```bash
./hollywood-pro.sh
```

Esta versión incluye todo lo anterior más:
- 🧠 Monitor de memoria
- ⚙️ Monitor de procesos avanzado
- 🌡️ Monitor de temperatura
- 🌐 Monitor de conectividad
- 📈 Glances (monitor todo-en-uno)
- Instalación automática de dependencias
- Interfaz mejorada con colores

### Detener Hollywood Mode
```bash
./hollywood-stop.sh
```

O simplemente cierra las ventanas con `Cmd+W` o `Cmd+Q`.

## 🎮 Controles

| Herramienta | Control |
|------------|---------|
| **cmatrix** | `Ctrl+C` para salir |
| **htop** | `q` para salir, `F6` para ordenar |
| **glances** | `q` para salir, `h` para ayuda |
| **nettop** | `q` para salir |
| **Logs** | `Ctrl+C` para detener |

## 💡 Tips y Trucos

### Organizar ventanas automáticamente
Si tienes **yabai** instalado, puedes organizar las ventanas automáticamente:
```bash
# Después de lanzar hollywood-pro.sh
yabai -m space --layout bsp
```

### Usar con iTerm2
Si prefieres iTerm2 sobre Terminal, modifica los scripts cambiando:
```bash
# De:
osascript -e 'tell application "Terminal" to do script "comando"'

# A:
osascript -e 'tell application "iTerm" to create window with default profile command "comando"'
```

### Modo presentación (Fullscreen)
Después de lanzar, presiona `Cmd+Ctrl+F` en cada ventana para ponerla en pantalla completa.

### Personalizar colores de cmatrix
```bash
cmatrix -b -C green    # Verde (Matrix clásico)
cmatrix -b -C red      # Rojo
cmatrix -b -C blue     # Azul
cmatrix -b -C cyan     # Cian
cmatrix -b -C magenta  # Magenta
```

## 🎨 Personalizaciones

### Añadir tu propio monitor
Edita `hollywood-pro.sh` y añade:
```bash
osascript -e 'tell application "Terminal" to do script "tu-comando-aqui"' &
sleep 0.3
```

### Ejemplos de monitores adicionales

#### Monitor de Docker
```bash
osascript -e 'tell application "Terminal" to do script "while true; do clear; docker ps; docker stats --no-stream; sleep 2; done"' &
```

#### Monitor de Git
```bash
osascript -e 'tell application "Terminal" to do script "while true; do clear; echo \"Git Status:\"; git -C ~/tu-repo status; sleep 5; done"' &
```

#### Monitor de Kubernetes
```bash
osascript -e 'tell application "Terminal" to do script "watch kubectl get pods --all-namespaces"' &
```

#### Speedtest continuo
```bash
osascript -e 'tell application "Terminal" to do script "while true; do speedtest-cli; sleep 300; done"' &
```

## 🎭 Casos de uso

1. **Demos y presentaciones**: Impresiona a tu audiencia
2. **Streams**: Fondo llamativo para streams de programación
3. **Monitoreo real**: Útil para diagnosticar problemas del sistema
4. **Diversión**: Simplemente porque se ve genial 😎

## 🔧 Troubleshooting

### "cmatrix: command not found"
```bash
brew install cmatrix
```

### "htop: command not found"
```bash
brew install htop
```

### Las ventanas se superponen
Usa yabai para organización automática o arrastra manualmente las ventanas.

### Consumo alto de CPU
Hollywood Mode usa recursos del sistema. Para reducir el impacto:
- Cierra monitores que no necesites
- Aumenta los intervalos de sleep en los loops
- Usa la versión básica en lugar de la PRO

### Permisos de logs
Si no puedes ver los logs del sistema:
```bash
# Ejecuta con sudo (te pedirá contraseña)
sudo log stream --predicate "eventMessage contains[cd] \"\""
```

## 📝 Notas

- **Rendimiento**: Hollywood Mode puede consumir recursos del sistema
- **Batería**: En laptops, esto afectará la duración de la batería
- **Privacidad**: Algunos monitores pueden mostrar información sensible del sistema

## 🤝 Contribuir

¿Tienes ideas para mejorar Hollywood Mode?
- Añade nuevos monitores interesantes
- Mejora la organización de ventanas
- Crea temas personalizados

## 📄 Licencia

Libre para usar, modificar y compartir.

---

**¡Disfruta de tu propio Hollywood hacker experience!** 🎬✨
