# python-project-template

A [copier](https://copier.readthedocs.io/) template for a typical Python
project: [uv](https://docs.astral.sh/uv/) for dependency management,
[ruff](https://docs.astral.sh/ruff/) for linting/formatting,
[ty](https://github.com/astral-sh/ty) for type checking,
[pytest](https://docs.pytest.org/) for tests, a `justfile` as the task
runner, [zensical](https://zensical.org/) for docs, and
[prek](https://github.com/j178/prek) for pre-commit hooks (lint/type-check
only — tests are too heavy in general to run on every commit). A GitHub Actions
workflow runs the full check suite (lint, type-check, tests, docs build) on
every push and pull request.

When `is_app=True`, the `click` library will be pulled in as a dependency with
some extra scaffolding.

When `with_web_frontend=True`, [deno](https://deno.com/) is added as a dev
dependency (via the `deno` PyPI package, so no separate install is needed) and
a `frontend/` TypeScript scaffold is generated. `just fmt`, `lint`, `typecheck`
and `test` then cover the frontend as well, `just frontend-build` bundles it
into `src/<package_name>/static/`, and `just build` builds the sdist and wheel
with the bundle included. With `is_app=True`, `just run` builds the
frontend and then starts the app. CI and the pre-commit hooks cover it too.

## Usage

```sh
uvx copier copy https://github.com/AdrianVollmer/python-project-template.git my-project
cd my-project
just sync
just ci
```

To update a project generated from this template later:

```sh
uvx copier update
```

## Generated layout

```
my-project/
├── .github/
│   └── workflows/
│       └── ci.yml
├── docs/
│   └── index.md
├── frontend/              # only with with_web_frontend
│   ├── deno.json
│   ├── greet.ts
│   ├── greet_test.ts
│   └── main.ts
├── src/
│   └── <package_name>/
│       ├── __init__.py
│       └── py.typed
├── tests/
│   └── test_<package_name>.py
├── .copier-answers.yml    # enables `copier update`
├── .gitignore
├── .pre-commit-config.yaml
├── justfile
├── pyproject.toml
└── zensical.toml
```
