; ModuleID = 'switch_2.c'
source_filename = "switch_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"wohaijiubuxinle\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"\0Aone\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"\0Atwo\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0)), !dbg !11
  call void @llvm.dbg.declare(metadata i32* %i, metadata !12, metadata !13), !dbg !14
  %call1 = call i32 @getchar(), !dbg !15
  store i32 %call1, i32* %i, align 4, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %a, metadata !16, metadata !13), !dbg !17
  %0 = load i32, i32* %i, align 4, !dbg !18
  %add = add nsw i32 %0, 2, !dbg !19
  store i32 %add, i32* %a, align 4, !dbg !17
  %1 = load i32, i32* %a, align 4, !dbg !20
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb5
  ], !dbg !21

sw.bb:                                            ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)), !dbg !22
  br label %sw.epilog, !dbg !24

sw.bb3:                                           ; preds = %entry
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !25
  br label %sw.epilog, !dbg !26

sw.bb5:                                           ; preds = %entry
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !27
  br label %sw.epilog, !dbg !28

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb3, %sw.bb
  %2 = load i32, i32* %a, align 4, !dbg !29
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i32 %2), !dbg !30
  ret i32 0, !dbg !31
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @getchar() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.0 (tags/RELEASE_500/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "switch_2.c", directory: "/home/emma/cfg_2019/cfg_2019/ex_code")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 2, type: !8, isLocal: false, isDefinition: true, scopeLine: 2, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocation(line: 3, column: 2, scope: !7)
!12 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 4, type: !10)
!13 = !DIExpression()
!14 = !DILocation(line: 4, column: 6, scope: !7)
!15 = !DILocation(line: 4, column: 10, scope: !7)
!16 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !10)
!17 = !DILocation(line: 5, column: 6, scope: !7)
!18 = !DILocation(line: 5, column: 10, scope: !7)
!19 = !DILocation(line: 5, column: 11, scope: !7)
!20 = !DILocation(line: 6, column: 9, scope: !7)
!21 = !DILocation(line: 6, column: 2, scope: !7)
!22 = !DILocation(line: 7, column: 11, scope: !23)
!23 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 11)
!24 = !DILocation(line: 7, column: 26, scope: !23)
!25 = !DILocation(line: 8, column: 11, scope: !23)
!26 = !DILocation(line: 8, column: 27, scope: !23)
!27 = !DILocation(line: 9, column: 11, scope: !23)
!28 = !DILocation(line: 9, column: 27, scope: !23)
!29 = !DILocation(line: 11, column: 16, scope: !7)
!30 = !DILocation(line: 11, column: 2, scope: !7)
!31 = !DILocation(line: 12, column: 2, scope: !7)
