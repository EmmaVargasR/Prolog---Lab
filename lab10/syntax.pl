sentence(Sem) --> noun_phrase(Subj), verb_phrase(Subj, Sem).
noun_phrase(Subj) --> determiner, adjectives, noun(Subj).
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

adjectives --> [].
adjectives --> adjective, adjectives.
adjective --> [big].
adjective --> [small].
adjective --> [angry].
