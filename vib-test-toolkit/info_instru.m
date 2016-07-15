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

salir_info_instru=0;
while salir_info_instru==0;
%clc;
show_program_info();
fprintf('-------------------------------\n');
fprintf('Comunicacion con Agilent 33220A\n');
fprintf('-------------------------------\n');
fprintf('\nIMPORTANTE: NO ELIMINE vt NI CIERRE MATLAB HASTA FINALIZAR LA COMUNICACION\n');
fprintf('IMPORTANTE: NO INICIE LA COMUNICACION HASTA TENER CONEXION LOCAL LAN\n\n');
fprintf('0: Salir de Comunicacion con Agilent 33220A\n');
fprintf('1: Iniciar Comunicacion\n');
fprintf('2: Finalizar comunicacion\n');
fprintf('3: Informacion de Agilent 33220A\n');
fprintf('4: Status\n');
opc_instru=input('Inserte Opcion: ');
switch opc_instru
case 0
salir_info_instru=1;
case 1
vt=inicia_inst; %Inicia la comunicacion creando el objeto

case 2
fclose(vt); %Cierra la comunicación

case 3
getvt;
pause;
case 4
vt.status %Informa del estatus de la comunicación open/close del objeto
pause;
otherwise
fprintf('\nERROR: OPCION NO VALIDA\n');
end
end