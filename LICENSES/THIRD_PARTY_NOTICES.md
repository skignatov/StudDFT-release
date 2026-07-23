# Third-Party Notices for the StudDFT Binary Distribution

This distribution of StudDFT contains, or is built with, the
third-party components listed below.  Each component is governed by
its own license, which applies alongside (and, for those components,
instead of) the top-level LICENSE file.

Status summary of the dependency audit (source tree v1.12.0):
| Component               | Where                                                       | License                                   | Obligation on this archive                                |
|-------------------------|-------------------------------------------------------------|-------------------------------------------|-----------------------------------------------------------|
| D3(BJ) dispersion code  | compiled in; StudDFT's own clean reimplementation (v1.13.0) | top-level LICENSE                         | none                                                      |
| D3 reference data files | `basis_data/d3_*.dat`, read at run time                     | LGPL-3.0-or-later                         | keep D3_DATA_LICENSE + LGPL text; see Section 1           |
| Intel OpenMP runtime    | `libiomp5.dll`                                              | Intel redistributable terms               | keep this notice + Intel license text                     |
| BLAS/LAPACK runtime     | linked into the executable                                  | OpenBLAS: BSD-3-Clause / Intel MKL: ISSL  | reproduce the notice below                                |
| Lebedev angular grids   | compiled in (own tabulation)                                | facts/own code; citation                  | none (citation courtesy)                                  |
| Basis sets and ECPs     | `basis_data/*.dat`                                          | public-domain data via Basis Set Exchange | attribution courtesy                                      |
| libxc                   | NOT linked in the standard build (stub module)              | n/a                                       | none                                                      |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## 1. D3 dispersion reference data -- LGPL-3.0-or-later (data files only)

As of v1.13.0 the D3(BJ) dispersion CODE in StudDFT is the program's
own clean reimplementation from the primary literature (Grimme et
al., JCP 132, 154104 (2010); JCC 32, 1456 (2011)) and is covered by
the top-level LICENSE.  D4 is not included (an inert interface stub;
requests refuse with a message).  As of
v1.13.1 the wB97X-D functional is available again: its CHG tail is a
clean reimplementation from the published papers, and the D2/CHG
parameters are paper-published constants (Grimme, JCC 27, 1787
(2006), Table 1) compiled into the program -- they are not extracted
from any LGPL library and impose no obligations.

What remains LGPL-licensed are the two REFERENCE DATA FILES

    basis_data/d3_atomic.dat
    basis_data/d3_c6ref.dat

whose numerical content was extracted from the Grimme group's
LGPL-3.0-or-later libraries (simple-dftd3, mctc-lib).  The program
reads them at run time; they are never compiled into the executable.
Distributing them alongside the proprietary binary is aggregation,
not linking: the files are user-replaceable text and are their own
preferred form for modification.  Obligations on this archive:

  - keep basis_data/D3_DATA_LICENSE intact (the
    authoritative notice for these files);
  - include the full LGPL-3.0 text as LICENSES/LGPL-3.0.txt;
  - do not compile the parameter values into the executable in
    future builds.

Scientific references for the method are listed in
D3_DATA_LICENSE.

--------------------------------------------------------------------
## 2. Intel OpenMP runtime (libiomp5.dll)

Copyright (C) Intel Corporation.  Redistributed as permitted for
Intel redistributable runtime components.  The applicable Intel
license text (Intel Simplified Software License or the Intel End
User License Agreement for Developer Tools, as shipped with the
compiler used for this build) should be included in this archive as
LICENSES/INTEL-RUNTIME.txt.  Intel and the Intel logo are trademarks
of Intel Corporation.

--------------------------------------------------------------------
## 3. BLAS/LAPACK runtime linked into the executable

### 3a. OpenBLAS (BSD-3-Clause) -- and the LAPACK it bundles

  Copyright (c) 2011-2014, The OpenBLAS Project.
  All rights reserved.

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the conditions of the
  BSD 3-Clause License are met.  THIS SOFTWARE IS PROVIDED BY THE
  COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
  IMPLIED WARRANTIES ARE DISCLAIMED.  Full text:
  https://github.com/OpenMathLib/OpenBLAS/blob/develop/LICENSE
  (include as LICENSES/OPENBLAS.txt).

  LAPACK: Copyright (c) The University of Tennessee, The University
  of California Berkeley, and The University of Colorado Denver;
  modified BSD license (include as LICENSES/LAPACK.txt).

### 3b. Intel oneMKL

  Intel oneAPI Math Kernel Library, redistributed under the Intel
  Simplified Software License (include as LICENSES/INTEL-ISSL.txt).

--------------------------------------------------------------------
## 4. Lebedev angular quadrature grids

The angular grids compiled into the program are the program's own
tabulation of the canonical Lebedev-Laikov quadrature coefficients:

  V.I. Lebedev, Zh. Vychisl. Mat. Mat. Fiz. (1975-1999);
  V.I. Lebedev, D.N. Laikov, Doklady Mathematics 59, 477 (1999).

No third-party source code is included; the numerical coefficients
are mathematical facts.  Citation of the original works in published
results is a courtesy the authors of the method deserve.

--------------------------------------------------------------------
## 5. Basis sets and effective core potentials (basis_data/*.dat)

The Gaussian basis-set and ECP parameter files were obtained from
the Basis Set Exchange (https://www.basissetexchange.org) and from
the primary literature cited in each file's header.  The parameters
are scientific data in the public domain; when publishing results,
please cite the original basis-set papers (see the file headers) and
the Basis Set Exchange:

  B.P. Pritchard et al., J. Chem. Inf. Model. 59, 4814 (2019).

--------------------------------------------------------------------
## 6. Explicitly NOT included

- libxc: the standard build links a stub interface only; no libxc
  code is present in this distribution.
- No GPL-licensed (as opposed to LGPL-licensed) components were
  found in the v1.12.0 dependency audit; nothing in this archive
  imposes GPL obligations on the distribution as a whole.
