from main import is_delayed

def test_is_delayed_false_when_exactly_on_time():
    assert is_delayed(predicted_lead_time=5.0, promised_delivery_days=5.0) is False

def test_is_delayed_true_when_late_by_exactly_one_day():
    assert is_delayed(predicted_lead_time=6.0, promised_delivery_days=5.0) is True

def test_is_delayed_false_when_late_by_slightly_less_than_one_day():
    assert is_delayed(predicted_lead_time=5.9, promised_delivery_days=5.0) is False