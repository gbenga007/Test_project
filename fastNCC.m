function [ NCC,lags ] = fastNCC( f1,f2 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

mean_f2 = mean(f2);
diff_f_mean_f2 = f2-mean_f2;
denomfsub = sqrt(sum(diff_f_mean_f2.^2));

f2_new = diff_f_mean_f2./denomfsub;

mfilt = ones(1,length(f2)) .* 1/length(f2);
mf1 = conv(f1,mfilt,'valid');

f2_new_flipped = fliplr(f2_new);
nume = conv(f1,f2_new_flipped,'valid') - (sum(f2_new).*mf1);


A2 = f1.^2;
m= ones(1,length(f2));
A2conv = conv(A2,m,'valid');
n = length(f2);
m2 = mf1.^2;

denom = A2conv - n*m2;
denom = sqrt(denom);
NCC = nume./denom;

lags = 0:1:length(NCC);

end

