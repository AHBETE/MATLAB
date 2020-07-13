V0=-80E6;
E1=0.920000*V0;
dx=0.02;
a=2;
[psil1, phil1, ~] = solve_from_left(E1, V0, -3*a, 0.95*a, a, dx);
[psir1, phir1, ~] = solve_from_right(E1, V0, 3*a, 0.95*a, a, -dx);

E2=0.917895*V0;
[psil2, phil2, ~] = solve_from_left(E2, V0, -3*a, 0.95*a, a, dx);
[psir2, phir2, ~] = solve_from_right(E2, V0, 3*a, 0.95*a, a, -dx);

delta1=(psil1(end)/phil1(end)-psir1(end)/phir1(end))/(psil1(end)/phil1(end)+psir1(end)/phir1(end));
delta2=(psil2(end)/phil2(end)-psir2(end)/phir2(end))/(psil2(end)/phil2(end)+psir2(end)/phir2(end));

tol=10^-6;

while (sign(delta1)~=sign(delta2) && abs(E2-E1)>tol)
    E3=(E1+E2)/2;
    [psil3, phil3, ~] = solve_from_left(E3, V0, -3*a, 0.95*a, a, dx);
    [psir3, phir3, ~] = solve_from_right(E3, V0, 3*a, 0.95*a, a, -dx);
    delta3=(psil3(end)/phil3(end)-psir3(end)/phir3(end))/(psil3(end)/phil3(end)+psir3(end)/phir3(end));
    
    if sign(delta3)==sign(delta1)
        E1=E3;
%         psil1=psil3;
%         phil1=phil3;
        
    else
        E2=E3;
    end
    
%     if abs(E2-E1)<tol
%         break
%     end
    
end

[psil1, phil1, ~] = solve_from_left(E1, V0, -3*a, 0.95*a, a, dx);
[psir1, phir1, ~] = solve_from_right(E1, V0, 3*a, 0.95*a, a, -dx);
[psil2, phil2, xvecl] = solve_from_left(E2, V0, -3*a, 0.95*a, a, dx);
[psir2, phir2, xvecr] = solve_from_right(E2, V0, 3*a, 0.95*a, a, -dx);
