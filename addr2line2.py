import subprocess
import _pickle as cPickle
import os

class SwitchException(Exception):
	def __init__(self, parameter):
		err = 'Jump table error occurred at block_id:{1}'.format(parameter)
		Exception.__init__(self, err)
		self.parameter = parameter
	def __str__(self):
		return self.err

def find_bounds_nodes(start,end,dir):
	x = int(start,16)
	y = int(end,16)
	tmp = []
	while(x <= y):
		cmd = dir+" "+hex(x)
		s = os.popen(cmd)
		d = s.read().split(":")[1].replace("\n","")
		if(d!='?'):
			if(int(d) not in tmp):
				tmp.append(int(d))
		x+=1
	if(len(tmp)>0):
		tmp.sort()#modify itself
		return tmp[0],tmp[len(tmp)-1]
	else:
		return False

def find_bounds(addr,dir,num_of_blocks):
	block_line = {}
	s_flag = []
	block_line_cp = {}
	for id,(start,end) in addr.items():
		if(find_bounds_nodes(start,end,dir)):
			x,y = find_bounds_nodes(start,end,dir)
			block_line[id] = (str(x),str(y))
	for id in addr.keys():
		if(id not in block_line.keys()):
			s_flag.append(id)
			s = -1
			d = -1
			print("get no bounds at: ")
			print(addr[id])
			for num in range(int(id)):
				if(str(num) in block_line.keys()):
					s = block_line[str(num)][1]
			print("id:"+id)
			print("s:"+str(s))
			for num in range(int(id),num_of_blocks+1):
				if(str(num) in block_line.keys()):
					d = block_line[str(num)][0] #cun yi
					break;
			print("id:"+id)
			print("d:"+str(d))
			block_line_cp[id]=(s,d)
	for id,(x,y) in block_line_cp.items():
		block_line[id]=(str(x),str(y))
	return block_line

def getLines(switch,des,block_bounds,dir):
	lines = {}
	des_lines = {}
	print("switch:")
	print(switch)
	print("des:")
	print(des)
	jump_table_addr = {}
	id = -1
	with open(dir,"r") as t:
		while(1):
			line_t = t.readline()
			if(line_t):
				if(line_t.startswith("block_id:")):
					id = line_t.replace("block_id:","").replace("\n","")
					print("id:"+id+"\n")
				if(line_t.startswith("address:")):
					print("id_again:"+id+"\n")
					jump_table_addr[id]=line_t.replace("address:","").replace("\n","")
			else:
				break
	print("jump table addr:")
	print(jump_table_addr)
	
	for k in jump_table_addr.keys():
		if(block_bounds[k][0] in switch):
			lines[block_bounds[k][0]] = k
		elif(block_bounds[k][1] in switch):
			lines[block_bounds[k][1]] = k
		else:
			try:
				raise(SwitchException(k))
			except SwitchException as e:
				print("error occurred :",e.err)

	for id,(x,y) in block_bounds.items():
		if(str(x) in des):
			if(str(x) not in des_lines.keys()):
				des_lines[str(x)]=id
			else:
				des_lines[str(x)]=str(min(int(des_lines[str(x)]),int(id)))
		else:
			print("else in getLines:"+str(x)+" "+str(y))
	return lines,des_lines

def main():
	#read addr files from directory
	#get last addr
	#use addr2line to get line number of last addr
	#dict[block.id]=line number
	#read all edges and get bytes (final result) by block id(search line number)
	#relations: edge---line_number(value)--->addr---block_id(key)--->byte
	#print final positive result
	# get switch block and get all traverse from switch block to the other block if the value of the other block can be found
	#in edge then positive else negative
	rootdir = "./data"
	opt = {}
	opt['edge']=256
	file_dir = {}
	file_dir['addr'] = os.listdir(rootdir+"/addr")
	print("file_dir: ")
	print(file_dir)
	for f in file_dir['addr']:
		addr= {} # items:id,(x,y); id:block_id;(x,y)=(addrinhex1,addrinhex2) 
		block_line = {} #items:id,(x,y); id:block_id;(x,y)=(startline,endline)
		lines = {}#reflection of switch :items:line->block_id
		des_lines = {}#reflection of destinations:items:line->block_id
		num_of_blocks = -1
		with open(rootdir+'/addr/'+f,"r") as a:
			while(1):
				line_a = a.readline()
				if(line_a):
					id = line_a.split(":")[0]
					num_of_blocks = int(id)
					addr[id]=((line_a.split(":")[1].split("->")[0],line_a.split(":")[1].split("->")[1].replace("\n","")))
				else:
					break
			'''
			for id,(x,y) in addr.items():
			
				if(find_bounds(x,y,"addr2line -e ./ex_code/"+f.split("_")[0])):
					start,end = find_bounds(x,y,"addr2line -e ./ex_code/"+f.split("_")[0])
					block_line[id] = (start,end)
			print("start and end line of each basic block:")
			print(block_line)
			'''
			block_line = find_bounds(addr,"addr2line -e ./ex_code/"+f.replace("_"+f.split("_")[len(f.split("_"))-1],""),num_of_blocks)
			print("block line:")
			print(block_line)
			with open(rootdir+"/edge/"+f,"r") as e:
				bb_did = []#edge format:(line_a,line_b)
				bb_e = []#edge format:(block_id_a,block_id_b)
				bb_sid = []#block_Id_of_switchs
				bb_line = []#line_number_of_switchs
				did_line = [] #line_number_of_destinations
				did_id = []#block_id_of_destinations
				while(1):
					line_e = e.readline()
					if(line_e):
						if(line_e.split(" -> ")[0] not in bb_line):
							bb_line.append(line_e.split(" -> ")[0])
						bb_did.append((line_e.split(" -> ")[0],line_e.split(" -> ")[1].replace("\n","")))
						if(line_e.split(" -> ")[1].replace("\n","") not in did_line):
							did_line.append(line_e.split(" -> ")[1].replace("\n",""))
						
					else:
						break
				lines,des_lines = getLines(bb_line,did_line,block_line,rootdir+"/table/"+f) 
				print("reflection: ")
				print(lines)
				for x in bb_line:
					bb_sid.append(lines[x])
				for x in did_line:
					did_id.append(des_lines[x])
				print("switch block id: ")
				print(bb_sid)	
				print("des block id: ")
				print(did_id)		
				for (x,y) in bb_did:
					bb_e.append((lines[x],des_lines[y]))
			print("edge block id: ")
			print(bb_e)
			# need bb_e,bb_sid		
			byte = cPickle.load(open(rootdir+"/byte/"+f.replace("txt","pkl"),"rb"))
			#print(byte)
			pos = []
			neg = []
			for block_id in bb_sid:
				for key in byte.keys():
					pos_tmp = []
					neg_tmp = []
					if(str(key)!=str(block_id)):
						if((str(block_id),str(key))in bb_e):
							pos_tmp.extend(byte[int(block_id)])
							pos_tmp.append(opt['edge'])
							pos_tmp.extend(byte[int(key)])
							pos.append(pos_tmp)
						else:
							if(str(key) not in did_id):
								neg_tmp.extend(byte[int(block_id)])
								neg_tmp.append(opt['edge'])
								neg_tmp.extend(byte[int(key)])
								neg.append(neg_tmp)
							else:
								print("else in did_id"+str(key)+"\n")
			print("pos_length:"+str(len(pos)))
			print(pos)
			print("neg_length:"+str(len(neg)))
			print(neg)
			cPickle.dump(pos,open(rootdir+"/positive/"+f.replace("txt","pkl"),"wb"))
			cPickle.dump(neg,open(rootdir+"/negative/"+f.replace("txt","pkl"),"wb"))
			


if __name__ == "__main__":
    main()