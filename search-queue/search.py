'''
def search(arr, x):
  
    for i in range(len(arr)):
  
        if arr[i] == x:
            return i
  
    return -1

numbers = [4, 5, 78, 2, 15]

num5 = search(numbers, 5)
print('Angka 5 ada pada indeks ' + str(num5))
'''
# Nyari kelas
def search(arr, x):
  
    for i in range(len(arr)):
        for j in range(len(arr[i])):
  
            if arr[i][j] == x:
                return i, j
  
    return -1, None

# Masukin data 
def insert(arr, x):
  
    for i in range(len(arr)):
        for j in range(len(arr[i])):
  
            if arr[i][j] == None:
                arr[i][j] = x
  
    return arr


jadwal = [
    #                       Jam 
    #  8            10           13              16
    ['IoT',     'Prak Jartel',  None,        'Big Data'],    # Senin
    ['Jartel',      None,       None,            None],       # Selasa
    [None,          None,       None,           None],         # Rabu
    ['Bimbingan',   None,       'Dasreg',        'IoT'],          # Kamis
    ['Bimbingan',   None,       None,          'Despro']       # Jumat
]

print(' ')
print('Original array')
print(jadwal)

recommend = insert(jadwal, 'Tugas')

print(' ')
print('Modified array')
print(recommend)


#indeks1, indeks2 = search(mul_arr, 'Big Data')

#indeks_a, indeks_b = search(mul_arr, 'Despro')
# print('Kelas big data ada pada indeks ' + str(indeks1) + ' ' + str(indeks2))
# print('Kelas Despro ada pada indeks ' + str(indeks_a) + ' ' + str(indeks_b))



