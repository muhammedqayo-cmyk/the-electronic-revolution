# Tesla Collection image upgrade

This update includes 10 locally hosted AI-generated vehicle illustrations in `assets/tesla/`. Each image is associated with the corresponding model through `vehicles.js` and automatically appears in the catalogue, giveaway cards and individual vehicle pages. They are stylized illustrations, **not photographs of actual Tesla vehicles**, and must not be represented as official Tesla marketing imagery.

## Install

1. Back up your GitHub `main` branch.
2. Upload `vehicles.js`, `catalogue.js`, `giveaway.js`, `catalogue.html`, `giveaway.html`, `vehicle.html`, and the full `assets/tesla/` directory to the repository root, preserving the directory structure.
3. Commit and wait for Vercel to redeploy.
4. Open `/catalogue.html` and `/giveaway.html` and refresh.

This package also includes unchanged site files for convenience. **Do not replace your existing `config.js`** (not included). No Supabase migration is required.

To replace an illustration with a licensed real photograph, put the image in `assets/tesla/` and update the matching `image` path in `vehicles.js`. Tesla's official media gallery is restricted to media uses; obtain appropriate permission for promotional/giveaway use.
