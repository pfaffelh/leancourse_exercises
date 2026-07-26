# Leancourse exercises

Exercise sheets for the course *Interactive Theorem Proving using
Lean* (University of Freiburg, winter semester 2026/27).  The course
notes are at <https://pfaffelh.github.io/leancourse/>.

## Setup

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

## Troubleshooting

* Lean needs a fair amount of RAM; if your machine struggles, use
  the course compute server or GitHub Codespaces (see the course
  notes for instructions).
* If `lake exe cache get` fails, make sure you are inside the
  repository directory and try again; a partial download resumes.
