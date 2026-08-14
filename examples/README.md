# StudDFT examples

Small calculations chosen for what they teach, not for what they
cover.  Every one runs in seconds to a couple of minutes on one
core; nothing here is a benchmark.

Each input carries a header saying what to look at in the output and
what the numbers mean.  Read the header first — most of these are
worth reading even without running.

The sections are ordered as a course.  Sections 01 and 02 are meant
to be worked through in order; after that, follow your interest.

---

## 01_basics

| file | what it shows |
|------|---------------|
| `01a_h2o_single_point.inp` | one energy; how to read the SCF table |
| `01b_h2o_optimize.inp`     | optimization; why the GRADIENT, not the energy, tells you it converged |
| `01c_h2o_frequencies.inp`  | frequencies, IR intensities, ZPVE; why `opt+freq` and never `freq` alone |
| `01d_h2o_properties.inp`   | orbital energies and Koopmans' theorem; why a partial charge is not an observable |

## 02_convergence

The habit this section teaches is the one that separates a result
from a number.

| file | what it shows |
|------|---------------|
| `02a_basis_1..4` | four basis sets, one molecule.  Energy falls monotonically — the variational principle — and is still falling at cc-pVTZ.  Geometries converge long before energies |
| `02b_grid_1,3,7` | DFT has a second, independent approximation: the quadrature grid.  `Integrated N_e` measures its error against a value known in advance.  Grid 7 has fewer points than grid 3 and is more accurate — placement beats count |
| `02c_hessian_analytical / numerical` | two independent routes to the same Hessian.  Agreement is the cheapest check available on a frequency calculation |

## 03_methods

One molecule, one geometry, five methods, so the numbers are
comparable.  Tabulate them and read the table, not the individual
runs.

`03a_hf`, `03b_svwn`, `03c_b3lyp`, `03d_mp2_correlation`, `03e_bp86`

The point: HF bonds are too short and too stiff, LDA overbinds, the
GGA correction fixes most of it, the hybrid lands closest.  DFT total
energies from different functionals are **not** comparable with each
other — each has its own zero.

## 04_open_shell

| file | what it shows |
|------|---------------|
| `04a_o2_triplet_spin_contamination.inp` | `<S^2>` as a diagnostic; and that a converged SCF has found *a* stationary point, not necessarily the lowest |
| `04b_o2_triplet_uks.inp` | the same molecule with a functional |
| `04c_stability_stretched_h2.inp` | the previous point made quantitative: the orbital Hessian of stretched RHF has a negative eigenvalue in the triplet channel (-0.323 Ha).  Same physics as the Coulson–Fischer point in 05a, now as a number |
| `04d_stability_follow.inp` | `check` diagnoses, `follow` descends — and why the external (spin) instability is reported but never followed automatically |

## 05_reactions

| file | what it shows |
|------|---------------|
| `05a_h2_dissociation_rhf_vs_uhf.inp` | the classic RHF failure: the curve has the wrong *shape*, ~0.18 Eh too high at 3 Å.  Re-run with `%spin unrestricted` to see the Coulson–Fischer point |
| `05b_hooh_torsion_relaxed_scan.inp` | relaxed scan along a torsion |
| `05c_hcn_ts_search.inp` | transition state by P-RFO; exactly one imaginary frequency |
| `05d_hcn_irc.inp` | the reaction path down from that saddle (run 05c first) |

## 06_environment

| file | what it shows |
|------|---------------|
| `06b_pcm_iefpcm_benzene.inp` / `06c_pcm_cpcm_benzene.inp` | the same solute in the same solvent, two models.  At benzene-class permittivity the conductor approximation overestimates the screening by ~16 %; at water-class it is indistinguishable from IEFPCM |
| `06d_pcm_anion_gauss_law.inp` | the sum of surface charges obeys Gauss's law — a physical check on the cavity discretization |
| `06e_bsse_counterpoise.inp` | basis-set superposition error and the counterpoise correction |
| `06f_dispersion_water_dimer.inp` | what an empirical dispersion term does to a hydrogen-bonded dimer |

## 07_excited_states

`07a_h2o_tddft_tda`, `07b_singlet_triplet_rpa`, `07c_tddft_in_solvent`,
`07d_rt_tddft_absorption`

TDA versus full RPA, singlets versus triplets, the solvent response of
an excitation, and the same spectrum obtained instead by propagating
the density in real time after a delta kick.

## 08_advanced

| file | what it shows |
|------|---------------|
| `08a_ri_conventional` / `08a_ri_j_fitted` | density fitting on pyrrole, measured: the Coulomb stage drops 130× but the wall time only 1.37×.  Amdahl's law in one table, and a reminder to profile before optimizing |
| `08b_ecp_cu3.inp` | effective core potentials |
| `08c_fermi_smearing_metal.inp` | fractional occupations for a vanishing gap |
| `08d_bomd_h2.inp` | Born–Oppenheimer molecular dynamics |
| `08e_cdft_charge_transfer.inp` | constrained DFT for a diabatic charge-transfer state |

---

## Two habits worth taking from this set

**Compute differences, not energies.** A total energy is a large
negative number whose absolute value means nothing. Everything
chemical in these examples is a difference between two calculations
done the same way.

**A frequency calculation is only valid at a stationary point of the
same method.** Computing a Hessian at a geometry optimized with a
different method or basis produces imaginary frequencies that mean
nothing at all. This mistake is easy to make and looks exactly like a
program bug.
