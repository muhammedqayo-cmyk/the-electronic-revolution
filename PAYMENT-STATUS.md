# Payment status

Bitcoin and gift card methods are displayed as **Coming Soon** only. No wallet address, gift-card code collection, or live payment processing is included.

Registration records expressions of interest, not purchased tickets. The existing Supabase table `giveaway_demo_entries` is retained for compatibility, and its internal `entry_status` remains `demo_only` to avoid incorrectly treating registrations as valid paid draw entries. Do not rename or delete the table.

Before enabling paid entry or claiming prizes are available, obtain the required approvals, secure the prizes, publish official rules, and implement appropriate payment processing.
