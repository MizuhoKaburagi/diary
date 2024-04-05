def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# フィボナッチ数列の最初の10項を出力
for num in fibonacci(10):
    print(num)