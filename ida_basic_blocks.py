# -*- coding: utf-8 -*-
from idaapi import *
from idautils import *
from idc import *
import pickle
root_dir = "E:\\program\\"
funcs_name = [] #list
dir = {}
dir['info'] = root_dir+get_root_filename()+"_info.txt"
dir['addr'] = root_dir+get_root_filename()+"_addr_"
dir['byte'] = root_dir+get_root_filename()+"_byte_"

all_blocks = {}
all_codes = {}
with open(dir['info'],'r') as info:
    lines = info.readlines()
    for line in lines:
        if(line.startswith("function")):
            if(line.split(":")[1] not in funcs_name):
                funcs_name.append(line.split(":")[1])

for func in funcs_name:
	addr = LocByName(func.strip("\n"))
	all_blocks[func.strip("\n")]={}
	all_codes[func.strip("\n")]={}
	if addr != BADADDR:
		print hex(addr)
		f = idaapi.FlowChart(idaapi.get_func(addr))
		for block in f:
			blocks = []
			codes = []
			if block.startEA != block.endEA:
				blocks.append((block.startEA, block.endEA))
				ibytes = GetManyBytes(block.startEA,block.endEA-block.startEA+1)
				for b in GetManyBytes(block.startEA,block.endEA-block.startEA):#youmeiyoujiayi
					codes.append(ord(b))
				all_blocks[func.strip("\n")][block.id] = blocks
				all_codes[func.strip("\n")][block.id]=codes
for func_name,func_content in all_blocks.items():
	with open(dir['addr'] + func_name + ".txt", "w") as f:
		for id,address in func_content.items():
			f.write(str(id)+":"+str(hex(address[0][0])).replace("L","")+"->"+str(hex(address[0][1])).replace("L","")+"\n")

bytes={}
for func_name,func_content in all_codes.items():
	for id,byte in func_content.items():
		bytes[id] = byte
	print bytes
	output = open(dir['byte']+func_name+".pkl", 'wb')
	pickle.dump(bytes,output)

