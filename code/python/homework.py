def hs(n):
    count = 0
    while (n != 1):
        print(n)
        count = count + 1

        if (n % 2 == 0):
                n = (n // 2)
        else:
            n = 3*n+1
    if (n == 1):
        print(n)
        count = count + 1
        return None
        print(count)
