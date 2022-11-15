def sawtooth_table(dac_bits, counter_bits, file_name = "sawtooth_table_rom.hex"):
    table_list = ""
    for i in range(pow(2, dac_bits)):
        for _j in range(pow(2, counter_bits - dac_bits)):
            table_list += "{}\n".format(hex(i)[2])
    with open(file_name, 'w') as f:
        f.write(table_list)
    print("Sawtooth table be written in file: {} as successfull".format(file_name))

if __name__ == '__main__':
    sawtooth_table(4, 10)
