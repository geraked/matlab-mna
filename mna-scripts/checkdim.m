function checkdim(n1, n2)

global G C b

dim = size(C);
if (dim(1) < n1 || dim(2) < n1)
    C(n1, n1) = 0;
end

if (dim(1) < n2 || dim(2) < n2)
    C(n2, n2) = 0;
end

dim = size(G);
if (dim(1) < n1 || dim(2) < n1)
    G(n1, n1) = 0;
end

if (dim(1) < n2 || dim(2) < n2)
    G(n2, n2) = 0;
end

dimb = size(b);
if (dimb(1) < dim(1))
    b(dim(1), 1) = 0;
end