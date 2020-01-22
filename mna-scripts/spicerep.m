function ret = spicerep(str)

x = strrep(str, 'u', 'e-6');
x = strrep(x, 'n', 'e-9');
x = strrep(x, 'p', 'e-12');
x = strrep(x, 'k', 'e+3');
x = strrep(x, 'K', 'e+3');
x = strrep(x, 'meg', 'e+6');
x = strrep(x, 'm', 'e-3');

ret = x;

end