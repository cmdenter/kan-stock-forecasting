# KAN Stock Forecasting

Autoregressive stock price forecasting using Kolmogorov-Arnold Networks (KANs) - a novel neural network architecture with learnable activation functions.

## Overview

This project demonstrates how to use KAN (Kolmogorov-Arnold Networks) for stock market prediction using an autoregressive approach. KANs offer several advantages over traditional MLPs:

- **Learnable activation functions**: B-splines on edges adapt to data patterns
- **Better interpretability**: Network structure and learned functions can be visualized
- **Parameter efficiency**: Achieves similar or better performance with fewer parameters
- **Non-linear function approximation**: Excels at capturing complex market dynamics

## Features

- 📊 **Stock data integration** with EODHD API (with synthetic data fallback)
- 🧮 **Feature engineering**: Lagged returns, moving averages, volatility, momentum
- 🤖 **KAN model**: Customizable architecture with B-spline activation functions
- 📈 **Comprehensive evaluation**: MSE, RMSE, MAE, R², and direction accuracy
- 📉 **Visualizations**: Training curves, predictions, feature importance
- 🔍 **Model interpretability**: Network visualization and feature analysis
- ⚖️ **Baseline comparison**: Performance comparison with Linear Regression

## Installation

### Prerequisites

- Python 3.9 or higher
- pip package manager

### Setup

1. **Clone the repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/kan-stock-forecasting.git
   cd kan-stock-forecasting
   ```

2. **Create a virtual environment** (recommended):
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Launch Jupyter Lab**:
   ```bash
   jupyter lab
   ```

5. **Open the notebook**: `kan_stock_forecasting.ipynb`

## Usage

### Basic Usage

1. Open `kan_stock_forecasting.ipynb` in Jupyter Lab
2. (Optional) Add your EODHD API key in the configuration cell
   - Get a free API key at https://eodhistoricaldata.com/
   - Replace `YOUR_API_KEY_HERE` with your actual key
3. Run all cells sequentially

### Configuration

You can customize the following parameters in the notebook:

```python
# Data Configuration
TICKER = "AAPL.US"  # Stock ticker
START_DATE = "2020-01-01"
LOOKBACK_WINDOW = 10  # Number of past days to use

# Model Architecture
WIDTH = [n_features, 20, 10, 1]  # Network layers
GRID = 5  # B-spline grid size
K = 3  # Spline order (3 = cubic)

# Training Configuration
TRAINING_STEPS = 100
LAMB = 0.001  # L1 regularization
LAMB_ENTROPY = 2.0  # Entropy regularization
OPTIMIZER = "LBFGS"  # or "Adam"
```

### Without API Key

The notebook includes synthetic data generation, so you can run it without an EODHD API key. The synthetic data simulates realistic stock price patterns with trend, seasonality, and noise.

## Project Structure

```
kan-stock-forecasting/
├── kan_stock_forecasting.ipynb  # Main Jupyter notebook
├── requirements.txt              # Python dependencies
├── README.md                     # This file
├── .gitignore                   # Git ignore rules
└── examples/                    # (Optional) Example results
```

## Model Architecture

The KAN model uses an autoregressive approach:

1. **Input Features** (16 features):
   - Lagged returns: past 10 days of log returns
   - Moving averages: 5-day and 10-day
   - Volatility: 5-day and 10-day rolling std
   - Momentum: 3-day and 5-day price momentum

2. **KAN Layers**:
   - Input layer: 16 features
   - Hidden layer 1: 20 neurons with B-spline activations
   - Hidden layer 2: 10 neurons with B-spline activations
   - Output layer: 1 neuron (next day's return)

3. **Training**:
   - Loss: Mean Squared Error (MSE)
   - Optimizer: LBFGS (default) or Adam
   - Regularization: L1 sparsity + Entropy

## Results

The notebook provides comprehensive evaluation:

- **Regression Metrics**: MSE, RMSE, MAE, R² score
- **Trading Metric**: Direction accuracy (% of correct up/down predictions)
- **Visualizations**:
  - Training loss curves
  - Prediction vs actual plots
  - Scatter plots
  - Error distributions
  - Cumulative returns
  - Feature importance
  - Network structure (if supported)

## Comparison with Baseline

The notebook includes a Linear Regression baseline to quantify KAN's improvement in capturing non-linear patterns.

## Examples

### Running with Real Data

```python
# Set your API key
EODHD_API_KEY = "your_actual_api_key"

# Choose your stock
TICKER = "TSLA.US"  # Tesla
# or
TICKER = "MSFT.US"  # Microsoft
# or
TICKER = "SPY.US"   # S&P 500 ETF
```

### Tuning the Model

```python
# Deeper network
WIDTH = [16, 40, 20, 10, 1]

# Finer B-spline resolution
GRID = 10

# More training steps
TRAINING_STEPS = 200
```

## Advanced Features

### Model Saving and Loading

The notebook includes code to save your trained model:

```python
import pickle

with open('kan_stock_ar_model.pkl', 'rb') as f:
    checkpoint = pickle.load(f)
    model = KAN(width=checkpoint['model_config']['width'],
                grid=checkpoint['model_config']['grid'],
                k=checkpoint['model_config']['k'])
    model.load_state_dict(checkpoint['model_state'])
```

### Feature Importance Analysis

The notebook performs permutation-based feature importance analysis to identify which features are most influential for predictions.

## Limitations and Considerations

- **Not financial advice**: This is an educational project
- **Past performance**: Does not guarantee future results
- **Training time**: KAN is ~10x slower than MLP
- **Market complexity**: Real trading involves transaction costs, slippage, etc.

## Future Improvements

Potential enhancements:

1. **Multi-step forecasting**: Predict multiple days ahead
2. **Multi-asset**: Extend to portfolio of stocks
3. **Additional features**: Sentiment data, macro indicators
4. **Ensemble methods**: Combine multiple KAN models
5. **Online learning**: Update model with new data
6. **Trading strategy**: Implement and backtest trading signals

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## References

- [Kolmogorov-Arnold Networks (KANs)](https://arxiv.org/abs/2404.19756) - Original KAN paper
- [pykan GitHub Repository](https://github.com/KindXiaoming/pykan)
- [pykan Documentation](https://kindxiaoming.github.io/pykan/)
- [KANs for Time Series](https://arxiv.org/abs/2405.08790)

## License

MIT License - feel free to use this code for your own projects.

## Disclaimer

This software is for educational purposes only. Do not use it for actual trading without proper due diligence. The authors are not responsible for any financial losses incurred from using this code.

## Acknowledgments

- Thanks to the pykan team for the excellent KAN implementation
- EODHD for providing financial data API
- The broader machine learning and quantitative finance communities

---

**Happy forecasting! 📈🤖**
