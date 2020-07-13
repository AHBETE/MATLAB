rate=10;
n=length(xt3(:,1));
i=rate;

%filename = 'orbit.gif';

while i<n

    plot(xt3(1:i,2),yt3(1:i,2),'b');
    hold on
    plot(xt3(1:i,1),yt3(1:i,1),'r');
    plot(xt3(i,2),yt3(i,2),'o','MarkerSize',10,'MarkerFaceColor',[0.6350 0.0780 0.1840]);
    plot(xt3(i,1),yt3(i,1),'o','MarkerSize',10,'MarkerFaceColor',[0.8500 0.3250 0.0980]);
    i=i+rate;
    hold off
    pause(0.03)

%     M=getframe;
%     im = frame2im(M);
%     [imind,cm] = rgb2ind(im,256);
%     if i == 20 
%         imwrite(imind,cm,filename,'gif', 'Loopcount',inf,'DelayTime',0.1); 
%     else 
%         imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',0.05); 
%     end
    
end