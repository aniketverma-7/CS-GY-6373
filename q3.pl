:- initialization(main).

union([], [], 'Both Lists are Empty').
union([], L, L).
union([H | T], L, Result) :- member(H, L), !, union(T, L, Result).
union([H | T], L, [H | Result]) :- union(T, L, Result), \+ member(H, Result).

unique_elements([], []).
unique_elements([H | T], Unique) :- member(H, T), !, unique_elements(T, Unique).
unique_elements([H | T], [H | Unique]) :- unique_elements(T, Unique).

unique_elements_sorted([], 'List is empty').
unique_elements_sorted(List, Result) :- unique_elements(List, Temp), 
                                         sort(Temp, Result).

main :-
    union([],[], List),
    unique_elements_sorted(List, Result),
    write(Result),
    nl,
    union([1,2,3,4,5], [1,2,2,3,2,3,3,6,6,32], List1),
    unique_elements_sorted(List1, Result1),
    write(Result1),
    nl.
