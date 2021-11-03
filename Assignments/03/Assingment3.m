%percentiles


v = csvread('Data1.txt');
N = size(v,1)
first_moment = mean(v)
second_moment = sum(v.^2) / N
third_moment = sum(v.^3) / N
fourth_moment = sum(v.^4) / N
centered_moment2 = sum((v - first_moment).^2) / N
centered_moment3 = sum((v - first_moment).^3) / N
centered_moment4 = sum((v - first_moment).^4) / N
varX = second_moment - first_moment^2
stdX = sqrt(centered_moment2)  %standard deviation
cv = stdX / first_moment  %coeff of variation
sm3 = sum(((v - first_moment) / stdX).^3) / N  %standardized moments
sm4 = sum(((v - first_moment) / stdX).^4) / N
lag1 = sum((v(1:N-1)-first_moment).*(v(2:N)-first_moment))/(N-1) %cross covariance with lag=1
lag2 = sum((v(1:N-2)-first_moment).*(v(3:N)-first_moment))/(N-2)
lag3 = sum((v(1:N-3)-first_moment).*(v(4:N)-first_moment))/(N-3)
kurtosis = sm4 - 3
p90 = prctile(v,90)
p75 = prctile(v,75)
p50 = prctile(v,50)
p25 = prctile(v,25)
p10 = prctile(v,10)
%h = 0.10 * (N-1) +1;
%p10 = v(floor(h)) + (floor(h)-h) * (v(floor(h)+1)-v(floor(h))); L03 PG 38
v_sorted = sort(v);
plot (v_sorted, [1:N]/N, "+")