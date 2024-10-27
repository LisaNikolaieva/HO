function x = calc_G(C,x)

    % while (~is_valid(C,x))
        i =randperm(length(x),2);
        x_i1=x(i(1));
        x(i(1))=x(i(2));
        x(i(2))=x_i1;
    % end


    x = make_valid(C,x);



    %%
    %  while (~is_valid(C,x))
    %     x =  (randperm(length(x))+length(x))';
    % 
    % end


end




% function x = calc_G(C,x)
%     while (~is_valid(C,x))
%         x =  randperm(length(x))+length(x);
% 
%     end
% 
% end

function res = is_valid(C,x)
    Nc = size(C,1);
res = 1;
for i = 1:Nc
    v = C(i,1);
    v2 = C(i,2);
    posv = find(x==v);
    posv2 =find(x==v2); 
    if posv2<posv
       res = 0;
    end

end

end


function x = make_valid(C,x)

    Nc = size(C,1);
% res = 1;
for i = 1:Nc
    v = C(i,1);
    v2 = C(i,2);
    posv = find(x==v);
    posv2 =find(x==v2); 
    if posv2<posv
       x_i1=x(posv);
        x(posv)=x(posv2);
        x(posv2)=x_i1;
    end

end
x = reshape(x,[],1);
end


