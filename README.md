# ChemE_7770_PS_3

## add packages (julia)
	DelimitedFiles
	GLPK

## solution to 1(a) and 1(b)
	- PS_3_ChemE_7770_Samavi_Farnush.pdf
	- in julia console run
		 include("S_and_epsillon_generator.jl")	
	- stoichiometric_matrix.csv, atom_matrix.csv and epsilon.csv will be created

## solution to 1(c)
	- PS_3_ChemE_7770_Samavi_Farnush.pdf
	- in julia console run
		 include("run.jl")
I have assumed the metabolites involved in reaction v5 can be exchanged through the boundary.
deactivate lines 25, 26 and activte lines 29 and 30 to see with no boundary exchange of reaction v5 metabolites	
