"""
	Code imported from activity 4 at
	https://www.uio.no/studier/emner/matnat/ifi/IN1000/h19/Obligatoriske-innleveringer/in1000-oblig2-h2019.pdf
	
	Comments added by Rolf Vidar Hoksaas, the 29th August 2019 as a solution to the activity.

	Summarized answers to activity questions:
	
	1) No, the given code is illegal, no matter how it is used. It will raise an Exception at runtime.
	There is no compile time error, though, so code is run; but its implementation is destined to fail.
	
	2) The obvious Exception which is encountered is TypeError, whenever we try to add an integer. This 
	is a common practice in languages with soft typing, but this is not the case for this Python case.
	Adding an integer to a int-like string could mean we want to concatenate, but it could also mean we
	want the summation to return a string with the value of the integers summed together.

	Another common Exception we can encounter is ValueError, which would happen if the user inputs anything
	that is not an integer. This should be handled through an try-except block, and raising an AssertionError
	instead.

	Lastly, one could encounter a KeyboardInterrupt exception (or an EOFError), if the users decides to
	interrupt the code's execution through <Ctrl+C> or <Ctrl+D>, sending a SIGINT or SIGTERM, respectively.

	#) As a note, when copying the code directly from the PDF file in my case, I was getting a SyntaxError, 
	due to implicit ZeroWidthSpace characters being copied into the clipboard from the document viewer. Using
	`vim` to remove these with `:%s/\%u200b//g` solved this easily.

"""


# Depending on the version, input() pipes STDIN into the variable as a string, or as an evaluated value.
# The string "Tast inn et heltall" is piped to the standard output (and thus written to terminal in most cases)
a = input("Tast inn et heltall! ")

# Evaluates the value of `a`, and triest to store it into the variable `b`. If value is parsed as an integer, 
# it does this succesfully. Otherwise it raises a ValueError exception, and terminates the program after printing
# the program's backtrace.
b = int(a)

# Conditonally checks if b is lower than 10. Since b must be a b due to the previous line, this is true for 
# all integers below 10. This excludes 10, but includes 9. If conditonal check is true, it runs the following
# block of indented code
if b <10:
	# Due to the order of operations in Python, this first tries to evaluate `b + "Hei"`. By knowing the type of b
	# is an Integer, and knowing that `b+"Hei"` implicitly calls b.__add__("Hei"). Since the sum of a String and an Integer
	# isn't defined, this raises a TypeError exception, and terminates. The print statement is never reached. I am unable to
	# find out exactly where the TypeError is raised. I suspect this is implemented in Cython.
        print(b + "hei")
