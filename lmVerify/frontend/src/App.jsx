import React, { Suspense, lazy } from "react";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "./context/AuthContext.jsx";
import ProtectedRoute from "./routes/ProtectedRoute.jsx";
import DashboardLayout from "./layouts/DashboardLayout.jsx";
import ErrorBoundary from "./components/ErrorBoundary.jsx";
import PageLoader from "./components/PageLoader.jsx";

// Route-level code splitting: each page is its own chunk, fetched on demand.
const Login = lazy(() => import("./pages/Login.jsx"));
const Dashboard = lazy(() => import("./pages/Dashboard.jsx"));
const NewScan = lazy(() => import("./pages/NewScan.jsx"));
const PreviousScans = lazy(() => import("./pages/PreviousScans.jsx"));
const ScanDetail = lazy(() => import("./pages/ScanDetail.jsx"));
const NotFound = lazy(() => import("./pages/NotFound.jsx"));

export default function App() {
  return (
    <ErrorBoundary>
      <BrowserRouter>
        <AuthProvider>
          <Suspense fallback={<PageLoader />}>
            <Routes>
              <Route path="/login" element={<Login />} />

              <Route element={<ProtectedRoute />}>
                <Route element={<DashboardLayout />}>
                  <Route path="/" element={<Dashboard />} />
                  <Route path="/scan/new" element={<NewScan />} />
                  <Route path="/scans" element={<PreviousScans />} />
                  <Route path="/scans/:id" element={<ScanDetail />} />
                </Route>
              </Route>

              <Route path="*" element={<NotFound />} />
            </Routes>
          </Suspense>
        </AuthProvider>
      </BrowserRouter>
    </ErrorBoundary>
  );
}
