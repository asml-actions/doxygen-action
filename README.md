# Doxygen Docker Action

This [GitHub Action](https://github.com/features/actions) will build [doxygen](http://doxygen.nl/) docs from the specified doxyfile.

Use with an action such as [actions-gh-pages](https://github.com/peaceiris/actions-gh-pages) to deploy to your project's GitHub pages site!

**NOTE:** If you are using dot/graphviz in your doxygen config to generate diagrams the only fonts installed, and hence can be used are those in the [GNU FreeFont](https://www.gnu.org/software/freefont/) package (FreeSans, FreeMono and FreeSerif) or in any package listed in `additional-packages`.

## Versions
Previously, versions of this action incremented as changes were made to the repo. However, this has now been changed so the tagged versions of this action match the doxygen versions they relate to.
An `edge` tag has been created, tracking the version of doxygen available on the alpine `edge` tag.

### Supported Tags
| Action Version | Doxygen Version  | Alpine Version | Tag Aliases |
|----------------|------------------|----------------|-------------|
| edge           | 1.13.2-r0        | edge           |             |
| 1.12.0         | 1.12.0-r0        | 3.21           | v1, v1.12   |
| 1.11.0         | 1.11.0-r0        | 3.20           | v1, v1.11   |
| 1.9.8          | 1.9.8-r0         | 3.19           | v1.9        |
| 1.9.6          | 1.9.6-r1         | 3.18           |             |
| 1.9.5          | 1.9.5-r0         | 3.17           |             |
| 1.9.4          | 1.9.4-r0         | 3.16           |             |
| 1.9.2          | 1.9.2-r1         | 3.15           |             |
| 1.9.1          | 1.9.1-r1         | 3.14           |             |
| 1.8.18         | 1.8.18-r0        | 3.12           | v1.8        |

## Inputs

### 'working-directory'

**Optional** Path of the working directory to change to before running doxygen. Default: `.`

> [!NOTE]
> If you want to use a fully qualified path, note that `${{ github.workspace }} / $GITHUB_WORKSPACE` directory
> is mounted at `/github/workspace` within the Docker container.
> See the [GitHub actions docs](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action#accessing-files-created-by-a-container-action) for more information.

### 'doxyfile-path'

**Optional** Path of the Doxyfile relative to the working directory. Default: `./Doxyfile`.

### 'enable-latex'

**Optional** Flag to enable `make`-ing of the LaTeX part of the doxygen output. Default: `false`.

### 'additional-packages'

**Optional** Additional [Alpine packages](https://pkgs.alpinelinux.org/packages) to install in the environment (i.e. font packages)

## Example usage with additional font package
```yaml
uses: mattnotmitt/doxygen-action@v1.9.5
with:
    additional-packages: font-fira-code
```

## Example usage with set working dir and doxyfile path (no LaTeX)

```yaml
uses: mattnotmitt/doxygen-action@v1.9.5
with:
    working-directory: 'submodule/'
    doxyfile-path: 'docs/Doxygen'
```

## Example usage (with LaTeX)

```yaml
uses: mattnotmitt/doxygen-action@v1.9.5
with:
    working-directory: 'submodule/'
    doxyfile-path: 'docs/Doxygen'
    enable-latex: true
```
