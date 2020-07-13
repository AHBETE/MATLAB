re=-(sin(-1)+cos(-1))+sin(1)-cos(1);

I1=1/3*sqrt(3)*sin(1/3*sqrt(3))-1/3*sqrt(3)*sin(-1/3*sqrt(3));

I2=5/9*1/5*sqrt(15)*sin(1/5*sqrt(15))-5/9*1/5*sqrt(15)*sin(-1/5*sqrt(15));

I3=1/36*(18+sqrt(30))*1/35*sqrt(525-70*sqrt(30))*sin(1/35*sqrt(525-70*sqrt(30)))...
    -1/36*(18+sqrt(30))*1/35*sqrt(525-70*sqrt(30))*sin(-1/35*sqrt(525-70*sqrt(30)))...
    +1/36*(18-sqrt(30))*1/35*sqrt(525+70*sqrt(30))*sin(1/35*sqrt(525+70*sqrt(30)))...
    -1/36*(18-sqrt(30))*1/35*sqrt(525+70*sqrt(30))*sin(-1/35*sqrt(525+70*sqrt(30)));

er1=abs(I1-re)/re;
er2=abs(I2-re)/re;
er3=abs(I3-re)/re;

fprintf('N = 1, Int_comp = %e, error = %e\n',I1,er1)
fprintf('N = 2, Int_comp = %e, error = %e\n',I2,er2)
fprintf('N = 3, Int_comp = %e, error = %e\n',I3,er3)