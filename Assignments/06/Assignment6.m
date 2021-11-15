%responseTime = zeros(50,1);
%avgResponseTime = zeros(50,1);
totalResponse = 0;
for k = 1:50  %50 runs of 200 jobs each
    %HypoExponential
    %figure
    serviceHypo = -log(rand(200,1)) / 0.1 - log(rand(200,1)) / 0.5
    %plot(sort(outHypo), [1:200]/200,"-");
    %title('Hypo-Exponential Distribution')
    Arrival_Hypo = serviceHypo(2:200) - serviceHypo(1:200-1);
    maxTime = max(serviceHypo);
    %HyperExponential
    for i = 1:200
        if rand < 0.5
            inHyper(i,1) = -log(rand) / 0.1;
        else
            inHyper(i,1) = -log(rand) / 0.05;
        end
    end
    %figure
    %plot(sort(outHyper), [1:200]/200,"-");
    %title('Hyper-Exponential Distribution')
    inHyper = sort(inHyper)
   
    %average number of jobs is responseTime/maxTime
    %response time is the summation of the difference between service and
    %arrival of every job
    departureTime(1,1) = inHyper(1,1) + serviceHypo(1,1);
    for j = 2:200
        if inHyper(j,1) > departureTime(j-1,1)
            departureTime(j,1) = inHyper(j,1) + serviceHypo(j,1);
        else
            departureTime(j,1) = departureTime(j-1,1) + serviceHypo(j,1);
        end
    end
    departureTime
    for i = 1:200
        responseTime(i,1) = departureTime(i,1) - inHyper(i,1);
    end
    avgResponse = sum(responseTime) / 200;
    totalResponse = totalResponse + avgResponse;
end
media = totalResponse / 50

