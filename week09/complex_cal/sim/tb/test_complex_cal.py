f_in1_re = open("din_1_real.txt", 'w')
f_in1_im = open("din_1_imag.txt", 'w')
f_in2_re = open("din_2_real.txt", 'w')
f_in2_im = open("din_2_imag.txt", 'w')
f_out_re = open("dout_real.txt", 'w')
f_out_im = open("dout_imag.txt", 'w')

din = [-127, 127, 0, 1, -1]

do = complex(0,0)
divisor = 1
for mode in range(2) :
    for r1 in range (5) :
        for i1 in range(5):
            for r2 in range(5):
                for i2 in range(5):
                    d1 = complex(din[r1], din[i1])
                    d2 = complex(din[r2], din[i2])

                    if mode == 0 : # add
                        do = d1 + d2
                        divisor = 2
                    else: #multiplier
                        do = d1 * d2
                        divisor = 256

                    # verilog .... round_down

                    dor = int(do.real / divisor)
                    doi = int(do.imag / divisor)
                    dor_remainder = (do.real) % divisor
                    doi_remainder = (do.imag) % divisor

                    if (dor < 0 and dor_remainder != 0) : dor = dor - 1
                    elif (dor == 0 and do.real < 0)     : dor = dor - 1
                    if (doi < 0 and doi_remainder != 0) : doi = doi - 1
                    elif (doi == 0 and do.imag < 0)     : doi = doi - 1

                    # decimal -> 8-bit hex (2's)
                    if d1.real < 0: d1  = d1 + 256
                    if d1.imag < 0: d1  = d1 + 256j
                    if d2.real < 0: d2  = d2 + 256
                    if d2.imag < 0: d2  = d2 + 256j
                    if dor     < 0: dor = dor + 256
                    if doi     < 0: doi = doi + 256

                    # print, format = 8-bit hex without "0x",
                    if d1.real >= 0 and d1.real < 16 : f_in1_re.write("0"+hex(int(d1.real))[2:]+'\n')
                    else                             : f_in1_re.write(    hex(int(d1.real))[2:]+'\n')
                    if d1.imag >= 0 and d1.imag < 16 : f_in1_im.write("0"+hex(int(d1.imag))[2:]+'\n')
                    else                             : f_in1_im.write(    hex(int(d1.imag))[2:]+'\n')
                    if d2.real >= 0 and d2.real < 16 : f_in2_re.write("0"+hex(int(d2.real))[2:]+'\n')
                    else                             : f_in2_re.write(    hex(int(d2.real))[2:]+'\n')
                    if d2.imag >= 0 and d2.imag < 16 : f_in2_im.write("0"+hex(int(d2.imag))[2:]+'\n')
                    else                             : f_in2_im.write(    hex(int(d2.imag))[2:]+'\n')

                    if dor >= 0 and dor < 16         : f_out_re.write("0"+hex(dor)[2:]+'\n')
                    else                             : f_out_re.write(    hex(dor)[2:]+'\n')
                    if doi >= 0 and doi < 16         : f_out_im.write("0"+hex(doi)[2:]+'\n')
                    else                             : f_out_im.write(    hex(doi)[2:]+'\n')

f_in1_re.close()
f_in1_im.close()
f_in2_re.close()
f_in2_im.close()
f_out_re.close()
f_out_im.close()