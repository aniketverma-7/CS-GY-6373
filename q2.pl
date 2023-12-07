hasIntersection([], _) :- fail.
hasIntersection([H|_], List) :- member(H, List), !.
hasIntersection([_|T], List) :- hasIntersection(T, List).

checkIntersectionResult([], []) :-
    write('Both List is empty.'),
    nl.
    
checkIntersectionResult([], List2) :-
    write('List 1 is empty.'),
    nl.
checkIntersectionResult(List1, []) :-
    write('List 2 is empty.'),
    nl.
    
checkIntersectionResult(List1, List2) :- 
    (hasIntersection(List1, List2) -> 
        write('Intersection found.');
        write('Intersection not found.')
    ),
    nl.

main :- 
    checkIntersectionResult([1,2,3], [1,4,5,6]), 
    checkIntersectionResult([1,2,3], [4,5,6]), 
    checkIntersectionResult([], []),
    checkIntersectionResult([], [4,5,6]),
    checkIntersectionResult([1,2,3], []),
    nl.

:- initialization(main).
