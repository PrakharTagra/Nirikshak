import React from "react";

export default class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error, info) {
    // In production, send this to your error-tracking service.
    console.error("Unhandled UI error:", error, info);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div className="flex min-h-screen items-center justify-center bg-slate-50 px-6">
          <div className="max-w-sm text-center">
            <p className="text-sm font-medium uppercase tracking-wide text-orange-600">
              Something went wrong
            </p>
            <h1 className="mt-2 text-xl font-semibold text-slate-900">
              This page hit an unexpected error
            </h1>
            <p className="mt-2 text-sm text-slate-500">
              Try reloading the page. If the problem continues, contact your
              system administrator.
            </p>
            <button
              onClick={() => window.location.reload()}
              className="mt-5 rounded-md bg-slate-900 px-4 py-2 text-sm font-medium text-white hover:bg-slate-800"
            >
              Reload page
            </button>
          </div>
        </div>
      );
    }
    return this.props.children;
  }
}
