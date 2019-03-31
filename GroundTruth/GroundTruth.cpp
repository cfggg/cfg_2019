#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/CFG.h"
#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <algorithm>

using namespace llvm;

namespace //bu ju ming kong jian
{
	struct GroundTruth : public ModulePass
  {
    static char ID;
    GroundTruth():ModulePass(ID){}
    virtual bool runOnModule(Module &M)
    {
      
      std::string filename = M.getSourceFileName();
      std::ofstream outfile1;
      std::ofstream outfile2;
      outfile1.open(filename.substr(0,filename.rfind(".")).append("_info.txt"));
      outfile2.open(filename.substr(0,filename.rfind(".")).append("_edge.txt"));
      for(Module::iterator Mit=M.begin(),Mite=M.end();Mit!=Mite;Mit++)
      {
        unsigned this_function_has_switch = 0;
        StringRef function_name = Mit->getName();
        StringRef cur_switch_block;
        std::vector<int> cur_switch_line;
        for(llvm::Function::iterator Fit =Mit->begin(),Fite = Mit->end();Fit!=Fite;Fit++)
        {
          StringRef bb_name = Fit->getName();
          std::vector<int> bb_line;
          for(BasicBlock::iterator Bit= Fit->begin(),Bite=Fit->end();Bit!=Bite;Bit++)
          {
            const DebugLoc &location = Bit->getDebugLoc();
            Instruction* curr_inst = dyn_cast<Instruction>(&*Bit);
            if(isa<Instruction>(&*Bit)){
              if(bool(location)){
                bb_line.push_back(location.getLine());
              }
            }
            SwitchInst* switchInst = dyn_cast<SwitchInst>(&*Bit);
            if (isa<SwitchInst>(&*Bit)) {
              this_function_has_switch = 1;
              unsigned line_of_switch = location.getLine();
              cur_switch_block = bb_name;
              outfile1<<"function:"<<function_name.str()<<"\n";
              outfile1<<"basic_block:"<<bb_name.str()<<"\n";
              outfile1<<"switch_line:"<<line_of_switch<<"\n";
              outfile1<<"switch_block:";
              sort(bb_line.begin(),bb_line.end());
              bb_line.erase(unique(bb_line.begin(), bb_line.end()), bb_line.end());
              for(int i = 0;i<bb_line.size();++i)
                outfile1<<bb_line[i]<<" ";   
              outfile1<<"\n"; 
              cur_switch_line.assign(bb_line.begin(), bb_line.end());
              break;
            }             
          }
          if(this_function_has_switch){
            if(bb_name.startswith("sw")){
              unsigned flag = 0;
              sort(bb_line.begin(),bb_line.end());
              bb_line.erase(unique(bb_line.begin(), bb_line.end()), bb_line.end());
              BasicBlock* bb = dyn_cast<BasicBlock>(&*Fit);
              for (BasicBlock *Pred : predecessors(bb)) {
                StringRef pre_name = Pred->getName();
                if(pre_name.compare(cur_switch_block)==0){
                  flag = 1;
                  
                }
              }
              if(flag==1){
                for(int i = 0;i<cur_switch_line.size();++i)
                  outfile2<<cur_switch_line[i]<<" ";
                outfile2<<" -> ";
                for(int i = 0;i<bb_line.size();++i)
                  outfile2<<bb_line[i]<<" ";
                outfile2<<"\n";
              }
            }
          }

        }
      }
      outfile1.close();
      outfile2.close();
      return false;
    }
  };
}

char GroundTruth::ID = 0;
static RegisterPass<GroundTruth> X("GT","to get ground truth",false,false);
