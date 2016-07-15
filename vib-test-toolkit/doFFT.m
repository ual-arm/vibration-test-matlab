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

function [ f,mag ] = doFFT( data,time,ActualRate,duration )
%----------------------------Filtro----------------------------------------
% fs=ActualRate;
% wo = 2*50/fs; bw = wo/70;
% [b,a] = iirnotch(wo,bw,25);
% data2 = filter(b,a,data);
% data=data2;
subplot(2,1,1)% varias graficas en la misma ventana [2filas, 1columna,Nº1]
plot(time,data) %Dibujamos los datos
axis ([1 1.5 -0.1 0.1])
grid on %Propiedades de la gráfica
ylabel('Magnitud (V)')
xlabel('Tiempo (s)')
title('Dominio del Tiempo')
%-------------------ANALIZAMOS LOS DATOS-----------------------------------
absdata=abs(data); %Valor absoluto de data
freq_=mean(absdata); %Media aritmética de absdata
%-----------------REALIZAMOS EL ANALISIS DE FRECUENCIAS--------------------
Fs=ActualRate;
blocksize= duration*ActualRate;
[f,mag]=daqdocfft(data,Fs,blocksize); %Transformada rápida de Fourier (FFT)
[ymax,maxindex]=max(mag); %Frecuencia maxima
freq_=f(maxindex);
subplot(2,1,2)% varias graficas en la misma ventana [2filas,1columna, Nº2]
plot(f,mag)
axis([0 freq_+0.3*freq_ -25 125])% Configuracion de los ejes
grid on %Propiedades de la gráfica
ylabel('Magnitud (dB)')
xlabel('Frequencia (Hz)')
title('Dominio de la Frecuencia. Analisis Armónico')


end

