#!/bin/bash
java -jar -Xms512m -Xmx12G -XX:+UnlockExperimentalVMOptions -XX:+UseZGC apex-blockchain-core.jar settings.conf
