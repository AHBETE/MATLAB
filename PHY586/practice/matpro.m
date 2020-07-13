function M = matpro(M1,M2)
%matrix product OK

[r1,c1]=size(M1);
[r2,c2]=size(M2);

% if method==1
    if c1~=r2
        error("Dimention does not match.");
    end
    M=zeros(r1,c2);
    for i=1:r1
        for j=1:c2
            for k=1:c1
                M(i,j)=M(i,j)+M1(i,k)*M2(k,j);
            end
        end
    end
% elseif method==2
%     M=zeros(r1*r2,c1*c2);
%     for i=1:r1
%         for j=1:r2
%             for k=1:c1
%                 for l=1:c2
%                     M(i*j,k*l)=M1(i,k)*M2(j,l);
%                 end
%             end
%         end
%     end
% end