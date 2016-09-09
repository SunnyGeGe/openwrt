rmmod  sdhci_pci
rmmod  sdhci
rmmod  mmc_block
rmmod  mmc_core
rmmod  omap_hsmmc

insmod /lib/modules/4.1.18/mmc_core.ko
insmod /lib/modules/4.1.18/mmc_block.ko
insmod /lib/modules/4.1.18/omap.ko
insmod /lib/modules/4.1.18/omap_hsmmc.ko
insmod /lib/modules/4.1.18/sdhci.ko

