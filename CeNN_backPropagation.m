function CeNN = CeNN_backPropagation(CeNN,x,y)

%     
%     n = CeNN.n;
%     equ = CeNN.equ;
%     m=size(x,3);
%     outputsize = size(CeNN.U{n}{1});
%     temp = outputsize(1)*outputsize(2);
%     fea = zeros(temp*equ,m);
%     for j=1:equ
%         fea(temp*(j-1)+1:temp*j,:)=reshape(CeNN.U{n}{j},temp,m);
%     end
%     fea=[ones(1,m);fea];
%    CeNN.W=y*fea'*inv(fea*fea'+diag([1 CeNN.lambda*ones(1,temp*equ)]));
% 
%   
%   
%   
%   
%     CeNN.error = sum(sum((y-CeNN.W*fea).*(y-CeNN.W*fea)))/m; 
% 
%     dU=-CeNN.W'*(y-CeNN.W*fea)/m;
%     dU=dU(2:end,:);
%     ddU =cell(equ,1); 
%     for j=1:equ
%         ddU{j} = reshape(dU(temp*(j-1)+1:temp*j,:),outputsize(1),outputsize(2),outputsize(3));
%     end
% %%     %%%numerical derivative
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     for i = (n - 1) : -1 : 1
%        
%         ddUlast = cell(equ,1);
%         for j = 1 : equ
%             if i>1 && strcmp(CeNN.layers{i}.type, 's')
%                 inputsize = size(CeNN.U{i}{j});
%                 if strcmp(CeNN.layers{i}.function, 'max')
%                 ex1 = expand(ddU{j},[CeNN.layers{i}.scale,CeNN.layers{i}.scale,1]);
%                 ex2 = expand(CeNN.U{i+1}{j},[CeNN.layers{i}.scale,CeNN.layers{i}.scale,1]);         
%                 ddUlast{j} =ex1(1:inputsize(1),1:inputsize(2),:).*(ex2(1:inputsize(1),1:inputsize(2),:)==CeNN.U{i}{j});
%                 else
%                     ex1 = expand(ddU{j},[CeNN.layers{i}.scale,CeNN.layers{i}.scale,1])/(CeNN.layers{i}.scale.^2);
%                      ddUlast{j} =ex1(1:inputsize(1),1:inputsize(2),:);
%                 end
%                 
%                 
%             else
%             CeNN.da{i}{j}=gradFa(ddU{j},CeNN.Inv_U{i}{j},CeNN.t,CeNN.a_num);
%             
%             
%             if i>1
%                 ddUlast{j} = ddU{j};
%                 % generate map the map is cell with size 9 and from first
%                 % left to right  then up to down
%                 numderive = genenum(CeNN.U{i}{j},CeNN.U{i+1}{j},CeNN.t,CeNN.a_num, CeNN.a{i}{j},CeNN.complex,CeNN.Beta);
%                 for k= 1 : 9
%                     numderive{k} = numderive{k}.* ddU{j};
%                 end
%                 %up
%                 ddUlast{j}(1:end-1,1:end-1,:)  =  ddUlast{j}(1:end-1,1:end-1,:) +  numderive{1}(2:end,2:end,:);
%                 ddUlast{j}(1:end-1,1:end,:)  =  ddUlast{j}(1:end-1,1:end,:) +  numderive{2}(2:end,1:end,:);
%                 ddUlast{j}(1:end-1,2:end,:)  =  ddUlast{j}(1:end-1,2:end,:) +  numderive{3}(2:end,1:end-1,:);
%                 %mid
%                 ddUlast{j}(1:end,1:end-1,:)  =  ddUlast{j}(1:end,1:end-1,:) +  numderive{4}(1:end,2:end,:);
%                 ddUlast{j}(1:end,1:end,:)  =  ddUlast{j}(1:end,1:end,:) +  numderive{5}(1:end,1:end,:);
%                 ddUlast{j}(1:end,2:end,:)  =  ddUlast{j}(1:end,2:end,:) +  numderive{6}(1:end,1:end-1,:);
%                 %down
%                 ddUlast{j}(2:end,1:end-1,:)  =  ddUlast{j}(2:end,1:end-1,:) +  numderive{7}(1:end-1,2:end,:);
%                 ddUlast{j}(2:end,1:end,:)  =  ddUlast{j}(2:end,1:end,:) +  numderive{8}(1:end-1,1:end,:);
%                 ddUlast{j}(2:end,2:end,:)  =  ddUlast{j}(2:end,2:end,:) +  numderive{9}(1:end-1,1:end-1,:);  
%             end
%             
%                
%             end
%           
%         end
%           ddU =ddUlast;
%     end
end

% function da=gradFa(dU,Inv_U,dt,a_num)
% 
% for i=1:a_num
%     da(i)=dt*sum(sum(sum(dU.*Inv_U{i})));
% end
% 
% end
