#!/usr/bin/env python3
import argparse
from pathlib import Path

REPO = Path(__file__).parent.resolve()
HOME = Path.home()


def link(src: Path, dst: Path, force: bool) -> None:
    if dst.is_symlink():
        if not force:
            print(f"  skip  {dst}  (symlink exists, use -f to overwrite)")
            return
        dst.unlink()
    elif dst.exists():
        if dst.is_dir():
            print(f"  skip  {dst}  (directory exists, remove manually)")
            return
        if not force:
            print(f"  skip  {dst}  (file exists, use -f to overwrite)")
            return
        dst.unlink()
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.symlink_to(src)
    print(f"  link  {dst} -> {src}")


def install_vim(force: bool) -> None:
    link(REPO / "vim/vimrc", HOME / ".vimrc", force)
    for f in ["plugin.vim", "keymap.vim", "utils.vim"]:
        link(REPO / "vim" / f, HOME / ".vim/config" / f, force)


def install_nvim(force: bool) -> None:
    link(REPO / "nvim", HOME / ".config/nvim", force)


def install_git(force: bool) -> None:
    link(REPO / "gitconfig", HOME / ".gitconfig", force)


def install_ideavim(force: bool) -> None:
    link(REPO / "ideavimrc", HOME / ".ideavimrc", force)


def install_spacemacs(force: bool) -> None:
    link(REPO / "spacemacs", HOME / ".spacemacs", force)


def install_zsh(force: bool) -> None:
    link(REPO / "zsh-config.zsh", HOME / ".zsh-config.zsh", force)
    print("  note  add 'source ~/.zsh-config.zsh' to ~/.zshrc manually")


CONFIGS: dict[str, tuple[str, object]] = {
    "vim":       ("Vim config",       install_vim),
    "nvim":      ("Neovim config",    install_nvim),
    "git":       ("Git config",       install_git),
    "ideavim":   ("IdeaVim config",   install_ideavim),
    "spacemacs": ("Spacemacs config", install_spacemacs),
    "zsh":       ("Zsh config",       install_zsh),
}


def main() -> None:
    parser = argparse.ArgumentParser(description="Install config symlinks")
    parser.add_argument(
        "configs",
        nargs="+",
        choices=[*CONFIGS, "all"],
        metavar=f"{{{','.join([*CONFIGS, 'all'])}}}",
        help="config(s) to install",
    )
    parser.add_argument("-f", "--force", action="store_true", help="overwrite existing symlinks/files")
    args = parser.parse_args()

    targets = list(CONFIGS) if "all" in args.configs else args.configs
    for name in targets:
        label, installer = CONFIGS[name]
        print(f"\n[{label}]")
        installer(args.force)


if __name__ == "__main__":
    main()
