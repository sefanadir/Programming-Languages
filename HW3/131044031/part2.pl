flight(istanbul  , izmir     ,3).
flight(istanbul  , ankara    ,2).
flight(istanbul  , trabzon   ,3).
flight(ankara    , istanbul  ,2).
flight(ankara    , izmir     ,6).
flight(ankara    , trabzon   ,6).
flight(ankara    , kars      ,3).
flight(ankara    , diyarbakır,8).
flight(izmir     , istanbul  ,3).
flight(izmir     , ankara    ,6).
flight(izmir     , antalya   ,1).
flight(antalya   , diyarbakır,5).
flight(antalya   , izmir     ,1).
flight(antalya   , erzurum   ,2).
flight(diyarbakır, ankara    ,8).
flight(diyarbakır, antalya   ,5).
flight(trabzon   , istanbul  ,3).
flight(trabzon   , ankara    ,6).
flight(kars      , gaziantep ,3).
flight(kars      , ankara    ,3).
flight(gaziantep , kars      ,3).
flight(edirne    , erzurum   ,5).
flight(erzurum   , edirne    ,5).
flight(erzurum   , antalya   ,2).

route(X, Y, C) :- flight(X, Y, C).
route(X, Y, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
                    C is C1 + C2.
route(X, W, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
                    C is C1 + C2+C3 .
route(X, A, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
					flight(W, A, C4),
					not(X=A),
					not(Z=A),
					not(Y=A),
                    C is C1 + C2+ C3 +C4 .
route(X, B, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
					flight(W, A, C4),
					not(X=A),
					not(Z=A),
					not(Y=A),
					flight(A, B, C5),
					not(X=B),
					not(Z=B),
					not(Y=B),
					not(W=B),
                    C is C1 + C2+ C3 +C4 + C5 .
route(X, Q, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
					flight(W, A, C4),
					not(X=A),
					not(Z=A),
					not(Y=A),
					flight(A, B, C5),
					not(X=B),
					not(Z=B),
					not(Y=B),
					not(W=B),
					flight(B, Q, C6),
					not(X=Q),
					not(Z=Q),
					not(Y=Q),
					not(W=Q),
					not(A=Q),
                    C is C1 + C2+ C3 + C4 + C5 + C6 .
route(X, L, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
					flight(W, A, C4),
					not(X=A),
					not(Z=A),
					not(Y=A),
					flight(A, B, C5),
					not(X=B),
					not(Z=B),
					not(Y=B),
					not(W=B),
					flight(B, Q, C6),
					not(X=Q),
					not(Z=Q),
					not(Y=Q),
					not(W=Q),
					not(A=Q),
					flight(Q, L, C7),
					not(X=L),
					not(Z=L),
					not(Y=L),
					not(W=L),
					not(A=L),
					not(B=L),
                    C is C1 + C2+ C3 + C4 + C5 + C6 +C7 .
route(X, K, C) :- flight(X, Z, C1),
                 	flight(Z, Y, C2),
					not(X=Y),
					flight(Y, W, C3),
					not(X=W),
					not(Z=W),
					flight(W, A, C4),
					not(X=A),
					not(Z=A),
					not(Y=A),
					flight(A, B, C5),
					not(X=B),
					not(Z=B),
					not(Y=B),
					not(W=B),
					flight(B, Q, C6),
					not(X=Q),
					not(Z=Q),
					not(Y=Q),
					not(W=Q),
					not(A=Q),
					flight(Q, L, C7),
					not(X=L),
					not(Z=L),
					not(Y=L),
					not(W=L),
					not(A=L),
					not(B=L),
					flight(L, K, C8),
					not(X=K),
					not(Z=K),
					not(Y=K),
					not(W=K),
					not(A=K),
					not(B=K),
					not(Q=K),
                    C is C1 + C2+ C3 + C4 + C5 + C6 +C7 +C8.