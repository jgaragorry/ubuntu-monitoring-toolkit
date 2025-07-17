#!/bin/bash

# ==============================================================================
# Script de Desinstalación de Herramientas de Monitoreo para Ubuntu 24.04 LTS
#
# Este script desinstalará las herramientas de monitoreo instaladas por el
# script 'instalar_monitores.sh'.
#
# Herramientas a desinstalar:
# - btop, glances, nmon, npm, btm (vía APT)
# - gtop (vía NPM)
#
# Autor: jgaragorry
# Versión: 1.2
# ==============================================================================

# --- Colores para la salida ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sin Color

echo -e "${BLUE}---> Iniciando la desinstalación de herramientas de monitoreo...${NC}"

# --- Paso 1: Desinstalar herramientas de APT ---
# Se usa --purge para eliminar también los archivos de configuración.
# Se añade 'btm' a la lista de paquetes a eliminar.
echo -e "\n${YELLOW}Desinstalando btop, glances, nmon, npm y btm desde APT...${NC}"
sudo apt-get remove --purge -y btop glances nmon npm btm
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Advertencia: Ocurrió un error al desinstalar paquetes de APT. Puede que ya estuvieran desinstalados.${NC}"
fi

# --- Paso 2: Desinstalar 'bottom' (si existe como Snap) ---
# Mantenemos este paso por si se instaló como snap en otro sistema.
echo -e "\n${YELLOW}Verificando y desinstalando 'bottom' desde Snap (si existe)...${NC}"
if snap list | grep -q 'bottom'; then
    sudo snap remove bottom
else
    echo -e "${GREEN}El paquete Snap 'bottom' no está instalado. Omitiendo.${NC}"
fi


# --- Paso 3: Desinstalar gtop usando npm ---
echo -e "\n${YELLOW}Desinstalando gtop a través de npm...${NC}"
# Verificamos si gtop está instalado antes de intentar desinstalarlo
if npm list -g | grep -q 'gtop'; then
    sudo npm uninstall -g gtop
else
    echo -e "${GREEN}gtop no está instalado globalmente a través de npm. Omitiendo.${NC}"
fi

# --- Paso 4: Limpiar paquetes no necesarios ---
echo -e "\n${YELLOW}Ejecutando autoremove para limpiar dependencias no utilizadas...${NC}"
sudo apt autoremove -y

# --- Paso 5: Mensaje de finalización ---
echo -e "\n\n${GREEN}===================================================================${NC}"
echo -e "${GREEN}  ¡Desinstalación completada!                                  ${NC}"
echo -e "${GREEN}  Todas las herramientas de monitoreo han sido eliminadas.      ${NC}"
echo -e "${GREEN}===================================================================${NC}\n"

