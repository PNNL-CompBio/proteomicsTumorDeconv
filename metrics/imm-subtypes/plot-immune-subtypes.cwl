#!/usr/bin/env cwltool

class: CommandLineTool
label: plot-immune-subtypes
id: plot-immune-subtypes
cwlVersion: v1.2
baseCommand: Rscript

arguments:
  - /bin/immune_subtypes.R

requirements:
  - class: DockerRequirement
    dockerPull: tumordeconv/imm-subtypes
  - class: MultipleInputFeatureRequirement

inputs:
  files:
    type:  File[]
    inputBinding:
      position: 1

outputs:
  table:
    type: File[]
    outputBinding:
      glob: "*.tsv"
  fig:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*.pdf"
    
