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

%************************LIMPIAMOS LA PANTALLA*****************************
clc;
%************************ANALISIS EN FRECUENCIA BARRIDO*******************
%Pantalla de bienvenida
fprintf('------------------------------\n');
fprintf('Analisis en Frecuencia Barrido\n');
fprintf('------------------------------\n\n');
fprintf('IMPORTANTE: NO ENVIE LA ONDA HASTA INICIAR LA COMUNICACIÓN\n\n');
disp('Pulse una tecla para comenzar. Ctrl+C para abortar.');
pause;
freq_barr_inicio=input('Inserte la frecuencia inicial (Hz): ');
freq_barr_fin=input('Inserte la frecuencia final (Hz): ');
freq_barr_num_pasos=input('Inserte el número de pasos de frecuencia: ');

 freqs= exp(linspace(log(freq_barr_inicio), log(freq_barr_fin), freq_barr_num_pasos));
%freqs= linspace (freq_barr_inicio, freq_barr_fin, freq_barr_num_pasos);

for i=1:freq_barr_num_pasos
    freq_=freqs(i);
    fprintf('Midiendo en %.03fHz...\n',freq_);
    c=sprintf('APPL:SIN %f HZ, %f VPP, %f V',freq_,amp,offset); %Enviamos la señal al generador de funciones
    fprintf(vt,c)

    % esperamos a que la nueva vibracion sea estable:
    pause(1.0);
    
    % Medimos la amplitud en esta frecuencia.
    [amp_daq, ~,~, amp_daq2]=daq(duration,freq_);
    
    fprintf('Medido en %.03fHz -> %f\n',freq_, abs(amp_daq) );

    DATOS(i,1)=freq_;
    DATOS(i,2)=amp_daq;
    DATOS(i,3)=amp_daq2;
end

fprintf(vt,'*RST');

% Plots:
 plot(DATOS(:,1), abs( DATOS(:,2)));
 title('Bode (amplitud) Acelerómetro 1');
 xlabel('Freq (Hz)');
 
  plot(DATOS(:,1), abs( DATOS(:,3)));
 title('Bode (amplitud) Acelerómetro 2');
 xlabel('Freq (Hz)');

%Guardar datos
 sDefaultName = sprintf(datestr(now(),'yyyy_mm_dd_HH_MM_SS'));  
 FileName = uiputfile( '*.mat', 'Grabar datos del experimento', sDefaultName);

 save(FileName, 'DATOS');
 