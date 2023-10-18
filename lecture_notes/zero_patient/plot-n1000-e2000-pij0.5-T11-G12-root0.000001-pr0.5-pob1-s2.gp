set label "Epidemy\n G=  12  T= 11 \n Infecting: 491 \n with border=   1000 \n av recov t=  2.027  \n av trans t=  1.9925  "  font "Times,16"   at screen 1.0, screen 0.7
INDMAX =  1000
G= 11
set label "Base Graph \n N= 1000 T= 11 G= 12 \n pij= 0.5 root= 0.000001 \n recov= 0.5 observ= 1" font "Times,16" at screen 1.0, screen 0.9
file = "resources/mean_vs_infer-n1000-e2000-pij0.5-T11-G12-root0.000001-pr0.5-pob0.7-s2.txt"
file1 = "resources/real_vs_infer-n1000-e2000-pij0.5-T11-G12-root0.000001-pr0.5-pob0.7-s2.txt"
set log x
set log y2
set yrange[-11:1.4]
set y2range [1e-6:1.2]
set xrange [0.9:1100]
set key below
set ylabel "infection time"
set y2label "seed probability"
set y2tics nomirror
set ytics nomirror (-11,-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,">0" 1)
set xlabel 
set grid ytics
fileR="< awk '$4==3{print NR,$0}' ".file1
fileI="< awk '$4==2{print NR,$0}' ".file1
fileX="< awk '$4==0{print NR,$0}' ".file1
set term postscript enhanced color "Times, 20"
set style fill
f(x)=0.1
plot file u (($0+1)):($2-G+1):3 w yerro lt 1 pt 4 ps .3 lc 0 title "BP time"\
, file1 u (($0+1)):(($5)) w p pt 6 lc 8 axes x1y2 title "P(seed)"\
, fileR u 1:($3-G+1-0.2):($3-G+1-0.2):($3-G+1.2):($3-G+1+0.2):(f($1)) w candlesticks fs solid lt 1 lc 1 title "R"\
, fileI u 1:($3-G+1-0.2):($3-G+1-0.2):($3-G+1.2):($3-G+1+0.2):(f($1)) w candlesticks fs solid lt 1 lc 2 title "I"\
, fileX u 1:($3-G+1-0.2):($3-G+1-0.2):($3-G+1.2):($3-G+1+0.2):(f($1)) w candlesticks fs solid lt 1 lc 3 title "X"\
