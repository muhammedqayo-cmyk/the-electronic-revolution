# THE ELECTRIC REVOLUTION — website setup

A static electric-vehicle showcase with animations, gallery filters, visitor registration, and an authenticated admin dashboard. No Node.js required.

## Preview locally

Unzip the download, then open `index.html` in Chrome. Gallery and animations work locally. Registration and admin require Supabase setup and an internet connection.

## 1. Create a free Supabase project

1. Visit https://supabase.com and create a free project. Save your database password somewhere private.
2. Open **SQL Editor**, create a query, paste the full contents of `database.sql`, and run it.
3. Open **Project Settings > API** (or the current API keys page). Copy the **Project URL** and the **publishable key** (or legacy `anon` key).
4. Edit `config.js` and replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_PUBLISHABLE_OR_ANON_KEY` with those two values. **Never use the service_role or secret key in browser code.**
5. Open **Authentication > Users**, then create your admin user with a strong password and a verified email using the dashboard. In SQL Editor run this separate statement, replacing the email with the admin email you created:

```sql
insert into public.admins(user_id)
select id from auth.users where email = 'YOUR_REAL_ADMIN_EMAIL@example.com';
```

6. Open `admin.html` after deploying and sign in using that admin account. Only accounts in `admins` can view registrations.
7. Test with a sample registration on the homepage and confirm it appears in the admin dashboard. You can export displayed registrations as CSV.

**Important:** Supabase Auth may need Site URL / Redirect URL configuration for some email-based authentication workflows. Password login of an already created verified admin user works without a callback in this site. Do not enable public signups for admin access; only manually approve admins in the database.

## 2. Publish for free using GitHub + Vercel

1. Unzip the website. The folder contains `index.html`, `style.css`, `script.js`, `admin.html`, `admin.js`, `privacy.html`, `config.js`, `database.sql`, and this README.
2. At https://github.com/new create a repository called `the-electric-revolution` (public is fine; no secret credentials are stored in the files).
3. On the repository page choose **Add file > Upload files**. Upload the files **inside** the extracted folder, not the outer ZIP, then **Commit changes**. `index.html` must be at the repository root.
4. Visit https://vercel.com/new, sign in with GitHub, select **Import** next to your repository.
5. Set **Framework Preset: Other**; leave Build Command blank and Output Directory blank. Click **Deploy**.
6. Vercel will issue a public `*.vercel.app` URL. Open it on your phone and computer.
7. Changes pushed to the GitHub repository redeploy automatically.

## Before public launch

- Replace placeholder privacy contact and operator details in `privacy.html`.
- Test registration and dashboard permissions (an unapproved account must not view registrations).
- Replace demo/illustrative photos with licensed, accurate images; verify the photography matches your claimed vehicles. The current gallery names are conceptual, not real models.
- Add spam protection such as Turnstile or a server-side rate limit before promoting the registration form widely. Public insert is intentionally allowed; the RLS policy prevents public reads, but does not prevent automated spam.
- Consider whether your privacy obligations require additional consent, deletion processes, and retention rules.
- The dashboard displays/exports only the 1,000 newest records. Pagination is needed for larger datasets.

## Notes

- Google Fonts, Unsplash images and Supabase JS CDN require an internet connection.
- Supabase free-tier availability and usage limits can change; check the provider's current pricing.
- This is an independent design, not a Tesla website or an investment/vehicle sales platform.
