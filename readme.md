石川 (2012: Ch.6) のコーパスにおける頻度処理の演習問題を R で解きました．

0823_freq.R は素直に（？）解いたものを，freq_function.R は Dice, Jaccard, Cosine, Simpson, MI という複数の共起頻度の指標を返す関数を freq_test として書き直したものです．freq_test の引数は次の通りです．

1. collocation: コロケーションの共起頻度をさします(e.g., 'beautiful {woman, women}' の頻度)．
2. x: XYというコロケーションの中心語 X 単体の頻度をさします(e.g., 'beautiful {woman, women}' であれば，'beautiful' の頻度)．
3. y: XYというコロケーションの共起語 Y 単体の頻度をさします(e.g., 'beautiful {woman, women}' であれば，'{woman, women}' の頻度)．
4. n: コーパス全体の総語数を指します．

各ファイルにはコメントで実際に検索に使った CQL を記述してあります．