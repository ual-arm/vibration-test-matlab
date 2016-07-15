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


salir_resultados=1;
while salir_resultados==1
clc;
show_program_info();

fprintf('Resultados\n');
fprintf('----------\n\n');
fprintf('0: Salir del programa\n');
fprintf('1: Cargar datos\n');
fprintf('2: Datos tomados\n');
fprintf('3: Bode\n');
fprintf('4: Funcion en el espacio de estados\n');
opc=input('Inserte Opcion: ');
switch opc
    case 0
        salir_resultados=0;

    case 1
        fprintf('\n\n1: Cargar DATOS\n');
        clear DATOS;
%        clear N;
        G=uigetfile('*.mat','Nombre de Archivo: ');
        DAT=load(G);
        DATOS=DAT.DATOS;

   case 2
        fprintf('\nDAtos de ENTRADA\n');
        fprintf(' Freq (Hz) Amp (V)\n');
        fprintf(' ======== =======\n');
        disp(entrada);
        fprintf('\nDAtos de SALIDA\n');
        fprintf(' Freq (Hz) Amp (V)\n');
        fprintf(' ======== =======\n');
        disp(salida);
        pause;

    case 3
        dibujar_bode

    case 4
        transferencia
    
    otherwise
        fprintf('\nERROR: OPCION NO VALIDA\n');
end
end