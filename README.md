# Ubuntu Monitoring Toolkit 🚀

Un conjunto de scripts para instalar y desinstalar rápidamente una selección curada de las mejores y más modernas herramientas de monitoreo de sistema para la terminal en **Ubuntu Server 24.04 LTS** y derivados.

Este toolkit está diseñado para administradores de sistemas, desarrolladores y entusiastas de Linux que quieren potenciar su terminal con herramientas visualmente atractivas y funcionales, sin perder tiempo en instalaciones manuales.

![Imagen de una terminal mostrando btop o glances en acción]

---

## ✨ Características Principales

* **Instalación Automatizada:** Un solo script para instalar 5 herramientas de monitoreo de primer nivel.
* **Selección Moderna:** Incluye las herramientas más populares y eficientes como `btop`, `glances` y `btm`.
* **Gestión Limpia:** Incluye un script para desinstalar todas las herramientas y dejar el sistema como estaba.
* **Guía Rápida:** El script de instalación finaliza con un resumen útil de cada herramienta y sus comandos más importantes.
* **Plug and Play:** Simplemente clona el repositorio, da permisos y ejecuta.

---

## 🚀 Cómo Empezar

Para poner en marcha tu nuevo arsenal de monitoreo, sigue estos 3 sencillos pasos:

1.  **Clona el repositorio:**
    ```bash
    git clone [https://github.com/tu-usuario/ubuntu-monitoring-toolkit.git](https://github.com/tu-usuario/ubuntu-monitoring-toolkit.git)
    cd ubuntu-monitoring-toolkit
    ```

2.  **Da permisos de ejecución a los scripts:**
    ```bash
    chmod +x install-tools.sh uninstall-tools.sh
    ```

3.  **Ejecuta el script de instalación:**
    ```bash
    sudo ./install-tools.sh
    ```
    ¡Y listo! Al finalizar, tendrás todas las herramientas instaladas y una guía de uso rápido en tu terminal.

---

## 🛠️ Scripts Incluidos

### `install-tools.sh`
Este script realiza las siguientes acciones:
1.  Actualiza la lista de paquetes de `apt`.
2.  Instala `btop`, `glances`, `nmon`, `btm` y `npm` usando `apt`.
3.  Instala `gtop` de forma global usando `npm`.
4.  Muestra un resumen final con la descripción y uso de cada herramienta.

### `uninstall-tools.sh`
Este script revierte todos los cambios de forma segura:
1.  Desinstala `btop`, `glances`, `nmon`, `btm` y `npm` usando `apt-get remove --purge`.
2.  Desinstala `gtop` usando `npm uninstall`.
3.  Ejecuta `apt autoremove` para limpiar cualquier dependencia que ya no sea necesaria.

---

## 🧰 Herramientas que se Instalan

| Herramienta | Se ejecuta con | Descripción Breve |
| :--- | :--- | :--- |
| **btop** | `btop` | Un monitor de recursos espectacular con gráficos detallados y control total. |
| **glances** | `glances` | Una vista "todo en uno" del sistema, ideal para una visión general rápida. |
| **bottom** | `btm` | Un dashboard de terminal rápido y personalizable, similar a btop. |
| **gtop** | `gtop` | Un dashboard enfocado en gráficos históricos para identificar tendencias. |
| **nmon** | `nmon` | La navaja suiza de los sysadmins, modular y capaz de capturar datos para análisis. |

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.
