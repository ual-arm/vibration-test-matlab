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

salir_archivos=1;
while salir_archivos==1
clc;
show_program_info();

fprintf('------------------------\n');
fprintf('Cargar y Salvar Archivos\n');
fprintf('------------------------\n\n');
fprintf('IMPORTANTE: SALVE ANTES DE CARGAR, LOS DATOS PUEDEN SOBREESCRIBIRSE Y PERDERLOS\n\n');
fprintf('0: Salir del programa\n');
fprintf('1: Cargar Datos\n');
fprintf('2: Salvar datos\n');
opc_archivos=input('Inserte Opcion: ');
switch opc_archivos;
    case 0
        salir_archivos=0;
        
    case 1
        G=input('Nombre de Archivo: ','s');
        load(G);
        
    case 2
        arch=input('Nombre del archivo [DATOS,N]: ','s');
        save(arch,'DATOS','N');
        
    end
end