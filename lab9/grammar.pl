% example from the lab 
sentence --> noun_phrase, verb_phrase. 
verb_phrase --> verb, noun_phrase.
noun_phrase --> determiner, adjectives, noun.
adjectives --> []|adjective, adjectives.

% grammar for a different type of sentence 
sentence2 --> noun2_phrase, verb2_phrase, predicate_phrase.
noun2_phrase --> determiner, noun2.
verb2_phrase --> verb2.
predicate_phrase  --> preposition, determiner, place.

% grammar for questions 
question --> auxiliar_verb, noun3_phrase, verb3_phrase.
auxiliar_verb --> auxiliar.
noun3_phrase --> noun3.
verb3_phrase --> verb3.

% Lexicon
determiner	-->	[the]|[a].	
noun	-->	[cat]|[dog]|[fish]|[bird].	
verb	-->	[eats]|[sees].	
adjective	-->	[big]|[small]|[angry].	
preposition --> [in]|[at].
noun2 -->[girl]|[kid]|[boy].
verb2 -->[plays]|[runs]|[paints].
place --> [patio]|[park]|[house]|[school].
auxiliar --> [do]|[can].
noun3 --> [you]|[they]|[we].
verb3 --> [cook]|[clean]|[dance].
