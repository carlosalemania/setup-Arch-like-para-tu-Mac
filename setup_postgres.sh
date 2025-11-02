#!/bin/bash

# Script automático para configurar PostgreSQL
# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}=== Configuración Automática de PostgreSQL ===${NC}\n"

# Variables
PG_VERSION="16"
PG_BIN="/Library/PostgreSQL/${PG_VERSION}/bin"
PG_DATA="/Library/PostgreSQL/${PG_VERSION}/data"
PG_HBA="${PG_DATA}/pg_hba.conf"
PG_HBA_BACKUP="${PG_DATA}/pg_hba.conf.backup"

# Contraseñas a configurar
POSTGRES_PASSWORD="postgres123"
USER_PASSWORD="carlos123"

echo -e "${YELLOW}Paso 1:${NC} Creando backup de pg_hba.conf..."
sudo cp "$PG_HBA" "$PG_HBA_BACKUP"
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Backup creado${NC}\n"
else
    echo -e "${RED}✗ Error al crear backup${NC}"
    exit 1
fi

echo -e "${YELLOW}Paso 2:${NC} Configurando autenticación temporal (trust)..."
sudo sed -i.tmp 's/scram-sha-256/trust/g' "$PG_HBA"
sudo sed -i.tmp 's/md5/trust/g' "$PG_HBA"
echo -e "${GREEN}✓ Configuración temporal aplicada${NC}\n"

echo -e "${YELLOW}Paso 3:${NC} Reiniciando PostgreSQL..."
sudo -u postgres "$PG_BIN/pg_ctl" -D "$PG_DATA" restart -w
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ PostgreSQL reiniciado${NC}\n"
else
    echo -e "${RED}✗ Error al reiniciar PostgreSQL${NC}"
    exit 1
fi

# Esperar un momento para que PostgreSQL esté listo
sleep 2

echo -e "${YELLOW}Paso 4:${NC} Configurando contraseñas..."

# Configurar contraseña para usuario postgres
"$PG_BIN/psql" -U postgres -d postgres -c "ALTER USER postgres WITH PASSWORD '$POSTGRES_PASSWORD';" 2>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Contraseña de usuario 'postgres' configurada${NC}"
else
    echo -e "${RED}✗ Error al configurar contraseña de postgres${NC}"
fi

# Crear/actualizar usuario carlosgarcia
"$PG_BIN/psql" -U postgres -d postgres -c "DO \$\$
BEGIN
    IF NOT EXISTS (SELECT FROM pg_user WHERE usename = 'carlosgarcia') THEN
        CREATE USER carlosgarcia WITH PASSWORD '$USER_PASSWORD' SUPERUSER;
    ELSE
        ALTER USER carlosgarcia WITH PASSWORD '$USER_PASSWORD' SUPERUSER;
    END IF;
END \$\$;" 2>/dev/null

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Usuario 'carlosgarcia' configurado${NC}\n"
else
    echo -e "${RED}✗ Error al configurar usuario carlosgarcia${NC}\n"
fi

echo -e "${YELLOW}Paso 5:${NC} Restaurando autenticación segura (scram-sha-256)..."
sudo cp "$PG_HBA_BACKUP" "$PG_HBA"
echo -e "${GREEN}✓ Configuración segura restaurada${NC}\n"

echo -e "${YELLOW}Paso 6:${NC} Reiniciando PostgreSQL con configuración final..."
sudo -u postgres "$PG_BIN/pg_ctl" -D "$PG_DATA" restart -w
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ PostgreSQL reiniciado${NC}\n"
else
    echo -e "${RED}✗ Error al reiniciar PostgreSQL${NC}"
    exit 1
fi

# Agregar al PATH si no está
if ! grep -q "/Library/PostgreSQL/${PG_VERSION}/bin" ~/.zshrc 2>/dev/null; then
    echo -e "${YELLOW}Paso 7:${NC} Agregando PostgreSQL al PATH..."
    echo '' >> ~/.zshrc
    echo '# PostgreSQL' >> ~/.zshrc
    echo "export PATH=\"/Library/PostgreSQL/${PG_VERSION}/bin:\$PATH\"" >> ~/.zshrc
    echo -e "${GREEN}✓ PATH actualizado en ~/.zshrc${NC}\n"
else
    echo -e "${YELLOW}Paso 7:${NC} PostgreSQL ya está en el PATH\n"
fi

echo -e "${GREEN}=== ✓ Configuración Completada ===${NC}\n"
echo -e "${YELLOW}Credenciales configuradas:${NC}"
echo -e "  Usuario: ${GREEN}postgres${NC}  | Password: ${GREEN}$POSTGRES_PASSWORD${NC}"
echo -e "  Usuario: ${GREEN}carlosgarcia${NC} | Password: ${GREEN}$USER_PASSWORD${NC}\n"

echo -e "${YELLOW}Comandos para probar:${NC}"
echo -e "  ${GREEN}psql -U postgres -d postgres${NC}"
echo -e "  ${GREEN}psql -U carlosgarcia -d postgres${NC}\n"

echo -e "${YELLOW}Para pgAdmin 4:${NC}"
echo -e "  Host: ${GREEN}localhost${NC} o ${GREEN}127.0.0.1${NC}"
echo -e "  Port: ${GREEN}5432${NC}"
echo -e "  Usuario: ${GREEN}postgres${NC} o ${GREEN}carlosgarcia${NC}"
echo -e "  Password: ${GREEN}$POSTGRES_PASSWORD${NC} o ${GREEN}$USER_PASSWORD${NC}\n"

echo -e "${YELLOW}Nota:${NC} Si quieres cambiar las contraseñas, ejecuta:"
echo -e "  ${GREEN}psql -U postgres -d postgres${NC}"
echo -e "  ${GREEN}ALTER USER postgres WITH PASSWORD 'nueva_password';${NC}\n"
