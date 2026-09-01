# Legal Metrology Listing Scanner

Prototype web app for scanning e-commerce product listings for mandatory
declarations under the Legal Metrology (Packaged Commodities) Rules, 2011.

## Stack

- React 18 + Vite
- React Router v6 (route-based code splitting via `React.lazy`/`Suspense`)
- Tailwind CSS

## Getting started

```bash
npm install
npm run dev
```

Sign in with any email and a password of 4+ characters — auth is mocked
(see `src/lib/api.js`). All data is mocked in-memory and resets on page
reload.

## Project structure

```
src/
  main.jsx                Entry point
  App.jsx                 Router setup, lazy-loaded routes
  context/AuthContext.jsx Auth state (login/logout, session restore)
  routes/ProtectedRoute.jsx  Route guard, redirects unauthenticated users
  layouts/DashboardLayout.jsx Sidebar + shell for authenticated pages
  lib/api.js               Mock API layer — swap for real backend calls
  lib/mockData.js          Seed data for previous scans
  components/              Shared UI: badges, loaders, error boundary,
                            the tabbed scan result view
  pages/
    Login.jsx
    Dashboard.jsx           Summary stats + recent scans
    NewScan.jsx             URL input, scans, shows result temporarily
    PreviousScans.jsx       Searchable/filterable scan history
    ScanDetail.jsx          Full record for one saved scan
    NotFound.jsx            404 page (catch-all route)
```

## Connecting a real backend

Everything the UI needs goes through `src/lib/api.js`. Replace the body of
each exported function with a real `fetch` call to your scraping/compliance
backend (`VITE_API_BASE_URL` in `.env`) — no page component needs to change,
since they only import from this file.

Functions to implement server-side:

- `loginRequest(email, password)` — authenticate, return the user object
- `getScans()` — list previously scanned listings
- `getScanById(id)` — fetch one saved scan's full data
- `scanUrl(url)` — scrape the given listing URL, extract and validate
  declarations, persist the result, and return it

## Production build

```bash
npm run build
npm run preview
```
