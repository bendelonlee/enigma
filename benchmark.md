
# Benchmark findings

## Initial configuration

The method used was to go through every possible key starting at 0 and until one allows ' end' to be and the end of the message. It doesn't decrypt the message every time, but only checks the letters at the location of the expected ' end'

With key 09040
0.2557879999949364

With key 70295
1.6387249999970663

The further the key is from 0 and the closer it is to 99999, the longer this method will take.

## State vs. behavior
I tried moving which_amount_at_beginning_of_assumption_string from behavior to state. Results were negligible.

With key 70295
1.632259999998496

I moved positive_assumption_location from behavior to state. The decrease in time was minor

With key 70295
1.5791469999967376
