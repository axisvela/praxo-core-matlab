# PRAXO-CORE for MATLAB

Dedicated repository for the MATLAB implementation of PRAXO-CORE: an embeddable,
MIT-licensed agent execution kernel with policy controls, human-in-the-loop
approval, checkpoints, events, and tool calling.

- Package: `PRAXO-CORE` on MATLAB File Exchange (entry `185166`)
- Documentation: https://axisvela.github.io/praxo-core/languages/matlab/
- Canonical source: https://github.com/axisvela/praxo-core/tree/main/language/matlab
- Release index: https://axisvela.github.io/praxo-core/languages/registry-status/

This repository is a discovery mirror of the canonical MATLAB source. The
monorepo remains the source of truth and the release workflow source. Shared
conformance vectors are included under `spec/`; the shared MATLAB/Octave core is
under `language/matlab-octave-core`.

MATLAB runtime verification is not recorded. Octave verification does not
establish MATLAB behavior.

## Install or build

Install from MATLAB File Exchange entry `185166`, or build from
`language/matlab`.

## Verify

Build and test instructions are in `language/matlab/README.md`. The monorepo CI
runs the MATLAB wrapper checks, but the MATLAB runtime remains unverified.

PRAXO-CORE is not a hosted model, workflow engine, identity provider, or safety
controller. Do not infer exactly-once execution, complete sandbox isolation,
production security certification, live-provider behavior, or physical safety
from this package.

MIT licensed.
