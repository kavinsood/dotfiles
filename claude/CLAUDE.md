# Global Preferences

## About Me
- Kavin, full-stack developer. Backend-leaning (Rust, Go, Python), but comfortable across the stack.
- Primary stack: Next.js (App Router), React 19, Tailwind 4, Bun, TypeScript, Supabase, Vercel AI SDK.
- Editor: Neovim (lazy.nvim). Terminal: Ghostty + Zellij/tmux. Shell: fish + starship.
- OS: Arch Linux (KDE Plasma, Wayland). Machine: HP Pavilion, i5-1135G7.
- Package manager: bun for JS/TS, uv for Python, pacman/yay for system.

## How I Work
- "Slow is Fast" — I value reasoning quality, architecture, and getting it right the first time over speed.
- I prefer direct, concise communication. No fluff, no over-explaining, no praise.
- I want to understand *why* before *what*. Explain tradeoffs, not just solutions.
- When I give a vague request, investigate first rather than guessing. Read the code, understand the context.
- Don't add features, comments, or abstractions I didn't ask for.

## Coding Style
- TypeScript: strict, infer types where possible, Zod at boundaries, discriminated unions for state.
- React: RSCs by default. useState only for transient UI state. URL params for shareable state.
- No useEffect unless synchronizing with an external system. Justify every dependency.
- Good code is boring. Clarity over cleverness. Errors are not optional.
- Every abstraction must pay for its keep. Three similar lines > premature abstraction.

## Tools & Environment
- Use `bun` for all JS/TS operations (install, run, build, test).
- Use `uv` for Python.
- Git: commit messages should be concise and describe *why*, not *what*.
- CLI tools available: eza, fd, fzf, rg, bat, delta, lazygit, btop, zoxide, atuin, starship.

## Project Patterns
- Most projects use Next.js + Supabase + Vercel AI SDK.
- Dev server: `bun dev`. Build: `bun build`. Lint: `bun lint`. Type check: `bun type-check`.
- Supabase migrations in `supabase/migrations/`. Types generated with `bunx supabase gen types`.
