E=0.8*10^-17;
a=2*10^-15;
h=1.0545718*10^-15;
V=1.281741252*10^-17;
m=1.6726219*10^-27;
deltax=0.05*10^-15;
steps=6*a/deltax;
x=linspace(0,6*a,steps);
phi=zeros(steps,1);
psi=zeros(steps,1);
phiright=phileft;
psiright=psileft;

deltaphi=@(psi,deltax)psi*deltax;
deltapsi=@(phi,deltax)((V-E)*phi*2*m*deltax)/h;


for i=0:steps
    %y1
    phi1=phi()
    psi1=
    
    %y2
    
    
    
    %y3
    
    
    
    %y4
    
    
    
    %
    phiright(i,1)=
    psiright(i,1)=
    
end
    