room(z06,3,[hcapped]).
room(z10,10,[hcapped, smartboard]).

occupancy(z06, 8 , cse341).
occupancy(z06, 9 , cse341).
occupancy(z06, 10, cse341).
occupancy(z06, 11, cse341).
occupancy(z06, 13, cse331).
occupancy(z06, 14, cse331).
occupancy(z06, 15, cse331).
occupancy(z11, 8 , cse343).
occupancy(z11, 9 , cse343).
occupancy(z11, 10, cse343).
occupancy(z11, 11, cse343).
occupancy(z11, 14, cse321).
occupancy(z11, 15, cse321).
occupancy(z11, 16, cse321).

occupancy(z06, 12).
occupancy(z06, 16).
occupancy(z11, 12).
occupancy(z11, 13). 

course(cse341, genc    , 10, 4, z06, [smartboard]).
course(cse343, turker  , 6 , 3, z11, [hcapped, smartboard]).
course(cse331, bayrakci, 5 , 3, z06, [projector]).
course(cse321, gozupek , 10, 4, z11, [hcapped, smartboard]).

student(1,  [cse341,cse343,cse331],no).
student(2,  [cse341,cse343],       no).
student(3,  [cse341,cse331],       no).
student(4,  [cse341],              no).
student(5,  [cse343,cse331],       no).
student(6,  [cse341,cse343,cse331],yes).
student(7,  [cse341,cse343],       no).
student(8,  [cse341,cse331],       yes).
student(9,  [cse341],              no).
student(10, [cse341,cse321],       no).
student(11, [cse341,cse321],       no).
student(12, [cse343,cse321],       no).
student(13, [cse343,cse321],       no).
student(14, [cse343],              no).
student(15, [cse343],             yes).

instructor(genc   , cse341, [hcapped]).
instructor(turker , cse343, [smartboard]).
instructor(gozupek, cse321, [smartboard]).
instructor(bayrakci,cse331, []          ).


same([], []).
same([H1|T1], [H2|T2]):- H1 = H2, same(T1, T2).

count(_, [], 0). 
count(X, [X | T], N) :- !, count(X, T, N1), N is N1 + 1.
count(X, [_ | T], N) :- count(X, T, N). 


/* 1. query - Check whether there is any scheduling conflict.    */
/* H: conflict hours - calling: conflicts(CourseID1,CourseID2,H) */
conflicts(CourseID1,CourseID2,H):-occupancy(X, XTIME , CourseID1),occupancy(Y, YTIME , CourseID2), XTIME =:= YTIME, not(X=Y), H is XTIME.

/* 2. query - Check which room can be assigned to a given class. */
/* 3. query - Check which room can be assigned to which classes  */
/* CA1,CA2: capacity status - E1,E2: equipment lists     	     */
assign(RoomID,CourseID):-	instructor(I1,CourseID,E1),
							room(RoomID,CA1,E2),
							course(CourseID, I2, CA2, H,C, E3), 
							not(H=0),  C \="", CA1>=CA2, not(E1=[]), same(E2,E3), I1 = I2.

/* 4. query - Check whether a student can be enrolled to a given class */
/* 5. query - Check which classes a student can be assigned */
/* CL: course list, H1,H2: hcapped and neededd                         */
enroll(StudentID,CourseID):-student(StudentID,CourseList,YesNo), 
							course(CourseID,I,CA,H,C,EquipmentList), not(H=0), C \="", I \= "", not(CA=0), 
							count(CourseID,CourseList,R1), R1 =:= 0,
							count(hcapped,EquipmentList,R2),(YesNo==yes->not(R2=0);R2>=0).