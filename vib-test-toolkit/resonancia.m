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


%Programa creado por Juan José Arévalo Martín para su proyecto fin de
%carrera. Curso 2010-2011.
%El fin del programa será hallar la frecuencia de resonancia de un
%objeto que se situará en el shaker, aparato que proporciona un
%vibracion mecanica de frecuencia y magnitud variable.
%Con este programa nos proponemos 3 cosas:
%1º: Controlar las frecuencias de estudio, aunque se podrian cambiarlas
%frecuencias de forma manual en el propio generador de funciones,hacer un
%barrido discreto de frecuencia de forma automática nos ahorrarátrabajo y
%esfuerzo.
%2º: Adquirir en cada frecuencia los datos del acelerómetro a travesde la
%tarjeta de adquisicion de datos
%3º: Graficar el Diagrama de Bode correspondiente del objeto analizado y hallar con los datos obtenidos la
%funcionde transferencia del sistema
%************************LIMPIAMOS LAPANTALLA*****************************

%************************MENSAJE DEBIENVENIDA********************************
%Pantalla de bienvenida con las opciones generales
salir=0;
%Configuramos los parametros por defecto
amp=1;
offset=0;
duration=3;
N=1;
while salir==0
show_program_info();
fprintf('--------------\n');
fprintf('Menu principal\n');
fprintf('--------------\n\n');
fprintf('0: Salir del programa\n');
fprintf('1: Frecuencia discreta\n');
fprintf('2: Barrido de frecuencias\n');
fprintf('3: Datos tomados\n');
fprintf('4: Comunicacion con Agilent 33220A\n');
fprintf('5: Otras opciones\n');
fprintf('6: Cargar y Salvar archivos\n');
fprintf('7: Analizar Resultados\n');
fprintf('8: Caracterizar Banco\n\n');
opc_inicio=input('Inserte Opcion: ');
switch opc_inicio
case 0
salir=1;
case 1
an_freq_discreta
case 2
an_freq_barrido
case 3
freq_datos
case 4
info_instru
case 5
otras_opc
case 6
archivos;
case 7
resultados;
case 8
caracterizar;    
otherwise
fprintf('\nERROR: OPCION NO VALIDA\n');
end
end