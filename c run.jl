include("data_urea_maximization.jl")
include("Flux.jl")
using DelimitedFiles

k_cat = [203;           ## e.c.6.3.4.5
        34.5;           ## e.c.4.3.2.1
         249;           ## e.c.3.5.3.1
        88.1;           ## e.c.2.1.3.3
        13.7;           ## e.c.1.14.13.39
        13.7            ## e.c.1.14.13.39
        ];              ## 1/s
E = 0.01                ## umol/gDW

f = [ 0.923*0.9897*1;   ## e.c.6.3.4.5       
      1;                ## e.c.4.3.2.1
      0.1418;           ## e.c.3.5.3.1
      0.7372*1;         ## e.c.2.1.3.3      ##S cerevisiae
      1*0.9865;         ## e.c.1.14.13.39
      1;                ## e.c.1.14.13.39
    ];                  ## Park et. al.

v_max = 3600/10^3*E.*k_cat.*f;  #mmol/gdW.hr

default_bounds_array[1:length(v_max),2] .= v_max;
## reversible transfer of metabolites involved in v5 & reverse v5
default_bounds_array[(length(v_max)+1):end,2] .= 10;
default_bounds_array[(15:20),1] .= -10;
## deactivate lines 25, 26 and activate lines 29 and 30 to see with
##no boundary exchange of reaction v5 metabolites
#default_bounds_array[(length(v_max)+1):15,2] .= 10;

objective_coefficient_array[10] = -1;

(objective_value, calculated_flux_array, dual_value_array, uptake_array, exit_flag, status_flag)=calculate_optimal_flux_distribution(stoichiometric_matrix, default_bounds_array, species_bounds_array, objective_coefficient_array);
##writedlm("optimum_flux.csv",calculated_flux_array,",")
