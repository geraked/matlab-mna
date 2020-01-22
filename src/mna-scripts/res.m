function res(n1, n2, val)

global G

checkdim(n1, n2);

if (n1 ~= 0)
    G(n1, n1) = G(n1, n1) + 1/val;
end

if (n2 ~= 0)
    G(n2,n2) = G(n2, n2) + 1/val;
end

if (n1 ~= 0) & (n2 ~= 0)
    G(n1, n2) = G(n1, n2) - 1/val;
    G(n2, n1) = G(n2, n1) - 1/val;
end