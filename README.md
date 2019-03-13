# ChemE_7770_PS_3

## add packages (julia)
	DelimitedFiles
	GLPK
## Files
	- data_urea_maximization.jl
	- FLux.jl
	- S_and_epsillon_generator.jl
	- run.jl

## solution to 1(a) and 1(b)
	- PS_3_ChemE_7770_Samavi_Farnush.pdf
	- in julia console run
		 include("a,b S_and_epsillon_generator.jl")	
	- stoichiometric_matrix.csv, atom_matrix.csv and epsilon.csv will be created

## solution to 1(c)
	- PS_3_ChemE_7770_Samavi_Farnush.pdf
	- in julia console run
		 include("c run.jl")
I have assumed the metabolites involved in reaction v5 can be exchanged through the boundary.
deactivate lines 26, 27 and activate lines 30 and 31 to see fluxes with no boundary exchange of reaction v5 metabolites	
