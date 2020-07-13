function [] = visualize_2body_gforce(posx, posy, ms)
% visualize the outputs from nBodyGForcecalc_2D...
% function [] = visualize_2body_gforce(posx, posy, ms)
% See help nBodyGForcecalc_2D.m for inputs
% 

close all

[Fx,Fy] = nBodyGForcecalc_2D(posx, posy, ms);

figure(1);
hold on;

for n1=1:length(posx)
	h(n1) = plot(posx(n1), posy(n1), 'o', 'Markersize', 14);
	col = get(h(n1), 'Color');
	set(h(n1), 'MarkerFaceColor', col);
	lt{n1} = sprintf('Obj%d', n1);
	Ftot(n1) = sqrt(Fx(n1)^2 + Fy(n1).^2);
	hq = quiver(posx(n1), posy(n1), Fx(n1)./Ftot(n1), Fy(n1)./Ftot(n1));
	set(hq, 'Color', col);
end
hold off
legend(h, lt);
