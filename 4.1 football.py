import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression

football = pd.read_csv("b.1 football.txt", sep = " ")
print(football.head())

x = football["x8"].reshape((-1,1))
y = football["y"]

model = LinearRegression()
model.fit(x,y)

print(model.score(x,y))