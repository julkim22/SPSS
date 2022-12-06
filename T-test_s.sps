* Encoding: UTF-8.
* data 불러오기.
get FILE=
 
dataset name child1 WINDOW=FRONT. 

***one-sample t-test
초4 아동이 평일에 부모님(부모님이 안 계신 경우에는 보호자)과  함께 보내는 시간은 평균 5시간이다?
(YFAM1A01w1, YFAM1A02w1).

COMPUTE famtime=

VARIABLE LABELS famtime '평일 부모님과 함께 보내는 시간'.




------------------------------------------------------------------------------------------------

***독립표본 t-test. 
*우울점수 생성(YPSY4E01w1 to YPSY4E10w1).

compute depression=

*성별에 따른 우울의 차이.



*삶의 만족도(YPSY1A01w1 to  YPSY1A05w1).
compute lifesat=

*성별에 따른 삶의 만족도의 차이.


-----------------------------------------------------------------------------------------------------------

***대응표본 t-test: 1, 2년도 우울수준의 차이. 

get FILE=

dataset name child2 WINDOW=FRONT.

*wave2 우울 변수 생성(YPSY4E01w2 to YPSY4E10w2).
compute depression2=


*기준변수(HID, PID) 오름차순으로 정렬.


*wave 1, 2 data 병합

MATCH FILES 


SAVE OUTFILE=
/COMPRESSED.


*paired t-test.


*paired t-test 다른 방식.



*1, 2년도 생활만족도의 차이. 

*wave2 삶의 만족도 변수 생성(YPSY1A01w2 to  YPSY1A05w2).
compute lifesat2=

*paired t-test.





