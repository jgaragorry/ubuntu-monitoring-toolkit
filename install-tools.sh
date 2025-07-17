#!/bin/bash

# ==============================================================================
# Script de Instalación de Herramientas de Monitoreo para Ubuntu 24.04 LTS
#
# Este script instalará un conjunto de herramientas modernas para el monitoreo
# de recursos del sistema desde la línea de comandos.
#
# Herramientas a instalar:
# - btop, glances, nmon, npm, y btm (vía APT)
# - gtop (vía NPM)
#
# Autor: jgaragorry
# Versión: 1.3
# ==============================================================================

# --- Colores para la salida ---
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # Sin Color

echo -e "${BLUE}---> Iniciando la instalación de herramientas de monitoreo...${NC}"

# --- Paso 1: Actualizar la lista de paquetes del sistema ---
echo -e "\n${YELLOW}Actualizando la lista de paquetes...${NC}"
sudo apt update

# --- Paso 2: Instalar herramientas desde los repositorios de APT ---
# Se instalan btop, glances, nmon, npm y btm (el paquete para bottom)
echo -e "\n${YELLOW}Instalando btop, glances, nmon, npm y btm desde APT...${NC}"
sudo apt install -y btop glances nmon npm btm
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Falló la instalación de paquetes base desde APT. El script continuará, pero algunas herramientas pueden faltar.${NC}"
fi

# --- Paso 3: Instalar gtop usando npm ---
# Se usa 'sudo' porque la bandera -g instala el paquete de forma global
echo -e "\n${YELLOW}Instalando gtop a través de npm...${NC}"
sudo npm install -g gtop
if [ $? -ne 0 ]; then
    echo -e "\n${RED}Error: Falló la instalación de gtop. Por favor, revisa la instalación de npm.${NC}"
fi

# --- Paso 4: Mensaje de finalización y resumen de herramientas ---
echo -e "\n\n${GREEN}===================================================================${NC}"
echo -e "${GREEN}  ¡Instalación completada! Resumen de las nuevas herramientas:  ${NC}"
echo -e "${GREEN}===================================================================${NC}"

echo -e "\n${YELLOW}1. btop${NC}"
echo -e "   ${BLUE}Qué hace:${NC} Un monitor de recursos espectacular y moderno. Muestra gráficos detallados"
echo -e "   de CPU, memoria, red y discos, con control total por teclado y ratón."
echo -e "   ${BLUE}Cómo se ejecuta:${NC} btop"
echo -e "   ${BLUE}Teclas más usadas:${NC} 'f' para filtrar procesos (ej: 'nginx'), 'Flechas' para navegar, 'Enter' para ver detalles, 'q' para salir."
echo -e "   ${BLUE}Uso productivo:${NC} Presiona 'F2' > 'Themes' para cambiar el tema visual a tu gusto."

echo -e "\n${YELLOW}2. glances${NC}"
echo -e "   ${BLUE}Qué hace:${NC} Una vista 'todo en uno' del sistema. Ideal para tener una visión general"
echo -e "   rápida de todos los componentes de tu servidor en una sola pantalla."
echo -e "   ${BLUE}Cómo se ejecuta:${NC} glances"
echo -e "   ${BLUE}Teclas más usadas:${NC} 'c' (ordenar por CPU), 'm' (por memoria), '1' (vista por núcleo/global), 'q' para salir."
echo -e "   ${BLUE}Uso productivo (Monitoreo Remoto):${NC}"
echo -e "     - En el servidor a monitorear, ejecuta: ${GREEN}glances -s${NC} (Modo Servidor)"
echo -e "     - En tu máquina local, ejecuta: ${GREEN}glances -c <IP_DEL_SERVIDOR>${NC} (Modo Cliente)"

echo -e "\n${YELLOW}3. bottom (btm)${NC}"
echo -e "   ${BLUE}Qué hace:${NC} Un dashboard de terminal muy rápido y personalizable, similar a btop."
echo -e "   Destaca por sus widgets gráficos y su eficiencia."
echo -e "   ${BLUE}Cómo se ejecuta:${NC} btm"
echo -e "   ${BLUE}Teclas más usadas:${NC} 'Flechas' para navegar, 'f' para filtrar, 'dd' para detalles de disco, '?' para ayuda, 'q' para salir."
echo -e "   ${BLUE}Uso productivo:${NC} Ejecuta ${GREEN}btm --basic${NC} para una vista minimalista que consume aún menos recursos."

echo -e "\n${YELLOW}4. gtop${NC}"
echo -e "   ${BLUE}Qué hace:${NC} Un dashboard enfocado en los gráficos históricos de uso de CPU y memoria."
echo -e "   Perfecto para identificar tendencias y picos de rendimiento a lo largo del tiempo."
echo -e "   ${BLUE}Cómo se ejecuta:${NC} gtop"
echo -e "   ${BLUE}Teclas más usadas:${NC} 'p' (ordenar por PID), 'c' (por CPU), 'm' (por memoria), 'q' para salir."
echo -e "   ${BLUE}Uso productivo:${NC} Es ideal para dejarlo en una pantalla dedicada y observar cambios en el tiempo durante un despliegue."

echo -e "\n${YELLOW}5. nmon${NC}"
echo -e "   ${BLUE}Qué hace:${NC} La navaja suiza de los sysadmins. Es una herramienta modular y muy ligera."
echo -e "   Tú eliges qué monitorear y puedes capturar datos para análisis posteriores."
echo -e "   ${BLUE}Cómo se ejecuta:${NC} nmon"
echo -e "   ${BLUE}Teclas más usadas (interactivas):${NC} 'c' (CPU), 'm' (Memoria), 'd' (Disco), 'n' (Red), 't' (Top Procesos), 'q' para salir."
echo -e "   ${BLUE}Uso productivo (Captura de Datos):${NC}"
echo -e "     - Para capturar datos cada 10 segundos durante 1 hora (360 muestras), ejecuta:"
echo -e "       ${GREEN}nmon -f -s 10 -c 360${NC}"
echo -e "     - Esto generará un archivo '.nmon' que luego puedes analizar con otras herramientas para crear gráficos."

echo -e "\n${GREEN}¡Disfruta de tus nuevas herramientas de monitoreo!${NC}\n"

