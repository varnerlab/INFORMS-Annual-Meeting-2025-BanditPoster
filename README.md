# INFORMS-Annual-Meeting-2025-BanditPoster
Repository for the Bandit Problem Poster presented at the INFORMS Annual Meeting 2025.

## Requirements
This example uses the [Julia programming language](https://julialang.org/downloads/) to explore the bandit problem. We also use a variety of tools and languages, such as:
- [Python via the Anaconda distribution](https://www.anaconda.com)
- [Jupyter Notebooks](https://jupyter.org)
- [GitHub Desktop](https://desktop.github.com/) for repository management
- [GitHub Classroom](https://classroom.github.com) for assignments

Finally, we use [Visual Studio Code (VSCode)](https://code.visualstudio.com/download) for development.

## Installation Guide
This document walks you through installing four tools and wiring them together so you can launch **Julia**, **Jupyter**, and **VS Code** from your terminal on **Windows**, **macOS**, or **Linux**. Follow the steps in order.

### Before you start

1. **Close** any terminals you already have open.
2. You will need a normal user account with permission to install software. On managed machines, use your IT-recommended method.

---

### 1. Install Anaconda (or Miniconda — recommended)

**Windows/macOS/Linux**

1. Download the **Anaconda Distribution** (or **Miniconda** if you prefer a smaller install) and run the installer. On Apple Silicon Macs, consider **Miniforge/Miniforge3** as a lightweight conda distribution built for ARM64.
2. When asked to "initialize conda," say **Yes** (this adds `conda` to your shell so `jupyter` works on the command line).
3. After installation, open a **new terminal** and run:

```bash
conda --version
conda init <your-shell>  # e.g., `conda init zsh` — only needed once if the installer did not do it
```

> Optional but recommended (keeps coursework isolated):

```bash
conda create -n course python=3.11 jupyterlab
conda activate course
```

You should be able to run:

```bash
jupyter lab --version
```

---

### 2. Install Julia

Prefer **juliaup** (it manages versions and PATH for you).

**Windows (PowerShell)**

```powershell
winget install -e --id Julia.Juliaup
# then open a NEW PowerShell window
julia --version
```

**macOS (zsh) and Linux (bash/zsh)**

```bash
curl -fsSL https://install.julialang.org | sh
# Restart your terminal (or exec your shell) so PATH updates take effect
julia --version
```

> If you cannot use juliaup, download the Julia installer/tarball from julialang.org and add the `.../bin` directory to your PATH manually (see §6 and Appendix).

Note: some environments or institutional policies disallow piping a remote script directly to `sh`. If that applies to you, download the juliaup installer or the Julia tarball directly from https://julialang.org and follow the manual installation instructions instead.

---

### 3. Install VS Code

**Windows/macOS/Linux**

1. Install **Visual Studio Code**.
2. Verify the `code` command is on your PATH:
   - **macOS (zsh)**: open VS Code → Command Palette (`⌘⇧P`) → "Shell Command: Install 'code' command in PATH".
   - **Windows**: the installer can add `code` to PATH (re-run installer if needed and check "Add to PATH").
   - **Linux**: your package manager usually adds `code`; otherwise add it manually.

Check:

```bash
code --version
```

---

### 4. Install GitHub Desktop

**Windows/macOS**

1. Install **GitHub Desktop** and sign in with your GitHub account.
2. In GitHub Desktop → Preferences/Options → **Integrations**, set **External Editor** to **Visual Studio Code**.

> **Linux:** use the community build of GitHub Desktop (e.g., shiftkey/desktop) or `gh` (GitHub CLI) + VS Code's built-in Git.

---

### 5. Add VS Code extensions

Open VS Code, then install these extensions from the Extensions view:

1. **Jupyter** — `ms-toolsai.jupyter`
2. **Julia** — `julialang.language-julia`
3. **GitHub Copilot Chat** — `GitHub.copilot-chat`  
   - Sign in when prompted. Your institution may need to enable Copilot for your account.

> Prefer CLI? You can also run:
>
> ```bash
> code --install-extension ms-toolsai.jupyter
> code --install-extension julialang.language-julia
> code --install-extension GitHub.copilot-chat
> ```

---

### 6. Ensure **Julia** and **Jupyter** are on your PATH
You should be able to run `julia` and `jupyter` from any terminal. If commands fail, use the appropriate fixes below.

#### Windows (PowerShell)

- **Conda/Jupyter**:

```powershell
conda init powershell   # adds conda to your PowerShell profile
# Restart PowerShell
jupyter lab --version
```

- **Julia via juliaup**: should already be on PATH. If `julia` is not found, sign out/in or run:

```powershell
$env:Path += ";$env:LOCALAPPDATA\Microsoft\WindowsApps"
julia --version
```

- **Julia via standalone installer**: add the Julia `bin` folder (e.g., `C:\Julia-1.x\bin`) to **System Properties → Environment Variables → Path**. Then restart your terminal.

#### macOS (zsh by default)

- **Conda/Jupyter**:

```bash
conda init zsh
exec zsh    # reloads shell
jupyter lab --version
```

- **Julia via juliaup**: the installer adds `~/.juliaup/bin` to your shell startup file. If `julia` is not found, add this to `~/.zshrc` (or `~/.zprofile`) and restart your terminal:

```bash
export PATH="$HOME/.juliaup/bin:$PATH"
```

#### Linux (bash or zsh)

- **Conda/Jupyter**:

```bash
conda init bash   # or: conda init zsh
exec $SHELL -l    # reloads your shell as a login shell
jupyter lab --version
```

- **Julia via juliaup**: if needed, add:

```bash
export PATH="$HOME/.juliaup/bin:$PATH"
```

to `~/.bashrc` or `~/.zshrc`, then restart the terminal.

---

### 7. Wire Julia into Jupyter (IJulia)
To make **Julia** available in Jupyter, you need to install the IJulia package.
Open a terminal and start Julia:

```bash
julia
```

In the Julia REPL:

```julia
using Pkg
Pkg.add("IJulia")
```

This registers a **Julia** kernel with Jupyter. If you activated a conda environment named `course`, continue to launch `jupyter lab` from that environment to ensure kernels align:

```bash
conda activate course
jupyter lab
```

In JupyterLab → Launcher → you should see **Julia** listed under **Notebook** kernels.

> Optional: from Julia you can also launch directly with:
>
> ```julia
> using IJulia
> notebook()   # or: jupyterlab()
> ```

---
