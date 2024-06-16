def sieve_of_Sundaram(n):
    z = 1
    k = (n - 2) // 2
    l = [True] * (k+1)
    s = len(str(n))
    for i in range(1, k+1):
        j = i
        while i + j + 2 * i * j <= k:
            l[i + j+ 2 * i* j] = False
            j += 1
    if n > 2:
        print(2, end=' ' * (3 - 1))
    for i in range(1, k + 1):
        if l[i]:
            if z % 10 != 0:
                print(2*i+1, end=' ' * (len(str(n)) - len(str(i))))
                z += 1
            else:
                print(2*i+1, end='\n')
                z = 1
                
        
            
            
sieve_of_Sundaram(1000)