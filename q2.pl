:- initialization(main).
hasIntersection([], _) :-fail.
hasIntersection([H|_], List) :-member(H, List),!.
hasIntersection([_|T], List) :- hasIntersection(T, List).

checkIntersectionResult(List1, List2) :- 
		(hasIntersection(List1, List2) -> write('Intersection found.');
																			write('Intersection not found.')).

main :- checkIntersectionResult([1,2,3], [1,4,5,6]), nl, 
				checkIntersectionResult([1,2,3], [4,5,6]), nl, 
				checkIntersectionResult([], []), nl.
