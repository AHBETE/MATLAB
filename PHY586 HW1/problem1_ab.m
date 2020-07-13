%%problem 1ab
%Zibo Wang 2019

clear
close all
clc

%diff
for l=[1,2]%fuction to be diffed
    if l==1
        j="exp";
    elseif l==2
        j="sin";
    end
    for m=[1,2,3]%x-value at which derivative to be evaled
        if m==1
            i=0.1;
        elseif m==2
            i=1;
        elseif m==3
            i=100;
        end
        for n=[1,2]%methoed used
            if n==1
                k="forward method";
            elseif n==2
                k="center difference";
            end
            fprintf('\n\nFor %s(%d) using %s:\n',j,i,k)
            h=1;
            nitr=1;
            real_diff=exp(i);
            while h>=eps
                ss(nitr)=h;
                calc_diff=diff_(j,i,h,n);%for help, use command "help diff_"; diff_.m is in the same zip file
                error=abs(calc_diff-real_diff)/real_diff;
                fprintf('iteration# = %d ,h = %e, calculated derivative = %e, relative error = %e;\n',nitr,h,calc_diff,error)
                nitr=nitr+1;
                h=h/2;
                eval(['re',num2str(l),num2str(m),num2str(n),'(',num2str(nitr),')','=','error',';']);%save error
            end
        end
    end
end

%print stepsize vs error
cnt=1;
for l=[1,2]
    for m=[1,2,3]
        for n=[1,2]
            
            figure(cnt)
            eval(['loglog(ss,re',num2str(l),num2str(m),num2str(n),'(1:end-1));'])
            
            if l==1
                j="exp";
            elseif l==2
                j="sin";
            end
            if m==1
                i=0.1;
            elseif m==2
                i=1;
            elseif m==3
                i=100;
            end
            if n==1
                k="forward method";
            elseif n==2
                k="center difference";
            end
            
            title(num2str(cnt)+") "+j+"("+num2str(i)+") using "+k+";")
            xlabel("log(h)");ylabel("log(\epsilon)");grid;
            cnt=cnt+1;
        end
    end
end