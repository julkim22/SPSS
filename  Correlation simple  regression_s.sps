* Encoding: UTF-8.
* data 불러오기.
cd
get FILE=

*산점도 보기(키와 몸무게: YPHY2A00w1, YPHY2B00w1).

*상관분석.



***simple regression.

*긍정적 양육태도-> 삶의 만족도.
*삶의 만족도.
compute lifesat=mean( YPSY1A01w1 to YPSY1A05w1).
VARIABLE LABELS lifesat '삶의 만족도'.


* 긍정적 양육태도(따스함, 자율성 지지, 구조제공 각 4문항
YFAM2A01w1 to YFAM2A04w1 YFAM2C01w1 to  YFAM2C04w1  YFAM2E01w1 to  YFAM2E04w1).

compute positive
VARIABLE LABELS positive '긍정적 양육태도'.




---------------------------------------------------------------------
*부정적 양육태도-> 삶의 만족도.

*부정적 양육태도(거부, 강요, 비일관성 각 4문항
YFAM2B01w1 to  YFAM2B04w1,  YFAM2D01w1 to  YFAM2D04w1,  YFAM2F01w1 to  YFAM2F04w1).
compute negative
VARIABLE LABELS negative '부정적 양육태도'.






