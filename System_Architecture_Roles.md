# System Architecture — Roles & Access Control
*Legal Metrology Compliance System — SIH Problem Statement 26034*

---

## Role Hierarchy

```
Admin (web)
  └── Senior Inspector (web)
        ├── Junior Inspector (mobile app)
        └── Digital Market Inspector (web/mobile)
```

A Senior Inspector can have multiple Junior Inspectors and Digital Market Inspectors assigned under them. Admin sits at the top and manages the full inspector roster.

---

## Roles & Permissions

| Role | Interface | Can do | Can see |
|---|---|---|---|
| **Admin** | Website | Add/remove Senior Inspectors; add/remove Junior & Digital Market Inspectors (assign them under a Senior Inspector) | Report counts per inspector (approved / rejected / pending); basic profile info for every inspector |
| **Senior Inspector** | Website | Flag a report if there's an issue; approve or disapprove reports submitted by their Junior/Digital Market Inspectors | All reports from inspectors under them; status of each report; latest reports feed |
| **Digital Market Inspector** | Website / mobile | Scan online product listings via web scraping; submit findings as reports | Their own previous reports, status, and scan data |
| **Junior Inspector** | Mobile app | Capture product photos in the field → triggers the scan/compliance pipeline → generates a report for submission | Their own report history and status (same feature set as Digital Market Inspector, field-capture focused) |

---

## Report Lifecycle (state machine)

1. **Created** — Junior Inspector captures photos (mobile) or Digital Market Inspector scrapes a listing (web) → pipeline runs → draft report generated.
2. **Pending** — Report sits in the Senior Inspector's queue awaiting review.
3. **Flagged** *(optional intermediate state)* — Senior Inspector marks an issue and sends it back for correction/re-submission by the originating inspector.
4. **Approved** / **Rejected** — Senior Inspector's final decision closes the report.

Admin does not act on individual reports — Admin's dashboard is aggregate-only (counts by status, per inspector).

---

## Data Model Implications

- **User/Inspector table**: `role` (admin / senior_inspector / junior_inspector / digital_market_inspector), `reports_to` (self-reference to a Senior Inspector's user ID, null for Admin/Senior), profile fields.
- **Report table**: `submitted_by` (inspector ID), `reviewed_by` (senior inspector ID, nullable until reviewed), `status` (pending / flagged / approved / rejected), `product_details`, `compliance_result` (from the rule engine), `evidence_photos`, `timestamps`.
- **Hierarchy queries**: Senior Inspector's dashboard needs "all reports where submitted_by IN (inspectors reporting to me)" — index `reports_to` and `submitted_by` for this.
- **Admin dashboard** needs aggregate counts grouped by inspector and status — a rollup query or a materialized view/cache to avoid recomputing on every page load.

---

## Access Control Notes

- Role-based access control (RBAC) enforced at the API layer: middleware checks `role` + hierarchy ownership before allowing an action (e.g., a Senior Inspector can only approve/reject reports from inspectors who report to them, not any report in the system).
- Junior Inspector and Digital Market Inspector share most read/report-status features — consider a shared "Field Inspector" base permission set with a `channel` flag (mobile-capture vs web-scrape) distinguishing how their reports are generated, rather than fully separate permission code paths.
- Admin's "remove inspector" action should consider what happens to that inspector's historical reports (soft-delete/deactivate the account rather than hard-delete, so report history and audit trail remain intact).

---

## Tech Notes (building on the earlier pipeline plan)

- **Auth**: JWT with role claims, or session-based auth with a role/permissions table — either works with the Node.js/Express or FastAPI backend already planned.
- **Web (Admin + Senior Inspector + Digital Market Inspector web use)**: single React.js app with route guards per role.
- **Mobile (Junior Inspector)**: React Native/Flutter app reusing the same backend API; the "same features" Senior Inspectors see on web (report status, history) should just be a subset of the same REST/GraphQL endpoints, filtered by the mobile user's own ID.
- **Web scraping (Digital Market Inspector)**: separate scraping service/worker (e.g., Python with Scrapy/Playwright) that feeds scraped listing images into the same Stage 1–9 compliance pipeline as manually captured photos, so both inspector types converge on one shared pipeline and report format.
