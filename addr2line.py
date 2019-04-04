import subprocess
import _pickle as cPickle
import os

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
	file_dir['edge'] = os.listdir(rootdir+"/edge")
	file_dir['addr'] = os.listdir(rootdir+"/addr")
	file_dir['byte'] = os.listdir(rootdir+"/byte")
	#file_list = os.listdir(rootdir)
	#print(file_list)
	print(file_dir)
	for f in file_dir['addr']:
		addr = {}
		lines = {}
		with open(rootdir+'/addr/'+f,"r") as a:
			while(1):
				line_a = a.readline()
				if(line_a):
					id = line_a.split(":")[0]
					addr[id]=line_a.split(":")[1].split("->")[1].replace("\n","")
					#print(addr)
				else:
					break
			print(addr)
			for bid,address in addr.items():
				cmd = "addr2line -e ./ex_code/"+f.split("_")[0]+" "+address
				s = os.popen(cmd)
				d = s.read().split(":")[1].replace("\n","")
				#if(d!='?'and int(bid)>int(lines[d])):
				if(d!='?'):
					lines[d] = bid
			print(lines)
			with open(rootdir+"/edge/"+f,"r") as e:
				bb_did = []
				bb_e = []
				bb_sid = []
				#did = []
				while(1):
					line_e = e.readline()
					if(line_e):
						#print(line_e)
						if(lines[line_e.split(" -> ")[0]] not in bb_sid):
							bb_sid.append(lines[line_e.split(" -> ")[0]])
						bb_did.append((line_e.split(" -> ")[0],line_e.split(" -> ")[1].replace("\n",""))) 
					else:
						break
				print(bb_sid)
				#print(bb_did)
				for (x,y) in bb_did:
					#print(x)
					#print(y)
					bb_e.append((lines[x],lines[y]))
			print(bb_e)
			byte = cPickle.load(open(rootdir+"/byte/"+f.replace("txt","pkl"),"rb"))
			print(byte)
			pos = []
			neg = []
			for block_id in bb_sid:
				for key in byte.keys():
			#for (x,y) in bb_e:
					pos_tmp = []
					neg_tmp = []
					#print(byte[int(block_id)])
					#print(byte[int(key)])
					
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
			print("neg_length:"+str(len(neg)))
			cPickle.dump(pos,open(rootdir+"/positive/"+f.replace("txt","pkl"),"wb"))
			cPickle.dump(neg,open(rootdir+"/negative/"+f.replace("txt","pkl"),"wb"))
			




if __name__ == "__main__":
    main()