# install.packages('ggplot2')
library(ggplot2)

# ggplot(data, aes(데이터 속성)) (aes : aesthetic)

# 산점도 : geom_point  (geom : geometry)
# w/o 포인트 옵션
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point()

# w/ 포인트 옵션
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(size=3, color='red')

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(aes(color=Species), size=3)

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width))+
  geom_point(aes(color=Species), size=2)+
  geom_smooth(aes(group=Species))


# line 그래프
str(airquality)
head(airquality)
ggplot(airquality, aes(x=Day, y=Temp))+
  geom_line()+geom_smooth()

# 막대 그래프 - 비이산 데이터 시각화
str(mtcars)
# mtcars$cyl : 4,6,8 -> num이지만 사실상 범주형 - 비이산데이터
ggplot(mtcars, aes(x=cyl))+geom_bar()

# geom_bar에 옵션 추가
# 누적 막대 그래프
# 범주화되지 않은 데이터는 누적 막대그래프를 그릴 수 없다.
ggplot(mtcars, aes(x=cyl))+
  geom_bar(aes(fill=gear)) # cyl, gear가 범주화 X

# option1. 데이터 프레임 자체를 변경(수치형->범주형)
# 데이터 자체를 바꾸기 때문에 살짝 비추
data <- mtcars
data$cyl <- factor(data$cyl)  # 범주화
data$gear <- factor(data$gear)
str(data)
ggplot(data, aes(x=cyl))+ geom_bar(aes(fill=gear))

# option2. 데이터 프레임 자체는 그대로, 벡터 자체를 범주화
ggplot(mtcars, aes(x=factor(cyl)))+geom_bar(aes(fill=factor(gear)))


# boxplot - 기준을 정해야 한다 -> group
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, group=Sepal.Length))+
  geom_boxplot()

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, group=Sepal.Width))+
  geom_boxplot()

# 1사분위(Q1) ~ Median ~ 3사분위(Q3) : IQR(Interquartile Range)
# Minimum : Q1-1.5*IQR / Maximum : Q3+1.5*IQR
# Min. Max. 바깥의 값 : Outliers


# 히스토그램 - 이산 데이터
ggplot(iris, aes(x=Sepal.Length))+geom_histogram()
ggplot(iris, aes(x=Sepal.Length))+geom_histogram(binwidth=0.5)


# 점과 선
ggplot(airquality, aes(x=Day, y=Temp))+geom_line()+geom_point()
ggplot(airquality, aes(x=Day, y=Temp))+
  geom_line(color='blue')+geom_point(color='red',size=3)


# x축은 캐럿, y축은 가격으로 하여 산점도 그래프를 그리고
# 투명도에 따라 색을 달리 표시하라
str(diamonds)
View(diamonds)
ggplot(diamonds, aes(x=carat, y=price))+
  geom_point(aes(color=clarity))+
  geom_smooth(aes(group=clarity))

# cut 정도에 따른 막대 그래프를 그리시오.
# 각 cut 정도에 따른 color의 분포를 색으로 표시하시오.
ggplot(diamonds, aes(x=cut))+geom_bar(aes(fill=color))

# carat에 따른 금액 변동을 꺾은 선 그래프로 표시하시오.
# 변동 추세를 표시하시오.
ggplot(diamonds, aes(x=carat, y=price))+geom_line()+
  geom_smooth(color='purple')


# 레이블 추가하기
# 그래프 위에 텍스트를 직접 표현
ggplot(airquality, aes(x=Day,y=Temp))+geom_point()+
  geom_text(aes(label=Temp))
ggplot(airquality, aes(x=Day,y=Temp))+geom_point()+
  geom_text(aes(label=Temp, vjust=-1))
#   vjust(vertical) : + 아래로, - 위로
ggplot(airquality, aes(x=Day,y=Temp))+geom_point()+
  geom_text(aes(label=Temp, hjust=1))
#   hjust(horizontal : + 왼쪽으로, - 오른쪽으로)
ggplot(airquality, aes(x=Day,y=Temp))+geom_point()+
  geom_text(aes(label=Temp, vjust=0.5, hjust=-1))

# 그래프 제목, 축 이름 설정하기(labs)
ggplot(mtcars, aes(x=factor(cyl)))+
  geom_bar(aes(fill=factor(gear)))+
  labs(x="실린더 수", y='개수', title='엔진개수와 기어수')
