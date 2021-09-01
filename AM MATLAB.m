function am = ssbsc
Am = input('Enter the value of message signal Amplitude: ');
Ac = input('Enter the value of carrier signal Amplitude: ');
fm = input('Enter the value of message signal frequency: ');
fc = input('Enter the value of carrier signal frequency: ');
m = Am/Ac;
A = (Am*Ac)/2;
Tm = 1/fm;
Tc = 1/fc;
t = 0:Tc/999:6*Tc;
T1 = 0:Tm/999:6*Tm;
message_signal = Am*cos(2*pi*fm*t);
message_Signal1 = Am*cos(2*pi*fm*T1);
carrier_signal = Ac*cos(2*pi*fc*t);
x1 = sin(2*pi*fc*t).*sin(2*pi*fm*t);
x2 = cos(2*pi*fc*t).*cos(2*pi*fm*t);
x3 = x1+x2;
x4 = x2-x1;
SSBSC_lsb = A*(x3);
SSBSC_usb = A*(x4);
subplot(4,1,1)
plot(T1, message_Signal1, 'r');
grid();
title('message signal');
subplot(4,1,2)
plot(t, carrier_signal, 'g');
grid();
title('Carrier signal');
subplot(4,1,3)
plot(t, SSBSC_lsb, 'b');
grid();
title('LSB - SSBSC');
subplot(4,1,4)
plot(t, SSBSC_usb, 'r');
grid();
title('USB - SSBSC');
end