import torch
import torch.nn as nn
import matplotlib.pyplot as plt

# 入力(x)と出力(y)のデータセット
x = torch.linspace(0, 10, 100).reshape(-1, 1)
y = 2 * x + 5 + torch.randn(x.size()) * 2  # 真の関係はy=2x+5に、ノイズを追加

# データを可視化
plt.scatter(x, y)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Training Data')
plt.show()

class LinearRegression(nn.Module):
    def __init__(self):
        super(LinearRegression, self).__init__()
        self.linear = nn.Linear(1, 1)  # 1入力特徴量、1出力特徴量

    def forward(self, x):
        return self.linear(x)
        
model = LinearRegression()
criterion = nn.MSELoss()  # 平均二乗誤差損失
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)  # 確率的勾配降下法


epochs = 100
for epoch in range(epochs):
    model.train()
    optimizer.zero_grad()  # 勾配を0に初期化
    output = model(x)
    loss = criterion(output, y)
    loss.backward()  # 逆伝播
    optimizer.step()  # パラメータの更新

    if (epoch+1) % 10 == 0:
        print(f'Epoch [{epoch+1}/{epochs}], Loss: {loss.item():.4f}')
        
        model.eval()  # モデルを評価モードに切り替え
with torch.no_grad():  #勾配計算を無効化 
predictions = model(x)plt.scatter(x, y, label='Original Data') plt.plot(x, predictions, label='Fitted Line', color='r') plt.legend() plt.show()