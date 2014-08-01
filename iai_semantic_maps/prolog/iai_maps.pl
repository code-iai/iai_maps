%%
%% Copyright (C) 2009 by Lars Kunze, Lorenz Moesenlechner, Moritz Tenorth
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
%%

:- module(iai_maps,
    [
      likely_qual_object_locations/3
    ]).


:-  rdf_meta
          likely_qual_object_locations(r,r,-).


%% likely_qual_object_locations(+ObjClass, -Loc, -Prob) is nondet.
%
% Compute likely object locations using the following schema:
% - If the system knows about an instance of the object class, it returns the
%   container it is in or the surface it is on
% - If no instance can be found in the semantic map, the query returns results
%   computed based on the semantic similarity to other objects and chooses the
%   container or surface where the most similar objects can be found
%
% Prob is a pseudo-probability that is either '1' (if an instance is known)
% or describes the WUP similarity to the most similar object at that location
%
% see also Martin Schuster, Dominik Jain, Moritz Tenorth, Michael Beetz,
%          "Learning Organizational Principles in Human Environments",
%          In IEEE International Conference on Robotics and Automation (ICRA),
%          St. Paul, MN, USA, 2012.
%
% @param ObjClass  OWL identifier of an object class
% @param Loc       OWL identifier of a container instance in the semantic map
% @param Prob      Pseudo-probability of finding an object of type ObjClass at location Loc
%
likely_qual_object_locations(ObjClass, Loc, Prob) :-

  findall(ObjClass-Loc-Prob, (
    (owl_individual_of(ObjInst, ObjClass),
     rdf_triple(knowrob:'in-ContGeneric', ObjInst, Loc),
     Prob=1) ;
    (best_location_maxMaxWup(ObjClass, Loc, Prob), Prob > 0)
  ), Locs),
  list_to_set(Locs, LocsUnique),
  member(ObjClass-Loc-Prob, LocsUnique).
