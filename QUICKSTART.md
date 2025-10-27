# Quick Start Guide

Get up and running with KAN Stock Forecasting in 5 minutes!

## 🚀 Setup

### 1. Clone the Repository

```bash
git clone https://github.com/cmdenter/kan-stock-forecasting.git
cd kan-stock-forecasting
```

### 2. Create Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Launch Jupyter Lab

```bash
jupyter lab
```

### 5. Open the Notebook

Open `kan_stock_forecasting.ipynb` in Jupyter Lab and run all cells!

## 📝 Notes

- **No API key needed** - The notebook includes synthetic data generation
- **Optional**: Get a free EODHD API key at https://eodhistoricaldata.com/ for real stock data
- **Training time**: ~2-5 minutes on CPU for 100 steps

## 🔧 Working with Claude Code

If you want me (Claude Code) to work directly on this repository:

1. **Navigate to the directory**:
   ```bash
   cd /Users/method314/kan-stock-forecasting
   ```

2. **Launch Jupyter Lab** and let me know what changes you want!

I can:
- Modify the notebook cells directly
- Add new features or analysis
- Tune hyperparameters
- Create additional visualizations
- Implement new models or comparisons
- Add more technical indicators
- Create multi-step forecasting
- Build trading strategies

## 📊 Quick Customization

Edit these variables in the notebook:

```python
# Try different stocks
TICKER = "TSLA.US"  # Tesla
TICKER = "MSFT.US"  # Microsoft
TICKER = "SPY.US"   # S&P 500

# Adjust lookback period
LOOKBACK_WINDOW = 20  # Use 20 days instead of 10

# Bigger network
WIDTH = [16, 40, 20, 10, 1]

# More training
TRAINING_STEPS = 200
```

## 🎯 Expected Output

After running all cells, you'll get:

1. ✅ Stock data loaded (real or synthetic)
2. ✅ Features engineered (lagged returns, MA, volatility, momentum)
3. ✅ KAN model trained (~100 steps)
4. ✅ Performance metrics (MSE, RMSE, MAE, R², direction accuracy)
5. ✅ Visualizations (predictions, errors, cumulative returns)
6. ✅ Feature importance analysis
7. ✅ Comparison with Linear Regression baseline

## ❓ Troubleshooting

**Issue**: `ModuleNotFoundError: No module named 'kan'`
**Solution**: Run `pip install pykan` or `pip install git+https://github.com/KindXiaoming/pykan.git`

**Issue**: Training is slow
**Solution**: Reduce `TRAINING_STEPS` to 50, or use smaller `WIDTH` like `[16, 10, 1]`

**Issue**: CUDA/GPU errors
**Solution**: The notebook works fine on CPU. If you have GPU issues, ignore them - training will default to CPU.

## 🎉 You're Ready!

Enjoy exploring KAN for stock forecasting! 🚀📈
