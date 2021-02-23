'''
Get all cptac data
downloads data into docker image
'''

import cptac
for ds in ['brca', 'ccrcc', 'endometrial', 'colon', 'ovarian', 'hnscc', 'luad']:
    cptac.download(dataset=ds)
