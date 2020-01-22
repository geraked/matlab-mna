function Mna(file)

global netlist

fileID = fopen(file);
netlist = textscan(fileID,'%s %s %s %s %s %s');
fclose(fileID);

fstart = 0;
fend = 0;
nodein = 0;
nodeout = 0;

for i = 1 : length(netlist{1})
    s = netlist{1}{i};
    switch(s(1))
        case{'R','r'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            res(n1, n2, val);
        case{'C','c'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            cap(n1, n2, val);
        case{'I','i'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            cur(n1, n2, val);
    end
end

for i = 1 : length(netlist{1})
    s = netlist{1}{i};
    switch(s(1))
        case{'L','l'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            ind(n1, n2, val);
        case{'V','v'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            vol(n1, n2, val);
        case{'I','i'}
            n1 = str2double(netlist{2}{i});
            n2 = str2double(netlist{3}{i});
            val = str2double(spicerep(netlist{4}{i}));
            cur(n1, n2, val);
        case{'E','e'}
            k = str2double(netlist{2}{i});
            kp = str2double(netlist{3}{i});
            j = str2double(netlist{4}{i});
            jp = str2double(netlist{5}{i});
            t = str2double(spicerep(netlist{6}{i}));
            VCVS(k, kp, j, jp, t);
        case{'G','g'}
            k = str2double(netlist{2}{i});
            kp = str2double(netlist{3}{i});
            j = str2double(netlist{4}{i});
            jp = str2double(netlist{5}{i});
            t = str2double(spicerep(netlist{6}{i}));
            VCCS(k, kp, j, jp, t);
        case{'.'}
            fstart = str2double(spicerep(netlist{2}{i}));
            fend = str2double(spicerep(netlist{3}{i}));
            nodein = str2double(netlist{4}{i});
            nodeout = str2double(netlist{5}{i});
    end
end

f = logspace(log10(fstart), log10(fend), 1000);
Y = resultfunc(f, nodein, nodeout);

subplot(2, 1, 1)
plot(f, Y(1, :))
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
set(gca, 'XScale', 'log'); grid;

subplot(2, 1, 2)
plot(f, Y(2, :))
xlabel('Frequency (Hz)');
ylabel('Phase (deg)');
set(gca, 'XScale', 'log'); grid;