#!/usr/bin/env cwltool

class: CommandLineTool
label: plot-immune-subtypes
id: plot-immune-subtypes
cwlVersion: v1.2
baseCommand: Rscript

arguments:
   - /bin/combine_results.R

requirements:
   - class: DockerRequirement
     dockerPull: tumordeconv/figures
   - class: MultipleInputFeatureRequirement

inputs:
   metricType:
     type: string
     inputBinding:
       position: 1
   metric:
     type: string
     default: "correlation"
     inputBinding:
       position: 2
   files:
     type:  File[]
     inputBinding:
        position: 3

outputs:
   table:
     type: File
     outputBinding:
        glob: "*.tsv"
   fig:
     type:
       type: array
       items: File
     outputBinding:
        glob: "*.pdf"
    
