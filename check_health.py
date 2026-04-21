#!/usr/bin/env python3

import argparse
import shutil
import sys
from pathlib import Path

HOME = Path.home()
REPO = Path(__file__).parent.resolve()


def _check(label: str, ok: bool, detail: str = "") -> bool:
    status = "✓" if ok else "✗"
    suffix = f"  ({detail})" if not ok and detail else ""
    print(f"  {status}  {label}{suffix}")
    return ok


def _cmd(name: str) -> bool:
    return _check(name, shutil.which(name) is not None, "not found")


def check_zsh() -> bool:
    results = []

    for cmd in ["fzf", "pay-respects", "zoxide", "lsd", "pyenv"]:
        results.append(_cmd(cmd))

    results.append(_check("nvm", (HOME / ".nvm").exists(), "~/.nvm not found"))

    results.append(_check("oh-my-zsh", (HOME / ".oh-my-zsh").exists(), "~/.oh-my-zsh not found"))

    plugin_path = HOME / ".oh-my-zsh/custom/plugins/zsh-autosuggestions"
    results.append(_check("zsh-autosuggestions", plugin_path.exists(), f"{plugin_path} not found"))

    zshrc = HOME / ".zshrc"
    source_line = f"source {REPO / 'zsh-config.zsh'}"
    sourced = zshrc.exists() and source_line in zshrc.read_text()
    results.append(_check("zshrc source line", sourced, f"run: python3 install.py zsh"))

    return all(results)


CHECKS: dict[str, tuple[str, object]] = {
    "zsh": ("Zsh", check_zsh),
}


def main() -> None:
    parser = argparse.ArgumentParser(description="Check environment health")
    parser.add_argument(
        "configs",
        nargs="+",
        choices=[*CHECKS, "all"],
        metavar=f"{{{','.join([*CHECKS, 'all'])}}}",
    )
    args = parser.parse_args()

    targets = list(CHECKS) if "all" in args.configs else args.configs
    all_ok = True
    for name in targets:
        label, checker = CHECKS[name]
        print(f"\n[{label}]")
        if not checker():
            all_ok = False

    sys.exit(0 if all_ok else 1)


if __name__ == "__main__":
    main()
