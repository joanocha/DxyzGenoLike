import pandas as pd
import numpy as np
import sys


configfile: 'config.yaml'


window_step_pairs = zip(*config['window_step_pairs'])
dxyWindow_path = config['dxyWindow_path']


rule all:
    input:
        expand(config['output_dir'] + '/dxyz_{window_step[0]}_{window_step[1]}_snps', window_step=window_step_pairs)


rule run_dxyWindow_xy:
    input:
        config['input_dx'],
        config['input_dy']
    output:
        temp('dxy_{window}_{step}_snps')
    shell: '{dxyWindow_path} -winsize {wildcards.window} -stepsize {wildcards.step} {input[0]} {input[1]} > {output}'


rule run_dxyWindow_xz:
    input:
        config['input_dx'],
        config['input_dz']
    output:
        temp('dxz_{window}_{step}_snps')
    shell: '{dxyWindow_path} -winsize {wildcards.window} -stepsize {wildcards.step} {input[0]} {input[1]} > {output}'


rule run_makeDxyz_output:
    input:
        'dxy_{window}_{step}_snps',
        'dxz_{window}_{step}_snps'
    output:
        config['output_dir'] + '/dxyz_{window}_{step}_snps'
    shell: """
    python scripts/mergeDxy2Dxyz.py {input[0]} {input[1]} {output[0]}
    """
