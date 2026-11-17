# THE ELECTRIC REVOLUTION 4.0 — Tesla giveaway concept

## Safety and scope
This is a demonstration, **not a real giveaway**. There are no secured prizes, winners, tickets, payment requests or payment processing. Gift cards and Bitcoin are *disabled* placeholders. The $500, $1,000, $2,500 and $5,000 amounts are simulated UI tiers only. Do not collect payments using this demo.

## Install (same GitHub repository / same Vercel project)
1. Back up the `main` branch or download the current repository.
2. In your **existing Supabase project**, open SQL Editor, create a new query, paste `GIVEAWAY-DATABASE.sql` and click Run. It creates a **separate** `giveaway_demo_entries` table with row-level security; it does not alter `registrations` or `admins`.
3. Keep the working `config.js` file in your existing GitHub repository. **This ZIP intentionally does not include it.**
4. Extract this ZIP. Upload all website files in the root of the extracted folder to your existing GitHub repository's **root** (do not upload the outer folder). GitHub → Add file → Upload files → Commit changes.
5. Wait for Vercel deployment to show Ready. Visit `/giveaway.html`.
6. Test: choose a Tesla, select $500, complete the demo form, submit. Confirm the record in Supabase `giveaway_demo_entries` and in the admin dashboard's new demo section. Verify your original registration form and admin records still work.

## Notes
- The registration reference shown after submission is a **local confirmation label**, not a database ID or a ticket. The record itself is stored in Supabase.
- This uses the existing public Supabase publishable/anon key with RLS. Never put a service-role key in `config.js`.
- For public production deployment, add bot protection, rate limits, privacy/data-retention policies and an opt-in/consent workflow. The demo form currently collects personal information and stores it in Supabase.
- Images are illustrative and may not show the named vehicle. The site is independent of Tesla.
- No payment information or gift card codes are stored.
- Before any real-money launch, seek legal advice for the jurisdictions involved, secure and document prizes, implement official rules and compliant payment services, and review data privacy and marketing obligations.
