# -*- coding: utf-8 -*-
from idaapi import *
from idautils import *
from idc import *
import pickle
root_dir = "E:\\program\\data\\"
funcs_name = [] #list
dir = {}
print(get_root_filename())
dir['info'] = root_dir+get_root_filename()+"_info.txt"
dir['addr'] = root_dir+"addr\\"+get_root_filename()+"_"
dir['byte'] = root_dir+"byte\\"+get_root_filename()+"_"
dir['table'] = root_dir+"table\\"+get_root_filename()+"_"
all_blocks = {}
all_codes = {}

def get_jmp_table(startea,endea,func_name,id):
	for head in Heads(startea, endea):
		switch_info = idaapi.get_switch_info_ex(head)
		if switch_info != None:
			print("jump table exist!")
			with open(dir['table'] + func_name + ".txt", "a") as f:
				num_cases = switch_info.get_jtable_size()
				f.write("block_id:" + str(id) + "\n")
				f.write("address:" + hex(head).replace("L", "")+"\n")
				#print("line_number:"+str(GetLineNumber(head))+"\n")
				f.write("cases:" + str(num_cases)+"\n")
				results = idaapi.calc_switch_cases(head, switch_info)
				for idx in xrange(results.cases.size()):
					cur_case = results.cases[idx]
					for cidx in xrange(len(cur_case)):
						print "case: %d" % cur_case[cidx]
						print "  goto 0x%x" % results.targets[idx]
						#print("case_line_number:"+str(GetLineNumber(results.targets[idx]))+"\n")
						f.write("target:0x%x"%results.targets[idx])
						f.write("\n")
			return results
		else:
			continue
			return None


with open(dir['info'],'r') as info:
    lines = info.readlines()
    for line in lines:
        if(line.startswith("function")):
            if(line.split(":")[1] not in funcs_name):
                funcs_name.append(line.split(":")[1])
flag= {}
for func in funcs_name:
	print(func.strip("\n"))
	flag[func.strip("\n")] = 0
	addr = LocByName(func.strip("\n"))
	all_blocks[func.strip("\n")]={}
	all_codes[func.strip("\n")]={}
	if addr != BADADDR:
		print hex(addr)
		print("line:"+str(GetLineNumber(addr)))
		f = idaapi.FlowChart(idaapi.get_func(addr))
		for block in f:
			blocks = []
			codes = []
			if block.startEA != block.endEA:
				blocks.append((block.startEA, block.endEA-1))
				results = get_jmp_table(block.startEA,block.endEA-1,func.strip("\n"),block.id)
				if(results!=None):
					print(func.strip("\n"))
					flag[func.strip("\n")]=1
				ibytes = GetManyBytes(block.startEA,block.endEA-block.startEA+1)
				for b in GetManyBytes(block.startEA,block.endEA-block.startEA):#youmeiyoujiayi
					codes.append(ord(b))
				all_blocks[func.strip("\n")][block.id] = blocks
				all_codes[func.strip("\n")][block.id]=codes
for func_name,func_content in all_blocks.items():
	if(flag[func_name]==1):
		with open(dir['addr'] + func_name + ".txt", "w") as f:
			for id,address in func_content.items():
				f.write(str(id)+":"+str(hex(address[0][0])).replace("L","")+"->"+str(hex(address[0][1])).replace("L","")+"\n")

bytes={}
for func_name,func_content in all_codes.items():
	for id,byte in func_content.items():
		bytes[id] = byte
	if(flag[func_name]==1):
		output = open(dir['byte']+func_name+".pkl", 'wb')
		pickle.dump(bytes,output)
		output.close()
print "done"

