import os

daftar_file = os.listdir('.')
print(daftar_file)
print(daftar_file[10])

print("==============================")
daftar_dir_entries = os.scandir('.')

jumlah_file=0
jumlah_folder=0

for entry in daftar_dir_entries:
    print("--------------------------")
    print(entry.name)
    print(entry.is_dir())
    print(entry.is_file())
    print(entry.stat().st_size)

    if entry.is_dir():
        jumlah_folder = jumlah_folder + 1
    
    if entry.is_file():
        jumlah_file = jumlah_file + 1

print("Jumlah file : " + str(jumlah_file))
print("Jumlah folder : " + str(jumlah_folder))