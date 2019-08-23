# 石川 (2012: Ch.6) の共起頻度の評価指標の為のスクリプト

# BNCコーパスにおける各コロケーション単独頻度 (beautiful + X)
# [lemma="beautiful"& tag = "J.*"][lemma="target" & tag ="N.*"] で Sketch Engine から取得
b_woman <- 199
b_place <- 87
b_countryside <- 48
b_day <- 46
b_house <- 54
b_hair <- 35
F <- c(b_woman, b_place, b_countryside, b_day, b_house, b_hair); F

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
Dice <- vector(length=6)
Jaccard <- vector(length=6)
Cosine <- vector(length=6)
Simpson <- vector(length=6)
MI <- vector(length=6)

for (i in 1: length(F)) {
  Dice[i] <- 2*(F[i] / (X + Y[i]));
  Jaccard[i] <- F[i] / (X + Y[i] - F[i])
  Cosine[i] <- F[i] / ({sqrt(X)}*{sqrt(Y[i])})
  Simpson[i] <- F[i] / (min(X, Y[i]))
  MI[i] <- log({(F[i]*N)/(X*Y[i])}, 2)
}

result <- data.frame(Dice, Jaccard, Cosine, Simpson, MI)
rownames(result) <- c("beautiful woman", "beautiful place", "beautiful countryside", "beautiful day", "beautiful house", "beautiful hair"); result
round(result, digits = 3)

#参考文献
## Gries, Stefan Th. 2013. Statistics for Linguistics with R. 2nd edition. Berlin/Boston: Walter De Gruyer.
## 石川慎一郎. 2012. 『ベーシックコーパス言語学』東京: ひつじ書房.