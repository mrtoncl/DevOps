import { describe, it, expect } from 'vitest';
import { getPartStatus, classifyFromGap, statusVariant } from './statusUtils';

describe('getPartStatus', () => {
  it('returns Critical when less than 7 days remaining', () => {
    expect(getPartStatus({ stockQuantity: 6, avgDailyUsage: 1 }).status).toBe('Critical');
  });

  it('returns Low Stock exactly at the 7-day boundary', () => {
    expect(getPartStatus({ stockQuantity: 7, avgDailyUsage: 1 }).status).toBe('Low Stock');
  });

  it('returns Healthy at the 21-day boundary', () => {
    expect(getPartStatus({ stockQuantity: 21, avgDailyUsage: 1 }).status).toBe('Healthy');
  });

  it('treats zero daily usage as infinite runway, not a crash', () => {
    const result = getPartStatus({ stockQuantity: 100, avgDailyUsage: 0 });
    expect(result.daysRemaining).toBe(Infinity);
    expect(result.status).toBe('Healthy');
  });
});

describe('classifyFromGap', () => {
  it('flags ORDER_NOW when gap is under 2 days', () => {
    expect(classifyFromGap(1)).toEqual({ status: 'Critical', action: 'ORDER_NOW' });
  });

  it('flags ORDER_SOON at the 2-day boundary', () => {
    expect(classifyFromGap(2)).toEqual({ status: 'Low Stock', action: 'ORDER_SOON' });
  });

  it('flags NO_ACTION at the 7-day boundary', () => {
    expect(classifyFromGap(7)).toEqual({ status: 'Healthy', action: 'NO_ACTION' });
  });
});

describe('statusVariant', () => {
  it('maps each status to its visual variant', () => {
    expect(statusVariant('Critical')).toBe('danger');
    expect(statusVariant('Low Stock')).toBe('warning');
    expect(statusVariant('Healthy')).toBe('success');
  });
});