:- initialization(main).
findMax([X], X).
findMax([],'List Empty').
findMax([Head | Tail], Max) :-
    findMax(Tail, TailMax),
    (Head > TailMax -> Max = Head ; Max = TailMax). 

% Example usage:
main :- findMax([1,10,2,3,2,3], Max), write('Result: '), write(Max), nl.
