#!/bin/bash
java -jar -Xms512m -Xmx8G -XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC apex-blockchain-core.jar settings.conf
