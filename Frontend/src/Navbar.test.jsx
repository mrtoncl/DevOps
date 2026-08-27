import { describe, it, expect, vi } from 'vitest';
import { render, screen, fireEvent } from '@testing-library/react';
import Navbar from './Navbar';

const baseProps = {
  activeTab: 'overview',
  onTabChange: () => {},
  theme: 'light',
  onToggleTheme: () => {},
  onLogout: () => {},
  onChangePassword: () => {},
};

describe('Navbar', () => {
  it('does not show the Users tab for a non-Admin user', () => {
    render(<Navbar {...baseProps} user={{ fullName: 'Ahmet Yilmaz', role: 'Kullanici' }} />);
    expect(screen.queryByText('USERS')).not.toBeInTheDocument();
  });

  it('shows the Users tab for an Admin user', () => {
    render(<Navbar {...baseProps} user={{ fullName: 'Ahmet Yilmaz', role: 'Admin' }} />);
    expect(screen.getByText('USERS')).toBeInTheDocument();
  });

  it('calls onTabChange with the right tab when a tab is clicked', () => {
    const onTabChange = vi.fn();
    render(<Navbar {...baseProps} user={{ fullName: 'Ahmet Yilmaz', role: 'Admin' }} onTabChange={onTabChange} />);

    fireEvent.click(screen.getByText('INVENTORY'));

    expect(onTabChange).toHaveBeenCalledWith('inventory');
  });
});