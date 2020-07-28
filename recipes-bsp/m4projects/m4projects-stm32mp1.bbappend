PROJECTS_LIST_stm32mpcommonmx += 'Avenger96/lte_sensors'
M4_BOARDS = "Avenger96"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-m4-build.patch;patchdir=${WORKDIR}"

SRC_URI += "file://Projects/Avenger96/lte_sensors/Remoteproc/README;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Remoteproc/fw_cortex_m4.sh;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/lock_resource.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/syscalls.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/sysmem.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/stm32mp1xx_it.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/system_stm32mp1xx.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/rsc_table.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/mbox_ipcc.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/openamp.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/main.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/sens_adux1020.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/sens_bno055.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/stm32mp1xx_hal_msp.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Src/openamp_log.c;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Startup/startup_stm32mp157aacx.s;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/mbox_ipcc.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/stm32mp1xx_it.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/stm32mp1xx_hal_conf.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/openamp.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/main.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/rsc_table.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/sens_adux1020.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/sens_bno055.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/lock_resource.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/openamp_log.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/Inc/openamp_conf.h;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/single_shot.cpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/VL53L0X.cpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/I2Cdev.cpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/VL53L0X_defines.hpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/I2Cdev.hpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/Core/VL53L0X/VL53L0X.hpp;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/STM32CubeIDE/lte_sensors/lte_sensors_Debug.launch;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/STM32CubeIDE/lte_sensors/STM32MP157AACX_RAM.ld;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/STM32CubeIDE/lte_sensors/.project;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/STM32CubeIDE/lte_sensors/.cproject;subdir=git"
SRC_URI += "file://Projects/Avenger96/lte_sensors/STM32CubeIDE/lte_sensors/lte_sensors_Debug.cfg;subdir=git"

do_compile_prepend() {
    if [ ! -x "${S}/Projects/Avenger96/lte_sensors/SW4STM32" ]; then
        lnr ${S}/Projects/Avenger96/lte_sensors/STM32CubeIDE ${S}/Projects/Avenger96/lte_sensors/SW4STM32
    fi
}

do_install_append() {
    install -d ${D}/home/root
    lnr ${D}/usr/local/Cube-M4-examples/Avenger96/lte_sensors/fw_cortex_m4.sh ${D}/home/root/fw_cortex_m4.sh
}

FILES_${PN} += "/home/root"

