# copy-wsl-path.yazi

## Installation

```sh
ya pkg add WantChane/copy-wsl-path
```

## Usage

### In WSL

```toml
[[mgr.prepend_keymap]]
on = ["c", "w"]
run = "plugin copy-wsl-path win"
desc = "Copy the file path in windows"
```

### In Windows

```toml
[[mgr.prepend_keymap]]
on = ["c", "w"]
run = "plugin copy-wsl-path wsl"
desc = "Copy the file path in wsl"
```

## License

This plugin is MIT-licensed. For more information check the [LICENSE](LICENSE) file.
