# Contributing

## Development

In Visual Studio Code, press `F5` (Start Debugging) to open a Visual Studio Code
Extension Development Host running this extension. This behavior is configured
in `.vscode/launch.json`. There are example IGC files in the `examples/`
directory.

The IGC syntax highlighting is defined in `syntaxes/igc.tmLanguage.json`. This
is generated from the [CUE](https://cuelang.org/) files `igc.tmLanguage.cue` and
`tmLanguage.cue`.

To re-generate `syntaxes/igc.tmLanguage.json`, run:

```console
$ make
```

You will need to reload the Extension Development Host for the changes to take
effect.

Ensure that the CUE is valid and formatted correctly by running:

```console
$ make fmt vet
```

## Releases

### Preparation

1. Bump the version number in `package.json`.
2. Add the release notes to `README.md`.
3. Tag the new version with `git tag vX.Y.Z`.
4. Create the package with `vsce package`.

### Publishing

Follow the instructions for [publishing Visual Studio Code
extensions](https://code.visualstudio.com/api/working-with-extensions/publishing-extension).

1. If necessary, create a new Personal Access Token in the Azure DevOps
organization is `https://twpayne.visualstudio.com/vscode-igc`. Personal Access
Tokens are managed in the "User Settings" menu.
2. Run `vsce login twpayne`.
3. Run `vsce publish`.

Once publishing is successful, push the tag to GitHub.