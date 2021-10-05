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

def show(arr):
    for i in range(len(arr)):
        print(arr[i])





        
# 1 sks - 50 menit tatap muka, 60 menit kegiatan terstruktur, 60 menit kegiatan mandiri


matkul = [
    ['RTOS-IoT', 3, 'Senin', '07.00-09.00'], #0
    ['RTOS-IoT', 3, 'Kamis', '16.00-18.00'],  #1
    ['Jar. Telkom', 3, 'Selasa', '07.00-09.00'], #2
    ['Jar. Telkom', 3, 'Rabu', '07.00-09.00'],  #3
    ['DPTK',        3, 'Jumat', '16.00-17.40']     #4
]

my_jadwal = [
    [None, None, None, None, None],     #0 - senin
    [None, None, None, None, None],     #1 - selasa
    [None, None, None, None, None],     #2 - rabu
    [None, None, None, None],           #3 - kamis
    [None, None, None, None]            #4 - jumat 
]

#show(matkul)
sks = int(input('Jumlah SKS yang diambil: '))
#jadwal = int(input('Jadwal yang anda inginkan: '))
current = 0

while current < sks:
    print(' ')
    print('Daftar matkul')
    show(matkul)
    print(' ')
    print('SKS saat ini: ' + str(current))
    ambil = int(input('Jadwal yang anda inginkan: '))

    if ambil == 0:
        my_jadwal[0][0] = matkul[0][0]
        current = current + matkul[0][1]
    elif ambil == 1:
        my_jadwal[3][3] = matkul[1][0]
        current = current + matkul[1][1]
    elif ambil == 2:
        my_jadwal[1][0] = matkul[2][0]
        current = current + matkul[2][1]
    elif ambil == 3:
        my_jadwal[2][0] = matkul[3][0]
        current = current + matkul[3][1]
    elif ambil == 4:
        my_jadwal[4][3] = matkul[4][0]
        current = current + matkul[4][1]
    
    print(' ')
    print(' ---------------------------------- ')
    print(' ')
    print('Jadwal saat ini')
    print(' ')
    show(my_jadwal)
    print(' ')
    print(' ---------------------------------- ')
    print(' ')


print('Jadwal anda semester ini')
print(' ')
show(my_jadwal)












'''
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

'''

#indeks1, indeks2 = search(mul_arr, 'Big Data')

#indeks_a, indeks_b = search(mul_arr, 'Despro')
# print('Kelas big data ada pada indeks ' + str(indeks1) + ' ' + str(indeks2))
# print('Kelas Despro ada pada indeks ' + str(indeks_a) + ' ' + str(indeks_b))



