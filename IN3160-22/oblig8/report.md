
# Task a)
I created the self-test unit, and changed the previous self-test system I had to include all the new components. I have also modified the code so that it can read values from a ROM.dat file instead of hardcoding them. 


# Task b)
I have modified the PWM architecture from a Mealy machine to a Moore machine, but I don't think I succesfully have amended the frequency error. I tried playing around with some delays, but no matter what I did I wasn't passing getting any EN values to be updated by running the testbench provided by the assignment.

# Task c)
Creating the synchronization modules seemed to be straightforward. I haven't been able to pass the tests though (maybe I should have had created yet another test module?)

# Task d)
Given the schematics for the quadrature decoder, it seemed easy to implement... although I can't confidently say I understand what exactly it does. I gave its testbench some random values for testing.


# Task e)
I connected everything in the self_test_system architecture, having to cast the type between Di and velocity which connects seg7ctrl to the velocity.


