# StudDFT User Manual

## Overview

StudDFT is an educational quantum chemistry program implementing
Hartree-Fock and Kohn-Sham density functional theory with Cartesian
Gaussian basis sets.

Capabilities: single-point energies, analytical gradients,
geometry optimization, harmonic frequencies (numerical Hessian),
Mulliken population analysis, and dipole moments.

Supported methods: RHF, UHF, SVWN (LDA), BLYP, PBE (GGA),
B3LYP, PBE0 (hybrid).  Elements H-Ar with four basis sets.

## Running the Program

    studdft input.inp

The input file uses keyword-value pairs prefixed with `%`
and a geometry block delimited by `*geometry ... *end`.
Lines starting with `#` or `!` are comments.
Keywords are case-insensitive.


## Input File Format

### Minimal Example

    %method  HF
    %basis   STO-3G
    %job     energy
    %charge  0
    %mult    1

    *geometry angstrom
    O   0.000000   0.000000   0.117370
    H   0.000000   0.756950  -0.469483
    H   0.000000  -0.756950  -0.469483
    *end


### Complete Example (all options shown)

    %method       B3LYP
    %basis        6-31G*
    %job          opt+freq
    %charge       0
    %mult         1
    %spin         restricted
    %grid         3
    %grad_method  analytical
    %scf_maxiter  128
    %scf_etol     1.0e-8
    %scf_ptol     1.0e-6
    %scf_converger DIIS
    %level_shift  0.0
    %damping      0.0
    %geom_maxiter 50
    %grad_tol     4.5e-4
    %boys_cook

    *geometry angstrom
    O   0.000000   0.000000   0.117370
    H   0.000000   0.756950  -0.469483
    H   0.000000  -0.756950  -0.469483
    *end


## Keyword Reference

### Method and Basis Set

    %method <name>

Specifies the electronic structure method.

| Value     | Type   | Description                            |
|-----------|--------|----------------------------------------|
| HF        | HF     | Hartree-Fock (default)                 |
| SVWN      | LDA    | Slater exchange + VWN5 correlation     |
| LDA       | LDA    | Same as SVWN                           |
| BLYP      | GGA    | Becke88 exchange + LYP correlation     |
| PBE       | GGA    | Perdew-Burke-Ernzerhof                 |
| B3LYP     | Hybrid | 20% HF + Becke88 + VWN3 + LYP         |
| PBE0      | Hybrid | 25% HF + 75% PBE exchange + PBE corr.  |

Default: HF

B3LYP uses the VWN3/Gaussian convention (equivalent to
b3lyp5 in PySCF or B3LYP in Gaussian).

---

    %basis <name>

Specifies the basis set.  Cartesian Gaussians only (6d, 10f).

| Value    | Type                            | Elements |
|----------|---------------------------------|----------|
| STO-3G   | Minimal                         | H-Cl     |
| 3-21G    | Split-valence                   | H-Ar     |
| 6-31G*   | Split-valence + d polarization  | H-Ar     |
| 6-31G(d) | Same as 6-31G*                  | H-Ar     |
| cc-pVDZ  | Correlation-consistent DZ       | H-Ar     |

Default: STO-3G

Special characters `*`, `(`, `)` in basis names are handled
automatically.  Names are case-insensitive.


### Job Control

    %job <type>

| Value          | Description                              |
|----------------|------------------------------------------|
| energy         | Single-point energy (default)            |
| sp, single     | Same as energy                           |
| gradient       | Energy + gradient                        |
| grad, force    | Same as gradient                         |
| opt, optimize  | Geometry optimization                    |
| freq, frequency, hessian | Frequencies at current geometry |
| opt+freq, optfreq | Optimization followed by frequencies  |

Default: energy

---

    %charge <integer>

Molecular charge.  Default: 0

---

    %mult <integer>

Spin multiplicity (2S+1).  Default: 1

For open-shell systems (mult > 1), the `%spin unrestricted`
keyword must also be set explicitly.

---

    %spin <treatment>

| Value           | Description                    |
|-----------------|--------------------------------|
| restricted      | RHF/RKS (default)              |
| unrestricted    | UHF/UKS                        |
| UHF             | Same as unrestricted           |
| UKS             | Same as unrestricted           |

Default: restricted

Note: UHF must be requested explicitly even for mult > 1.
UKS (unrestricted DFT) SCF is not yet implemented;
UHF gradients work with pure HF only.


### SCF Options

    %scf_maxiter <integer>

Maximum number of SCF iterations.  Default: 128

---

    %scf_converger <name>

SCF convergence accelerator.

| Value | Description            |
|-------|------------------------|
| DIIS  | Direct inversion of the iterative subspace (default) |

Default: DIIS

DIIS stores up to 8 Fock/error matrix pairs.

---

    %scf_etol <real>

SCF energy convergence threshold (Hartree).
Default: 1.0e-8

---

    %scf_ptol <real>

SCF density matrix convergence threshold (max |dP|).
Default: 1.0e-6

---

    %level_shift <real>

Virtual orbital level shift (Hartree) to aid convergence.
Default: 0.0 (no shift)

---

    %damping <real>

Density matrix damping factor (0 = no damping, 1 = freeze).
P_new = (1-f)*P_new + f*P_old.
Default: 0.0


### DFT Grid Options

    %grid <integer>

DFT integration grid quality.  Applies only to DFT methods.
Higher quality = more grid points = more accurate but slower.

| Value | Radial pts | Angular              | Typical total (3 atoms) |
|-------|-----------|----------------------|-------------------------|
| 1     | 25        | 110 (uniform)        | ~8,000                  |
| 2     | 50        | 110/302 (pruned)     | ~24,000                 |
| 3     | 75        | 110/302/590 (pruned) | ~49,000                 |
| 4     | 100       | 110/302/590 (pruned) | ~65,000                 |
| 5     | 150       | 110/302/590 (pruned) | ~98,000                 |

Default: 3

For quality >= 2, SG-1-style angular grid pruning is applied:
inner core and far outer radial shells use coarser angular
grids since the integrand is nearly spherical or negligible.
This reduces the total number of points by about 63% compared
to a uniform fine grid, with negligible loss of accuracy.

Radial quadrature: Mura-Knowles Log3 mapping.
Angular quadrature: Lebedev grids (110, 302, or 590 points).
Partitioning: Becke fuzzy cells with 3-iteration smoothing.


### Gradient Options

    %grad_method <name>

| Value          | Description                               |
|----------------|-------------------------------------------|
| analytical     | Fully analytical gradient (default)       |
| full           | Same as analytical                        |
| semi           | Semi-analytical (Pulay + FD)              |
| semianalytical | Same as semi                              |
| FD             | Same as semi                              |

Default: analytical

The analytical method computes kinetic, nuclear attraction,
and ERI derivatives analytically.  Only the DFT exchange-
correlation part (if any) uses finite differences at fixed
density.

The semi-analytical method uses analytical overlap (Pulay)
and nuclear repulsion derivatives, with finite differences
for the rest.  Slower but useful for cross-validation.

For UHF, only the analytical method is available.

---

    %grad_tol <real>

Maximum gradient component for optimization convergence
(Hartree/Bohr).  Default: 4.5e-4

Full Gaussian-style convergence criteria are used in
the optimizer (all four must be met simultaneously):

| Criterion     | Threshold    |
|---------------|--------------|
| max |grad|    | 4.5e-4 Ha/b  |
| RMS grad      | 3.0e-4 Ha/b  |
| max |disp|    | 1.8e-3 bohr  |
| RMS disp      | 1.2e-3 bohr  |


### Optimization Options

    %geom_maxiter <integer>

Maximum geometry optimization steps.  Default: 50

The optimizer uses BFGS in Cartesian coordinates with
a backtracking line search.  The initial inverse Hessian
approximation is a scaled identity matrix.


### Advanced Options

    %boys_cook

Flag (no value needed).  Switches the Boys function
evaluation from tabulated grid + Taylor interpolation
(fast, ~4e-13 accuracy) to direct Cook series evaluation
(slower, full double precision).

Default: off (table method)

Use for debugging or when highest numerical precision
is required (e.g., Hessian by finite differences of
gradients).

---

    %spherical

Flag (no value needed).  Requests spherical harmonic
basis functions (5d, 7f).

Default: off (Cartesian, 6d, 10f)

Note: spherical harmonics are not yet implemented.
The keyword is parsed but has no effect.


## Geometry Block

    *geometry [angstrom|bohr]
    <element> <x> <y> <z>
    ...
    *end

Coordinates are in Angstrom by default.
Use `*geometry bohr` for atomic units.

Elements are specified by standard chemical symbols (H, He,
Li, ..., Ar).  Case-insensitive (h = H).


## Output

The program prints step-by-step information about each
stage of the calculation:

1. Input summary (method, basis, charge, multiplicity)
2. Molecule geometry and basis set details
3. One-electron integral diagnostics (trace, extrema)
4. SCF convergence (iteration, energy, dE, dP, DIIS)
5. Orbital energies (occupied/virtual)
6. Gradient components (if requested)
7. Optimization progress table (if requested)
8. Vibrational frequencies and normal modes (if requested)
9. Mulliken population analysis
10. Dipole moment (nuclear, electronic, total)
11. Wall time


## Examples

### Single-Point HF Energy

    %method  HF
    %basis   cc-pVDZ
    %job     energy
    %charge  0
    %mult    1

    *geometry angstrom
    O   0.000   0.000   0.117
    H   0.000   0.757  -0.469
    H   0.000  -0.757  -0.469
    *end


### DFT Geometry Optimization

    %method  B3LYP
    %basis   6-31G*
    %job     opt
    %grid    3

    *geometry angstrom
    C  0.000  0.000  0.000
    O  1.200  0.000  0.000
    *end


### UHF Gradient of O2 Triplet

    %method  HF
    %basis   6-31G*
    %job     gradient
    %charge  0
    %mult    3
    %spin    unrestricted

    *geometry angstrom
    O  0.000  0.000  0.000
    O  0.000  0.000  1.208
    *end


### Optimization + Frequencies

    %method  HF
    %basis   STO-3G
    %job     opt+freq
    %geom_maxiter 50

    *geometry angstrom
    O   0.000   0.000   0.120
    H   0.000   0.760  -0.470
    H   0.000  -0.760  -0.470
    *end


### DFT with Custom SCF Settings

    %method       PBE0
    %basis        6-31G*
    %job          energy
    %grid         4
    %scf_maxiter  200
    %scf_etol     1.0e-10
    %scf_ptol     1.0e-8
    %boys_cook

    *geometry angstrom
    N  0.000  0.000  0.000
    H  0.000  0.000  1.012
    H  0.950  0.000 -0.337
    H -0.475  0.823 -0.337
    *end
