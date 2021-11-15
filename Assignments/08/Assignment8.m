s = 1;
Ts1 = 0;
Ts2 = 0;
Ts3 = 0;
C = 0;
while C < 1000
    if s == 1
        dt1Reporting = -log(rand) / 0.05;
        dt1Maintenance = -log(rand) / 0.001;
        if dt1Reporting < dt1Maintenance
            s = 2;
            dt1 = dt1Reporting;
        else
            s = 3;
            dt1 = dt1Maintenance;
        end
        Ts1 = Ts1 + dt1;
        C = C+1;
    end
    if s == 2
        dt2Working = -log(rand) / 1;
        dt2Maintenance = -log(rand) / 0.001;
        if dt2Working < dt2Maintenance
            s = 1;
            dt2 = dt2Working;
        else
            s = 3;
            dt2 = dt2Maintenance;
        end
        Ts2 = Ts2 + dt2;
        C = C+1;
    end  
    if s == 3
        s = 1;
        dt3 = -log(rand) / 0.05;
        Ts3 = Ts3 + dt3;
        C = C+1;
    end
end
totalTime = Ts1 + Ts2 + Ts3;
ps1 = Ts1 / totalTime
ps2 = Ts2 / totalTime
ps3 = Ts3 / totalTime
reportingFrequency = Ts2 / (totalTime-Ts2)