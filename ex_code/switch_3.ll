; ModuleID = 'switch_3.c'
source_filename = "switch_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"0\0A\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"\0Aone\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"\0Atwo\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"2\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"3\0A\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"4\0A\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"5\0A\00", align 1
@.str.11 = private unnamed_addr constant [9 x i8] c"default\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %c, metadata !11, metadata !12), !dbg !13
  %call = call i32 @getchar(), !dbg !14
  store i32 %call, i32* %c, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %b, metadata !15, metadata !12), !dbg !16
  %call1 = call i32 @getchar(), !dbg !17
  store i32 %call1, i32* %b, align 4, !dbg !16
  %0 = load i32, i32* %c, align 4, !dbg !18
  switch i32 %0, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %sw.bb16
    i32 3, label %sw.bb18
    i32 4, label %sw.bb20
    i32 5, label %sw.bb22
  ], !dbg !19

sw.bb:                                            ; preds = %entry
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0)), !dbg !20
  br label %sw.epilog25, !dbg !22

sw.bb3:                                           ; preds = %entry
  %1 = load i32, i32* %b, align 4, !dbg !23
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb4
    i32 1, label %sw.bb6
    i32 2, label %sw.bb8
    i32 3, label %sw.bb10
    i32 4, label %sw.bb12
    i32 8, label %sw.bb14
  ], !dbg !24

sw.bb4:                                           ; preds = %sw.bb3
  %call5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)), !dbg !25
  br label %sw.epilog, !dbg !27

sw.bb6:                                           ; preds = %sw.bb3
  %call7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0)), !dbg !28
  br label %sw.epilog, !dbg !29

sw.bb8:                                           ; preds = %sw.bb3
  %call9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0)), !dbg !30
  br label %sw.epilog, !dbg !31

sw.bb10:                                          ; preds = %sw.bb3
  %call11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0)), !dbg !32
  br label %sw.epilog, !dbg !33

sw.bb12:                                          ; preds = %sw.bb3
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0)), !dbg !34
  br label %sw.epilog, !dbg !35

sw.bb14:                                          ; preds = %sw.bb3
  %call15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)), !dbg !36
  br label %sw.epilog, !dbg !37

sw.epilog:                                        ; preds = %sw.bb3, %sw.bb14, %sw.bb12, %sw.bb10, %sw.bb8, %sw.bb6, %sw.bb4
  br label %sw.epilog25, !dbg !38

sw.bb16:                                          ; preds = %entry
  %call17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0)), !dbg !39
  br label %sw.epilog25, !dbg !40

sw.bb18:                                          ; preds = %entry
  %call19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i32 0, i32 0)), !dbg !41
  br label %sw.epilog25, !dbg !42

sw.bb20:                                          ; preds = %entry
  %call21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i32 0, i32 0)), !dbg !43
  br label %sw.epilog25, !dbg !44

sw.bb22:                                          ; preds = %entry
  %call23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0)), !dbg !45
  br label %sw.epilog25, !dbg !46

sw.default:                                       ; preds = %entry
  %call24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.11, i32 0, i32 0)), !dbg !47
  br label %sw.epilog25, !dbg !48

sw.epilog25:                                      ; preds = %sw.default, %sw.bb22, %sw.bb20, %sw.bb18, %sw.bb16, %sw.epilog, %sw.bb
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @getchar() #2

declare i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 5.0.0 (tags/RELEASE_500/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "switch_3.c", directory: "/home/emma/cfg_2019/cfg_2019/ex_code")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 5.0.0 (tags/RELEASE_500/final)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 2, type: !8, isLocal: false, isDefinition: true, scopeLine: 2, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 3, type: !10)
!12 = !DIExpression()
!13 = !DILocation(line: 3, column: 6, scope: !7)
!14 = !DILocation(line: 3, column: 10, scope: !7)
!15 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 4, type: !10)
!16 = !DILocation(line: 4, column: 6, scope: !7)
!17 = !DILocation(line: 4, column: 10, scope: !7)
!18 = !DILocation(line: 5, column: 9, scope: !7)
!19 = !DILocation(line: 5, column: 2, scope: !7)
!20 = !DILocation(line: 6, column: 10, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 11)
!22 = !DILocation(line: 6, column: 24, scope: !21)
!23 = !DILocation(line: 8, column: 10, scope: !21)
!24 = !DILocation(line: 8, column: 3, scope: !21)
!25 = !DILocation(line: 9, column: 12, scope: !26)
!26 = distinct !DILexicalBlock(scope: !21, file: !1, line: 8, column: 12)
!27 = !DILocation(line: 9, column: 27, scope: !26)
!28 = !DILocation(line: 10, column: 12, scope: !26)
!29 = !DILocation(line: 10, column: 28, scope: !26)
!30 = !DILocation(line: 11, column: 12, scope: !26)
!31 = !DILocation(line: 11, column: 28, scope: !26)
!32 = !DILocation(line: 12, column: 12, scope: !26)
!33 = !DILocation(line: 12, column: 24, scope: !26)
!34 = !DILocation(line: 13, column: 12, scope: !26)
!35 = !DILocation(line: 13, column: 24, scope: !26)
!36 = !DILocation(line: 14, column: 12, scope: !26)
!37 = !DILocation(line: 14, column: 24, scope: !26)
!38 = !DILocation(line: 15, column: 4, scope: !21)
!39 = !DILocation(line: 17, column: 3, scope: !21)
!40 = !DILocation(line: 17, column: 17, scope: !21)
!41 = !DILocation(line: 19, column: 3, scope: !21)
!42 = !DILocation(line: 19, column: 17, scope: !21)
!43 = !DILocation(line: 21, column: 3, scope: !21)
!44 = !DILocation(line: 21, column: 17, scope: !21)
!45 = !DILocation(line: 23, column: 3, scope: !21)
!46 = !DILocation(line: 23, column: 17, scope: !21)
!47 = !DILocation(line: 24, column: 11, scope: !21)
!48 = !DILocation(line: 25, column: 2, scope: !21)
!49 = !DILocation(line: 26, column: 2, scope: !7)
