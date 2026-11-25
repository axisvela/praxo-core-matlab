# PRAXO-CORE for MATLAB

> **MATLAB runtime compatibility is unverified.** Current execution evidence is > GNU Octave 11.3.0 only. No MATLAB release or Windows/macOS/Linux MATLAB support > matrix has been independently validated. File Exchange compatibility labels > are not test evidence; do not use them as a production support promise.

## At a glance

| Field | Value |
| --- | --- |
| Package | `PRAXO-CORE` |
| Registry | [MATLAB File Exchange](https://www.mathworks.com/matlabcentral/fileexchange/185166-praxo-core) |
| Install | `File Exchange entry 185166` |
| Source version | `0.9.0` |
| Published version | `0.5.0` |
| Source tag | `matlab/v0.9.0` |
| Tier | Core |
| Contract | `SPEC_VERSION` `0.2.0` |
| Documentation | https://axisvela.github.io/praxo-core/languages/matlab/ |
| License | MIT |

## Highlights

- OpenAI-compatible model: native
- Anthropic model: native
- Gemini model: native
- MCP client: native (transport seam)
- Harmovela sink: native
- OpenTelemetry sink: native (transport seam)
- Subagent delegation: native (synchronous seam)
- Retriever: native

## Quick start

Install the published package:

```text
File Exchange entry 185166
```

```bash
python language/matlab/run-tests.py
python language/matlab/api-snapshot.py --check
```

See the [full MATLAB README](language/matlab/README.md) for complete installation, build, and verification commands.

## What's included

| Capability | Status | Detail |
| --- | --- | --- |
| OpenAI-compatible model | native | `praxo.openai_compatible` using `webwrite`; SSE streaming reassembly |
| Anthropic model | native | `praxo.anthropic_compatible`; injectable transport; `onDelta` reassembles Anthropic SSE |
| Gemini model | native | `praxo.gemini_compatible`; injectable transport; `onDelta` reassembles Gemini SSE |
| MCP client | native (transport seam) | `praxo.mcp_client`; caller supplies a function handle |
| Harmovela sink | native | `praxo.harmovela_sink` |
| OpenTelemetry sink | native (transport seam) | `praxo.otel_sink`; caller supplies OTLP/HTTP transport |
| Subagent delegation | native (synchronous seam) | `praxo.subagent_run`; no asynchronous manager |
| Retriever | native | `praxo.document` and `praxo.retrieve_documents` |

## Examples

Runnable examples live under [`language/matlab/examples`](language/matlab/examples).

| Example | What it shows |
| --- | --- |
| [advanced-delegation](language/matlab/examples/advanced-delegation) | Application-level parent/child delegation plus six governance negative checks. |
| [checkpoint](language/matlab/examples/checkpoint) | This example uses the MATLAB/Octave Core checkpoint allowlist for a registered payload round trip. |
| [consumer](language/matlab/examples/consumer) | This starter uses a deterministic model and an in-memory tool. It does not use the network or a model service. Run it from the repository root: |
| [event-sink](language/matlab/examples/event-sink) | This example uses MATLAB/Octave Core sink composition to fan out events and filter the tool-only stream. |
| [hitl](language/matlab/examples/hitl) | This example configures `options.interruptOn`, `options.onInterruptDecision`, and `options.onInterrupt` for approve, edit-with-reauthorization, reject, and respond decisions. It... |
| [identity-policy](language/matlab/examples/identity-policy) | This example binds a trusted principal to policy decisions and rejects missing, role-mismatched, and tenant-mismatched actions. |
| [live-model](language/matlab/examples/live-model) | This example connects the shared MATLAB/Octave Core to an OpenAI-compatible endpoint through `praxo.openai_compatible`, registers a `get_time(zone)` tool with a small JSON Schem... |
| [mcp](language/matlab/examples/mcp) | The MATLAB/Octave Core does not bundle an MCP client. This example provides a transport-neutral MCP-shaped client boundary: initialize, `tools/list`, and `tools/call` over a cal... |
| [provider-fallback](language/matlab/examples/provider-fallback) | This example calls a fallback only after the primary fails and preserves the primary failure when both fail. |
| [representative-chain](language/matlab/examples/representative-chain) | Deterministic representative chain covering MCP record, final-argument authorization, governed child delegation, OTel/Harmovela events, and an edited denial with zero effects. |
| [retry](language/matlab/examples/retry) | This example retries a transient failure with a bounded attempt count and keeps the exhausted failure state. |
| [service](language/matlab/examples/service) | This example defines a transport-neutral request handler with health, principal, and run cases. |
| [session-checkpoint](language/matlab/examples/session-checkpoint) | This example saves and restores a conversation history across two agent turns. It uses a teaching in-memory store keyed by session id; production storage and retention remain ap... |
| [streaming](language/matlab/examples/streaming) | This example accumulates streamed chunks and checks that they reconstruct the final output. |
| [structured-output](language/matlab/examples/structured-output) | This example validates a final JSON answer against a schema and rejects invalid output. |

## Scenario Tutorials

Scenario-oriented tutorials live under `language/matlab/Tutorial`.

| Path | What it shows |
| --- | --- |
| [Tutorial](language/matlab/Tutorial) | Application tutorials live in `Tutorial/`, alongside focused `language/go/examples/`. |
| [data-quality](language/matlab/Tutorial/data-quality) | A bounded data-quality tutorial. It computes fixed mean/median/outlier statistics, then lets Core choose normal or outlier review. No source data is modified. |
| [signal-trends](language/matlab/Tutorial/signal-trends) | A native MATLAB/Octave signal-analysis tutorial. The Agent has one fixed tool, `review_signal`, which computes metrics over a fixed signal and returns a structured report with a... |

## Verify

This mirror contains the language source and the shared `spec/` vectors, so the implementation can be built and tested here. See [`language/matlab/README.md`](language/matlab/README.md) for the exact commands. The monorepo CI runs conformance, API snapshot, and native tests for this implementation.

## Community

- X: <https://x.com/axisvela>
- Weibo: <https://weibo.com/u/1936025761>
- LinkedIn: <https://www.linkedin.com/company/axisvela/>
- Facebook: <https://www.facebook.com/profile.php?id=61596905732406>
- YouTube: <https://www.youtube.com/@axisvela>
- Discord: <https://discord.com/channels/1575163993767809064/1575164343148875977>
- GitHub Discussions: <https://github.com/axisvela/praxo-core/discussions>
- GitHub Issues: <https://github.com/axisvela/praxo-core/issues>
- Documentation: <https://axisvela.github.io/praxo-core/>
- Architect: <https://axisvela.architect.pub>

## Repository layout

- `language/matlab/` — implementation source, tests, API snapshot, and examples
- `spec/` — shared contract, vectors, and parity inventories
- `LICENSE` — MIT license

## Canonical source

- Canonical source: https://github.com/axisvela/praxo-core/tree/main/language/matlab
- Registry introduction: `language/matlab/REGISTRY.md`
- Machine-readable entry: `language/matlab/llms.txt` and `language/matlab/llms.md`
- Mirror repository: https://github.com/axisvela/praxo-core-matlab
- Release index: https://axisvela.github.io/praxo-core/languages/registry-status/

This repository is a discovery mirror of the canonical MATLAB source. The monorepo remains the source of truth and the release workflow source.

PRAXO-CORE is not a hosted model, workflow engine, identity provider, or safety controller. Do not infer exactly-once execution, complete sandbox isolation, production security certification, live-provider behavior, or physical safety from this package.

MIT licensed.
