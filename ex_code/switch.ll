; ModuleID = 'switch.c'
source_filename = "switch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"hello,world\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"wohaijiubuxinle\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"\0Aone\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"\0Atwo\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"\0Athree\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"\0Afour\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"\0Afive\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"default\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"bye\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define void @f2() #0 !dbg !7 {
entry:
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0)), !dbg !10
  ret void, !dbg !12
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define void @f1(i32 %i) #0 !dbg !13 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !17, metadata !18), !dbg !19
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i32 0, i32 0)), !dbg !20
  %0 = load i32, i32* %i.addr, align 4, !dbg !21
  switch i32 %0, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
  ], !dbg !22

sw.bb:                                            ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !23
  br label %sw.epilog, !dbg !25

sw.bb2:                                           ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !26
  br label %sw.epilog, !dbg !27

sw.bb4:                                           ; preds = %entry
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)), !dbg !28
  br label %sw.epilog, !dbg !29

sw.epilog:                                        ; preds = %entry, %sw.bb4, %sw.bb2, %sw.bb
  ret void, !dbg !30
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %i, metadata !34, metadata !18), !dbg !35
  %call = call i32 @getchar(), !dbg !36
  store i32 %call, i32* %i, align 4, !dbg !35
  %0 = load i32, i32* %i, align 4, !dbg !37
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
    i32 3, label %sw.bb6
    i32 4, label %sw.bb8
    i32 5, label %sw.bb10
  ], !dbg !38

sw.bb:                                            ; preds = %entry
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !39
  br label %sw.epilog, !dbg !41

sw.bb2:                                           ; preds = %entry
  %call3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !42
  br label %sw.epilog, !dbg !43

sw.bb4:                                           ; preds = %entry
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)), !dbg !44
  br label %sw.epilog, !dbg !45

sw.bb6:                                           ; preds = %entry
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)), !dbg !46
  br label %sw.epilog, !dbg !47

sw.bb8:                                           ; preds = %entry
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i32 0, i32 0)), !dbg !48
  br label %sw.epilog, !dbg !49

sw.bb10:                                          ; preds = %entry
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i32 0, i32 0)), !dbg !50
  br label %sw.epilog, !dbg !51

sw.default:                                       ; preds = %entry
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0)), !dbg !52
  br label %sw.epilog, !dbg !53

sw.epilog:                                        ; preds = %sw.default, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb4, %sw.bb2, %sw.bb
  call void @f2(), !dbg !54
  call void @llvm.dbg.declare(metadata i8* %a, metadata !55, metadata !18), !dbg !57
  %call13 = call i32 @getchar(), !dbg !58
  %conv = trunc i32 %call13 to i8, !dbg !58
  store i8 %conv, i8* %a, align 1, !dbg !57
  %1 = load i8, i8* %a, align 1, !dbg !59
  %conv14 = sext i8 %1 to i32, !dbg !59
  switch i32 %conv14, label %sw.default23 [
    i32 97, label %sw.bb15
    i32 98, label %sw.bb17
    i32 99, label %sw.bb19
    i32 100, label %sw.bb21
  ], !dbg !60

sw.bb15:                                          ; preds = %sw.epilog
  %call16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !61
  br label %sw.epilog25, !dbg !63

sw.bb17:                                          ; preds = %sw.epilog
  %call18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !64
  br label %sw.epilog25, !dbg !65

sw.bb19:                                          ; preds = %sw.epilog
  %call20 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i32 0, i32 0)), !dbg !66
  br label %sw.bb21, !dbg !66

sw.bb21:                                          ; preds = %sw.epilog, %sw.bb19
  %call22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i32 0, i32 0)), !dbg !67
  br label %sw.epilog25, !dbg !68

sw.default23:                                     ; preds = %sw.epilog
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i32 0, i32 0)), !dbg !69
  br label %sw.epilog25, !dbg !70

sw.epilog25:                                      ; preds = %sw.default23, %sw.bb21, %sw.bb17, %sw.bb15
  %call26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0)), !dbg !71
  ret i32 0, !dbg !72
}

declare i32 @getchar() #1

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.0 (tags/RELEASE_500/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "switch.c", directory: "/home/emma/cfg_2019/cfg_2019")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!7 = distinct !DISubprogram(name: "f2", scope: !1, file: !1, line: 2, type: !8, isLocal: false, isDefinition: true, scopeLine: 2, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 4, column: 3, scope: !11)
!11 = distinct !DILexicalBlock(scope: !7, file: !1, line: 3, column: 5)
!12 = !DILocation(line: 5, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "f1", scope: !1, file: !1, line: 6, type: !14, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocalVariable(name: "i", arg: 1, scope: !13, file: !1, line: 6, type: !16)
!18 = !DIExpression()
!19 = !DILocation(line: 6, column: 13, scope: !13)
!20 = !DILocation(line: 7, column: 2, scope: !13)
!21 = !DILocation(line: 8, column: 9, scope: !13)
!22 = !DILocation(line: 8, column: 2, scope: !13)
!23 = !DILocation(line: 9, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !13, file: !1, line: 8, column: 11)
!25 = !DILocation(line: 9, column: 26, scope: !24)
!26 = !DILocation(line: 10, column: 11, scope: !24)
!27 = !DILocation(line: 10, column: 27, scope: !24)
!28 = !DILocation(line: 11, column: 11, scope: !24)
!29 = !DILocation(line: 11, column: 27, scope: !24)
!30 = !DILocation(line: 13, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !32, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: false, unit: !0, variables: !2)
!32 = !DISubroutineType(types: !33)
!33 = !{!16}
!34 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 16, type: !16)
!35 = !DILocation(line: 16, column: 6, scope: !31)
!36 = !DILocation(line: 16, column: 10, scope: !31)
!37 = !DILocation(line: 17, column: 9, scope: !31)
!38 = !DILocation(line: 17, column: 2, scope: !31)
!39 = !DILocation(line: 18, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !31, file: !1, line: 17, column: 11)
!41 = !DILocation(line: 18, column: 26, scope: !40)
!42 = !DILocation(line: 19, column: 11, scope: !40)
!43 = !DILocation(line: 19, column: 27, scope: !40)
!44 = !DILocation(line: 20, column: 11, scope: !40)
!45 = !DILocation(line: 20, column: 27, scope: !40)
!46 = !DILocation(line: 21, column: 11, scope: !40)
!47 = !DILocation(line: 21, column: 29, scope: !40)
!48 = !DILocation(line: 22, column: 11, scope: !40)
!49 = !DILocation(line: 22, column: 28, scope: !40)
!50 = !DILocation(line: 23, column: 11, scope: !40)
!51 = !DILocation(line: 23, column: 28, scope: !40)
!52 = !DILocation(line: 24, column: 11, scope: !40)
!53 = !DILocation(line: 25, column: 2, scope: !40)
!54 = !DILocation(line: 26, column: 2, scope: !31)
!55 = !DILocalVariable(name: "a", scope: !31, file: !1, line: 27, type: !56)
!56 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!57 = !DILocation(line: 27, column: 7, scope: !31)
!58 = !DILocation(line: 27, column: 11, scope: !31)
!59 = !DILocation(line: 28, column: 9, scope: !31)
!60 = !DILocation(line: 28, column: 2, scope: !31)
!61 = !DILocation(line: 29, column: 13, scope: !62)
!62 = distinct !DILexicalBlock(scope: !31, file: !1, line: 28, column: 11)
!63 = !DILocation(line: 29, column: 28, scope: !62)
!64 = !DILocation(line: 30, column: 13, scope: !62)
!65 = !DILocation(line: 30, column: 29, scope: !62)
!66 = !DILocation(line: 31, column: 13, scope: !62)
!67 = !DILocation(line: 32, column: 13, scope: !62)
!68 = !DILocation(line: 32, column: 31, scope: !62)
!69 = !DILocation(line: 33, column: 11, scope: !62)
!70 = !DILocation(line: 34, column: 2, scope: !62)
!71 = !DILocation(line: 35, column: 2, scope: !31)
!72 = !DILocation(line: 36, column: 2, scope: !31)
