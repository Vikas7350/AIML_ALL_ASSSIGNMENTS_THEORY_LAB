% =========================================================
%           COLLEGE LIBRARY CHATBOT
% =========================================================


% =========================================================
% FACTS
% =========================================================

% Library location
library_location(alandi).

% Areas in the library
area(reading_hall).
area(book_section).
area(reception).
area(cabin_1).
area(cabin_2).

% Reading hall has benches
has_benches(reading_hall).

% Number of cabins
number_of_cabins(2).

% Books available in the library
book(python).
book(java).
book(cpp).
book(artificial_intelligence).
book(data_structures).


% =========================================================
% RULES
% =========================================================

% A place is a library area if it is defined as an area
library_area(X) :-
    area(X).

% A book is available if it is present in the library
book_available(X) :-
    book(X).

% The library has cabins if the number of cabins is
% greater than zero
has_cabins :-
    number_of_cabins(N),
    N > 0.


% =========================================================
% CHATBOT
% =========================================================

% Start the chatbot
start :-
    nl,
    write('======================================'), nl,
    write('       COLLEGE LIBRARY CHATBOT'), nl,
    write('======================================'), nl,
    write('Hello! I am your Library Assistant.'), nl,
    write('You can ask me about the library.'), nl,
    write('Type stop. to exit.'), nl,
    nl,
    chat.


% ---------------------------------------------------------
% Chat loop
% ---------------------------------------------------------

chat :-
    write('You: '),
    read(Input),
    respond(Input).


% =========================================================
% CHATBOT RESPONSES
% =========================================================

% Exit the chatbot
respond(stop) :-
    write('Bot: Goodbye! Have a nice day.'), nl.


% Library location
respond(location) :-
    library_location(Location),
    write('Bot: The library is located in '),
    write(Location),
    write('.'), nl,
    chat.


% Display all library areas
respond(areas) :-
    write('Bot: The library has the following areas:'), nl,
    write('- Reading Hall'), nl,
    write('- Book Section'), nl,
    write('- Reception'), nl,
    write('- Cabin 1'), nl,
    write('- Cabin 2'), nl,
    chat.


% Reading hall
respond(reading_hall) :-
    has_benches(reading_hall),
    write('Bot: Yes, the Reading Hall has benches.'), nl,
    chat.


% Number of cabins
respond(cabins) :-
    number_of_cabins(N),
    write('Bot: The library has '),
    write(N),
    write(' cabins.'), nl,
    chat.


% Check whether a book is available
respond(book(Book)) :-
    book_available(Book),
    write('Bot: Yes, '),
    write(Book),
    write(' is available in the library.'), nl,
    chat.


% If the requested book is not available
respond(book(Book)) :-
    \+ book_available(Book),
    write('Bot: Sorry, '),
    write(Book),
    write(' is not available in the library.'), nl,
    chat.


% Check whether a particular area exists
respond(section(Section)) :-
    library_area(Section),
    write('Bot: Yes, '),
    write(Section),
    write(' is a section of the library.'), nl,
    chat.


% If the section does not exist
respond(section(Section)) :-
    \+ library_area(Section),
    write('Bot: Sorry, that section is not available.'), nl,
    chat.


% Unknown question
respond(_) :-
    write('Bot: Sorry, I do not understand that question.'), nl,
    chat.