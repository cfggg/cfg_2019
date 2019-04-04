import subprocess
import _pickle as cPickle
import os
def find_bounds(start,end,dir):
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

def getLines(switch,des,block_bounds):
	lines = {}
	print("switch:")
	print(switch)
	print("des:")
	print(des)
	for id,(x,y) in block_bounds.items():
		if(str(y) in switch):
			if(str(y) not in lines.keys()):
				lines[str(y)]=id
			else:
				lines[str(y)]=str(max(int(lines[str(y)]),int(id)))
		elif(str(x) in des ):
			if(str(x) not in lines.keys()):
				lines[str(x)]=id
			else:
				lines[str(x)]=str(min(int(lines[str(x)]),int(id)))
		else:
			print("else in getLines:"+str(x)+" "+str(y))
	return lines

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
		addr= {}
		block_line = {}
		lines = {}
		with open(rootdir+'/addr/'+f,"r") as a:
			while(1):
				line_a = a.readline()
				if(line_a):
					id = line_a.split(":")[0]
					addr[id]=((line_a.split(":")[1].split("->")[0],line_a.split(":")[1].split("->")[1].replace("\n","")))
				else:
					break
			for id,(x,y) in addr.items():
				if(find_bounds(x,y,"addr2line -e ./ex_code/"+f.split("_")[0])):
					start,end = find_bounds(x,y,"addr2line -e ./ex_code/"+f.split("_")[0])
					block_line[id] = (start,end)
			print("start and end line of each basic block:")
			print(block_line)
		
			with open(rootdir+"/edge/"+f,"r") as e:
				bb_did = []# edge format:(line_a,line_b) convert to (block_1,block_2)
				bb_e = []
				bb_sid = []
				bb_line = []
				did_line = []
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
				lines = getLines(bb_line,did_line,block_line) 
				print("reflection: ")
				print(lines)
				for x in bb_line:
					bb_sid.append(lines[x])
				print("switch block id: ")
				print(bb_sid)			
				for (x,y) in bb_did:
					bb_e.append((lines[x],lines[y]))
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
							neg_tmp.extend(byte[int(block_id)])
							neg_tmp.append(opt['edge'])
							neg_tmp.extend(byte[int(key)])
							neg.append(neg_tmp)
			print("pos_length:"+str(len(pos)))
			print(pos)
			print("neg_length:"+str(len(neg)))
			print(neg)
			cPickle.dump(pos,open(rootdir+"/positive/"+f.replace("txt","pkl"),"wb"))
			cPickle.dump(neg,open(rootdir+"/negative/"+f.replace("txt","pkl"),"wb"))
			


if __name__ == "__main__":
    main()