list_of_metabolites = [
      "arginine";               #M.1  arg
      "ornithine";              #M.2  orn
      "urea";                   #M.3  u
      "carbamoyl_phosphate";    #M.4  camp
      "aspartate";              #M.5  asp
      "citrulline";             #M.6  cit
      "arginine_succinate";     #M.7  arg_s
      "fumarate";               #M.8  fum
      "water";                  #M.9  H2O
      "ATP";                    #M.10 ATP
      "AMP";                    #M.11 AMP
      "diphosphate";            #M.12 PPi
      "orthophosphoric_acid";   #M.13 H3PO4
      "NADPH";                  #M.14 NADPH
      "NADP";                   #M.15 NADP
      "oxygen";                 #M.16 O2
      "nitric oxide";           #M.17 NO
      "H"                       #M.18 H
      ];

list_of_fluxes = [  "v1"       # e.c.6.3.4.5 asp-->arg_s
                    "v2"       # e.c.4.3.2.1 arg_s-->arg
                    "v3"       # e.c.3.5.3.1 arg-->orn
                    "v4"       # e.c.2.1.3.3 orn-->cit
                    "v5"       # e.c.1.14.13.39 arg-->cit
                    "v6"       # e.c.1.14.13.39 cit-->arg
                    "b1"       # []-->camp
                    "b2"       # []-->asp
                    "b3"       # fum-->[]
                    "b4"       # u-->[]
                    "b5"       # []-->ATP
                    "b6"       # AMP-->[]
                    "b7"       # PPi-->[]
                    "b8"       # H3PO4-->[]
                    "b9"       # []<-->H2O
                    "b10"      # NADPH<-->[]
                    "b11"      # H<-->[]
                    "b12"      # NADP<-->[]
                    "b13"      # NO<-->[]
                    "b14"      # O2<-->[]
                     ];

list_element = ["C"; "H"; "N"; "O"; "P"];

atom_matrix = [
## M.  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18
       6  5  1  1  4  6 10  4  0 10 10  0  0 21 21  0  0  0;      #C
      14 12  4  4  7 13 18  4  2 16 14  4  3 30 29  0  0  1;      #H
       4  2  2  1  1  3  4  0  0  5  5  0  0  7  7  0  1  0;      #N
       2  2  1  5  4  3  6  4  1 13  7  7  4 17 17  2  1  0;      #0
       0  0  0  1  0  0  0  0  0  3  1  2  1  3  3  0  0  0       #P
              ];

stoichiometric_matrix = [
## v1 v2 v3 v4 v5 v6 b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14
  0.0  1 -1  0 -2  2  0  0  0  0  0  0  0  0  0  0   0   0   0   0;        # M.1
    0  0  1 -1  0  0  0  0  0  0  0  0  0  0  0  0   0   0   0   0;        # M.2
    0  0  1  0  0  0  0  0  0 -1  0  0  0  0  0  0   0   0   0   0;        # M.3
    0  0  0 -1  0  0  1  0  0  0  0  0  0  0  0  0   0   0   0   0;        # M.4
   -1  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0   0   0   0   0;        # M.5
   -1  0  0  1  2 -2  0  0  0  0  0  0  0  0  0  0   0   0   0   0;        # M.6
    1 -1  0  0  0  0  0  0  0  0  0  0  0  0  0  0   0   0   0   0;        # M.7
    0  1  0  0  0  0  0  0 -1  0  0  0  0  0  0  0   0   0   0   0;        # M.8
    0  0 -1  0  4 -4  0  0  0  0  0  0  0  0  1  0   0   0   0   0;        # M.9
   -1  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0   0   0   0   0;        # M.10
    1  0  0  0  0  0  0  0  0  0  0 -1  0  0  0  0   0   0   0   0;        # M.11
    1  0  0  0  0  0  0  0  0  0  0  0 -1  0  0  0   0   0   0   0;        # M.12
    0  0  0  1  0  0  0  0  0  0  0  0  0 -1  0  0   0   0   0   0;        # M.13
    0  0  0  0 -3  3  0  0  0  0  0  0  0  0  0 -1   0   0   0   0;        # M.14
    0  0  0  0  3 -3  0  0  0  0  0  0  0  0  0  0   0   1   0   0;        # M.15
    0  0  0  0 -4  4  0  0  0  0  0  0  0  0  0  0   0   0   0  -1;        # M.16
    0  0  0  0  2 -2  0  0  0  0  0  0  0  0  0  0   0   0   1   0;        # M.17
    0  0  0  0 -3  3  0  0  0  0  0  0  0  0  0  0  -1   0   0   0         # M.18
];

(number_of_species,number_of_fluxes) = size(stoichiometric_matrix);

default_bounds_array = zeros(number_of_fluxes,2);

## maximization function (in this case which is urea production flux b4)
objective_coefficient_array = zeros(number_of_fluxes);

##RHS of S*v==0
species_bounds_array = zeros(number_of_species,2);
