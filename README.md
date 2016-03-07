The project contains different functions in Haskell created to solve the following tasks. Each task refers to a file .hs with the corresponding number.

•	Task 1.1
Write a function that, given a list, produces a sum of all even numbers in the list. E.g. from the list [1,2,3,4,5] your function should produce 6.

•	Task 1.2
Write a function that takes a list as input and produces a list that has every other member of the original list starting from the first. E.g. from the list [1,2,3,4,5] the function produces the list [1,3,5].

•	Task 1.3
Suppose that we represent phone contact data with tuples (name,phone) in a list, where both name and phone are strings, e.g. [("bob","+1234567"),("alice","03543654")]. Write function findPhone that, given a name and a list, looks for a phone and answers with the phone number or informs that none is found, and findName, that similarly, given a phone number and a list, looks for a name. Write also a function to add an entry to the list, however not allowing an insertion if the name or the phone number already exists. 

•	Task 1.4
Suppose that we want to represent an integer as a list of numbers from 0 to 9. For instance, the integer 1002 would be represented as [1,0,0,2]. Write a function myIntToList that converts an Int into such a list, and another function myListToInt that converts such a list into the Int value.

•	Task 1.5
Suppose that the list of Task 1.4 is a number from which we want to calculate a Finnish Bank Transfer Reference Number (FBTRN, for short :) and by adding a check-digit at the end as follows:
1.	Multiply the values in the list, starting from the end, with values 7,3,1,7,3,1,...
2.	Add the values obtained from the multiplications, thus getting a value v.
3.	Subtract v from the next successor of v finishing with a 0 (the next multiple of 10) getting a value v'.
4.	If v' is 10, then add a 0 at the end of the input list, else add v' at the end of the input list.
For example, for the list [1,2,0,0,1] the sum of multiplications v is 24. The next multiple of 10 is 30. Subtracting v from 30 we get v' = 6. At Step 4, we add v' at the end of the list to get [1,2,0,0,1,6]. Write a function fbtrn to do calculate the check-digit and add it to the end.

•	Task 1.6
Write your own function for sorting a list in such a way that you only access the elements of the list by the ":" operator (that is, you take and add items to lists at the head of the list).

•	Task 2.1
Write a function that, given two lists, computes a list that contains all pairs such that the first element comes from the first list and the second element comes from the second list. E.g. from lists [1,2] and [3,4,5] the result is a list that contains pairs (1,3),(2,3),(1,4),(2,4),(1,5),(2,5) in some order.

•	Task 2.2
Write a function that is given the temperature in the form of a number (Int) and a unit (String), which can be Kelvin, Fahrenheit, or Celsius. Your function is supposed to tell if the weather is hot, warm, cold or very cold. You can choose the threshold values yourself. Use the case structure in your solution.E.g. from (-15) "Celsius" your function might say "It is cold". The parenthesis in input are there for a negative value.

•	Task 2.3
Write a function that computes the median value of a list of numbers. If you do not remember what a median value is, then it is easy to find this information from the Internet. E.g. for the list [1,3,2,4,3,3,3] the median value is 3.

•	Task 2.4
Write a function that computes the mode (most common item) from a list. If there are many, one is enough.E.g. for the list [1,3,2,4,3,3,3] the mode is 3

•	Task 2.5
Given a string, detect a palindrome substring of maximum length. If there are many with equal length, just one is enough. Palindrome is a string that is the same from beginning to end and from end to beginning. E.g. for the string "saippuakauppias" the answer is "saippuakauppias". That's a famous Finnish palindrome.

•	Task 2.6
Write a function that, given a string and a minimum length minLength, creates a list with all (n,palindr) pairs, where palindr is a palindrome of at least minLength length and n is the number of occurrences of palindr in the string given to the function. A couple of quickly invented (but hopefully correct :) examples: If the input string is "abacaaba" and minLength is 3, then the output is [(2,"aba"),(1,"aca")]. If the input string is "aaabbbcccc" and minLength is 3, then the output is [(1,"aaa"),(1,"bbb"),(2,"ccc"),(1,"cccc")]

•	Task 3.1
Write a solution to Task 1.1 in such a way that you make a function that evaluates to 0 for odd numbers and otherwise to the input number. Then calculate the answer by mapping that function to the list and summing the result.

•	Task 3.2
Same as Task 3.1 but use a lambda.

•	Task 3.3
Define combineWith which takes a predicate p, a function f, and two lists. If p is true to a value pair x and y, where x is from the first list and y from the second, then f is applied to x and y to produce an item for the output list.

•	Task 3.4
Rewrite the solutions of 2.5 and 2.6 (sorry, I put 3.5 and 3.6 initially, hope they make sense now) in such a way that you make a Palindrome module where you place some of the helping functions in the module and the main functions in a separate program file.

•	Task 3.5
Implement simple phonebook management and find functions (at least the ones in Task 1.3) using the Data.Map module.

•	Task 3.6
Implement functions to cipher and decipher the (simple) Vigenere cipher, given the text and the keyword used in the cipher. Consult the Internet for details.

•	Task 4.1
Make a program that repeatedly reads lines from standard input, until an empty line comes in the input. When the empty input line comes, your program prints the lines in sorted order.

•	Task 4.2
Write a program that is given a phonebook file name in the command line. Ehac line of the file contains a name and a number. The program reads the file and then allows you to search for numbers by the name and names by a number (reads command for searching names and numbers from standard input and answers to standard output).

•	Task 4.3
Write programs to cipher and decipher, reading standard input and writing to standard output. Possible paramaters are given from command line. So, if you use Vigenere's cipher, you give the key as a command line argument. You may implement some other ciphering method, if you wish.

•	Task 4.4
Using data statement, define boolean 3-valued logic, in which the possible truth values area True3, False3, and Unk3. Define the boolean functions and3, or3 and not3, that operate on these truth values (if an argument is unknown, then your functions must behave reasonably, e.g. for and3 False3 Unk3 we know that the result is False3, but for and3 True3 Unk3 it should be Unk3.

•	Task 4.5
Make a type Maybe3, in which the data is either Just3 x, Unknown3, or Missing3. Implement a comparison function for equality, which returns values of Bool3 (Task 4.4). (NOTE: You should pick some other name than eq for your function). The difference between unknown and missing values is that comparing missing with something gives False3, whereby comparing unknown values with something else than missing gives Unk3.

•	Task 4.6
Make a YesNoMaybe typeclass which requires implementation of function: yesnomaybe :: a -> Bool3
Make Maybe3 a member of this typeclass.

•	Task 5.1
Implement a a data type for Point with integer coordinates, and a function to move from one point to another. Make the Point type a monoid.Since I have received some questions about this, I will give this explanation. To make the Point type a monoid, you have to choose the function (which is to be the mappend function) in a suitable way. A suitable function for moving from one point to another is e.g. a a function "move x y", which adds x to the previous x coordinate and y to the previous y coordinate. 

•	Task 5.2
Make Maybe3 (from Task 4.5) an applicative functor and implement the function to move from one Maybe3 Point to another using the <*> function.

•	Task 5.3
Make Maybe3 (from Task 4.5) a Monad and implement the function to move from one Maybe3 Point to another using the >>= function.

•	Task 5.4
Implement a function to give n pairs of integers from the range [-10,10] as a list of integer pairs. The list should have n pairs. Each integer should be from the range [-10,10]. Doing this exercise using random number generation will help you to solve Task 5.6. 

•	Task 5.5
Implement a function that for a list of Maybe3 points generates a list like in Task 5.4 with the same length as the Maybe3 list has, and add the generated pairs to the Maybe3 points (zipping, that is, one pair is added to one point.

•	Task 5.6
Make a program that first generates a list of Maybe3 points with x and y coordinates in range [-10,10] (the length of the list can be given as a command line argument and initially all are Just3 points). So for instance if your program is executed as "task5_6 15" then it will at first generate a list of 15 Maybe3 points.Then your program reads commands from the standard input and does the following:

•	Task 6.1
Using the Writer monad, make a function that given a string and a minimum length:
1.	Finds the longest palindrome that is longer than the minimum length, and 
2.	Collects a "log" (of type [String]) of all palindromes that is has found of at least the minimum length.

•	Task 6.2
Same as Task 6.1 but using DiffList type for the log.

•	Task 6.3
Extend the stateful computation stack example from the book (Tasteful stateful computations, Learn you a Haskell) with functions where the

•	Task 6.4
Write a program that, given two integers a and b as arguments, creates one thread to compute a^b and another to compute b^a, collects the results, and tells which was bigger.

