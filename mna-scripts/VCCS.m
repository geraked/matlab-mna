function VCCS(k, kp, j, jp, gm)

global G

if (k ~= 0) & (j ~= 0)
    G(k, j) = G(k, j) + gm;
end

if (k ~= 0) & (jp ~= 0)
    G(k, jp) = G(k, jp) - gm;
end

if (kp ~= 0) & (j ~= 0)
    G(kp, j) = G(kp, j) + gm;
end

if (kp ~= 0) & (jp ~= 0)
    G(kp, jp) = G(kp, jp) - gm;
end