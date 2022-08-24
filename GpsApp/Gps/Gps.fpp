module GpsApp {

    @ Component for working with a GPS device
    active component Gps {

        #-----
        # general ports
        #-----

        #-----
        # special ports
        #-----

        @ command receive port
        command recv port cmdIn

        @ command registration port
        command reg port cmdRegOut

        @ command response port
        command resp port cmdResponseOut

        @ event port
        event port eventOut

        @ text event port
        text event port textEventOut

        @ time get port
        time get port timeGetOut

        @ telemetry port
        telemetry port tlmOut

        @ output port for writing commands over UART to device
        output port serialWrite: Drv.SerialWrite

        @ receive serial data port to read data from UART
        async input port serialRecv: Drv.SerialRead

        @ serial buffer port for device to write into over UART
        output port serialBufferOut: Fw.BufferSend
    
        #-----
        # commands
        #-----

        @ force an EVR reporting lock status
        async command REPORT_STATUS \
        opcode 0

        @ force cold start on reboot
        async command COLD_START \
        opcode 1

        #-----
        # events
        #-----

        @ notification on GPS lock acquired
        event GPS_LOCK_ACQUIRED \
        severity activity high \
        id 0 \
        format "GPS lock acquired"

        @ warning on GPS lock lost
        event GPS_LOCK_LOST \
        severity warning high \
        id 1 \
        format "GPS lock lost"
        

        #-----
        # telemetry
        #-----

        @ current latitude
        telemetry LATITUDE: F32 id 0

        @ current longitude
        telemetry LONGITUDE: F32 id 1

        @ current altitude
        telemetry ALTITUDE: F32 id 2

        @ current number of satellites
        telemetry SV_COUNT: U32 id 3

        @ current lock status
        telemetry LOCK_STATUS: U32 id 4

        @ current GPS-relative velocity
        telemetry VEL_KM_SEC: F32 id 5

        @ current true ground track
        telemetry TRACK_TRUE_DEG: F32 id 6

        @ current magnetic heading
        telemetry TRACK_MAG_DEG: F32 id 7

        @ current magnetic variation
        telemetry MAG_VAR_DEG: F32 id 8

        @ current dilution of precision
        telemetry PDOP: F32 id 9
    } 
}