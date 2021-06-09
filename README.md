# RosettaSurf Data Repository
This repository contains all the data and scripts accompanying the paper:

**RosettaSurf - a surface-centric computational design approach**

Scheck A, Rosset S, Defferrard M, Loukas A, Bonet J, Vandergheynst P, Correia BE

## Summary
>Finely orchestrated protein-protein interactions are at the heart of virtually all fundamental cellular processes. Altering these processes or encoding new functions in proteins has been a long-standing goal in computational protein design. 
>Protein design methods commonly rely on scoring functions that seek to identify amino acid sequences that optimize structural configurations of atoms while minimizing a variety of physics-based and statistical terms. The objectives of the large majority of computational design protocols have been focused on obtaining a predefined structural conformation. However, routinely introducing a functional aspect on designer proteins has been more challenging. 
>Our results suggest that the molecular surface features can be a useful optimization parameter to guide the design process towards functional surfaces that mimic known protein binding sites and interact with their intended targets. Specifically, we demonstrate that our design method can optimize experimental libraries through computational screening, creating a basis for highly specific protein binders, as well as design a potent immunogen that engages with site-specific antibodies. The ability to create proteins with novel functions will be transformative for biomedical applications, providing many opportunities for the design of novel immunogens, protein components for synthetic biology, and other protein-based biotechnologies.

-----

**RosettaSurf** is part of the [Rosetta Suite](https://www.rosettacommons.org/software) and can be freely obtained with an academic license.

A basic example of how to use RosettaSurf inside RosettaScript:

    <SIMPLE_METRICS>                
        <ElectrostaticSimilarityMetric name="elec" residue_selector1="target" residue_selector2="reference" />
        <ShapeSimilarityMetric name="shape" residue_selector1="target" residue_selector2="reference" />        
    </SIMPLE_METRICS>        
    <FILTERS>                
        <SimpleMetricFilter name="es" metric="elec" cutoff="-0.8" comparison_type="lt" composite_action="avg" />                
        <SimpleMetricFilter name="ss" metric="shape" cutoff="0.8" comparison_type="gt" />        

        <CalculatorFilter name="surface_sim"  equation="1 - (1 / (1 + EXP( 13.79986756 - (14.64347448 * SS) + (-13.78594078 * ES))))">
            <Var filter_name="es" name="ES"/>
            <Var filter_name="ss" name="SS"/>
        </CalculatorFilter>
    </FILTERS>
    <MOVERS>
        <RandomMutation name="random"/>
        <GenericMonteCarlo name="mc" mover_name="random" filter_name="surface_sim" />
    </MOVERS>



This part of the repository contains computational scripts. Data presented in the paper is stored in a separate [data repository]() at Zenodo. To follow the data analysis, please integrate the data repository into the top-level. Both repositories have a similar structure and contain the following sections:

* **interface recovery** referring to section *Protein interface sequence recovery* in the paper.
* **interleukin benchmark** referring to section *Computational SSM screening to improve protein binding* in the paper.
* **rsv site 0 design** referring to section *Surface-centric design of a novel RSV site 0 immunogen* in the paper.
* **single amino acid recovery** referring to section *Single amino acid recovery* in the paper.
* **surface weight optimization** referring to section *RosettaSurf framework* in the paper.

The `RosettaSurf_benchmark.ipynb` Jupyter Notebook contains the data analysis and data figures shown in the paper.