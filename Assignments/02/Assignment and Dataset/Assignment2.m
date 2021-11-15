%uiimport('Log1.txt')
v = readtable('Log1.txt','Delimiter',{' ', '-','['})
x = v(:, 7)
x = table2array(x)
Day= datetime(x,'InputFormat','dd/MMM/yyyy:HH:mm:ss')
Day1 = datenum(Day(1,1))
Day1001 = datenum(Day(1001,1))
Daymax = Day1001-Day1
Time = Daymax * 24
A = 1001/Time 
InterArr = 1/A * 60

DayNum = datenum(Day)

A2 = datenum(Day)

V = var(A2)

FirstEl = A2(2:2:end)

SecondEl = A2 (1:2:end)

MatrixCorr = cat(2,FirstEl,SecondEl(1:500))

plot (MatrixCorr(:,1),MatrixCorr(:,2))