.class public final Landroidx/compose/material/internal/Icons$Filled;
.super Ljava/lang/Object;
.source "Icons.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/compose/material/internal/Icons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Filled"
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nIcons.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Icons.kt\nandroidx/compose/material/internal/Icons$Filled\n+ 2 Icons.kt\nandroidx/compose/material/internal/IconsKt\n+ 3 Dp.kt\nandroidx/compose/ui/unit/DpKt\n+ 4 ImageVector.kt\nandroidx/compose/ui/graphics/vector/ImageVectorKt\n+ 5 Vector.kt\nandroidx/compose/ui/graphics/vector/VectorKt\n*L\n1#1,87:1\n64#2:88\n57#2,3:89\n60#2,3:93\n67#2,16:96\n84#2:131\n65#2:132\n123#3:92\n640#4,2:112\n653#4,2:114\n655#4,11:120\n73#5,4:116\n*S KotlinDebug\n*F\n+ 1 Icons.kt\nandroidx/compose/material/internal/Icons$Filled\n*L\n38#1:88\n38#1:89,3\n38#1:93,3\n39#1:96,16\n39#1:131\n38#1:132\n38#1:92\n39#1:112,2\n39#1:114,2\n39#1:120,11\n39#1:116,4\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c1\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0014\u0010\u0004\u001a\u00020\u00058@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0006\u0010\u0007R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Landroidx/compose/material/internal/Icons$Filled;",
        "",
        "<init>",
        "()V",
        "ArrowDropDown",
        "Landroidx/compose/ui/graphics/vector/ImageVector;",
        "getArrowDropDown$material",
        "()Landroidx/compose/ui/graphics/vector/ImageVector;",
        "_arrowDropDown",
        "material"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final INSTANCE:Landroidx/compose/material/internal/Icons$Filled;

.field private static _arrowDropDown:Landroidx/compose/ui/graphics/vector/ImageVector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/compose/material/internal/Icons$Filled;

    invoke-direct {v0}, Landroidx/compose/material/internal/Icons$Filled;-><init>()V

    sput-object v0, Landroidx/compose/material/internal/Icons$Filled;->INSTANCE:Landroidx/compose/material/internal/Icons$Filled;

    const/16 v0, 0x8

    sput v0, Landroidx/compose/material/internal/Icons$Filled;->$stable:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final getArrowDropDown$material()Landroidx/compose/ui/graphics/vector/ImageVector;
    .locals 32

    .line 34
    sget-object v0, Landroidx/compose/material/internal/Icons$Filled;->_arrowDropDown:Landroidx/compose/ui/graphics/vector/ImageVector;

    if-eqz v0, :cond_0

    .line 35
    sget-object v0, Landroidx/compose/material/internal/Icons$Filled;->_arrowDropDown:Landroidx/compose/ui/graphics/vector/ImageVector;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0

    .line 37
    :cond_0
    nop

    .line 38
    const-string v2, "Filled.ArrowDropDown"

    .local v2, "name$iv":Ljava/lang/String;
    const/4 v0, 0x0

    .line 88
    .local v0, "$i$f$materialIcon":I
    nop

    .line 89
    new-instance v1, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    .line 90
    nop

    .line 91
    const/high16 v3, 0x41c00000    # 24.0f

    .local v3, "$this$dp$iv$iv":F
    const/4 v4, 0x0

    .line 92
    .local v4, "$i$f$getDp":I
    invoke-static {v3}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v3

    .line 93
    .end local v3    # "$this$dp$iv$iv":F
    .end local v4    # "$i$f$getDp":I
    const/high16 v4, 0x41c00000    # 24.0f

    .local v4, "$this$dp$iv$iv":F
    const/4 v5, 0x0

    .line 92
    .local v5, "$i$f$getDp":I
    invoke-static {v4}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v4

    .line 94
    .end local v4    # "$this$dp$iv$iv":F
    .end local v5    # "$i$f$getDp":I
    nop

    .line 95
    nop

    .line 89
    const/16 v11, 0xe0

    const/4 v12, 0x0

    const/high16 v5, 0x41c00000    # 24.0f

    const/high16 v6, 0x41c00000    # 24.0f

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v1 .. v12}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;-><init>(Ljava/lang/String;FFFFJIZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 88
    nop

    .local v1, "$this$_get_ArrowDropDown__u24lambda_u240":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    const/4 v3, 0x0

    .line 39
    .local v3, "$i$a$-materialIcon-Icons$Filled$ArrowDropDown$1":I
    move-object v4, v1

    .line 96
    .local v4, "$this$materialPath_u2dYwgOQQI_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    nop

    .line 97
    const/high16 v5, 0x3f800000    # 1.0f

    .line 96
    .local v5, "fillAlpha$iv":F
    nop

    .line 98
    const/high16 v6, 0x3f800000    # 1.0f

    .line 96
    .local v6, "strokeAlpha$iv":F
    nop

    .line 99
    invoke-static {}, Landroidx/compose/ui/graphics/vector/VectorKt;->getDefaultFillType()I

    move-result v7

    .line 96
    .local v7, "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0$iv":I
    const/4 v8, 0x0

    .line 102
    .local v8, "$i$f$materialPath-YwgOQQI":I
    nop

    .line 103
    new-instance v9, Landroidx/compose/ui/graphics/SolidColor;

    sget-object v10, Landroidx/compose/ui/graphics/Color;->Companion:Landroidx/compose/ui/graphics/Color$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/graphics/Color$Companion;->getBlack-0d7_KjU()J

    move-result-wide v10

    invoke-direct {v9, v10, v11, v12}, Landroidx/compose/ui/graphics/SolidColor;-><init>(JLkotlin/jvm/internal/DefaultConstructorMarker;)V

    check-cast v9, Landroidx/compose/ui/graphics/Brush;

    .line 104
    nop

    .line 105
    nop

    .line 106
    nop

    .line 107
    nop

    .line 108
    sget-object v10, Landroidx/compose/ui/graphics/StrokeCap;->Companion:Landroidx/compose/ui/graphics/StrokeCap$Companion;

    invoke-virtual {v10}, Landroidx/compose/ui/graphics/StrokeCap$Companion;->getButt-KaPHkGw()I

    move-result v10

    .line 109
    sget-object v11, Landroidx/compose/ui/graphics/StrokeJoin;->Companion:Landroidx/compose/ui/graphics/StrokeJoin$Companion;

    invoke-virtual {v11}, Landroidx/compose/ui/graphics/StrokeJoin$Companion;->getBevel-LxFBmk8()I

    move-result v11

    .line 110
    nop

    .line 111
    nop

    .line 102
    move-object/from16 v19, v12

    .local v19, "stroke$iv$iv":Landroidx/compose/ui/graphics/Brush;
    move/from16 v18, v5

    .local v18, "fillAlpha$iv$iv":F
    move-object v13, v4

    .local v13, "$this$path_u2dR_LF_u2d3I_u24default$iv$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    move-object/from16 v17, v9

    .local v17, "fill$iv$iv":Landroidx/compose/ui/graphics/Brush;
    move/from16 v20, v6

    .local v20, "strokeAlpha$iv$iv":F
    const/high16 v21, 0x3f800000    # 1.0f

    move/from16 v24, v21

    .local v21, "strokeLineWidth$iv$iv":F
    move/from16 v23, v11

    .local v23, "strokeLineJoin$iv$iv":I
    move/from16 v22, v10

    .local v22, "strokeLineCap$iv$iv":I
    move v15, v7

    .line 112
    .local v15, "pathFillType$iv$iv":I
    .local v24, "strokeLineMiter$iv$iv":F
    nop

    .line 113
    const-string v16, ""

    .line 112
    .local v16, "name$iv$iv":Ljava/lang/String;
    const/4 v9, 0x0

    .line 114
    .local v9, "$i$f$path-R_LF-3I":I
    nop

    .line 115
    const/4 v10, 0x0

    .line 116
    .local v10, "$i$f$PathData":I
    new-instance v11, Landroidx/compose/ui/graphics/vector/PathBuilder;

    invoke-direct {v11}, Landroidx/compose/ui/graphics/vector/PathBuilder;-><init>()V

    .local v11, "$this$PathData_u24lambda_u240$iv$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    const/4 v12, 0x0

    .line 117
    .local v12, "$i$a$-with-VectorKt$PathData$1$iv$iv$iv":I
    move-object v14, v11

    .local v14, "$this$_get_ArrowDropDown__u24lambda_u240_u240":Landroidx/compose/ui/graphics/vector/PathBuilder;
    const/16 v25, 0x0

    .line 40
    .local v25, "$i$a$-materialPath-YwgOQQI$default-Icons$Filled$ArrowDropDown$1$1":I
    move/from16 v30, v0

    .end local v0    # "$i$f$materialIcon":I
    .local v30, "$i$f$materialIcon":I
    const/high16 v0, 0x40e00000    # 7.0f

    move-object/from16 v31, v1

    .end local v1    # "$this$_get_ArrowDropDown__u24lambda_u240":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .local v31, "$this$_get_ArrowDropDown__u24lambda_u240":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v14, v0, v1}, Landroidx/compose/ui/graphics/vector/PathBuilder;->moveTo(FF)Landroidx/compose/ui/graphics/vector/PathBuilder;

    .line 41
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-virtual {v14, v0, v0}, Landroidx/compose/ui/graphics/vector/PathBuilder;->lineToRelative(FF)Landroidx/compose/ui/graphics/vector/PathBuilder;

    .line 42
    const/high16 v1, -0x3f600000    # -5.0f

    invoke-virtual {v14, v0, v1}, Landroidx/compose/ui/graphics/vector/PathBuilder;->lineToRelative(FF)Landroidx/compose/ui/graphics/vector/PathBuilder;

    .line 43
    invoke-virtual {v14}, Landroidx/compose/ui/graphics/vector/PathBuilder;->close()Landroidx/compose/ui/graphics/vector/PathBuilder;

    .line 44
    nop

    .line 117
    .end local v14    # "$this$_get_ArrowDropDown__u24lambda_u240_u240":Landroidx/compose/ui/graphics/vector/PathBuilder;
    .end local v25    # "$i$a$-materialPath-YwgOQQI$default-Icons$Filled$ArrowDropDown$1$1":I
    nop

    .line 118
    invoke-virtual {v11}, Landroidx/compose/ui/graphics/vector/PathBuilder;->getNodes()Ljava/util/List;

    move-result-object v14

    .line 116
    .end local v11    # "$this$PathData_u24lambda_u240$iv$iv$iv":Landroidx/compose/ui/graphics/vector/PathBuilder;
    .end local v12    # "$i$a$-with-VectorKt$PathData$1$iv$iv$iv":I
    nop

    .line 119
    nop

    .line 120
    .end local v10    # "$i$f$PathData":I
    nop

    .line 121
    nop

    .line 122
    nop

    .line 123
    nop

    .line 124
    nop

    .line 125
    nop

    .line 126
    nop

    .line 127
    nop

    .line 128
    nop

    .line 129
    nop

    .line 114
    const/16 v28, 0x3800

    const/16 v29, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-static/range {v13 .. v29}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;->addPath-oIyEayM$default(Landroidx/compose/ui/graphics/vector/ImageVector$Builder;Ljava/util/List;ILjava/lang/String;Landroidx/compose/ui/graphics/Brush;FLandroidx/compose/ui/graphics/Brush;FFIIFFFFILjava/lang/Object;)Landroidx/compose/ui/graphics/vector/ImageVector$Builder;

    move-result-object v0

    .line 130
    nop

    .line 131
    .end local v9    # "$i$f$path-R_LF-3I":I
    .end local v13    # "$this$path_u2dR_LF_u2d3I_u24default$iv$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .end local v15    # "pathFillType$iv$iv":I
    .end local v16    # "name$iv$iv":Ljava/lang/String;
    .end local v17    # "fill$iv$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v18    # "fillAlpha$iv$iv":F
    .end local v19    # "stroke$iv$iv":Landroidx/compose/ui/graphics/Brush;
    .end local v20    # "strokeAlpha$iv$iv":F
    .end local v21    # "strokeLineWidth$iv$iv":F
    .end local v22    # "strokeLineCap$iv$iv":I
    .end local v23    # "strokeLineJoin$iv$iv":I
    .end local v24    # "strokeLineMiter$iv$iv":F
    nop

    .line 44
    .end local v4    # "$this$materialPath_u2dYwgOQQI_u24default$iv":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    .end local v5    # "fillAlpha$iv":F
    .end local v6    # "strokeAlpha$iv":F
    .end local v7    # "$v$c$androidx-compose-ui-graphics-PathFillType$-pathFillType$0$iv":I
    .end local v8    # "$i$f$materialPath-YwgOQQI":I
    nop

    .line 88
    .end local v3    # "$i$a$-materialIcon-Icons$Filled$ArrowDropDown$1":I
    .end local v31    # "$this$_get_ArrowDropDown__u24lambda_u240":Landroidx/compose/ui/graphics/vector/ImageVector$Builder;
    nop

    .line 132
    invoke-virtual {v0}, Landroidx/compose/ui/graphics/vector/ImageVector$Builder;->build()Landroidx/compose/ui/graphics/vector/ImageVector;

    move-result-object v0

    .line 37
    .end local v2    # "name$iv":Ljava/lang/String;
    .end local v30    # "$i$f$materialIcon":I
    sput-object v0, Landroidx/compose/material/internal/Icons$Filled;->_arrowDropDown:Landroidx/compose/ui/graphics/vector/ImageVector;

    .line 46
    sget-object v0, Landroidx/compose/material/internal/Icons$Filled;->_arrowDropDown:Landroidx/compose/ui/graphics/vector/ImageVector;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    return-object v0
.end method
