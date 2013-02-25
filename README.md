# General Assembly - Career Fair Application Test

This is a very simple career fair application filter that was created for General Assembly. The initial instructions were as follows:

Write a program that prints the integers from 1 to 100. But for numbers divisible by 3 print "NYC" instead of the number, and for numbers divisible by 5 print "Tech". For numbers which are divisible by both 3 and 5 print "NYCTech". ("1, 2, NYC, 4, Tech"...and so forth.)

This is how applicants could submit their answers:

* Send a POST request to: [http://ga-programming-fundamentals.herokuapp.com/apply](http://ga-programming-fundamentals.herokuapp.com/apply)
* Make sure the Content-Type is set to application/json.
* Include the following keys as valid JSON:
    * name: A string with your name (required)
    * email: A string with your email address (required)
    * answer: A string with the number of 'NYCTech' occurrences for the integers from 1 to 1000 (required)
* You will receive a 201 response on success with a message saying "Application submited. Thank you." If you apply multiple times, we will look at your latest application.


## How do I test to see if this thing works?

To succeed:

    $ curl -H "Content-type: application/json" -d '{"name":"somebody", "email":"email@example.com", "answer":"66"}' http://ga-programming-fundamentals.herokuapp.com/apply


To fail (note here I used 'mail' instead of 'email' - both name and email are required fields):

    $ curl -H "Content-type: application/json" -d '{"name":"somebody", "mail":"email@example.com", "answer":"66"}' http://ga-programming-fundamentals.herokuapp.com/apply

## Other

This code also includes an encrypter/ decrypter to solve [this](http://projecteureka.org/problem/question/1037). We basically asked applicants to follow the same rules but the key phrase was: "Welcome to the General Assembly community".

Correct answer:

"101110111000100010111010100011101011101000111011101110001110111000100000001110001110111011100000001110001010101000100000001110111010001000111010001000101110100010111000101110101000000010111000101010001010100010001110111000111010101000101110101000111010111011100000001110101110100011101110111000111011100011101110001010111000111010001010001110001110101110111"

By the way, if you want to decrypt the Euler challenge, simply add this code at the end of cypher.rb.

    puts decrypt_message("1110001010101000100000001011101110001010101000101000101010001110001011101010001000111010101000101110101000111011101110001011101110001000101110100000001011101110001010101000111011101110000000111010111000101000111010111010001110101110001010100011100010111000101110100011100010001110101000000011101010001110111011100011101110001000101010001110001010001110101110100000001010100010111011101000111010111011100010100011101000111011101000000010111010001000101010111000100010111010100010111000111000101000111011101110001110100010101")

Then run this:
    
    $ ruby cypher.rb