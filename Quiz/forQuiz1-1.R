  ### sort vs rank vs order
  ```{r}
x= c(10, 15, 8, 22)
sort(x)
```

sort = 벡터 내 원소를 오름차순 정리

```{r}
rank(x)
```
rank = sort했을 경우 벡터 내 원소가 몇번째에 있을지 알려준다. 

```{r}
order(x)
```
order = sort한 상태의 벡터내 원소가 원래 몇번째였는지 알려준다.

*문제*
  ```{r}
order(c(12,5,9,20))
```

*문제*
  ```{r}
1:5 + 1:2
```

**위와 같이 길이가 맞지 않은 벡터를 계산할 때 recycle rule이 적용된다.**
  
  
  rev = 순서를 반대로 바꾼다.

```{r}
rev(sort(c(2,7,3)))
```
```{r}
rev(c(2,7,3))
```


---
  
  ### Inf, NaN
  R은 double precison 사용하여 Infinity까지 표현해준다.  
NaN Not a Number가 나오는 상황만 유의하자.

```{r}
3/0
exp(-Inf)
(0:3)^Inf
Inf-Inf
Inf/Inf
```

*문제*
  
  ```{r}
0/0
```

---
  
  *문제*
  
  고객명단 %>% group_by（거주지역） %>% summarize（지역평균=mean（소득금액）） 

위 식은 어떤 의미인가?
  
  답: 고객명단 데이터프레임에 있는 변수 중 거주지역 값 별로 소득금액의 평균값을 계산하여 지역평균 변수에 저장하라는의미 

%>% 는 chain operator, pipe operator 이고, dplyr 패키지 사용시에 쓸 수 있다.

*예시*
  ```{r}
worms = read.table('worms.txt', header = T)
head(worms)
```
```{r}
library(dplyr)
```
```{r}
worms %>% group_by(Vegetation) %>% summarize(AreaM = mean(Area), SlopeM = mean(Slope)) 
```

worms 데이터베이스 내 데이터를 Vegetation 변수의 값으로 나눠서 Area의 평균값을 AreaM, Slope의 평균값을 SlopeM 변수에 저장한다.

---
  
  ### coplot
  
  ```{r}
Ozone = read.table('ozone.txt', header = T)
head(Ozone)
```

```{r}
coplot(ozone~wind|temp, Ozone, panel = panel.smooth)
# figure margin too large는 Rstudio창 폭이 너무 작아서 생길 수 있음
```
temp를 6구간으로 나눠서 각 temp 하에 wind와 ozone의 관계를 plot해준다. ozone이 종속변수, wind가 독립변수.

---
  
  ### qunatmod 패키지 getSymbols 함수
  quantmod 패키지는 quantitative trader 즉, 퀀트(Quant)가 개발, 테스팅하는 과정을 보조하기 위해 만들어진 패키지다.  
getSymbols함수는 야후 파이낸스에서 시세를 받아온다.

---
  
  ### 문항수 증가에 따른 신뢰성 변화
  스피어만 브라운 예측 공식을 이용하면 문항수 증가에 따른 신뢰성을 알 수 있다. 이는 반분법(split-half method)을 통한 신뢰성 측정시 원래 문항에 비해 문항수가 작은 상태에서 신뢰성을 측정하기 때문에 이를 보완하기 위해 만들어진 공식이다. 

![](https://wikimedia.org/api/rest_v1/media/math/render/svg/0582bfa386ff59fc83733278ea79b0b932bfac95)  
참고 : https://ko.wikipedia.org/wiki/스피어만_브라운_공식

*문제*  
  5개 문항으로 구성된 어느 측정의 신뢰성이 0.5로 나타났다. 이러한 측정을 10개 문항으로 늘리는 경우 신뢰성은 얼마로 바뀌는가? （계산하지 않고 수식으로 표현하여도 괜찮음）

답 : (2*0.5)/(1+0.5)

---
  
  ### 타당성
  
  타당성은 3가지 방식으로 검토할 수 있다.  
1. 기준타당성  
2. 내용타당성  
3. 개념타당성

이중 내용타당성은 측정 내용 자체가 얼마나 연구하고자 하는 개념을 대표(반영)하고 있는지 확인하는 것으로, 자료를 통한 분석방법(정량적인 평가방법)이 없기 때문에 타당성 검토에서 중요하게 다루지 않는다.

**기준 타당성**  
  연구하고자하는 개념의 기준이 될 수 있는 측정이 존재한다면 해당 측정과 현재 관심을 두고있는 측정을 비교하여 타당성을 검토할 수 있다.  
즉, 기준 타당성은 관심있는 측정과 기준이 되는 측정의 관계를 조사하는 것이다.

관심있는 측정과 기준이 되는 측정 사이의 <u>상관계수를 타당성 계수</u>라고 한다.

**개념 타당성**  
  두 개념 사이에 이론적 관계가 존재한다면, 각 개념에 대한 측정 사이에도 이론적 관계와 동일한 상관관계가 존재할 것이다. 이렇게 이론적 근거 아래 두 측정에 대한 관계를 조사하는 것이 개념타당성이다.

개념타당성 중 두 측정의 관계가 높은 상관관계를 갖고 있다면 수렴 타당성이라 하고, 반대의 경우를 판별타당성이라 한다. 

*문제*  
  서비스 품질과 고객 만족도 사이에 밀접한 관계를 가지고 있다는 이론적 근거 아래 두 측정에 대한 관계를 조사하는 것은 어떠한 타당성과 연관되어 있는 것인가? 
  
  답: 개념타당성 or 수렴타당성

---
  
  ### 연산자 순서
  
  **%% 와 %/%**
  ```{r}
5 %% 2
```
```{r}
5 %/% 2
```

*예시*
  ```{r}
2 * 5 %% 3 == 4
```
comment : * 보다 %% 가 우선

```{r}
2 * 3 ^ 4 %% 4 == 2 
```
comment : %% 보다 ^ 이 우선
```{r}
2 ^ 4 / 8 %/% 2 == 4
```
^ -> %%, %/% -> *, / -> + , -
  
  ---
  
  ### runif 함수
  
  uniform distribution (균등분포)를 이루는 랜덤값을 만들 수 있다.

```{r}
#make this example reproducible
set.seed(5)

#generate 10 random values from uniform distribution
runif(n=10, min=50, max=100)
```

출처 : https://www.statology.org/runif-in-r/
  
  *min, max를 생략하면?*
  ```{r}
runif(10)
```
0과 1 사이에서 random variable 생성

---
  
  ### for 함수
  
  for 함수는 반복, loop에 사용한다. 

```{r}
for (i in 1:10) {
  print(i)
}
```

```{r}
j <- k <- 0
for (i in 1:3) {j <- i-5; k <- k + i*j; print(i+j+k) }
```
1번 print == j = -4, k = -4 , i = 1
현재 j와 k에는 -4 가 입력된 상태
2번 print == j = -3, k = -4 + -6 = -10 , i = 2
현재 j와 k에는 -3, -10이 입력된 상태
3번 print == j = -2, k = -10 + -6 = -16 , i = 3

---
  
  ### 인덱싱
  
  인덱싱할 때 comma를 생략하면?
  
  *데이터준비*
  ```{r}
titles <- c('Probability', 'Finance', 'Simulation')
authors <- c('Breiman', 'Lehmann', 'Givens')
years <- c(1968, 1983, 2005)
books <- data.frame(title=titles, author=authors, year=years)
head(books)
```

*문제*
  books[1:2] 와 books[1:2, ] 의 차이는?
  
  ```{r}
books[1:2]
```
**인덱싱할 때 comma를 생략하면 열을 선택한다.**
  
  ```{r}
books[2:3]
```
```{r}
books[1:2, ]
```

*!=*
  
  ```{r}
x <- 10:15; 
x
```
```{r}
x[x != 12]
```

!= 으로 원소를 제외하고 고를 수 있다.

```{r}
x[x != 10]
```

---
  
  ### 상관계수 cor
  
  두 변수간의 상관계수를 알고 싶은 경우 사용한다. default method는 pearson이다.

```{r}
x = c(1:10)
y = c(2:11)
plot(x,y)
```
```{r}
cor(x,y)
```

## end of document
