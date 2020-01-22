function ret = resultfunc(f, nodein, nodeout)

global G C b A Q X

for i = 1 : length(f)
    w = 2*pi*f(1, i);
    s = (1j)*w;
    A = (G + s.*C);

    thresh = [0.1, 0.001];
    [L,U,P,Q] = lu(sparse(A), thresh);
    z = L\(P*b);
    y = U\z;
    X = Q*y;

    ret(1, i) = 20*log10( abs(X(nodeout,1)/X(nodein,1)) );
    ret(2, i) = rad2deg( angle(X(nodeout,1)/X(nodein,1)) );
end

end