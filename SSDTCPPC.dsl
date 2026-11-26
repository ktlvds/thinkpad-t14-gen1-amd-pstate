DefinitionBlock ("", "SSDT", 1, "LENOVO", "CPPCMOD", 0x00000001)
{
    External (_SB_.PLTF.C000, DeviceObj)
    External (_SB_.PLTF.C001, DeviceObj)
    External (_SB_.PLTF.C002, DeviceObj)
    External (_SB_.PLTF.C003, DeviceObj)
    External (_SB_.PLTF.C004, DeviceObj)
    External (_SB_.PLTF.C005, DeviceObj)
    External (_SB_.PLTF.C006, DeviceObj)
    External (_SB_.PLTF.C007, DeviceObj)
    External (_SB_.PLTF.C008, DeviceObj)
    External (_SB_.PLTF.C009, DeviceObj)
    External (_SB_.PLTF.C00A, DeviceObj)
    External (_SB_.PLTF.C00B, DeviceObj)
    External (_SB_.A111, FieldUnitObj)
    External (_SB_.A112, FieldUnitObj)
    External (_SB_.A113, FieldUnitObj)
    External (_SB_.A114, FieldUnitObj)
    External (_SB_.A115, FieldUnitObj)
    External (_SB_.A116, FieldUnitObj)
    External (_SB_.A117, FieldUnitObj)
    External (_SB_.A118, FieldUnitObj)

    Name (CPTR, Zero)

    // Ask the SMU to fill CAP1 before the kernel reads it
    Method (CPIN, 0, Serialized)
    {
        If (CPTR)
        {
            Return ()
        }

        If (Acquire (\_GL, 0x0064))
        {
            Return ()
        }

        \_SB.A111 = Zero
        Local0 = 0x14
        While ((\_SB.A111 != Zero) && (Local0 != Zero))
        {
            Sleep (0x05)
            Local0--
        }

        If (\_SB.A111 != Zero)
        {
            Release (\_GL)
            Return ()
        }

        CPTR = One

        \_SB.A112 = Zero
        \_SB.A113 = 0x00200000
        \_SB.A114 = Zero
        \_SB.A115 = Zero
        \_SB.A116 = Zero
        \_SB.A117 = Zero
        \_SB.A118 = 0x05

        Local0 = 0x14
        While ((\_SB.A111 == Zero) && (Local0 != Zero))
        {
            Sleep (0x05)
            Local0--
        }

        Release (\_GL)
    }

    //Restore CPPC after wakeup
    Method (_TTS, 1, NotSerialized)
    {
        If (Arg0 == Zero) //S0
        {
            CPTR = 0
            \CPIN ()
        }
    }

    Name (CPKG, Package (0x17)  // _CPC: Continuous Performance Control
    {
        0x17, 
        0x03, 
        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x18,               // Bit Offset
                0x00000000C00102B0, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x10,               // Bit Offset
                0x00000000C00102B0, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x08,               // Bit Offset
                0x00000000C00102B0, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x00,               // Bit Offset
                0x00000000C00102B0, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x10,               // Bit Offset
                0x00000000C00102B3, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x08,               // Bit Offset
                0x00000000C00102B3, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x00,               // Bit Offset
                0x00000000C00102B3, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x40,               // Bit Width
                0x00,               // Bit Offset
                0x00000000000000E7, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x40,               // Bit Width
                0x00,               // Bit Offset
                0x00000000000000E8, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x02,               // Bit Width
                0x00,               // Bit Offset
                0x00000000C00102B2, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x01,               // Bit Width
                0x00,               // Bit Offset
                0x00000000C00102B1, // Address
                0x04,               // Access Size
                )
        }, 

        0x00000001, 
        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        ResourceTemplate ()
        {
            Register (FFixedHW, 
                0x08,               // Bit Width
                0x18,               // Bit Offset
                0x00000000C00102B3, // Address
                0x04,               // Access Size
                )
        }, 

        ResourceTemplate ()
        {
            Register (SystemMemory, 
                0x00,               // Bit Width
                0x00,               // Bit Offset
                0x0000000000000000, // Address
                ,)
        }, 

        0x00000190, 
        0x00000834
    })

    Scope (\_SB.PLTF.C000)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C001)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C002)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C003)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C004)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C005)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C006)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C007)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C008)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C009)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C00A)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }

    Scope (\_SB.PLTF.C00B)
    {
        Method (_CPC, 0, NotSerialized)
        {
            \CPIN ()
            Return (\CPKG)
        }
    }
}