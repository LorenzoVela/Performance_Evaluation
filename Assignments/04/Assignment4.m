A = csvread("Traces.csv");
M1 = mean(A);
M2 = mean(A.^2);
M3 = mean(A.^3);
M4 = mean(A.^4);
% page 46 group L04, 2 parameters for the method of moments
Unif_a_MM = M1 - (0.5*(sqrt(12*(M2 - M1.^2))))
Unif_b_MM = M1 + (0.5*(sqrt(12*(M2 - M1.^2))))
for i = 1:4
    xUnif = linspace(Unif_a_MM(i), Unif_b_MM(i), 100)
    figure()
    HE_pars_MM = fsolve(@MM_HyperExp, [0.5, 0.5, 0.5])
    HE_pars_MLE = mle(A(:,2), 'pdf', @MM_HyperExp_pdf, 'start', [0.5, 0.5, 0.5], 'LowerBound', [0,0,0], 'UpperBound', [Inf, Inf, 1])
    x = [0:100] / 10;
    %capire se bisogna cambiare i parametri nella funzione
    %nella formula sotto si possono usare indistintamente MLE e MM (basta
    %cambiarli tutti) oppure converrebbe pure plottare tutto
    plot(sort(A(:,i)), [1:1000]/1000, "+", xUnif, [0:99]/99, "-", x, 1 - HE_pars_MLE(3)*exp(-x*HE_pars_MLE(1)) - (1 - HE_pars_MLE(3))*exp(-x*HE_pars_MLE(2)))
end 