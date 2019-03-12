include("data_urea_maximization.jl")
include("Flux.jl")
using DelimitedFiles

#check_reaction
S = stoichiometric_matrix[:,1:6];      ## w/o transfer reaction
epsilon = atom_matrix*S;
##eplison_sum = sum(epsilon,dims=(2));

writedlm("epsilon.txt",epsilon,"    ");
writedlm("stoichiometric_matrix.csv",stoichiometric_matrix,",");
writedlm("atom_matrix.csv",atom_matrix,",");
