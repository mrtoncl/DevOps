import { test, expect } from '@playwright/test';

test('bir kullanıcı kayıt olup giriş yapabiliyor', async ({ page }) => {
  const username = `e2e_test_${Date.now()}`;

  await page.goto('/');

  // Sign Up sekmesine geç, formu doldur
  await page.getByText('Sign Up').click();
  await page.getByPlaceholder('Full Name').fill('E2E Test Kullanıcı');
  await page.getByPlaceholder('Username').fill(username);
  await page.getByPlaceholder('Password').fill('test1234');
  await page.locator('form').getByRole('button', { name: 'Sign Up' }).click();

  await expect(page.getByText('Account created — you can log in now.')).toBeVisible();

  // Login sekmesine geç, az önce oluşturduğun kullanıcıyla giriş yap
  await page.getByText('Login').click();
  await page.getByPlaceholder('Username').fill(username);
  await page.getByPlaceholder('Password').fill('test1234');
  await page.getByRole('button', { name: 'Log In' }).click();

  // Ana ekran (Navbar) göründüyse giriş başarılı demektir
  await expect(page.getByText('MRO-Pulse')).toBeVisible();
  await expect(page.getByRole('button', { name: 'OVERVIEW' })).toBeVisible();
});
