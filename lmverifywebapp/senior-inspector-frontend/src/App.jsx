import { Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider, useAuth } from './lib/auth.jsx';
import Layout from './components/Layout.jsx';
import Login from './pages/Login.jsx';
import ChangePassword from './pages/ChangePassword.jsx';
import Queue from './pages/Queue.jsx';
import ReportReview from './pages/ReportReview.jsx';

// User object se tay hota hai, routes se nahi — to aadha-setup account URL
// type karke queue tak nahi pahunch sakta.
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
        <Route index element={<Queue awaiting />} />
        <Route path="all" element={<Queue />} />      
        <Route path="reports/:id" element={<ReportReview />} />
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