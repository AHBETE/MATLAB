function [fxy] = twoBody_2DGCalc(posx, posy, ms)

% function [fxy] = twoBody_2DGCalc(posx, posy, ms)
% Calculate force of gravity on body 1 by body 2 in 2D (x/y) coordinates
% INPUTS:
% 	posx: 2 element vector, posx(1)->xcoordinate of body1, posx(2) -> body2 
% 	posy: 2 element vector, posy(1)->ycoordinate of body1, posy(2) -> body2 
% 	ms: 2 element vector, ms(1) -> m1, ms(2)->m2
% OUTPUTS:
% 	ms: 2 element vector, fxy(1) -> Fx, fxy(2) ->Fy
% 
% 	NOTE: Force "signs" are in the same "system" as posx, posy and 
% 	are in general a right-handed cartesian system

G = 6.67E-11; %use regular SI units for G

if prod(size(posx)) ~=2 		%a nifty way to catch 2 element vector!
	error('Need 2 element posx inputs');
elseif prod(size(posy)) ~=2 
	error('Need 2 element posy inputs');
elseif prod(size(ms)) ~=2 
	error('Need 2 element ms inputs');
end

r12sq = (posx(1)-posx(2)).^2 + (posy(1)-posy(2)).^2;
cos1 = (posx(1)-posx(2))./sqrt(r12sq);
sin1 = (posy(1)-posy(2))./sqrt(r12sq);
fxy(1) = - cos1.*G.*ms(1).*ms(2)./r12sq;
fxy(2) = - sin1.*G.*ms(1).*ms(2)./r12sq;
