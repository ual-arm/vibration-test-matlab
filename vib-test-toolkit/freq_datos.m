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


salir_freq_datos=1;
%Distinguimos entre 0 datos tomados y algun dato tomado.
while salir_freq_datos==1
if N==1
ordenar
clc;
show_program_info();

fprintf('-------------\n');
fprintf('Datos tomados\n');
fprintf('-------------\n\n');
fprintf('\n Nºde Datos tomados: %.0f \n\n',N-1);
end
if N~=1
ordenar;
clc;
fprintf('\t\t\t\t\t\t\t\t==============\n');
fprintf('\t\t\t\t\t\t\t\tRESONANCIA 1.0\n');
fprintf('\t\t\t\t\t\t\t\t==============\n\n');
fprintf('Programa creado por Juan José Arévalo Martín \n');
fprintf('Curso 2010-2011 \n');
fprintf('Todos los derechos reservados © \n\n\n');
fprintf('-------------\n');
fprintf('Datos tomados\n');
fprintf('-------------\n\n');
disp(DATOS);
s=input('Desea borrar los datos (s/n)','s');
if(s=='s')
%Borramos los datos
clear DATOS;
N=1;
DATOS=[];
end
end
salir_freq_datos=input('0: Salir');
end