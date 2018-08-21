PLATFORM_FLAVOR ?= sun50i_h5

$(call force,CFG_GENERIC_BOOT,y)
$(call force,CFG_SECURE_TIME_SOURCE_CNTPCT,y)
$(call force,CFG_8250_UART,y)
$(call force,CFG_PM_STUBS,y)

ifeq ($(PLATFORM_FLAVOR),bpi_zero)
include core/arch/arm/cpu/cortex-a7.mk
$(call force,CFG_SUN8I_H2_PLUS,y)
$(call force,CFG_ARM32_core,y)
$(call force,CFG_GIC,y)
$(call force,CFG_WITH_LPAE,n)
$(call force,CFG_WITH_PAGER,n)

CFG_CRYPTO_SIZE_OPTIMIZATION ?= n
CFG_NUM_THREADS ?= 4
CFG_TEE_CORE_NB_CORE ?= 4
CFG_WITH_STACK_CANARIES ?= y
CFG_BOOT_SECONDARY_REQUEST ?= y
CFG_PSCI_ARM32 ?= y
CFG_NS_ENTRY_ADDR ?= 0x42000000
CFG_DT ?= y
CFG_INIT_CNTVOFF ?= y
CFG_SECONDARY_INIT_CNTFRQ ?= y
CFG_TZDRAM_START ?= 0x5c000000
CFG_TZDRAM_SIZE ?= 0x03e00000
CFG_SHMEM_START ?= 0x5fe00000
CFG_SHMEM_SIZE ?= 0x00200000
endif
ta-targets = ta_arm32
ifeq ($(PLATFORM_FLAVOR),sun50i_h5)
include core/arch/arm/cpu/cortex-armv8-0.mk
$(call force,CFG_ARM64_core,y)
$(call force,CFG_WITH_LPAE,y)
ta-targets += ta_arm64
CFG_TZDRAM_START ?= 0x40200000
CFG_TZDRAM_SIZE  ?= 0x01000000
CFG_SHMEM_START  ?= 0x40000000
CFG_SHMEM_SIZE   ?= 0x00200000
CFG_TEE_CORE_NB_CORE ?= 4
CFG_TZC380 ?= y
endif
ifeq ($(platform-flavor-armv8),1)
$(call force,CFG_WITH_ARM_TRUSTED_FW,y)
endif
CFG_WITH_STACK_CANARIES ?= y
CFG_WITH_STATS ?= y