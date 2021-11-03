%HypoExponential
%figure
outHypo = -log(rand(500,1)) / 0.1 - log(rand(500,1)) / 0.5;
%plot(sort(outHypo), [1:500]/500,"-");
%title('Hypo-Exponential Distribution')
outHypo = sort(outHypo)

%HyperExponential
for i = 1:500
    if rand < 0.5
        outHyper(i,1) = -log(rand) / 0.1;
    else
        outHyper(i,1) = -log(rand) / 0.05;
    end
end
%figure
%plot(sort(outHyper), [1:500]/500,"-");
%title('Hyper-Exponential Distribution')
outHyper = sort(outHyper)

SizeHypo = size (outHypo)
Arrival_Hypo = outHypo(2:SizeHypo) - outHypo(1:SizeHypo-1)

