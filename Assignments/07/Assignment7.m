s = 1;
Ts1 = 0;
Ts2 = 0;
Ts3 = 0;
C = 0;
while C < 100
    if s == 1
        if rand < 0.8
            s = 2;
        else
            s = 3;
        end
        dt1 = -(log(rand)+log(rand)+log(rand)) / 0.1;
        Ts1 = Ts1 + dt1;
        C = C+1;
    end
    if s == 2
        if rand < 0.5
            s = 3;
        else
            s = 1;
        end
        dt2 = -log(rand) / 0.01;
        Ts2 = Ts2 + dt2;
        C = C+1;
    end  
    if s == 3
        s = 1;
        dt3 = -log(rand) / 0.005;
        Ts3 = Ts3 + dt3;
        C = C+1;
    end
end
totalTime = Ts1 + Ts2 + Ts3;
ps1 = Ts1 / totalTime
ps2 = Ts2 / totalTime
ps3 = Ts3 / totalTime
utilization = C / totalTime