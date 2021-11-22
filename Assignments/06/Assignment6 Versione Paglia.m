%responseTime = zeros(50,1);
%avgResponseTime = zeros(50,1);
totalResponse = 0;
responseTime = zeros(200,1);
inHyper = zeros(200,1);
for k = 1:1  
    serviceHypo = -log(rand(200,1)) / 0.1 - log(rand(200,1)) / 0.5;

    for i = 1:200
        if rand < 0.5
            inHyper(i,1) = -log(rand) / 0.1;
        else
            inHyper(i,1) = -log(rand) / 0.05;
        end
    end
    inHyper = sort(inHyper);
   interArr = inHyper(2:200) - inHyper(1:199);
   completionTimeInverse(1) = serviceHypo(1);
   for i = 2:200
       completionTimeInverse(i) = max(sum(interArr(1:i-1)),completionTimeInverse(i-1)) + serviceHypo(i);
   end
   completionTime = completionTimeInverse.^-1;
   ArrivalAndServiceMatrix = [inHyper, serviceHypo];
   ArrivalAndServiceMatrix = sortrows(ArrivalAndServiceMatrix, 1);
   
   BusyTime = completionTimeInverse(200) -    sum(serviceHypo);
   Utilitation = BusyTime / completionTimeInverse(200);
   Through = 200 / completionTimeInverse(200);
   W = inHyper(:,1) - completionTimeInverse(:,1);
   W = sum(W);
   AVGJobs = W/completionTimeInverse(200);
end

