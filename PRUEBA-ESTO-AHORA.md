# 🚀 Prueba Tu Nuevo Setup - Paso a Paso

## ✅ Paso 1: Abre Nueva Terminal

**¡IMPORTANTE!** Los comandos nuevos solo funcionan en terminales nuevas.

### Opción A: Nueva Pestaña
```
Presiona: Cmd + T
```

### Opción B: Nueva Ventana
```
Presiona: Cmd + N
```

---

## ✅ Paso 2: Prueba los Comandos CLI Modernos

En la **nueva terminal**, escribe estos comandos (copia y pega, o escribe):

### Comando 1: Probar `ls` mejorado (eza)
```bash
ls
```
**Deberías ver:**
- 📁 Íconos de carpetas
- 📄 Íconos de archivos
- Colores bonitos
- Info de Git si estás en un repo

### Comando 2: Probar `cat` mejorado (bat)
```bash
cat ~/.zshrc
```
**Deberías ver:**
- Números de línea
- Syntax highlighting (colores)
- Formato profesional

### Comando 3: Probar `cd` inteligente (zoxide)
```bash
z Desktop
```
**Resultado:**
- Te lleva a tu carpeta Desktop
- Más rápido que `cd ~/Desktop`

### Comando 4: Ver tu IP pública
```bash
myip
```
**Resultado:**
- Muestra tu IP pública

### Comando 5: Crear carpeta y entrar automáticamente
```bash
mkcd prueba-setup
```
**Resultado:**
- Crea la carpeta "prueba-setup"
- Entra automáticamente a ella

### Comando 6: Volver atrás
```bash
cd ..
```

---

## ✅ Paso 3: Prueba los Atajos de Teclado

**Estos YA están activos**, solo presiona las teclas:

### Atajos Básicos (Los Más Útiles)

#### 1. Abrir Terminal Nueva
```
Presiona: Cmd + Shift + Return
```
**Resultado:** Se abre una nueva terminal

#### 2. Hacer Fullscreen
```
Presiona: Cmd + Shift + F
```
**Resultado:** La ventana actual se maximiza

#### 3. Navegar Entre Ventanas
```
Cmd + Shift + H   →  Mover foco a ventana izquierda
Cmd + Shift + L   →  Mover foco a ventana derecha
Cmd + Shift + J   →  Mover foco a ventana abajo
Cmd + Shift + K   →  Mover foco a ventana arriba
```

#### 4. Balancear Ventanas
```
Presiona: Cmd + Shift + 0 (cero)
```
**Resultado:** Todas las ventanas se organizan automáticamente

#### 5. Cambiar a Workspace/Espacio
```
Cmd + Shift + 1   →  Ir a espacio 1
Cmd + Shift + 2   →  Ir a espacio 2
Cmd + Shift + 3   →  Ir a espacio 3
```

---

## ✅ Paso 4: Prueba Tmux (Opcional)

### Iniciar Tmux
```bash
tmux
```

### Instalar Plugins (Solo Primera Vez)
1. Presiona: `Ctrl + Space`
2. Luego presiona: `I` (letra i mayúscula)
3. Espera 10-15 segundos (verás mensajes instalando)
4. Presiona: `Ctrl + Space` luego `D` (para salir)

### Atajos Tmux Útiles
```
Ctrl + Space + |   →  Split vertical
Ctrl + Space + -   →  Split horizontal
Alt + H/J/K/L      →  Navegar entre paneles (sin Ctrl+Space)
Ctrl + Space + D   →  Salir de tmux
```

---

## ✅ Paso 5: Ver Estado del Sistema

```bash
wm-status
```
**Deberías ver:**
```
=== Yabai ===
✅ Corriendo (PID: xxxxx)

=== Skhd ===
✅ Corriendo (PID: xxxxx)
```

---

## ✅ Paso 6: Ver la Guía Completa (Opcional)

```bash
cat ~/GUIA-RAPIDA-USO.md | bat
```

O simplemente:
```bash
bat ~/GUIA-RAPIDA-USO.md
```

---

## 🎯 Resumen Rápido

### Comandos que Puedes Probar Ahora:
```bash
ls              # Lista con íconos
cat ~/.zshrc    # Ver archivo con colores
z Desktop       # Ir a Desktop
myip            # Ver IP
mkcd test       # Crear carpeta y entrar
wm-status       # Ver estado del sistema
```

### Atajos que Puedes Probar Ahora:
```
Cmd + Shift + Return   →  Nueva terminal
Cmd + Shift + F        →  Fullscreen
Cmd + Shift + H/J/K/L  →  Navegar ventanas
Cmd + Shift + 0        →  Balancear ventanas
Cmd + Shift + 1-6      →  Cambiar workspace
```

---

## ❓ Si Algo No Funciona

### Los comandos nuevos no funcionan (ls sigue siendo normal)
**Solución:** Abre una terminal NUEVA (Cmd+T o Cmd+N)

### Los atajos no funcionan
**Solución:**
```bash
wm-status          # Ver si yabai/skhd están corriendo
./start-wm.sh      # Si no están corriendo
```

### Necesito ver los errores
```bash
tail -f /tmp/yabai_$USER.err.log   # Errores de yabai
tail -f /tmp/skhd_$USER.err.log    # Errores de skhd
```

---

## 🎉 ¡Listo!

**Tu setup está funcionando al 100%**

Empieza probando los comandos básicos en una nueva terminal:
```bash
ls
cat ~/.zshrc
z Desktop
```

**¡Disfruta tu nuevo entorno tipo Arch Linux! 🚀**
