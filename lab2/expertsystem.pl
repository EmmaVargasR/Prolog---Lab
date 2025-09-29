% EXPERT SYSTEM ABOUT ECUADORIAN VOLCANOES 

% Facts 
is_active(cotopaxi).
is_active(tungurahua).
is_active(reventador).
is_active(sangay).
is_active(sierra_negra).

is_inactive(chimborazo).
is_inactive(cayambe).
is_inactive(antisana).
is_inactive(altar).
is_inactive(pichincha).
is_inactive(illinizas).

has_glacier(chimborazo).
has_glacier(cotopaxi).
has_glacier(cayambe).
has_glacier(antisana).
has_glacier(altar).
has_glacier(illinizas).

in_andes(cotopaxi).
in_andes(chimborazo).
in_andes(cayambe).
in_andes(tungurahua).
in_andes(antisana).
in_andes(altar).
in_andes(pichincha).
in_amazon(reventador).

near_city(cotopaxi, latacunga).
near_city(chimborazo, riobamba).
near_city(tungurahua, banos).
near_city(pichincha, quito).
near_city(cayambe, cayambe).
near_city(illinizas, machachi).

height_above_6000m(chimborazo).  
height_above_6000m(cotopaxi).    
height_above_6000m(cayambe).     
height_above_5000m(tungurahua).  
height_above_5000m(antisana).  
height_above_5000m(sangay).    
height_above_5000m(altar). 
height_above_5000m(illinizas).      
height_above_4000m(pichincha).   
height_above_4000m(reventador).   

last_eruption_recent(tungurahua).  
last_eruption_recent(reventador).
last_eruption_recent(sangay).
last_eruption_old(cotopaxi).   

% Extra facts
has_crater_lake(altar).
frequent_eruptions(sangay).
frequent_eruptions(reventador).

% Classification rules
is_stratovolcano(Volcano) :- in_andes(Volcano), height_above_6000m(Volcano), height_above_5000m(Volcano).

has_permanent_snow(Volcano) :- has_glacier(Volcano).

is_high_risk(Volcano) :- is_active(Volcano), last_eruption_recent(Volcano).

is_tourist_destination(Volcano) :- has_glacier(Volcano), is_inactive(Volcano).

% User questions
ask(Question, Answer) :-
    write(Question), 
    write(' (yes/no): '),
    nl,
    read(Answer).

% Inference engine
identify_volcano(Volcano) :-
    ask('Is the volcano currently active?', Active),
    (Active == yes ->
        ask('Is it near Quito?', NearQuito),
        (NearQuito == yes -> 
            ask('Does it have a glacier?', Glacier),
            (Glacier == yes -> Volcano = cotopaxi
            ; Volcano = pichincha)
        ;
            ask('Is its last eruption very recent (last 2 years)?', Recent),
            (Recent == yes -> 
                ask('Is it near Banos?', NearBanos),
                (NearBanos == yes -> Volcano = tungurahua
                ;
                ask('Is it constantly erupting?', Constant),
                (Constant == yes -> Volcano = sangay ; Volcano = reventador))
            ;
            Volcano = 'unknown_active_volcano')
        )
    ;
    % For inactive volcanoes
    ask('Is it the highest mountain in Ecuador?', Highest),
    (Highest == yes -> Volcano = chimborazo
    ;
        ask('Does it have a glacier?', Glacier2),
        (Glacier2 == yes ->
            ask('Is it near Quito?', NearQuito2),
            (NearQuito2 == yes -> 
                ask('Is it on the equatorial line?', Equator),
                (Equator == yes -> Volcano = cayambe ; Volcano = antisana)
            ;
            ask('Does it have a crater lake?', CraterLake),
            (CraterLake == yes -> Volcano = altar ; Volcano = antisana)
            )
        ;
            ask('Is it overlooking Quito?', OverlookQuito),
            (OverlookQuito == yes -> Volcano = pichincha
            ; Volcano = 'unknown_inactive_volcano')
        )
    )).

% ambiguity handling
possible_volcanoes(List) :-
    findall(V, (is_active(V), has_glacier(V)), List).

% Recursive rule - height hierarchy
taller_than(chimborazo, cotopaxi).     % 6,263m > 5,897m
taller_than(chimborazo, cayambe).     
taller_than(chimborazo, antisana).     
taller_than(chimborazo, altar).        
taller_than(chimborazo, tungurahua).  
taller_than(chimborazo, sangay).       
taller_than(chimborazo, pichincha).    
taller_than(chimborazo, reventador).   

taller_than(cotopaxi, cayambe).
taller_than(cotopaxi, antisana).
taller_than(cotopaxi, altar).
taller_than(cotopaxi, tungurahua).
taller_than(cotopaxi, sangay).
taller_than(cotopaxi, pichincha).
taller_than(cotopaxi, reventador).

taller_than(cayambe, antisana).
taller_than(cayambe, altar).
taller_than(cayambe, tungurahua).
taller_than(cayambe, sangay).
taller_than(cayambe, pichincha).
taller_than(cayambe, reventador).

taller_than(antisana, altar).
taller_than(antisana, tungurahua).
taller_than(antisana, sangay).
taller_than(antisana, pichincha).
taller_than(antisana, reventador).

taller_than(tungurahua, sangay).
taller_than(tungurahua, pichincha).
taller_than(tungurahua, reventador).

taller_than(sangay, pichincha).
taller_than(sangay, reventador).

taller_than(altar, tungurahua).
taller_than(altar, sangay).
taller_than(altar, pichincha).
taller_than(altar, reventador).
taller_than(pichincha, reventador).

% Recursive rule
taller_than_recursive(Taller, Shorter) :- 
    taller_than(Taller, Shorter).  

taller_than_recursive(Taller, Shorter) :-
    taller_than(Taller, Intermediate),
    taller_than_recursive(Intermediate, Shorter).
