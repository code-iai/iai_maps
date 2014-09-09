%% Copyright (C) 2013 by Moritz Tenorth, Jan Winkler
%%
%% This program is free software; you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation; either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License for more details.
%%
%% You should have received a copy of the GNU General Public License
%% along with this program.  If not, see <http://www.gnu.org/licenses/>.


:- register_ros_package(knowrob_map_tools).
:- register_ros_package(knowrob_map_data).
:- register_ros_package(iai_maps).

:- rdf_db:rdf_register_ns(iai_maps, 'http://knowrob.org/kb/room.owl#', [keep(true)]).

