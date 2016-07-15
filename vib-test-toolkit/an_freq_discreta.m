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
%************************ANALISIS EN FRECUENCIA DISCRETA*******************
%Pantalla de bienvenida con las opciones generales
show_program_info();
fprintf('------------------\n');
fprintf('Analisis en Frecuencia Discreta\n');
fprintf('------------------\n\n');
fprintf('IMPORTANTE: NO ENVIE LA ONDA HASTA INICIAR LA COMUNICACIÓN\n\n');
salir_freq_discreta=1;
fprintf('0: SALIR DEL ANÁLISIS \n1: PERMANECER EN EL ANÁLISIS\n');
salir_freq_discreta=input('OPCIÓN: ');
clc
while salir_freq_discreta==1;
fprintf('\t\t\t\t\t\t\t\t==============\n');
fprintf('\t\t\t\t\t\t\t\tRESONANCIA 1.0\n');
fprintf('\t\t\t\t\t\t\t\t==============\n\n');
fprintf('Programa creado por Juan José Arévalo Martín \n');
fprintf('Curso 2010-2011 \n');
fprintf('Todos los derechos reservados © \n\n\n');
fprintf('------------------\n');
fprintf('Analisis en Frecuencia Discreta\n');
fprintf('------------------\n\n');
fprintf('IMPORTANTE: NO ENVIE LA ONDA HASTA INICIAR LA COMUNICACIÓN\n\n');
freq_=input('Inserte la frecuencia: ');
comprobacion50hz= mod(freq_,50);
%Comprobamos que la frecuencia no es 50 ni ninguno de sus armónicos
if comprobacion50hz~=0
%Enviamos la señal sinusoidal con las caracteristicas señaladas
s=sprintf('APPL:SIN %f HZ, %f VPP, %f V',freq_,amp,offset);
fprintf(vt,s);
[amp_daq]=daq(duration,freq_);
fprintf(vt,'*RST')

% Modulo de adquisicion de datos devuelve la maxima frecuencia registrada y la amplitud caracteristica para esa frecuencia
DATOS(N,1)=freq_; 
%Añadimos los datos a la matriz de datos
DATOS(N,2)=amp_daq;
N=N+1; 
%sumamos una medida
end
fprintf('\nFIN DEL ANÁLISIS\n\n');
salir_freq_discreta=input('Para salir pulse 0: ');
end