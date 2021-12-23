# Radon level forecasting using LSTM models

This work builds a simple LSTM model that it is able to predict the radon levels using only the radon itself and the ventilation
status in the room it is monitorized. It has below 15Bq/m3 of RMSE and the next figure shows a the model forecasting prediction.

![LSTM forecasting](./figures/LSTM_forecasting_close.png)

The repository structure is the following

```
├── data
│   ├── predictions.csv
│   └── radon-data.csv
├── figures
│   └── // figures used, drawed with src/plots.R
├── README.md
└── src
    ├── LSTM-models.ipynb
    ├── plots.R
    ├── requirements.txt
    └── utils
        └── // Useful functions
```
