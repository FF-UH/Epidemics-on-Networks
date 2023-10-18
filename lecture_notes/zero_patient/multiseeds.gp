#### for T in 7 8 9 10 11; do for x in real_vs_infer-n1000-e2000-pij0.5-T$T-G1-root0.002-pr1-pob1-s*;do sort -rgk5 $x | cat -n | awk -vT=11 -vx="" '$3<T{es++}$3==0{s+=$1; a+= es - tp; ++tp}END{ if(tp) print tp,s/tp, a/(tp*(es-tp+1)),(tp+1)/2,es,x}'; done
#### T=7; for x in real_vs_infer-n1000-e2000-pij0.5-T$T-G1-root0.002-pr1-pob1-s*;do sort -rgk5 $x | cat -n | awk -vT=$T -vx=$x '$3==0{tp++; s+=$1; ++n}$3!=0&&$3<T{a+=tp}$3<T{es++}END{ if(n) print n,s/n, a/(tp*(es-tp+1)),(n+1)/2,es}'; done > data$T.txt
#### for T in 7 8 9 10 11; do awk '{s[$1]+=$2; m[$1]+=$3; s2[$1]+=$2*$2; n[$1]++}END{for (p in s) print p,s[p]/n[p],((s2[p]/n[p]-(s[p]/n[p])**2)/n[p])**0.5,m[p]/n[p],n[p]}' data$T.txt | sort -gk1 > multiseed-T$T.txt; done
set size 0.5,0.8
set tmargin 2
set lmargin 5
set rmargin 3
set terminal postscript eps enhanced color
set multiplot layout 1,2
set origin 0,0
set size 0.5,0.5
#set xlabel "seeds"
set y2label "aggregate ranking"
set key top left reverse Left
plot [:6.1][:] "resources/multiseed-T7.txt" u 1:2:3 t "BP T-t_0=6" w yerrorb lw 4,"resources/multiseed-T8.txt" u 1:2:3  t "BP T-t_0=7" w yerrorb lw 4, "resources/multiseed-T9.txt" u 1:2:3 t "BP T-t_0=8" w yerrorb lw 4, "resources/multiseed-T10.txt" u 1:2:3  t "BP T-t_0=9" w yerrorb lw 4, "resources/multiseed-T11.txt" u 1:2:3  t "BP T-t_0=10" w yerrorb lw 4, (x+1)/2 t "perfect" lw 4 lt 0
set origin 0,0.5
set size 0.5,0.3
set bmargin 0
set nokey
set ytics 0.02
unset ylabel
set y2label "ROC area"
plot [:6.1][:1.005] "resources/multiseed-T7.txt" u 1:4 w l lw 4, "resources/multiseed-T8.txt" u 1:4 w l lw 4, "resources/multiseed-T9.txt" u 1:4 w l lw 4, "resources/multiseed-T10.txt" u 1:4 w l lw 4, "resources/multiseed-T11.txt" u 1:4 w l lw 4, 1 w l lw 4 lt 0
unset multiplot
