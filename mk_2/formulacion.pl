:- ['elementos.pl'].

% RULES
% Regla para convertir los caracteres en números 
string_elemento([], []).

string_elemento([X|R] , [E|S]) :-
	atom_number(X, E),
	string_elemento(R, S).

string_elemento([X|R], [X|S]) :-
	string_elemento(R, S).

% Regla para reordenar los elementos
invertir_elemento([], []).

invertir_elemento([X,Y,Z|R], [W,Z|S]) :-
	atom_concat(X,Y,W),
	elemento(W),
	prefijo(Z,_),
	invertir_elemento(R,S).

invertir_elemento([X,Y|R], [X,Y|S]) :-
	elemento(X),
	prefijo(Y,_),
	invertir_elemento(R,S).

invertir_elemento([X,Y|R], [W|S]) :-
	atom_concat(X,Y,W),
	elemento(W),
	invertir_elemento(R,S).

invertir_elemento([X|R], [X|S]) :-
	elemento(X),
	invertir_elemento(R,S).

% Regla para comprobar que se trata de un compuesto binario
tipo_correcto([X,Y|_], _) :-
	prefijo(X,_),
	elemento_nombre(Y,oxigeno);
	elemento_nombre(Y,hidrogeno).

tipo_correcto([X|_], _) :-
	elemento_nombre(X,oxigeno);
	elemento_nombre(X,hidrogeno).

tipo_correcto([X,Y,Z,W|_], _) :-
	prefijo(X,_),
	prefijo(Z,_),
	elemento_tipo(Y, no-metal),
	elemento_tipo(W, metal).

tipo_correcto([X,Y,Z|_], _) :-
	prefijo(X,_),
	elemento_tipo(Y, no-metal),
	elemento_tipo(Z, metal).

tipo_correcto([X,Y,Z|_], _) :-
	elemento_tipo(X, no-metal),
	prefijo(Y,_),
	elemento_tipo(Z, metal).

tipo_correcto([X,Y|_], _) :-
	elemento_tipo(X, no-metal),
	elemento_tipo(Y, metal).

% Regla para pasar de elementos a nombres
nombre_prefijo([], []).

nombre_prefijo([X,o|R], [E,oxido,de|S]) :-
	prefijo(X,E),
	nombre_elemento(R,S), !.

nombre_prefijo([o|R], [mon,oxido,de|S]) :-
	nombre_elemento(R,S), !.

nombre_prefijo([X,Y|R], [E,W,de|S]) :-
	prefijo(X,E),
	elemento_prefijo(Y,W),
	nombre_elemento(R,S), !.

nombre_prefijo([X|R], [mono,E,de|S]) :-
	elemento_prefijo(X,E),
	nombre_elemento(R,S), !.

nombre_elemento([], []).

nombre_elemento([X|R], [E|S]) :-
	prefijo(X,E),
	nombre_elemento(R,S).

nombre_elemento([X|R], [E|S]) :-
	elemento_nombre(X,E),
	nombre_elemento(R,S).

% Regla para formar el compuesto con sus nombres
formular([X,Y,W,V,Z|_], E) :-
	!, atomic_list_concat([X,Y,' ',W,' ',V,Z], '', A),
	atom_string(A, E).

formular([X,Y,W,Z|_], E) :-
	!, atomic_list_concat([X,Y,' ',W,' ',Z], '', A),
	atom_string(A, E).

% Componer el compuesto químico
compuesto_quimico(X, R) :-
	atom_chars(X, StringElementos),
	string_elemento(StringElementos, Elementos),
	invertir_elemento(Elementos, Elementos2),
    reverse(Elementos2, Elementos3),
    tipo_correcto(Elementos3, _),
    nombre_prefijo(Elementos3, Elementos4),
    formular(Elementos4, R).

% FACTS
prefijo(2, di).
prefijo(3, tri).
prefijo(4, tetra).
prefijo(5, penta).
