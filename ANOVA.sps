* Encoding: UTF-8.
* data 불러오기.
cd
get FILE=
dataset name child1 WINDOW=FRONT. 

get
/keep hid pid PINCOME1w1.
DATASET name parent1 WINDOW=FRONT.
SORT CASES by hid pid.

DATASET ACTIVATE child1.
sort cases by hid pid.

MATCH FILES /FILE=*
/FILE='parent1'
/BY hid pid.

save OUTFILE=
/compressed.





***one-way ANOVA: 주관적 가정의 경제수준에 따른 삶의 만족도(YPSY1A01w1 to YPSY1A05w1)의 차이.

recode 
VARIABLE LABELS econo '주관적 가정의 경제수준'.
VALUE LABELS econo 1'하', 2'중', 3'상'.


compute lifesat
VARIABLE LABELS lifesat '삶의 만족도'.

*방법1.


*방법2.


***주관적 가정의 경제수준에 따른 우울의 차이(YPSY4E01w1 to YPSY4E10w1).
compute depression
VARIABLE LABELS depression'우울'.


 
*이분산일 때 Welch's F-test.


***사후 검정:scheffe.


*이분산일 때 사후검정: Games-Howell.



