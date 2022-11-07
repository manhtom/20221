def init(n):
 return [str(0) for i in range(n)]

def check(k,v):
  global lst
  if v>int(lst[k-2]):
    return True
  else: return False

def bin(k):
  global lst
  global i
  if k>m:
    if sum(lst)>=m*(m+1)/2:
      print(lst)
      i+=1
  else:
    for v in range(k,n+1): #eliminate redundancy
      if check(k,v):
        lst[k-1]=(v)
        bin(k+1)
    lst[k-1]=str(0) #reset

m,n=[int(x) for x in input().split()]
lst=init(m)
i=0
bin(1)
print(i)
