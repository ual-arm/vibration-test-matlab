%*****************************************************************************
%*              Vibration test toolkit (VTT) for MATLAB                      *
%* Copyright (2011-2016) - Eloy Casas Villalba, Jose-Luis Blanco Claraco,    *
%*                    Juan Jose Arevalo Martin, Antonio Gimenez Fernandez.   *
%*                    University of Almeria                                  *
%*                                                                           *
%* This file is part of VTT.                                                 *
%* VTT is free software: you can redistribute it and/or modify               *
%* it under the terms of the GNU General Public License as published by      *
%* the Free Software Foundation, either version 3 of the License, or         *
%* (at your option) any later version.                                       *
%*                                                                           *
%* VTT is distributed in the hope that it will be useful,                    *
%* but WITHOUT ANY WARRANTY; without even the implied warranty of            *
%* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
%* GNU General Public License for more details.                              *
%*                                                                           *
%* You should have received a copy of the GNU General Public License         *
%* along with VTT.  If not, see <http://www.gnu.org/licenses/>.              *
%*****************************************************************************

function [amp_daq, freqs,fft_amps, amp_daq2, GRAB ]=daq(duration,freq_)
% esta funcion lanza la tarjeta de adquisicion durante duration y con esos
% datos calcula la amplitud y fase de la señal capturada en la freciencia
% - {amp_daq, amp_daq2}: amplitud de la señal capturada en la frecuencia
% freq_ en el canal 1 y 2, respectivamente.
%freqs: cada una de las frecuencias(Hz) para las amplitudes en fft_amps
%fft_amps: fft(compleja) de toda la señal capturada
% freq_(hz)
%
%

% Make sure:
%disp('Buscando dispositivo...');
devs=daq.getDevices();

if (length(devs.Vendor)~=1),
    error('¿Se encuentra el dispositivo USB conectado?');
end
dev=devs(1);


% Create session:
s = daq.createSession ('ni');

%Canal entrada
[ch1,idx1] = s.addAnalogInputChannel(dev.ID, 'ai1', 'Voltage');

%Canal salida
[ch2,idx2] = s.addAnalogInputChannel(dev.ID, 'ai2', 'Voltage');

ch1.TerminalConfig='SingleEnded';
ch2.TerminalConfig='SingleEnded';

% Capture:
s.IsContinuous = true;
s.Rate = 10000;
s.prepare();

global GRAB;
GRAB=[];

%disp('Pulsa una tecla para EMPEZAR a grabar...');
%pause;

%[data,timeStamps,triggerTime] = s.startForeground();
lh = s.addlistener('DataAvailable', @grabData); 

s.startBackground();


pause(duration);

s.stop();
delete (lh);

% FIL=sprintf('GRAB_%s.txt', datestr(now(),'yyyy_mm_dd_HH_MM_SS') ) ;
% fprintf('Saving to: %s\n',FIL);
% save(FIL,'GRAB', '-ascii');

time=GRAB(:,1);
data=GRAB(:,2);
data2=GRAB(:,3);
%doFFT(data,time,10e3,size(GRAB,1)/10e3);

%Filtro Paso Alto de Butterworth donde la formula es [b,a]=butter(orden del
%filtro, [freq de corte/freq sampleo medios], 'high')
    [b,a]= butter (5, 5/5000, 'high');
    data= filter(b,a,data);
    data2= filter(b,a,data2);
%----------------------------Filtro----------------------------------------
if (0)
 fs=10000;
 wo = 100/(fs/2); bw = wo/70;
 [b,a] = iirnotch(wo,bw,25);
 data = filter(b,a,data);
 data2 = filter(b,a,data2);
end 

    
% Determinar la amplitud a "freq_" (Hz)
L = length(data);

%data = data .* hamming(L);

freq_index= round(freq_/10000*L)+1;
amp_daq = goertzel(data,freq_index);
amp_daq2 = goertzel(data2,freq_index);

fft_amps = fft(GRAB(:,2));
% Quitamos la mitad "espejo": 
fft_amps = fft_amps(1:(L/2));
freqs= linspace (0,s.Rate/2,length(fft_amps));

end

function grabData(~,event)  % ~: src (not used)
    global GRAB;
    figure(1);
    GRAB=[GRAB;event.TimeStamps event.Data];
    data=GRAB(1:end,2:end);
    if (0)
        [b,a]= butter (5, [5 /5000], 'high');
        data= filter(b,a,data);
    end   
    
    plot(GRAB(1:end,1),data);
end

