import matplotlib.pyplot as plt

a = 16807
b = 0
m = 2**31-1
seed = 42 

cant = 10

x_vals = []
y_vals = []

y_n = seed 

for i in range(cant):
    y_n = (a*y_n + b) % m
    x_vals.append(i)
    y_vals.append(y_n)

print(y_vals)
plt.figure(figsize=(10,5))
plt.scatter(x_vals,y_vals, color='blue',s=20, label='Aleatorios')

plt.title('Aleatorios')
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()