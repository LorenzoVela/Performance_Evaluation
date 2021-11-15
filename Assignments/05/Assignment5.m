%uniform
%Range = [10, 20];
uni = rand(500, 1);
for i = 1:500
    uni(i,1) = (uni(i,1) * 10) + 10;
end
figure
plot(sort(uni), [1:500]/500)
title('Uniform Distribution')
meanUni = mean(uni)
coefficient_variation_uni = getCV(sort(uni))

%exponential
outExp = -log(rand(500,1)) / 0.06666; %where 0.666 is 1/15 (the mean requested)
figure
plot(sort(outExp), [1:500]/500)
title('Exponential Distribution')
meanExp = mean(outExp)
coefficient_variation_exp = getCV(sort(outExp))

%discrete
Pr = [5, 0.2, 0.2; 15, 0.6, 0.8; 20, 0.2, 1];
u = rand(500,1);
%gruppo L05 pg 28
for i = 1:500
    if u(i,1) < Pr(1,3)
        outDis(i,1) = Pr(1,1);
    elseif u(i,1) < Pr(2,3)
        outDis(i,1) = Pr(2,1);
    else
        outDis(i,1) = Pr(3,1);
    end
end
figure
plot(sort(outDis), [1:500]/500,"-");
title('Discrete Distribution')
meanDis = mean(outDis)
coefficient_variation_dis = getCV(sort(outDis))

%HypoExponential
figure
outHypo = -log(rand(500,1)) / 0.1 - log(rand(500,1)) / 0.2;
plot(sort(outHypo), [1:500]/500,"-");
title('Hypo-Exponential Distribution')
meanHypo = mean(outHypo)
coefficient_variation_hypo = getCV(sort(outHypo))

%HyperExponential
for i = 1:500
    if rand < 0.5
        outHyper(i,1) = -log(rand) / 0.1;
    else
        outHyper(i,1) = -log(rand) / 0.05;
    end
end
figure
plot(sort(outHyper), [1:500]/500,"-");
title('Hyper-Exponential Distribution')
meanHyper = mean(outHyper)
coefficient_variation_hyp = getCV(sort(outHyper))

%Erlang
for i = 1:500
    if rand < 0.1
        outErlang(i,1) = -(log(rand)) / 0.02;
    elseif rand < 0.5
        outErlang(i,1) = -(log(rand)+log(rand)) / 0.2;
    else 
        outErlang(i,1) = -(log(rand)+log(rand)+log(rand)) / 0.25;
    end
end
figure
meanErlang = mean(outErlang)
coefficient_variation_erl = getCV(sort(outErlang))
plot(sort(outErlang), [1:500]/500,"-");
title('Erlang Distribution')
