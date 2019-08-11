#!/bin/bash
java -jar -Xms512m -Xmx12G -XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=6500 -XX:G1HeapRegionSize=32M apex-blockchain-core.jar settings.conf
