:- initialization(main).
last_element([], 'List is empty').
last_element([X], X).
last_element([_|T], Last) :-
    last_element(T, Last).

main :-
    % Example usage:
    last_element([1,2,3], Result),
    write(Result),
    nl,
    last_element([],Result),
    write(Result),
    nl.
