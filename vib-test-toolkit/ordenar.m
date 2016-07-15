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

i=1;
while i<=(N-1)
j=1;
while j<=((N-1)-i)
if DATOS(j,1)>DATOS(j+1,1);
aux_freq=DATOS(j,1);
DATOS(j,1)=DATOS(j+1,1);
DATOS(j+1,1)=aux_freq;
aux_amp=DATOS(j,2);
DATOS(j,2)=DATOS(j+1,2);
DATOS(j+1,2)=aux_amp;
end
j=j+1;
end
i=i+1;
end