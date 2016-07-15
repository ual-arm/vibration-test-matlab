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

show_program_info();
fprintf('-----------------\n');
fprintf('Resultados [BODE]\n');
fprintf('-----------------\n\n');
    trasnfer_func= DATOS(:,3)./DATOS(:,2); %Dividimos la salida entre la entrada
    bode_magdb=20*log10(abs(trasnfer_func)); %Pasamos a decibelios
    bode_phase=angle(trasnfer_func);
    phase_deg=radtodeg(bode_phase);
    bode_freq=DATOS(:,1);
    [maxmagbd,maxmagbdindex]=max(bode_magdb);
    [minmagbd,minmagbdindex]=min(bode_magdb);
    freq_resonancia=bode_freq(maxmagbdindex);
fprintf('___________________________________________________');
fprintf('\nFRECUENCIA DE RESONANCIA %f Hz \n',freq_resonancia);
cla;
    subplot(2,1,1)
    semilogx (bode_freq, bode_magdb);
    hold on; semilogx (bode_freq, bode_magdb,'.');
    v=size(bode_freq);
    %axis([1 v(1,1) minmagbd-0.2*minmagbd maxmagbd+0.2*maxmagbd]);
    
    grid on;
    ylabel('Magnitud (dB)')
    xlabel('Frecuencia (Hz)')
    title('Bode Plot')
    subplot(2,1,2)% Segunda gráfica con la fase [2filas,1columna, Nº2]
    semilogx(bode_freq,phase_deg)
    grid on
    ylabel('Fase(Grados)')
    xlabel('Frecuencia (Hz)')    
pause;