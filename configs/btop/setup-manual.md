# 🔧 INSTALACIÓN MANUAL - BTOP TEMAS

Como el directorio `~/.config` requiere permisos especiales, sigue estos pasos:

## Paso 1: Arreglar permisos (necesario una sola vez)

Abre una terminal y ejecuta:

```bash
sudo chown -R $USER:staff ~/.config
```

Te pedirá tu contraseña de macOS.

## Paso 2: Ejecutar instalador

Una vez arreglados los permisos, ejecuta:

```bash
cd ~/btop-themes-custom
./install-themes.sh
```

## Paso 3: Activar alias

```bash
source ~/.zshrc
```

## Paso 4: ¡Usar!

```bash
btop-theme
```

---

## Instalación Completamente Manual (si prefieres hacerlo paso a paso)

### 1. Crear directorios

```bash
sudo mkdir -p ~/.config/btop/themes
sudo chown -R $USER:staff ~/.config/btop
```

### 2. Copiar temas

```bash
cp ~/btop-themes-custom/*.theme ~/.config/btop/themes/
```

### 3. Copiar configuración

```bash
cp ~/btop-themes-custom/btop.conf ~/.config/btop/
```

### 4. Agregar alias

Agrega al final de tu `~/.zshrc`:

```bash
echo "alias btop-theme='~/btop-themes-custom/btop-theme-switcher.sh'" >> ~/.zshrc
```

### 5. Recargar configuración

```bash
source ~/.zshrc
```

### 6. ¡Listo!

```bash
btop-theme
```

---

## Verificar instalación

```bash
# Verificar temas copiados
ls ~/.config/btop/themes/

# Deberías ver:
# cyberpunk-neon.theme
# dracula-premium.theme
# matrix-hacker.theme
# tokyo-night-storm.theme

# Verificar configuración
ls ~/.config/btop/btop.conf

# Verificar alias
which btop-theme
```

---

## Usar temas SIN instalar

Si no quieres modificar tu sistema, puedes usar los temas directamente:

### Opción 1: Copiar tema individualmente

```bash
# Elige tu tema favorito y cópialo a btop
cp ~/btop-themes-custom/dracula-premium.theme ~/.config/btop/themes/
```

### Opción 2: Usar desde btop directamente

1. Abre btop
2. Presiona `ESC` o `M`
3. Ve a "Options" → "Color theme"
4. Selecciona "dracula-premium" (o el que copiaste)

---

## Troubleshooting

### "Permission denied" al crear directorios

```bash
sudo mkdir -p ~/.config/btop/themes
sudo chown -R $USER:staff ~/.config/btop
```

### Temas no aparecen en btop

Verifica que estén en el directorio correcto:

```bash
ls ~/.config/btop/themes/
```

### Alias btop-theme no funciona

Verifica que esté en tu `.zshrc`:

```bash
grep btop-theme ~/.zshrc
```

Si no está, agrégalo:

```bash
echo "alias btop-theme='~/btop-themes-custom/btop-theme-switcher.sh'" >> ~/.zshrc
source ~/.zshrc
```

---

## Una vez instalado

Lee la [Guía Rápida](QUICK-START.md) para empezar a usar tus temas.

O ejecuta directamente:

```bash
btop-theme
```

¡Disfruta! 🚀
