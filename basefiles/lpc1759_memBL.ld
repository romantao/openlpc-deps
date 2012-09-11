MEMORY
{
  /* Define each memory region */
  MFlash512 (rx) : ORIGIN = 0x10000,    LENGTH = 0x70000 /* 448k */
  RamLoc32 (rwx) : ORIGIN = 0x10000000, LENGTH = 0x7FE0  /* 32k - 32bytes */
  RamAHB32 (rwx) : ORIGIN = 0x2007c000, LENGTH = 0x8000  /* 32k */
}

/* Define a symbol for the top of each memory region */
__top_MFlash512 = 0x10000    + 0x70000;
__top_RamLoc32  = 0x10000000 + 0x7FE0;
__top_RamAHB32  = 0x2007c000 + 0x8000;

