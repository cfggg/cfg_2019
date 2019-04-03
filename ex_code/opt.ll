; ModuleID = 'switch.c'
source_filename = "switch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str.2 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"\0Aone\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"\0Atwo\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"\0Athree\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"\0Afour\00", align 1
@.str.7 = private unnamed_addr constant [6 x i8] c"\0Afive\00", align 1
@.str.8 = private unnamed_addr constant [8 x i8] c"default\00", align 1
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@str = private unnamed_addr constant [12 x i8] c"hello,world\00"
@str.10 = private unnamed_addr constant [16 x i8] c"wohaijiubuxinle\00"
@str.11 = private unnamed_addr constant [4 x i8] c"bye\00"

; Function Attrs: nounwind uwtable
define void @f2() local_unnamed_addr #0 !dbg !7 {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str, i64 0, i64 0)), !dbg !10
  ret void, !dbg !12
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @f1(i32 %i) local_unnamed_addr #0 !dbg !13 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !18, metadata !19), !dbg !20
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @str.10, i64 0, i64 0)), !dbg !21
  switch i32 %i, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
  ], !dbg !22

sw.bb:                                            ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !23
  br label %sw.epilog, !dbg !25

sw.bb2:                                           ; preds = %entry
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)), !dbg !26
  br label %sw.epilog, !dbg !27

sw.bb4:                                           ; preds = %entry
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !28
  br label %sw.epilog, !dbg !29

sw.epilog:                                        ; preds = %entry, %sw.bb4, %sw.bb2, %sw.bb
  ret void, !dbg !30
}

; Function Attrs: nounwind uwtable
define i32 @main() local_unnamed_addr #0 !dbg !31 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !38, !tbaa !42
  %call.i = tail call i32 @_IO_getc(%struct._IO_FILE* %0) #3, !dbg !46
  tail call void @llvm.dbg.value(metadata i32 %call.i, i64 0, metadata !35, metadata !19), !dbg !47
  switch i32 %call.i, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb4
    i32 3, label %sw.bb6
    i32 4, label %sw.bb8
    i32 5, label %sw.bb10
  ], !dbg !48

sw.bb:                                            ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  br label %sw.epilog, !dbg !51

sw.bb2:                                           ; preds = %entry
  %call3 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  br label %sw.epilog, !dbg !53

sw.bb4:                                           ; preds = %entry
  %call5 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !54
  br label %sw.epilog, !dbg !55

sw.bb6:                                           ; preds = %entry
  %call7 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0)), !dbg !56
  br label %sw.epilog, !dbg !57

sw.bb8:                                           ; preds = %entry
  %call9 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.6, i64 0, i64 0)), !dbg !58
  br label %sw.epilog, !dbg !59

sw.bb10:                                          ; preds = %entry
  %call11 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.7, i64 0, i64 0)), !dbg !60
  br label %sw.epilog, !dbg !61

sw.default:                                       ; preds = %entry
  %call12 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0)), !dbg !62
  br label %sw.epilog, !dbg !63

sw.epilog:                                        ; preds = %sw.default, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb4, %sw.bb2, %sw.bb
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @str, i64 0, i64 0)) #3, !dbg !64
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !66, !tbaa !42
  %call.i28 = tail call i32 @_IO_getc(%struct._IO_FILE* %1) #3, !dbg !68
  %sext = shl i32 %call.i28, 24, !dbg !69
  %conv14 = ashr exact i32 %sext, 24, !dbg !69
  switch i32 %conv14, label %sw.default23 [
    i32 97, label %sw.bb15
    i32 98, label %sw.bb17
    i32 99, label %sw.bb19
    i32 100, label %sw.bb21
  ], !dbg !70

sw.bb15:                                          ; preds = %sw.epilog
  %call16 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  br label %sw.epilog25, !dbg !73

sw.bb17:                                          ; preds = %sw.epilog
  %call18 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)), !dbg !74
  br label %sw.epilog25, !dbg !75

sw.bb19:                                          ; preds = %sw.epilog
  %call20 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.4, i64 0, i64 0)), !dbg !76
  br label %sw.bb21, !dbg !76

sw.bb21:                                          ; preds = %sw.epilog, %sw.bb19
  %call22 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0)), !dbg !77
  br label %sw.epilog25, !dbg !78

sw.default23:                                     ; preds = %sw.epilog
  %call24 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.8, i64 0, i64 0)), !dbg !79
  br label %sw.epilog25, !dbg !80

sw.epilog25:                                      ; preds = %sw.default23, %sw.bb21, %sw.bb17, %sw.bb15
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str.11, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.0 (tags/RELEASE_500/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "switch.c", directory: "/home/emma/cfg_2019/cfg_2019/ex_code")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!7 = distinct !DISubprogram(name: "f2", scope: !1, file: !1, line: 2, type: !8, isLocal: false, isDefinition: true, scopeLine: 2, isOptimized: true, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 4, column: 3, scope: !11)
!11 = distinct !DILexicalBlock(scope: !7, file: !1, line: 3, column: 5)
!12 = !DILocation(line: 5, column: 1, scope: !7)
!13 = distinct !DISubprogram(name: "f1", scope: !1, file: !1, line: 6, type: !14, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !17)
!14 = !DISubroutineType(types: !15)
!15 = !{null, !16}
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !{!18}
!18 = !DILocalVariable(name: "i", arg: 1, scope: !13, file: !1, line: 6, type: !16)
!19 = !DIExpression()
!20 = !DILocation(line: 6, column: 13, scope: !13)
!21 = !DILocation(line: 7, column: 2, scope: !13)
!22 = !DILocation(line: 8, column: 2, scope: !13)
!23 = !DILocation(line: 9, column: 11, scope: !24)
!24 = distinct !DILexicalBlock(scope: !13, file: !1, line: 8, column: 11)
!25 = !DILocation(line: 9, column: 26, scope: !24)
!26 = !DILocation(line: 10, column: 11, scope: !24)
!27 = !DILocation(line: 10, column: 27, scope: !24)
!28 = !DILocation(line: 11, column: 11, scope: !24)
!29 = !DILocation(line: 11, column: 27, scope: !24)
!30 = !DILocation(line: 13, column: 1, scope: !13)
!31 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 15, type: !32, isLocal: false, isDefinition: true, scopeLine: 15, isOptimized: true, unit: !0, variables: !34)
!32 = !DISubroutineType(types: !33)
!33 = !{!16}
!34 = !{!35, !36}
!35 = !DILocalVariable(name: "i", scope: !31, file: !1, line: 16, type: !16)
!36 = !DILocalVariable(name: "a", scope: !31, file: !1, line: 27, type: !37)
!37 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!38 = !DILocation(line: 46, column: 20, scope: !39, inlinedAt: !41)
!39 = distinct !DISubprogram(name: "getchar", scope: !40, file: !40, line: 44, type: !32, isLocal: false, isDefinition: true, scopeLine: 45, flags: DIFlagPrototyped, isOptimized: true, unit: !0, variables: !2)
!40 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "/home/emma/cfg_2019/cfg_2019/ex_code")
!41 = distinct !DILocation(line: 16, column: 10, scope: !31)
!42 = !{!43, !43, i64 0}
!43 = !{!"any pointer", !44, i64 0}
!44 = !{!"omnipotent char", !45, i64 0}
!45 = !{!"Simple C/C++ TBAA"}
!46 = !DILocation(line: 46, column: 10, scope: !39, inlinedAt: !41)
!47 = !DILocation(line: 16, column: 6, scope: !31)
!48 = !DILocation(line: 17, column: 2, scope: !31)
!49 = !DILocation(line: 18, column: 11, scope: !50)
!50 = distinct !DILexicalBlock(scope: !31, file: !1, line: 17, column: 11)
!51 = !DILocation(line: 18, column: 26, scope: !50)
!52 = !DILocation(line: 19, column: 11, scope: !50)
!53 = !DILocation(line: 19, column: 27, scope: !50)
!54 = !DILocation(line: 20, column: 11, scope: !50)
!55 = !DILocation(line: 20, column: 27, scope: !50)
!56 = !DILocation(line: 21, column: 11, scope: !50)
!57 = !DILocation(line: 21, column: 29, scope: !50)
!58 = !DILocation(line: 22, column: 11, scope: !50)
!59 = !DILocation(line: 22, column: 28, scope: !50)
!60 = !DILocation(line: 23, column: 11, scope: !50)
!61 = !DILocation(line: 23, column: 28, scope: !50)
!62 = !DILocation(line: 24, column: 11, scope: !50)
!63 = !DILocation(line: 25, column: 2, scope: !50)
!64 = !DILocation(line: 4, column: 3, scope: !11, inlinedAt: !65)
!65 = distinct !DILocation(line: 26, column: 2, scope: !31)
!66 = !DILocation(line: 46, column: 20, scope: !39, inlinedAt: !67)
!67 = distinct !DILocation(line: 27, column: 11, scope: !31)
!68 = !DILocation(line: 46, column: 10, scope: !39, inlinedAt: !67)
!69 = !DILocation(line: 28, column: 9, scope: !31)
!70 = !DILocation(line: 28, column: 2, scope: !31)
!71 = !DILocation(line: 29, column: 13, scope: !72)
!72 = distinct !DILexicalBlock(scope: !31, file: !1, line: 28, column: 11)
!73 = !DILocation(line: 29, column: 28, scope: !72)
!74 = !DILocation(line: 30, column: 13, scope: !72)
!75 = !DILocation(line: 30, column: 29, scope: !72)
!76 = !DILocation(line: 31, column: 13, scope: !72)
!77 = !DILocation(line: 32, column: 13, scope: !72)
!78 = !DILocation(line: 32, column: 31, scope: !72)
!79 = !DILocation(line: 33, column: 11, scope: !72)
!80 = !DILocation(line: 34, column: 2, scope: !72)
!81 = !DILocation(line: 35, column: 2, scope: !31)
!82 = !DILocation(line: 36, column: 2, scope: !31)
