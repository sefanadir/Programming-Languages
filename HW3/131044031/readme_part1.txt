Part1 

Konu1:  sorgular nasıl çalıştıralacak
Konu2:  assert ile fact ekleme
*************************KONU1********************

1. query - Check whether there is any scheduling conflict.

run -> conflicts(CourseID1,CourseID2,C).
C parametresi derslerin hangi saatlerde çalıştığını görmek içindir.
Örnek çalıştırma ve sonuç
?- conflicts(cse331,cse321,C).
C = 14 ;
C = 15 ;

**************************************************
2. query - Check which room can be assigned to a given class.
run -> assign(RoomID,CourseID).
Örnek çalıştırma ve sonuç
?- assign(z10,cse321).
true.

?- assign(z10,cse331).
false.

**************************************************
3. query - Check which room can be assigned to which classes
run -> assign(RoomID, X).
X parametresi hangi sınıflara atanabileceğini görmek içindir.
Örnek çalıştırma ve sonuç
?- assign(z10,X).
X = cse343 ;
X = cse321.

**************************************************

4. query - Check whether a student can be enrolled to a given class
run -> enroll(StudentID,CourseID).
Örnek çalıştırma ve sonuç
?- enroll(14,cse343).  /* hcapped = no */
false.

?- enroll(14,cse341).  /* hcapped = no */
true 

?- enroll(15,cse321).  /* hcapped = yes */
true 

**************************************************

5. query - Check which classes a student can be assigned
run -> enroll(StudentID, X).
X parametresi hangi sınıflara atanabileceğini görmek içindir.
Örnek çalıştırma ve sonuç
?- enroll(4,X).
X = cse343 ;
X = cse331 ;
X = cse321 ;

?- enroll(14,X).
X = cse341 ;
X = cse331 ;
X = cse321 ;

*************************KONU2********************
Room Ekleme
Ekipmanlar liste içine aşağıdaki gibi eklenecektir.
assert(room(id,capacity,[equipment_1, equipment_2])).

Occupancy Ekleme
assert(occupancy(id, hour , course)).
Eğer o saatte ders yoksa occupancy ekleme
assert(occupancy(id, hour)).

Course Ekleme
İhtiyaçlar(needs) liste içine aşağıdaki gibi eklenecektir.
assert(course(id, instructor, capacity, hour, room, [needs_1,needs2, ...])).

Student Ekleme
Öğrencinin kurs bilgileri listeşeklinde aşağıdaki gibi eklenecektir.
assert(student(SID,  [course_1,course_2,course_3,...],Hcapped)).

Instructor Ekleme
Instructur assert edilirken ihtiyaçlar(needs) aşağıdaki gibi listeye eklenecektir.
assert(instructor(ID   , courses, [needs_1,needs_2,...])).





