#!/usr/bin/env python3

import argparse
import shutil
import subprocess
from pathlib import Path

REPO = Path(__file__).parent.resolve()
HOME = Path.home()


def link(src: Path, dst: Path, force: bool) -> None:
    if dst.is_symlink():
        if not force:
            print(f"  skip     {dst}  (symlink exists, use -f to overwrite)")
            return
        dst.unlink()
    elif dst.exists():
        if dst.is_dir():
            print(f"  skip     {dst}  (directory exists, remove manually)")
            return
        if not force:
            print(f"  skip     {dst}  (file exists, use -f to overwrite)")
            return
        dst.unlink()
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.symlink_to(src)
    print(f"  link     {dst} -> {src}")


def _run(cmd: str) -> None:
    subprocess.run(cmd, shell=True, check=False)


def _ensure(label: str, installed: bool, cmd: str) -> None:
    if installed:
        print(f"  skip     {label}  (already installed)")
    else:
        print(f"  install  {label}")
        _run(cmd)


# ── Install (symlinks) ────────────────────────────────────────────────────────

def install_nvim(force: bool) -> None:
    link(REPO / "nvim", HOME / ".config/nvim", force)


def install_git(force: bool) -> None:
    link(REPO / "gitconfig", HOME / ".gitconfig", force)


def install_ideavim(force: bool) -> None:
    link(REPO / "ideavimrc", HOME / ".ideavimrc", force)


def install_spacemacs(force: bool) -> None:
    link(REPO / "spacemacs", HOME / ".spacemacs", force)


def install_zsh(force: bool) -> None:
    zshrc = HOME / ".zshrc"
    source_line = f"source {REPO / 'zsh-config.zsh'}"
    if zshrc.exists() and source_line in zshrc.read_text():
        print(f"  skip     {zshrc}  (source line already present)")
        return
    with zshrc.open("a") as f:
        f.write(f"\n{source_line}\n")
    print(f"  done     appended source line to {zshrc}")


INSTALLS: dict[str, tuple[str, object]] = {
    "nvim":      ("Neovim config",    install_nvim),
    "git":       ("Git config",       install_git),
    "ideavim":   ("IdeaVim config",   install_ideavim),
    "spacemacs": ("Spacemacs config", install_spacemacs),
    "zsh":       ("Zsh config",       install_zsh),
}

# ── Setup (install dependencies) ─────────────────────────────────────────────

def setup_zsh() -> None:
    _ensure(
        "Homebrew",
        shutil.which("brew") is not None,
        '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"',
    )
    _ensure(
        "oh-my-zsh",
        (HOME / ".oh-my-zsh").exists(),
        'RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
    )
    _ensure(
        "nvm",
        (HOME / ".nvm").exists(),
        "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash",
    )
    plugin_path = HOME / ".oh-my-zsh/custom/plugins/zsh-autosuggestions"
    _ensure(
        "zsh-autosuggestions",
        plugin_path.exists(),
        f"git clone https://github.com/zsh-users/zsh-autosuggestions {plugin_path}",
    )
    for pkg in ["fzf", "pay-respects", "zoxide", "lsd", "pyenv"]:
        _ensure(pkg, shutil.which(pkg) is not None, f"brew install {pkg}")

    install_zsh(force=False)


SETUPS: dict[str, tuple[str, object]] = {
    "zsh": ("Zsh", setup_zsh),
}

# ── CLI ───────────────────────────────────────────────────────────────────────

def cmd_install(args) -> None:
    targets = list(INSTALLS) if "all" in args.configs else args.configs
    for name in targets:
        label, installer = INSTALLS[name]
        print(f"\n[{label}]")
        installer(args.force)


def cmd_setup(args) -> None:
    targets = list(SETUPS) if "all" in args.configs else args.configs
    for name in targets:
        label, setup = SETUPS[name]
        print(f"\n[{label}]")
        setup()


def main() -> None:
    parser = argparse.ArgumentParser(description="Manage configs and environment setup")
    sub = parser.add_subparsers(dest="command", required=True)

    p_install = sub.add_parser("install", help="create symlinks")
    p_install.add_argument(
        "configs", nargs="+",
        choices=[*INSTALLS, "all"],
        metavar=f"{{{','.join([*INSTALLS, 'all'])}}}",
    )
    p_install.add_argument("-f", "--force", action="store_true", help="overwrite existing symlinks/files")

    p_setup = sub.add_parser("setup", help="install dependencies then apply config")
    p_setup.add_argument(
        "configs", nargs="+",
        choices=[*SETUPS, "all"],
        metavar=f"{{{','.join([*SETUPS, 'all'])}}}",
    )

    args = parser.parse_args()
    {"install": cmd_install, "setup": cmd_setup}[args.command](args)


if __name__ == "__main__":
    main()
