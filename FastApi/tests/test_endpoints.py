from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_predict_stock_returns_valid_shape():
    response = client.post("/predict/stock", json={
        "category": "Elektronik",
        "criticality": "Yüksek",
        "stock_quantity": 120,
        "avg_daily_usage": 4.5,
        "usage_trend_pct": 2.1
    })
    assert response.status_code == 200

    body = response.json()
    assert set(body.keys()) == {"median_day", "earliest_day", "latest_day"}
    assert body["earliest_day"] <= body["median_day"] <= body["latest_day"]

def test_predict_leadtime_returns_valid_shape():
    response = client.post("/predict/leadtime", json={
        "category": "Elektronik",
        "criticality": "Yüksek",
        "supplier_country": "Almanya",
        "shipping_method": "Kara",
        "supplier_reliability_score": 0.85,
        "promised_delivery_days": 7
    })
    assert response.status_code == 200

    body = response.json()
    assert set(body.keys()) == {"lead_time", "promised_delivery_days", "delay_warning"}
    assert isinstance(body["delay_warning"], bool)