# THE ELECTRIC REVOLUTION — Premium Upgrade

## Important: keep your working Supabase connection
This is an **update to your existing GitHub repository**, not a new project. Your live website already uses a working `config.js` with your Supabase URL and publishable key.

**Do not delete or replace `config.js` in GitHub.** This upgrade ZIP intentionally does **not** contain `config.js`.

**Do not rerun `database.sql`** or recreate the Supabase project. Your existing `registrations` and `admins` tables and existing admin account remain in place.

## Update the existing website using GitHub
1. Download the upgrade ZIP and extract it on your computer.
2. Open your existing GitHub repository, `the-electronic-revolution` (use the repository already connected to Vercel).
3. Select **Add file → Upload files**.
4. Open the extracted upgrade folder and select all files inside it. **Do not upload the outer folder or the ZIP itself.**
5. Drag them into GitHub's upload area. GitHub should show that files such as `index.html`, `style.css`, `script.js`, `admin.html`, and `admin.js` will be updated.
6. Choose **Commit directly to the main branch**, enter `Premium design and dashboard upgrade`, then click **Commit changes**.
7. Your existing `config.js` stays untouched. Vercel automatically redeploys from `main`.
8. Open Vercel → Project → Deployments and wait for the newest deployment to say **Ready**.
9. Open the website in a private tab or hard-refresh (Ctrl+Shift+R) to avoid cached CSS/JS.
10. Test the gallery detail buttons, filters, animations and registration form. Visit `/admin.html`, sign in with your existing admin account and test search, filters, charts and CSV export.

## What changed
- Premium styling and accessibility enhancements
- New feature strip and interactive vehicle detail modal
- Admin dashboard KPI cards, country/interest bar charts, search, interest filter, and filtered CSV export
- CSV spreadsheet formula-injection protection
- Responsive/mobile refinements and reduced-motion support

## Notes
- Vehicle names and photography remain illustrative, not verified manufacturer models/specifications.
- Dashboard charts and totals reflect **up to 1,000 most recent records** loaded by the existing application, not all-time database totals.
- This version does not change your Supabase tables, policies, credentials, admin account, or existing registrations.
- For public marketing, confirm that your use complies with your hosting plan terms, and consider spam protection, a proper privacy notice, and licensed photography.
