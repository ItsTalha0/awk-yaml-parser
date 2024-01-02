BEGIN{
	printf("innings,over,ball,runs,bowler,batsman,non_striker,wicker\n");
	}
	
/---/	{printf("innings,over,ball,runs,bowler,batsman,non_striker,wicker\n");fn=FILENAME; gsub(/\.yaml$/,"",fn)}
/^ *-.*innings:$/  { gsub(/[a-z]*$/,"",$2);ar=$2;print ar}
/^ *- [0-9]*\.[0-9]*:$/ { split($2,p,/(\.|:)/);printf("%d,%d,%d,%d,%s,%s,%s,%s\n",ar,over,ball,runs,bowler,bat,side,wicket) >> fn"/"fn".csv" ;ball=p[2];over=p[1] }
/^ *bowler: .*/ {$1="";bowler=$0;}
/^ *batsman: .*[^0-9]$/ {$1="";bat=$0;}
/^ *non_striker: .*[^0-9]$/ {$1="";side=$0;}
/^ *total: .*/ {$1="";wicket="na";runs=$0;}
/^ *player_out: .*/ {$1="";wicket=$0}
