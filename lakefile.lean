import Lake
open Lake DSL

require mathlib from git
  "https://github.com/leanprover-community/mathlib4"@"v4.28.0"

package «leancourse_exercises» where
  moreLeancArgs := #["-O0"]

@[default_target]
lean_lib «LeancourseExercises» where
