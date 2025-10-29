# Theme Auto-Verify Package — Install

## 1) Unzip into your repo root
Contents:
- `.github/workflows/theme-verify.yml`
- `hooks/pre-commit` (local Git hook)
- `README_snippet.md`

## 2) Enable the pre-commit hook
Copy the hook into your local `.git/hooks` and make it executable:
```bash
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## 3) Add CI badge (optional)
Append the content of `README_snippet.md` to your `README.md`.

## 4) Push to trigger CI
```bash
git add .github/workflows/theme-verify.yml
git commit -m "chore(ci): add Theme Manifest Verify workflow"
git push
```
