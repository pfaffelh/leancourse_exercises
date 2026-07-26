# Leancourse exercises

Exercise sheets for the course *Interactive Theorem Proving using
Lean* (University of Freiburg, winter semester 2026/27).  The course
notes are at <https://pfaffelh.github.io/leancourse/>.

## Setup (local machine)

1. Install [VS Code](https://code.visualstudio.com/) and, inside VS
   Code, the *Lean 4 language extension* (which installs Lean itself
   on first use).
2. Clone this repository and fetch the precompiled Mathlib cache:

   ```
   git clone https://github.com/pfaffelh/leancourse_exercises
   cd leancourse_exercises
   lake exe cache get
   code .
   ```

3. Open a file under `Exercises/` (start with
   `Exercises/01-Logic/01-a-Propositions.lean`).  Once the orange
   bars disappear you are ready: replace the `sorry`s.

## Working on the sheets

Copy the `Exercises` folder to `MyExercises` and work there --
`MyExercises` is ignored by git, so updating the course material via

```
git pull
```

will never overwrite your own solutions.

## Using a compute server

Lean is memory-hungry; working locally is comfortable with roughly
8 GB of RAM or more, and struggles below that. For our course you can
use a compute server instead. Please contact the advisors for a
login. Once you have it, follow these instructions:

1. Connect your computer to the university network via VPN.
2. **Create an SSH key and register it on the remote machine.**

   First generate a key pair. This step is the same on every operating system
   (all ship OpenSSH's `ssh-keygen`). Press Enter to accept the default
   location, and optionally set a passphrase:
   ```
   ssh-keygen -t ed25519
   ```
   This creates a private key `id_ed25519` (keep it secret) and a public key
   `id_ed25519.pub` in `~/.ssh/` (on Windows: `%USERPROFILE%\.ssh\`).

   Then copy the **public** key to the server. You will be asked for your
   server password this one time; afterwards the key logs you in without it.

   - **Linux** — `ssh-copy-id` is available:
     ```
     ssh-copy-id <user>@<host>
     ```
   - **macOS** — `ssh-copy-id` is not installed by default; append the key
     manually (or `brew install ssh-copy-id` and use the Linux command):
     ```
     cat ~/.ssh/id_ed25519.pub | ssh <user>@<host> "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
     ```
   - **Windows (PowerShell)** — there is no `ssh-copy-id`; append the key
     manually:
     ```
     type $env:USERPROFILE\.ssh\id_ed25519.pub | ssh <user>@<host> "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
     ```
3. Install the **Remote - SSH** extension for VS Code on your machine.
4. Connect to the remote host (command palette → *Remote-SSH: Connect to
   Host…*). From here on you work inside VS Code, but everything runs on the
   server.
5. **Install Lean on the remote host.** Lean is managed by `elan`, which
   downloads the exact version each project needs. Open a terminal on the
   remote (*Terminal → New Terminal*) and run
   ```
   curl https://elan.lean-lang.org/elan-init.sh -sSf | sh
   ```
   Accept the offered `PATH` change (say yes to updating your shell config).
   To use `lean` and `lake` in the *current* shell right away, run
   ```
   source $HOME/.elan/env
   ```
   A freshly opened terminal picks this up automatically. Check that it
   worked:
   ```
   elan --version
   lake --version
   ```

   You do **not** have to pick the course's Lean version by hand. This
   repository pins it in the file `lean-toolchain`, and `elan` installs and
   selects exactly that version automatically the first time you run `lake`
   or open the folder in VS Code. If the installer asks for a *default
   toolchain* (a global fallback for work outside any project), answering
   `none` — or just accepting the offered default — is fine; the pinned
   version overrides it inside the course directory.
6. **Get the exercises onto the remote host** by cloning this repository:
   ```
   git clone https://github.com/pfaffelh/leancourse_exercises.git
   cd leancourse_exercises
   ```
7. **Fetch the prebuilt Mathlib cache.** The exercises depend on Mathlib;
   compiling it from source would take hours and a lot of memory, so
   download the precompiled files instead:
   ```
   lake exe cache get
   ```
   On the first `lake` call, `elan` installs the Lean version pinned in
   `lean-toolchain` automatically; `lake exe cache get` then downloads
   Mathlib's compiled `.olean` files.
8. **Open the folder and start Lean.** Still connected to the remote, choose
   *File → Open Folder…* and open the `leancourse_exercises` folder on the
   server. In the Extensions panel install the **Lean 4** extension *on the
   remote host* (VS Code lists a separate "SSH: …" section there — install
   it in that section, not only locally). Open any `.lean` file: after a
   moment the goal window (*InfoView*) appears, and from now on all of
   Lean's checking runs on the compute server rather than on your laptop.

You now edit and navigate files in VS Code exactly as you would locally; only
the heavy computation happens remotely.

**No root/`sudo` is required.** Everything above installs into your home
directory — `elan` into `~/.elan`, the Mathlib cache into the project's
`.lake/` and `~/.cache`, and the VS Code server and Lean extension into
`~/.vscode-server`. Checking `.lean` files needs no compiler either (`elan`
ships prebuilt `lean`/`lake` binaries and `lake exe cache get` fetches
precompiled Mathlib). The advisors only need to ensure that `curl` and `git`
are available on the server (they normally are); a C compiler is needed solely
if you build native executables, not for the exercises.

## Troubleshooting

* If your machine has too little RAM for a local setup, use the
  compute server (above) or GitHub Codespaces (green *Code* button on
  the repository page).
* If `lake exe cache get` fails, make sure you are inside the
  repository directory and try again; a partial download resumes.
