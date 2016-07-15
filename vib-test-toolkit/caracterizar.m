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

%Caracterización de la mesa de vibraciones. Esta se realizará variando la
%amplitud de la onda viendo su comportamiento hasta llegar a saturar.
%Para esto se recurrira a la FFT.

disp('Elija una opción');
fprintf('0: Salir del programa\n');
fprintf('1: Ensayar\n');
fprintf('2: Cargar Datos\n');
opc=input('Inserte Opcion: ');

switch opc
  case 0
      return;

  case 1

      %AMP=input('Introduzca Amplitudes en mVpp a ensayar');
      %FREQS=input('Introduzca Frecuencias a ensayar');

      AMP=[];
      str=inputdlg('Introduzca Amplitudes a ensayar separados por espacios o comas [mVpp]:');
      if((~isempty(str))&&(~isempty(str{1})))
        AMP=eval( sprintf('[%s]',str{1}) );
      else 
          return;
      end

      FREQS=[];
      str=inputdlg('Introduzca Frecuencias ensayar separados por espacios o comas [Hz]:');
      if((~isempty(str))&&(~isempty(str{1})))
        FREQS=eval( sprintf('[%s]',str{1}) );
      else 
        return;
      end
      
case 2
     DATOS=inputdlg('Nombre de Archivo: ','s');
     load(DATOS);

   %no podemos sacar la fft de cada ensayo por separado porque eso solo lo hacemos en el momento de tomar los datos ??       
     % Bode para esta amplitud:

 bode_magdb=20*log10(abs(DATOS(:,2))); %Pasamos a decibelios
 bode_phase=angle(DATOS(:,2));
 phase_deg=radtodeg(bode_phase);
 bode_freq=DATOS(:,1); 
 subplot(2,1,1)
 semilogx (bode_freq, bode_magdb);
 hold on; 
 semilogx (bode_freq, bode_magdb,'.');
 v=size(bode_freq);


 grid on;
 ylabel('Magnitud (dB)')
 xlabel('Frecuencia (Hz)')
 title('Bode Plot')
 subplot(2,1,2)% Segunda gráfica con la fase [2filas,1columna, Nº2]
 semilogx(bode_freq,phase_deg)
 grid on
 ylabel('Fase(Grados)')
 xlabel('Frecuencia (Hz)')       


 otherwise
     fprintf('\nERROR: OPCION NO VALIDA\n');
end

%para seguir con las pruebas dejaremos esto asi para evitar abrir el menu
%cada vez
% AMP=[ 1000]; %, 500, 750, 1000, 1250, 1500];
% FREQS=[550, 600, 625, 650, 675];%, 75, 95, 115, 165, 225];

DATOS_ALL_FFT = struct();
DATOS_ALL_FFT.FFTs=cell(length(AMP),length(FREQS));
DATOS_ALL_FFT.AMP = AMP;
DATOS_ALL_FFT.FREQS = FREQS;

for iAmp=1:length(AMP)
    for iFreqs=1:length(FREQS)
    freq_=FREQS(iFreqs);
    fprintf('Midiendo en %.03fHz...\n',freq_);
    c=sprintf('APPL:SIN %f HZ, %f mVPP, %f V',freq_,AMP(iAmp),offset); %Enviamos la señal al generador de funciones
    fprintf(vt,c);

    % esperamos a que la nueva vibracion sea estable:
    pause(1.0);
    
    % Medimos la amplitud en esta frecuencia.
    % amp_daq: It returns the magnitude & phase of the signal in channel #1
    % fft_amps: Returns the full FFT (useful for armonic detection, etc.)
    [amp_daq,freqs,fft_amps ]=daq(duration,freq_);
    
    fprintf('Medido en %.03f Hz %.03f mVpp -> %f\n',freq_,AMP(iAmp), abs(amp_daq) );

    DATOS(iFreqs,1)=freq_;
    DATOS(iFreqs,2)=amp_daq; %preguntar por que no es FFT_AMPS ya que AMP_DAQ es con goertzel.
    DATOS_ALL_FFT.FFTs{iAmp,iFreqs} = fft_amps;
    
    %Ventana de Hamming
        %ventana=hamming(amp_daq);
        % Una gráfica de FFT para cada caso:
        figure;
        semilogx(freqs, 20*log10(abs(fft_amps)));
        xlabel('Freq (Hz)');
        ylabel('Ampl (dB)');
        title(sprintf('FFT %.03fHz %.03f mVpp',freq_,AMP(iAmp) ));
    end
    
    % Bode para esta amplitud:
    
    bode_magdb=20*log10(abs(DATOS(:,2))); %Pasamos a decibelios
    bode_phase=angle(DATOS(:,2));
    phase_deg=radtodeg(bode_phase);
    bode_freq=DATOS(:,1); 
    subplot(2,1,1)
    semilogx (bode_freq, bode_magdb);
    hold on; 
    semilogx (bode_freq, bode_magdb,'.');
    v=size(bode_freq);
    
    
    grid on;
    ylabel('Magnitud (dB)')
    xlabel('Frecuencia (Hz)')
    title(sprintf('FFT %.03fHz %.03f mVpp Bode Plot',freq_,AMP(iAmp) ))
    subplot(2,1,2)% Segunda gráfica con la fase [2filas,1columna, Nº2]
    semilogx(bode_freq,phase_deg)
    grid on
    ylabel('Fase(Grados)')
    xlabel('Frecuencia (Hz)')
end

fprintf(vt,'*RST');

%doFFT( data,time,ActualRate,duration )
%Guardar datos
sDefaultName = sprintf(datestr(now(),'yyyy_mm_dd_HH_MM_SS'));  
FileName = uiputfile( '*.mat', 'Grabar datos del experimento', sDefaultName);

save(FileName, 'DATOS','DATOS_ALL_FFT');

