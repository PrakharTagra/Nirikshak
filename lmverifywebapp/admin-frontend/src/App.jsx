import { Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './lib/auth.jsx';
import Layout from './components/Layout.jsx';
import Login from './pages/Login.jsx';
import ChangePassword from './pages/ChangePassword.jsx';
import Dashboard from './pages/Dashboard.jsx';
import Reports from './pages/Reports.jsx';
import Officers from './pages/Officers.jsx';
import CreateAccount from './pages/CreateAccount.jsx';
import AuditLog from './pages/AuditLog.jsx';
import ReportDetail from './pages/ReportDetail.jsx';

// Teen states, routes se nahi balki user object se tay hote hain — to aisa koi
// window nahi bachta jahan aadha-setup account URL type karke console mein ghus jaye.
function Gate() {
  const { user, checking } = useAuth();

  if (checking) {
    return (
      <div className="flex min-h-screen items-center justify-center bg-slate-50 text-sm text-slate-500" role="status">
        Checking your session…
      </div>
    );
  }

  if (!user) return <Login />;
  if (user.must_change_password) return <ChangePassword />;

  return (
    <Routes>
      <Route element={<Layout user={user} />}>
        <Route index element={<Dashboard />} />
        <Route path="reports" element={<Reports />} />
        <Route path="reports/:id" element={<ReportDetail />} />
        <Route path="officers" element={<Officers />} />
        <Route path="officers/new" element={<CreateAccount />} />
        <Route path="audit" element={<AuditLog />} />
        <Route path="*" element={<Navigate to="/" replace />} />
      </Route>
    </Routes>
  );
}

export default function App() {
  return (
    <AuthProvider>
      <Gate />
    </AuthProvider>
  );
}