/*
 * Memory linkscript for LPC1759 BareMetal projects.
 * This script has been modified to:
 *
 * 1) Reserve the top 32 bytes of RAMLoc32 for use by the IAP
 *    programming routines, as described in the LPC17xx User
 *    Manual.
 *
 */

MEMORY
{
  /* Define each memory region */
  MFlash512 (rx) : ORIGIN = 0x0,        LENGTH = 0x80000 /* 512k */
  RamLoc32 (rwx) : ORIGIN = 0x10000000, LENGTH = 0x7FE0  /* 32k - 32bytes */
  RamAHB32 (rwx) : ORIGIN = 0x2007c000, LENGTH = 0x8000  /* 32k */
}

/* Define a symbol for the top of each memory region */
__top_MFlash512 = 0x0        + 0x80000;
__top_RamLoc32  = 0x10000000 + 0x7FE0;
__top_RamAHB32  = 0x2007c000 + 0x8000;

