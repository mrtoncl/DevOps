import { describe, it, expect, vi, beforeEach } from 'vitest';
import { render, screen } from '@testing-library/react';
import App from './App';

beforeEach(() => {
  // App, mount olur olmaz /api/parts'a fetch atıyor — gerçek bir backend olmadan bu
  // çağrı patlamasın diye fetch'i sahte (boş) bir cevapla mocklıyoruz. Amaç API'yi
  // test etmek değil, App'in hiç çökmeden render olduğunu doğrulamak.
  global.fetch = vi.fn(() =>
    Promise.resolve({ json: () => Promise.resolve([]) })
  );
});

describe('App (smoke test)', () => {
  it('renders the login screen when no user is logged in', () => {
    render(<App />);
    expect(screen.getByText('Log In')).toBeInTheDocument();
    expect(screen.getByPlaceholderText('Username')).toBeInTheDocument();
  });
});