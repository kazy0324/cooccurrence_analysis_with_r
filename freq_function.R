# 石川 (2012: Ch.6) の共起頻度の評価指標の為のスクリプト
freq_test <- function(collocation, x, y, n){
  Dice <- 2*(collocation / (x + y));
  Jaccard <- collocation / (x + y - collocation);
  Cosine <- collocation / ({sqrt(x)}*{sqrt(y)});
  Simpson <- collocation / (min(x, y));
  MI <- log({(collocation*n)/(x*y)}, 2);
  result <- c(Dice, Jaccard, Cosine, Simpson, MI)
  names(result) <- c("Dice", "Jaccard", "Cosine", "Simpson", "MI")
  return(result)
}

# BNCコーパスにおける各コロケーション単独頻度 (beautiful + X)
# [lemma="beautiful"& tag = "J.*"][lemma="target" & tag ="N.*"] で Sketch Engine から取得
beautiful_woman <- 199
beautiful_place <- 87
beautiful_countryside <- 48
beautiful_day <- 46
beautiful_house <- 54
beautiful_hair <- 35
F <- c(beautiful_woman, beautiful_place, beautiful_countryside, beautiful_day, beautiful_house, beautiful_hair); F

# コーパス全体の語数（BNCにおける語数は一億
N <- 96263399 

# 中心語 beautiful の頻度
X <- 8259

# 共起語頻度 Y の頻度
woman <- 57306
place <- 51829
countryside <- 3429
day <- 89236
house <- 42871
hair <- 13833
Y <- c(woman, place, countryside, day, house, hair); Y

# 保存用のベクトルの生成 (cf. Gries 2013: 96)
collocations <- c("beautiful woman", "beautiful place", "beautiful countryside", "beautiful day", "beautiful house", "beautiful hair")
Dice <- vector(length=length(F))
Jaccard <- vector(length=length(F))
Cosine <- vector(length=length(F))
Simpson <- vector(length=length(F))
MI <- vector(length=length(F))

#result <- cbind(result, freq_test(F[2], X, Y[2], N))
result <- data.frame(collocations, Dice, Jaccard, Cosine, Simpson, MI); result

for(i in 1:length(F)){
  result[i,2:6] <- freq_test(F[i], X, Y[i], N)
  ## 小数点3桁で表示したい場合はこちらを使う
  #result[i,2:6] <- round(freq_test(F[i], X, Y[i], N), digits = 3)
}

result

#参考文献
## Gries, Stefan Th. 2013. Statistics for Linguistics with R. 2nd edition. Berlin/Boston: Walter De Gruyer.
## 石川慎一郎. 2012. 『ベーシックコーパス言語学』東京: ひつじ書房.