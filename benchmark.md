
# Benchmark findings

## Initial configuration

The method used was to go through every possible key starting at 0 and until one allows ' end' to be and the end of the message. It doesn't decrypt the message every time, but only checks the letters at the location of the expected ' end'

With key 09040
0.2557879999949364

With key 70295
1.6387249999970663

The further the key is from 0 and the closer it is to 99999, the longer this method will take.

## 
