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

clc;
show_program_info();
fprintf('-------------------------------\n');
fprintf('Comunicacion con Agilent 33220A\n');
fprintf('-------------------------------\n');
fprintf('\nIMPORTANTE: clearNO ELIMINE vt NI CIERRE MATLAB HASTA FINALIZAR LA COMUNICACION\n');
fprintf('IMPORTANTE: NO INICIE LA COMUNICACION HASTA TENER CONEXION LOCAL LAN\n\n');
get(vt);
pause;