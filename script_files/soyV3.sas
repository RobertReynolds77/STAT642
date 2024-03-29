*soyV3.sas;
OPTION LS=120 PS=55 NOCENTER NODATE; 
TITLE 'COMPARISON OF SLOPES OF THREE REGRESSION LINES'; 
DATA;        
INPUT  Y X T $ @@;  
LABEL Y=YIELD X=HEIGHT T= TREATMENT; 
CARDS;   
 19.8   33   C   20.4   35   C  23.5   45   C  24.4   48   C 
 25.3   51   C   25.7   52   C  25.7   53   C  27.4   56   C 
 28.2   61   C   29.2   65   C  
 21.4   34   S   21.9   36   S  25.7   48   S  26.4   49   S 
 25.9   49   S   27.1   52   S  27.0   53   S  29.4   60   S 
 29.3   61   S   30.2   63   S  
 19.0   35   P   20.2   39   P  22.9   47   P  24.3   51   P 
 24.7   52   P   24.5   53   P  25.4   56   P  26.5   59   P 
 26.7   60   P   28.2   66   P 
PROC PRINT;
RUN;
PROC MEANS;
CLASS T;
VAR X Y;
RUN;
PROC PLOT;  
PLOT Y*X=T; 
TITLE 'MODEL ALLOWING DIFFERENT SLOPES AND INTERCEPTS'; 
PROC GLM;  
CLASS T;
MODEL Y=T X X*T / SOLUTION;  
LSMEANS T/ PDIFF STDERR;
RUN;
TITLE 'MODEL TO OBTAIN SLOPES AND INTERCEPTS'; 
PROC GLM;  
CLASS T;
MODEL Y=T  X*T /NOINT SOLUTION;  
LSMEANS T/ PDIFF STDERR;
RUN;
TITLE 'MODEL WITH EQUAL SLOPES'; 
PROC GLM;  
CLASS T;
MODEL Y=T  X/ SOLUTION;  
LSMEANS T/ PDIFF STDERR;
RUN;
