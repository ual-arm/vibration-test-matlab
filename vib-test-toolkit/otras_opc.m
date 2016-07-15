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

salir_otras_opc=1;
while salir_otras_opc==1;
clc;
show_program_info();
fprintf('Opciones Actuales\n');
fprintf('-------------------------------\n');
fprintf('Amplitud: %.2f V\nOffset: %.2f V\nDuracion del ensayo: %.2f segundos.\n\n',amp,offset,duration);
fprintf('Cambiar Opciones\n');
fprintf('-------------------------------\n');
fprintf('1: Cambiar la amplitud de la onda\n');
fprintf('2: Cambiar el desplazamiento de la onda\n');
fprintf('3: Cambiar la duración de cada ensayo\n');
fprintf('0: Salir\n\n');
opc=input('OPCION: ');
switch opc
case 1
amp=input('Amplitud (V): ');
case 2
offset=input('Desplazamiento (V): ');
case 3
duration=input('Duracion (s): ');
case 0
salir_otras_opc=0;
end
end