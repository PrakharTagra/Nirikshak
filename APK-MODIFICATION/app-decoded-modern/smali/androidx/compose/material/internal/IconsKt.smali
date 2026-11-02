.class public final Landroidx/compose/material/internal/IconsKt;
.super Ljava/lang/Object;
.source "Icons.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nIcons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Icons.kt\nandroidx/compose/material/internal/IconsKt\n+ 2 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 3 ImageVector.kt\nandroidx/compose/ui/graphics/vector/ImageVectorKt\n+ 4 Vector.kt\nandroidx/compose/ui/graphics/vector/VectorKt\n*L\n1#1,87:1\n123#2:88\n123#2:89\n640#3,2:90\n653#3,2:92\n655#3,11:98\n653#3,13:109\n73#4,4:94\n*S KotlinDebug\n*F\n+ 1 Icons.kt\nandroidx/compose/material/internal/IconsKt\n*L\n59#1:88\n60#1:89\n73#1:90,2\n73#1:92,2\n73#1:98,11\n73#1:109,13\n73#1:94,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u001a*\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0017\u0010\u0004\u001a\u0013\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u0005\u00a2\u0006\u0002\u0008\u0007H\u0082\u0008\u001aK\u0010\u0008\u001a\u00020\u0006*\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r2\u0017\u0010\u000e\u001a\u0013\u0012\u0004\u0012\u00020\u000f\u0012\u0004\u0012\u00020\u00100\u0005\u00a2\u0006\u0002\u0008\u0007H\u0082\u0008\u00a2\u0006\u0004\u0008\u0011\u0010\u0012\"\u000e\u0010\u0013\u001a\u00020\nX\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0014"
    }
    d2 = {
        "materialIcon",
        "Landroidx/compose/ui/graphics/vector/ImageVector;",
        "name",
        "",
        "block",
        "Lkotlin/Function1;",
        "Landroidx/compose/ui/graphics/vector/ImageVector$Builder;",
        "Lkotlin/ExtensionFunctionType;",
        "materialPath",
        "fillAlpha",
        "",
        "strokeAlpha",
        "pathFillType",
        "Landroidx/compose/ui/graphics/PathFillType;",
        "pathBuilder",
        "Landroidx/compose/ui/graphics/vector/PathBuilder;",
        "",
        "materialPath-YwgOQQI",
        "(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;FFILkotlin/jvm/functions/Function1;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;",
        "MaterialIconDimension",
        "material"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final MaterialIconDimension:F = 24.0f


# direct methods
.method private static final materialIcon(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Landroidx/compose/ui/graphics/vector/ImageVector;
    .locals 13
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "block"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/ui/graphics/vector/ImageVector$Builder;",
            "Landroidx/compose/ui/graphics/vector/ImageVector$Builder;",
            ">;)",
            "Landroidx/compose/ui/graphics/vector/ImageVector;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 64
    .local v0, "$i$f$materialIcon":I
    nop

    .line 57
    new-instance v1, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    .line 58
    nop

    .line 59
    const/high16 v2, 0x41c00000    # 24.0f

    .local v2, "$this$dp$iv":F
    const/4 v3, 0x0

    .line 88
    .local v3, "$i$f$getDp":I
    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v3

    .line 60
    .end local v2    # "$this$dp$iv":F
    .end local v3    # "$i$f$getDp":I
    const/high16 v2, 0x41c00000    # 24.0f

    .restart local v2    # "$this$dp$iv":F
    const/4 v4, 0x0

    .line 89
    .local v4, "$i$f$getDp":I
    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 61
    .end local v2    # "$this$dp$iv":F
    .end local v4    # "$i$f$getDp":I
    nop

    .line 62
    nop

    .line 57
    const/16 v11, 0xe0

    const/4 v12, 0x0

    const/high16 v5, 0x41c00000    # 24.0f

    const/high16 v6, 0x41c00000    # 24.0f

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v2, p0

    .end local p0    # "name":Ljava/lang/String;
    .local v2, "name":Ljava/lang/String;
    invoke-direct/range {v1 .. v12}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;-><init>(Ljava/lang/String;FFFFJIZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 64
    invoke-interface {p1, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    .line 65
    invoke-virtual {p0}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;->build()Landroidx/compose/ui/graphics/vector/ImageVector;

    move-result-object p0

    return-object p0
.end method

.method private static final materialPath-YwgOQQI(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;FFILkotlin/jvm/functions/Function1;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .locals 22
    .param p0, "$this$materialPath_u2dYwgOQQI"    # Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .param p1, "fillAlpha"    # F
    .param p2, "strokeAlpha"    # F
    .param p3, "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0"    # I
    .param p4, "pathBuilder"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/graphics/vector/ImageVector$Builder;",
            "FFI",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/ui/graphics/vector/PathBuilder;",
            "Lkotlin/Unit;",
            ">;)",
            "Landroidx/compose/ui/graphics/vector/ImageVector$Builder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 73
    .local v0, "$i$f$materialPath-YwgOQQI":I
    nop

    .line 74
    new-instance v1, Landroidx/compose/ui/graphics/SolidColor;

    sget-object v2, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/graphics/Color$Companion;->getBlack-0d7_KjU()J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Landroidx/compose/ui/graphics/SolidColor;-><init>(JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v1, Landroidx/compose/ui/graphics/Brush;

    .line 75
    nop

    .line 76
    nop

    .line 77
    nop

    .line 78
    nop

    .line 79
    sget-object v2, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v2}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v2

    .line 80
    sget-object v3, Landroidx/compose/ui/graphics/StrokeJoin;->Companion:Landroidx/compose/ui/graphics/StrokeJoin$Companion;

    invoke-virtual {v3}, Landroidx/compose/ui/graphics/StrokeJoin$Companion;->getBevel-LxFBmk8()I

    move-result v3

    .line 81
    nop

    .line 82
    nop

    .line 73
    move-object/from16 v5, p0

    .local v5, "$this$path_u2dR_LF_u2d3I_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    const/high16 v13, 0x3f800000    # 1.0f

    move/from16 v16, v13

    .local v16, "strokeLineMiter$iv":F
    move v15, v3

    .local v13, "strokeLineWidth$iv":F
    .local v15, "strokeLineJoin$iv":I
    move v14, v2

    .local v14, "strokeLineCap$iv":I
    move-object v9, v1

    .local v9, "fill$iv":Landroidx/compose/ui/graphics/Brush;
    move/from16 v10, p1

    .local v10, "fillAlpha$iv":F
    move/from16 v12, p2

    .local v12, "strokeAlpha$iv":F
    move-object v11, v4

    .local v11, "stroke$iv":Landroidx/compose/ui/graphics/Brush;
    move/from16 v7, p3

    .line 90
    .local v7, "pathFillType$iv":I
    nop

    .line 91
    const-string v8, ""

    .line 90
    .local v8, "name$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 92
    .local v1, "$i$f$path-R_LF-3I":I
    nop

    .line 93
    const/4 v2, 0x0

    .line 94
    .local v2, "$i$f$PathData":I
    new-instance v3, Landroidx/compose/ui/graphics/vector/PathBuilder;

    invoke-direct {v3}, Landroidx/compose/ui/graphics/vector/PathBuilder;-><init>()V

    .local v3, "$this$PathData_u24lambda_u240$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    const/4 v4, 0x0

    .line 95
    .local v4, "$i$a$-with-VectorKt$PathData$1$iv$iv":I
    move-object/from16 v6, p4

    invoke-interface {v6, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {v3}, Landroidx/compose/ui/graphics/vector/PathBuilder;->getNodes()Ljava/util/List;

    move-result-object v3

    .line 94
    .end local v3    # "$this$PathData_u24lambda_u240$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    .end local v4    # "$i$a$-with-VectorKt$PathData$1$iv$iv":I
    nop

    .line 97
    nop

    .line 98
    .end local v2    # "$i$f$PathData":I
    nop

    .line 99
    nop

    .line 100
    nop

    .line 101
    nop

    .line 102
    nop

    .line 103
    nop

    .line 104
    nop

    .line 105
    nop

    .line 106
    nop

    .line 107
    nop

    .line 92
    const/16 v20, 0x3800

    const/16 v21, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object v6, v3

    invoke-static/range {v5 .. v21}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;->addPath-oIyEayM$default(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;Ljava/util/List;ILjava/lang/String;Landroidx/compose/ui/graphics/Brush;FLandroidx/compose/ui/graphics/Brush;FFIIFFFFILjava/lang/Object;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    move-result-object v2

    .line 108
    nop

    .line 84
    .end local v1    # "$i$f$path-R_LF-3I":I
    .end local v5    # "$this$path_u2dR_LF_u2d3I_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .end local v7    # "pathFillType$iv":I
    .end local v8    # "name$iv":Ljava/lang/String;
    .end local v9    # "fill$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v10    # "fillAlpha$iv":F
    .end local v11    # "stroke$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v12    # "strokeAlpha$iv":F
    .end local v13    # "strokeLineWidth$iv":F
    .end local v14    # "strokeLineCap$iv":I
    .end local v15    # "strokeLineJoin$iv":I
    .end local v16    # "strokeLineMiter$iv":F
    return-object v2
.end method

.method static synthetic materialPath-YwgOQQI$default(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;FFILkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .locals 25
    .param p0, "$this$materialPath_u2dYwgOQQI_u24default"    # Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .param p1, "fillAlpha"    # F
    .param p2, "strokeAlpha"    # F
    .param p3, "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0"    # I
    .param p4, "pathBuilder"    # Lkotlin/jvm/functions/Function1;

    .line 67
    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    .line 68
    const/high16 v0, 0x3f800000    # 1.0f

    .end local p1    # "fillAlpha":F
    .local v0, "fillAlpha":F
    goto :goto_0

    .line 67
    .end local v0    # "fillAlpha":F
    .restart local p1    # "fillAlpha":F
    :cond_0
    move/from16 v0, p1

    .end local p1    # "fillAlpha":F
    .restart local v0    # "fillAlpha":F
    :goto_0
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_1

    .line 69
    const/high16 v1, 0x3f800000    # 1.0f

    .end local p2    # "strokeAlpha":F
    .local v1, "strokeAlpha":F
    goto :goto_1

    .line 67
    .end local v1    # "strokeAlpha":F
    .restart local p2    # "strokeAlpha":F
    :cond_1
    move/from16 v1, p2

    .end local p2    # "strokeAlpha":F
    .restart local v1    # "strokeAlpha":F
    :goto_1
    and-int/lit8 v2, p5, 0x4

    if-eqz v2, :cond_2

    .line 70
    invoke-static {}, Landroidx/compose/ui/graphics/vector/VectorKt;->getDefaultFillType()I

    move-result v2

    .end local p3    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    .local v2, "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    goto :goto_2

    .line 67
    .end local v2    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    .restart local p3    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    :cond_2
    move/from16 v2, p3

    .end local p3    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    .restart local v2    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0":I
    :goto_2
    const/4 v3, 0x0

    .line 73
    .local v3, "$i$f$materialPath-YwgOQQI":I
    nop

    .line 74
    new-instance v4, Landroidx/compose/ui/graphics/SolidColor;

    sget-object v5, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/graphics/Color$Companion;->getBlack-0d7_KjU()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-direct {v4, v5, v6, v7}, Landroidx/compose/ui/graphics/SolidColor;-><init>(JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v4, Landroidx/compose/ui/graphics/Brush;

    .line 75
    nop

    .line 76
    nop

    .line 77
    nop

    .line 78
    nop

    .line 79
    sget-object v5, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v5}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v5

    .line 80
    sget-object v6, Landroidx/compose/ui/graphics/StrokeJoin;->Companion:Landroidx/compose/ui/graphics/StrokeJoin$Companion;

    invoke-virtual {v6}, Landroidx/compose/ui/graphics/StrokeJoin$Companion;->getBevel-LxFBmk8()I

    move-result v6

    .line 81
    nop

    .line 82
    nop

    .line 73
    move-object/from16 v8, p0

    .local v8, "$this$path_u2dR_LF_u2d3I_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    const/high16 v16, 0x3f800000    # 1.0f

    move/from16 v19, v16

    .local v19, "strokeLineMiter$iv":F
    move/from16 v18, v6

    .local v16, "strokeLineWidth$iv":F
    .local v18, "strokeLineJoin$iv":I
    move/from16 v17, v5

    .local v17, "strokeLineCap$iv":I
    move-object v12, v4

    .local v12, "fill$iv":Landroidx/compose/ui/graphics/Brush;
    move v13, v0

    .local v13, "fillAlpha$iv":F
    move v15, v1

    .local v15, "strokeAlpha$iv":F
    move-object v14, v7

    .local v14, "stroke$iv":Landroidx/compose/ui/graphics/Brush;
    move v10, v2

    .line 90
    .local v10, "pathFillType$iv":I
    nop

    .line 91
    const-string v11, ""

    .line 90
    .local v11, "name$iv":Ljava/lang/String;
    const/4 v4, 0x0

    .line 109
    .local v4, "$i$f$path-R_LF-3I":I
    nop

    .line 110
    const/4 v5, 0x0

    .line 94
    .local v5, "$i$f$PathData":I
    new-instance v6, Landroidx/compose/ui/graphics/vector/PathBuilder;

    invoke-direct {v6}, Landroidx/compose/ui/graphics/vector/PathBuilder;-><init>()V

    .local v6, "$this$PathData_u24lambda_u240$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    const/4 v7, 0x0

    .line 95
    .local v7, "$i$a$-with-VectorKt$PathData$1$iv$iv":I
    move-object/from16 v9, p4

    invoke-interface {v9, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    invoke-virtual {v6}, Landroidx/compose/ui/graphics/vector/PathBuilder;->getNodes()Ljava/util/List;

    move-result-object v6

    .line 94
    .end local v6    # "$this$PathData_u24lambda_u240$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    .end local v7    # "$i$a$-with-VectorKt$PathData$1$iv$iv":I
    nop

    .line 97
    nop

    .line 111
    .end local v5    # "$i$f$PathData":I
    nop

    .line 112
    nop

    .line 113
    nop

    .line 114
    nop

    .line 115
    nop

    .line 116
    nop

    .line 117
    nop

    .line 118
    nop

    .line 119
    nop

    .line 120
    nop

    .line 109
    const/16 v23, 0x3800

    const/16 v24, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object v9, v6

    invoke-static/range {v8 .. v24}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;->addPath-oIyEayM$default(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;Ljava/util/List;ILjava/lang/String;Landroidx/compose/ui/graphics/Brush;FLandroidx/compose/ui/graphics/Brush;FFIIFFFFILjava/lang/Object;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    move-result-object v5

    .line 121
    nop

    .line 84
    .end local v4    # "$i$f$path-R_LF-3I":I
    .end local v8    # "$this$path_u2dR_LF_u2d3I_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .end local v10    # "pathFillType$iv":I
    .end local v11    # "name$iv":Ljava/lang/String;
    .end local v12    # "fill$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v13    # "fillAlpha$iv":F
    .end local v14    # "stroke$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v15    # "strokeAlpha$iv":F
    .end local v16    # "strokeLineWidth$iv":F
    .end local v17    # "strokeLineCap$iv":I
    .end local v18    # "strokeLineJoin$iv":I
    .end local v19    # "strokeLineMiter$iv":F
    return-object v5
.end method
