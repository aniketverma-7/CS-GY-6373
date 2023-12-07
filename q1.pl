:- initialization(main).
findMax([X], X).
findMax([Head | Tail], Max) :-
    findMax(Tail, TailMax),
    (Head > TailMax -> Max = Head ; Max = TailMax). 

% Example usage:
main :- findMax([3, 8, 2, 5, 10], Max), write('Max: '), write(Max), nl.
