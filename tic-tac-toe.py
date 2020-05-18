def check(pa):
    var=0
    dh=0
    kl=[]
    for i in pa:
        for j in h:
            if i.count(j)==c:
                kl.append(j)
    la=[]
    ka=2*c-1
    for i in pa:
        lh=[]
        for j in range(0,ka,2):
            lh.append(i[j])
        la.append(lh)
    fin=[]
    for j in range(0,c):
        fn=[]
        for i in la:
            fn.append(i[j])
        fin.append(fn)
    for i in fin:
        for j in h:
            if i.count(j)==c:
                kl.append(j)
    cross=[]
    for i in range(0,c):
        cross.append(fin[i][i])
    cross1=[]
    for i in range(0,c):
        cross1.append(fin[i][-(i+1)])
    for j in h:
        if cross.count(j)==c:
            kl.append(j)
    for j in h:
        if cross1.count(j)==c:
            kl.append(j)
    kl=list(set(kl))
    if len(kl)==1:
        var=1
    
    if var==1:
        print('\U0001F4A5',end='')	
        print('  ',end='')
        print(f"{name[h.index(kl[0])]} won",end='')
        print(' ',end='')
        print('\U0001F4A5',end='')
        exit()

r=int(input('enter the no. of rows and colums:'))
c=r
n=int(input('enter the no. of players:'))
b=0
h=[]
pa=[]
u=1
g=r*c
if n>g:
    print(f'no. of players should be less than {g}')
else:
    b=1

if b==1:
    for i in range (1,r+1):
        ga=[]
        for j in range(u,c+u):
            ga.append(str(j))
            for k in range (1):
                if j==c+u-1:
                    print()
                    u=c+u
                    break
                else:
                    ga.append("|")
                pa.append(ga)
pa=[tuple(i) for i in pa]
pa=list(set(pa))
pa=[list(i) for i in pa]
pa.sort()

name=[]
for i in pa:
    ga=''.join(i)
    print(ga)                    
for i in range (0,n):
    x=input(f'player {i+1} enter your symbol:')
    nam=input(f'player {i+1} enter your name:')
    h.append(x)
    name.append(nam)
for i in range(1,g+1):
    if i>=n:
        if i%n==0:
            y=int(input(f'player {n} enter the position:'))
            for j in pa:
                for k in range(0,len(j)):
                    if j[k]==str(y):
                        j[k]=h[n-1]
                        for q in pa:
                            ga=''.join(q)
                            print(ga)
                        if i>=c:
                            check(pa)
                            


        else:
            y=int(input(f'player {i%n} enter the position:'))
            for j in pa:
                for k in range(0,len(j)):
                    if j[k]==str(y):
                        j[k]=h[i%n-1]
                        for q in pa:
                            ga=''.join(q)
                            
                            print(ga)
                        if i>=c:
                            check(pa)
                            
    else:
        y=int(input(f'player {i} enter the position:'))
        for j in pa:
            for k in range(0,len(j)):
                if j[k]==str(y):
                    j[k]=h[i-1]
                    for q in pa:
                        ga=''.join(q)
                        print(ga)
                    if i>=c:
                        check(pa)    
    if i==g:
        print('Tie')                        