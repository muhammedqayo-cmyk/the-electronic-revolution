# THE ELECTRIC REVOLUTION — Tesla-only catalogue upgrade

## What is included
Ten Tesla vehicle families: Model 3, Model Y, Model S, Model X, Cybertruck, next-generation Roadster, original Roadster, Cybercab, Semi, and Robovan. Status labels distinguish production, legacy, development, and concepts. Search, category filters, model detail pages, and 3-way comparison are included.

## Important
- Independent enthusiast website. Not affiliated with Tesla. Do not imply official affiliation or accept Tesla vehicle deposits.
- Images are **illustrative**, may show other vehicles, and must be replaced with licensed, model-accurate images before promotion. Current sample images are externally hosted; review usage rights.
- No unverified prices, range, horsepower, acceleration, or launch dates are shown. Consult Tesla's official pages for current facts.
- The homepage's original gallery layout is retained but labels now point to Tesla families; images remain illustrative.

## Deploy safely
1. Back up your current GitHub main branch (create a branch named `before-tesla-catalogue`).
2. Extract this ZIP. Upload the **contents** of its folder into the root of your existing GitHub repository. Commit to main.
3. **Do not delete or overwrite `config.js`**. This ZIP intentionally omits it. Do not rerun `database.sql`.
4. Wait for Vercel's latest deployment to say Ready.
5. Open `/catalogue.html` and `/vehicle.html?id=roadster-new`.
6. Test registration, admin sign-in, and CSV export to verify your existing Supabase connection.
7. If anything breaks, restore the previous commit or branch in GitHub.

## Data maintenance
Edit `vehicles.js` to update descriptions, status labels, official URLs, and images. Avoid invented specifications.

## Source references (checked November 2026)
- Tesla vehicle gallery: https://www.tesla.com/tesla-gallery
- Tesla main site: https://www.tesla.com/
- Tesla Q2 2026 update (production and Roadster development): https://assets-ir.tesla.com/tesla-contents/IR/TSLA-Q2-2026-Update.pdf
