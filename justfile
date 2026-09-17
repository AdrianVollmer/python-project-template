set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

# Generate a test project in output/ to sanity-check the template
# Extra args are passed through to copier, e.g. `just test -d is_app=true`
test *args:
    rm -rf output
    uv tool run copier copy . output --trust --defaults \
        -d project_name="Test Project" \
        -d author_name="Test Author" \
        -d author_email="test@example.com" \
        {{ args }}
