function vcvs(k, kp, j, jp, A)

global G C b

d = size(G, 1);
xr = d + 1;
b(xr, 1) = 0;
G(xr, xr) = 0;
C(xr, xr) = 0;

if (j ~= 0)
    G(xr, j) = -A;
end

if (jp ~= 0)
    G(xr, jp) = A;
end

if (k ~= 0)
    G(xr, k) = 1;
    G(k, xr) = 1;
end

if (kp ~= 0)
    G(xr, kp) = -1;
    G(kp, xr) = -1;
end