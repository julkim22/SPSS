* Encoding: UTF-8.
* data 불러오기.


* 긍정적 양육태도(따스함, 자율성 지지, 구조제공 각 4문항).
compute positive=mean( YFAM2A01w1 to  YFAM2A04w1,  YFAM2C01w1 to  YFAM2C04w1,  YFAM2E01w1 to  YFAM2E04w1).
VARIABLE LABELS positive '긍정적 양육태도'.

compute lifesat=mean( YPSY1A01w1 to YPSY1A05w1).
VARIABLE LABELS lifesat '삶의 만족도'.

***simple regression.
Regression 
/Dependent lifesat
/Method enter positive. 
Regression 
/Dependent lifeboat
/method=enter positive
/Scatterplot=(*ZRESID, *ZPRED)
/residuals normprob(ZRESID) Durbin

***multiple regression: 긍정적 양육태도, 긍정적 친구관계(YEDU2A01w1 to YEDU2A08w1), 건강(YPHY1A00w1)-> 삶의 만족도.

*긍정적 친구관계.
Compute friend=mean(YEDU2A01w1 to YEDU2A08w1). 
Variable labels friend '긍정적 친구관게'. 

Reliability
/Variables=YEDU2A01w1 to YEDU2A08w1
/scale(friend)=all. 

*건강.
Rename variables YPHY1A00w1=health. 
Reliability
/Variables=YPHY1A00w1
/scale(health)=all. 

Graph
/scatterplot positive with lifesat.

Graph 
/Scatterplot health with lifesat. 

Correlations positive friend health lifesat. 
/print=NOSIG. 
 
Regression
/Statistics defaults TOL
/Dependent lifesat
?method enter positive friend health. 


*삶의 만족도에 영향을 미치는 요인에 대한 위계적 회귀분석.
REGRESSION 
/statistics defaults  TOL CHANGE
/Dependent lifesat
/Method enter positive friend
/method enter health. 

*dependent 부명령문 뒤에는 method가 따라와야 함.


*더미변수 만들기(도시규모).
FREQUENCIES  ARA2Aw1.
Compute region1=(ARA2Aw1=2)
Variable labels region1'중ㄷ소도시'.
Compute region2=(ARA2Aw1=3)/ 
Variable labels region2 '읍면지역'. 
 Compute region3=(ara2aw1)=1
Variable labels region3 'seoul'


Frecuencies region1 region2. 

*더미변수 만들기(성별).

Compute female=(YGENDERw1=2).
Frequencies YGENDERw1 female.  


*** multiple regression: 긍정적 양육태도, 긍정적 친구관계, 건강, 도시규모, 성별-> 삶의 만족도.

Regression
/statistics Deafaults TOL
/dependent lifesat
/method enter positive friend health region1 region2 female. 

Regression 
/statisstics defaults TOL
/dependent lifesat
Method enter positive friend health region 1 region3 region2 female.

