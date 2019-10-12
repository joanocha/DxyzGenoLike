import pandas as pd
import numpy as np
import sys

dxy = sys.argv[1]
dxz = sys.argv[2]
dxyz = sys.argv[3]

df1=pd.read_csv(dxy, '\t', header=None, names=["chromo", "winstart",  "winend", "dxy", "nsites_xy"])
print(df1.head())

df2=pd.read_csv(dxz, '\t', header=None, names=["chromo", "winstart",  "winend", "dxz", "nsites_xz"])
print(df2.head())

merged_dxyz = df1.merge(df2,  how='inner', on=['chromo','winstart', 'winend'])
merged_dxyz['dxyz'] = merged_dxyz['dxy'] / merged_dxyz['dxz']

print(merged_dxyz.head())

merged_dxyz.to_csv(dxyz, sep='\t', index=False)

