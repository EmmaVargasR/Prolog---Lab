sentence(Sem) --> noun_phrase(Subj), verb_phrase(Subj, Sem).
noun_phrase(entity(Subj, Mods)) --> determiner, adjectives(Mods), noun(Subj).
verb_phrase(Subj, Sem) --> verb(V), noun_phrase(Obj), { Sem =.. [V, Subj, Obj] }.

determiner --> [the].
determiner --> [a].
noun(cat)  --> [cat].
noun(dog)  --> [dog].
noun(girl) --> [girl].
noun(kid)  --> [kid].
noun(fish) --> [fish].
noun(bird) --> [bird].
verb(eat)  --> [eats].
verb(see)  --> [sees].
verb(love) --> [loves].

adjectives([]) --> [].
adjectives([M|Ms]) --> adjective(M), adjectives(Ms).
adjective(big)   --> [big].
adjective(small) --> [small].
adjective(angry) --> [angry].
