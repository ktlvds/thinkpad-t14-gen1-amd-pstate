# AMD P-State for ThinkPad T14 Gen 1 AMD (20UD0011RT)

This SSDT enables `amd-pstate` in `active` or `guided` modes by initializing CPPC.

Tested on the Ryzen 5 PRO 4650U with BIOS **1.54 (`R1BET85W`)**.

## Installation

Build the table with `iasl` from the `acpica` package:

```sh
iasl -sa SSDTCPPC.dsl
```

Load the resulting `SSDTCPPC.aml` as an additional table using an [ACPI table override](https://wiki.archlinux.org/title/DSDT#Using%20modified%20code). On Arch Linux with `mkinitcpio`, use the `acpi_override` hook.

Boot with `amd_pstate=active` or `amd_pstate=guided`. The kernel may still log `The CPPC feature is supported but currently disabled by the BIOS` even when the driver is working.
