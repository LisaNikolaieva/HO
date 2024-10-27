function f = calc_f(E,x)
N = size(E,1);
f = 0;
for i = 1:N
    u = E(i,1);
    v = E(i,2);
    w = E(i,3);
    for j = i+1:N%1:N
        u2 = E(j,1);
        v2 = E(j,2);
        w2 = E(j,3);

        if u<u2
            posv = find(x==v);
            posv2 = find(x==v2);
            if (posv>posv2)
                f = f+w+w2;
            end
        end


    end
end



end
