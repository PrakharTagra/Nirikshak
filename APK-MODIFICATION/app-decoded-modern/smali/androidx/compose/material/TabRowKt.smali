.class public final Landroidx/compose/material/TabRowKt;
.super Ljava/lang/Object;
.source "TabRow.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTabRow.kt\nKotlin\n*S Kotlin\n*F\n+ 1 TabRow.kt\nandroidx/compose/material/TabRowKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n+ 4 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 5 Dp.kt\nandroidx/compose/ui/unit/Dp\n+ 6 Effects.kt\nandroidx/compose/runtime/EffectsKt\n+ 7 Effects.kt\nandroidx/compose/runtime/EffectsKt$rememberCoroutineScope$1\n+ 8 Dp.kt\nandroidx/compose/ui/unit/DpKt\n*L\n1#1,491:1\n1128#2,6:492\n1128#2,3:548\n1131#2,3:552\n1128#2,6:555\n1128#2,6:561\n150#3,3:498\n34#3,6:501\n153#3:507\n168#3,13:508\n70#3,6:523\n34#3,6:529\n34#3,6:535\n150#3,3:567\n34#3,6:570\n153#3:576\n34#3,6:577\n34#3,6:583\n34#3,6:589\n34#3,6:595\n1#4:521\n68#5:522\n599#6:541\n596#6,6:542\n597#7:551\n113#8:601\n*S KotlinDebug\n*F\n+ 1 TabRow.kt\nandroidx/compose/material/TabRowKt\n*L\n152#1:492,6\n240#1:548,3\n240#1:552,3\n242#1:555,6\n251#1:561,6\n158#1:498,3\n158#1:501,6\n158#1:507\n162#1:508,13\n168#1:523,6\n172#1:529,6\n178#1:535,6\n257#1:567,3\n257#1:570,6\n257#1:576\n261#1:577,6\n271#1:583,6\n279#1:589,6\n294#1:595,6\n165#1:522\n240#1:541\n240#1:542,6\n240#1:551\n486#1:601\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000T\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0007\n\u0000\u001a\u009c\u0001\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u000723\u0008\u0002\u0010\t\u001a-\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\u0012\u0004\u0012\u00020\u00010\n\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u00112\u0018\u0008\u0002\u0010\u0012\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u00112\u0016\u0010\u0014\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u0011H\u0007\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u001a\u00a6\u0001\u0010\u0017\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0018\u001a\u00020\u001923\u0008\u0002\u0010\t\u001a-\u0012\u0019\u0012\u0017\u0012\u0004\u0012\u00020\u000c0\u000b\u00a2\u0006\u000c\u0008\r\u0012\u0008\u0008\u000e\u0012\u0004\u0008\u0008(\u000f\u0012\u0004\u0012\u00020\u00010\n\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u00112\u0018\u0008\u0002\u0010\u0012\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u00112\u0016\u0010\u0014\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0013\u00a2\u0006\u0002\u0008\u0010\u00a2\u0006\u0002\u0008\u0011H\u0007\u00a2\u0006\u0004\u0008\u001a\u0010\u001b\"\u0010\u0010\u001c\u001a\u00020\u0019X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u001d\"\u0014\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020 0\u001fX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006!"
    }
    d2 = {
        "TabRow",
        "",
        "selectedTabIndex",
        "",
        "modifier",
        "Landroidx/compose/ui/Modifier;",
        "backgroundColor",
        "Landroidx/compose/ui/graphics/Color;",
        "contentColor",
        "indicator",
        "Lkotlin/Function1;",
        "",
        "Landroidx/compose/material/TabPosition;",
        "Lkotlin/ParameterName;",
        "name",
        "tabPositions",
        "Landroidx/compose/runtime/Composable;",
        "Landroidx/compose/ui/UiComposable;",
        "divider",
        "Lkotlin/Function0;",
        "tabs",
        "TabRow-pAZo6Ak",
        "(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V",
        "ScrollableTabRow",
        "edgePadding",
        "Landroidx/compose/ui/unit/Dp;",
        "ScrollableTabRow-sKfQg0A",
        "(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V",
        "ScrollableTabRowMinimumTabWidth",
        "F",
        "ScrollableTabRowScrollSpec",
        "Landroidx/compose/animation/core/AnimationSpec;",
        "",
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
.field private static final ScrollableTabRowMinimumTabWidth:F

.field private static final ScrollableTabRowScrollSpec:Landroidx/compose/animation/core/AnimationSpec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/animation/core/AnimationSpec<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$192yJeakcI9VI_xMCc0xB1YyKLY(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$0(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$HxSTrGyG05nPkXOoE50Ar5fNbmQ(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 0

    invoke-static/range {p0 .. p7}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$1$1$0(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$KQJsO3ll3VNedJZtpBrUY2XvYt0(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$1(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Lkt-3VhlFIWAmlcTXeMgYrFBMYI(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p12}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$2(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$M55PVWG9akFwVQfEZkBwCC3yTFY(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p13}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$2(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$NFQEnq91FZj5ryNM0tvYh-IqChY(Ljava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;ILandroidx/compose/ui/unit/Constraints;ILkotlin/jvm/functions/Function3;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p9}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$1$0$0$3(Ljava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;ILandroidx/compose/ui/unit/Constraints;ILkotlin/jvm/functions/Function3;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$QLWbrmRymMS4E1SjedWGXEQOICY(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$1(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$e3jNItqLMqKiSo2muf8Q80IDtCs(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$1$1$0$2$2(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$h-vUpuDrlsRt0A_YlBzL58VIwlA(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$1$0$0$3$2(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$hJqhv4cXOnYOG0LNCctIS-bNxZk(ILjava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILandroidx/compose/ui/unit/Constraints;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p10}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$1$1$0$2(ILjava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILandroidx/compose/ui/unit/Constraints;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$kQFktKI1GzULYWCR98UJfP_XjbA(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow_sKfQg0A$lambda$0(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$st9bVtxd3K4i7u5unrBNeXGwtjU(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Landroidx/compose/material/TabRowKt;->TabRow_pAZo6Ak$lambda$1$0$0(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 5

    .line 486
    const/16 v0, 0x5a

    .local v0, "$this$dp$iv":I
    const/4 v1, 0x0

    .line 601
    .local v1, "$i$f$getDp":I
    int-to-float v2, v0

    invoke-static {v2}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v0

    .line 486
    .end local v0    # "$this$dp$iv":I
    .end local v1    # "$i$f$getDp":I
    sput v0, Landroidx/compose/material/TabRowKt;->ScrollableTabRowMinimumTabWidth:F

    .line 490
    invoke-static {}, Landroidx/compose/animation/core/EasingKt;->getFastOutSlowInEasing()Landroidx/compose/animation/core/Easing;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/16 v3, 0xfa

    const/4 v4, 0x0

    invoke-static {v3, v4, v0, v1, v2}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v0

    check-cast v0, Landroidx/compose/animation/core/AnimationSpec;

    sput-object v0, Landroidx/compose/material/TabRowKt;->ScrollableTabRowScrollSpec:Landroidx/compose/animation/core/AnimationSpec;

    return-void
.end method

.method public static final ScrollableTabRow-sKfQg0A(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
    .locals 24
    .param p0, "selectedTabIndex"    # I
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0"    # J
    .param p6, "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0"    # F
    .param p7, "indicator"    # Lkotlin/jvm/functions/Function3;
    .param p8, "divider"    # Lkotlin/jvm/functions/Function2;
    .param p9, "tabs"    # Lkotlin/jvm/functions/Function2;
    .param p10, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p11, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/compose/ui/Modifier;",
            "JJF",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/util/List<",
            "Landroidx/compose/material/TabPosition;",
            ">;-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 237
    move/from16 v1, p0

    move/from16 v11, p11

    const v0, -0x4cfb6fcf

    move-object/from16 v2, p10

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .end local p10    # "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(ScrollableTabRow)N(selectedTabIndex,modifier,backgroundColor:c#ui.graphics.Color,contentColor:c#ui.graphics.Color,edgePadding:c#ui.unit.Dp,indicator,divider,tabs)237@11975L2929,237@11892L3012:TabRow.kt#jmzs0o"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p11

    .local v3, "$dirty":I
    and-int/lit8 v4, v11, 0x6

    if-nez v4, :cond_1

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v3, v4

    :cond_1
    and-int/lit8 v4, p12, 0x2

    if-eqz v4, :cond_2

    or-int/lit8 v3, v3, 0x30

    move-object/from16 v5, p1

    goto :goto_2

    :cond_2
    and-int/lit8 v5, v11, 0x30

    if-nez v5, :cond_4

    move-object/from16 v5, p1

    invoke-interface {v2, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x20

    goto :goto_1

    :cond_3
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v3, v6

    goto :goto_2

    :cond_4
    move-object/from16 v5, p1

    :goto_2
    and-int/lit16 v6, v11, 0x180

    if-nez v6, :cond_7

    and-int/lit8 v6, p12, 0x4

    if-nez v6, :cond_5

    move-wide/from16 v6, p2

    invoke-interface {v2, v6, v7}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x100

    goto :goto_3

    :cond_5
    move-wide/from16 v6, p2

    :cond_6
    const/16 v8, 0x80

    :goto_3
    or-int/2addr v3, v8

    goto :goto_4

    :cond_7
    move-wide/from16 v6, p2

    :goto_4
    and-int/lit16 v8, v11, 0xc00

    if-nez v8, :cond_a

    and-int/lit8 v8, p12, 0x8

    if-nez v8, :cond_8

    move-wide/from16 v8, p4

    invoke-interface {v2, v8, v9}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v10

    if-eqz v10, :cond_9

    const/16 v10, 0x800

    goto :goto_5

    :cond_8
    move-wide/from16 v8, p4

    :cond_9
    const/16 v10, 0x400

    :goto_5
    or-int/2addr v3, v10

    goto :goto_6

    :cond_a
    move-wide/from16 v8, p4

    :goto_6
    and-int/lit8 v10, p12, 0x10

    if-eqz v10, :cond_b

    or-int/lit16 v3, v3, 0x6000

    move/from16 v12, p6

    goto :goto_8

    :cond_b
    and-int/lit16 v12, v11, 0x6000

    if-nez v12, :cond_d

    move/from16 v12, p6

    invoke-interface {v2, v12}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v13

    if-eqz v13, :cond_c

    const/16 v13, 0x4000

    goto :goto_7

    :cond_c
    const/16 v13, 0x2000

    :goto_7
    or-int/2addr v3, v13

    goto :goto_8

    :cond_d
    move/from16 v12, p6

    :goto_8
    and-int/lit8 v13, p12, 0x20

    const/high16 v14, 0x30000

    if-eqz v13, :cond_e

    or-int/2addr v3, v14

    move-object/from16 v14, p7

    goto :goto_a

    :cond_e
    and-int/2addr v14, v11

    if-nez v14, :cond_10

    move-object/from16 v14, p7

    invoke-interface {v2, v14}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_f

    const/high16 v15, 0x20000

    goto :goto_9

    :cond_f
    const/high16 v15, 0x10000

    :goto_9
    or-int/2addr v3, v15

    goto :goto_a

    :cond_10
    move-object/from16 v14, p7

    :goto_a
    and-int/lit8 v15, p12, 0x40

    const/high16 v16, 0x180000

    if-eqz v15, :cond_11

    or-int v3, v3, v16

    move-object/from16 v0, p8

    goto :goto_c

    :cond_11
    and-int v17, v11, v16

    if-nez v17, :cond_13

    move-object/from16 v0, p8

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_12

    const/high16 v18, 0x100000

    goto :goto_b

    :cond_12
    const/high16 v18, 0x80000

    :goto_b
    or-int v3, v3, v18

    goto :goto_c

    :cond_13
    move-object/from16 v0, p8

    :goto_c
    const/high16 v18, 0xc00000

    and-int v18, v11, v18

    if-nez v18, :cond_15

    move-object/from16 v0, p9

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_14

    const/high16 v18, 0x800000

    goto :goto_d

    :cond_14
    const/high16 v18, 0x400000

    :goto_d
    or-int v3, v3, v18

    goto :goto_e

    :cond_15
    move-object/from16 v0, p9

    :goto_e
    const v18, 0x492493

    and-int v0, v3, v18

    move/from16 p10, v4

    const v4, 0x492492

    if-eq v0, v4, :cond_16

    const/4 v0, 0x1

    goto :goto_f

    :cond_16
    const/4 v0, 0x0

    :goto_f
    and-int/lit8 v4, v3, 0x1

    invoke-interface {v2, v0, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_23

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "227@11365L6,228@11414L32,231@11615L125"

    invoke-static {v2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v11, 0x1

    if-eqz v0, :cond_1a

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_17

    goto :goto_10

    .line 225
    :cond_17
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, p12, 0x4

    if-eqz v0, :cond_18

    and-int/lit16 v3, v3, -0x381

    :cond_18
    and-int/lit8 v0, p12, 0x8

    if-eqz v0, :cond_19

    and-int/lit16 v0, v3, -0x1c01

    move-object/from16 v10, p8

    move v3, v0

    move/from16 v0, v16

    const v4, -0x4cfb6fcf

    move-wide/from16 v16, v8

    move v8, v12

    move-object v9, v14

    move-object/from16 v12, p1

    move-wide v14, v6

    .end local v3    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_16

    .end local v0    # "$dirty":I
    .restart local v3    # "$dirty":I
    :cond_19
    move-object/from16 v10, p8

    move/from16 v0, v16

    const v4, -0x4cfb6fcf

    move-wide/from16 v16, v8

    move v8, v12

    move-object v9, v14

    move-object/from16 v12, p1

    move-wide v14, v6

    goto/16 :goto_16

    .line 237
    :cond_1a
    :goto_10
    if-eqz p10, :cond_1b

    .line 227
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_11

    .line 237
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_1b
    move-object/from16 v0, p1

    .line 227
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_11
    and-int/lit8 v18, p12, 0x4

    if-eqz v18, :cond_1c

    .line 228
    sget-object v4, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v5, 0x6

    invoke-virtual {v4, v2, v5}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v4

    invoke-static {v4}, Landroidx/compose/material/ColorsKt;->getPrimarySurface(Landroidx/compose/material/Colors;)J

    move-result-wide v4

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v3, v3, -0x381

    goto :goto_12

    .line 227
    .end local v4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_1c
    move-wide v4, v6

    .line 228
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_12
    and-int/lit8 v6, p12, 0x8

    if-eqz v6, :cond_1d

    .line 229
    shr-int/lit8 v6, v3, 0x6

    and-int/lit8 v6, v6, 0xe

    invoke-static {v4, v5, v2, v6}, Landroidx/compose/material/ColorsKt;->contentColorFor-ek8zF_U(JLandroidx/compose/runtime/Composer;I)J

    move-result-wide v6

    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .local v6, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    and-int/lit16 v3, v3, -0x1c01

    goto :goto_13

    .line 228
    .end local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :cond_1d
    move-wide v6, v8

    .line 229
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :goto_13
    if-eqz v10, :cond_1e

    .line 230
    sget-object v8, Landroidx/compose/material/TabRowDefaults;->INSTANCE:Landroidx/compose/material/TabRowDefaults;

    invoke-virtual {v8}, Landroidx/compose/material/TabRowDefaults;->getScrollableTabRowPadding-D9Ej5fM()F

    move-result v8

    .end local p6    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .local v8, "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    goto :goto_14

    .line 229
    .end local v8    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .restart local p6    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    :cond_1e
    move v8, v12

    .line 230
    .end local p6    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .restart local v8    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    :goto_14
    if-eqz v13, :cond_1f

    .line 232
    new-instance v9, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda0;

    invoke-direct {v9, v1}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda0;-><init>(I)V

    const v10, -0xdee7834

    const/16 v12, 0x36

    const/4 v13, 0x1

    invoke-static {v10, v13, v9, v2, v12}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v9

    check-cast v9, Lkotlin/jvm/functions/Function3;

    .end local p7    # "indicator":Lkotlin/jvm/functions/Function3;
    .local v9, "indicator":Lkotlin/jvm/functions/Function3;
    goto :goto_15

    .line 230
    .end local v9    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local p7    # "indicator":Lkotlin/jvm/functions/Function3;
    :cond_1f
    move-object v9, v14

    .line 232
    .end local p7    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local v9    # "indicator":Lkotlin/jvm/functions/Function3;
    :goto_15
    if-eqz v15, :cond_20

    sget-object v10, Landroidx/compose/material/ComposableSingletons$TabRowKt;->INSTANCE:Landroidx/compose/material/ComposableSingletons$TabRowKt;

    invoke-virtual {v10}, Landroidx/compose/material/ComposableSingletons$TabRowKt;->getLambda$-222041980$material()Lkotlin/jvm/functions/Function2;

    move-result-object v10

    move-object v12, v0

    move-wide v14, v4

    move/from16 v0, v16

    const v4, -0x4cfb6fcf

    move-wide/from16 v16, v6

    .end local p8    # "divider":Lkotlin/jvm/functions/Function2;
    .local v10, "divider":Lkotlin/jvm/functions/Function2;
    goto :goto_16

    .end local v10    # "divider":Lkotlin/jvm/functions/Function2;
    .restart local p8    # "divider":Lkotlin/jvm/functions/Function2;
    :cond_20
    move-object/from16 v10, p8

    move-object v12, v0

    move-wide v14, v4

    move/from16 v0, v16

    const v4, -0x4cfb6fcf

    move-wide/from16 v16, v6

    .line 225
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local p8    # "divider":Lkotlin/jvm/functions/Function2;
    .restart local v10    # "divider":Lkotlin/jvm/functions/Function2;
    .local v12, "modifier":Landroidx/compose/ui/Modifier;
    .local v14, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v16, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :goto_16
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_21

    const/4 v5, -0x1

    const-string v6, "androidx.compose.material.ScrollableTabRow (TabRow.kt:236)"

    invoke-static {v4, v3, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 238
    :cond_21
    new-instance v4, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda3;

    move-object/from16 p3, p9

    move/from16 p6, v1

    move-object/from16 p1, v4

    move/from16 p2, v8

    move-object/from16 p5, v9

    move-object/from16 p4, v10

    .end local v8    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .end local v9    # "indicator":Lkotlin/jvm/functions/Function3;
    .end local v10    # "divider":Lkotlin/jvm/functions/Function2;
    .local p2, "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .local p4, "divider":Lkotlin/jvm/functions/Function2;
    .local p5, "indicator":Lkotlin/jvm/functions/Function3;
    invoke-direct/range {p1 .. p6}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda3;-><init>(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;I)V

    move-object/from16 v1, p1

    .end local p2    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .end local p4    # "divider":Lkotlin/jvm/functions/Function2;
    .end local p5    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local v8    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .restart local v9    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local v10    # "divider":Lkotlin/jvm/functions/Function2;
    const v4, -0x5de31a8b

    const/16 v5, 0x36

    const/4 v13, 0x1

    invoke-static {v4, v13, v1, v2, v5}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lkotlin/jvm/functions/Function2;

    shr-int/lit8 v1, v3, 0x3

    and-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    and-int/lit16 v1, v3, 0x380

    or-int/2addr v0, v1

    and-int/lit16 v1, v3, 0x1c00

    or-int v22, v0, v1

    const/16 v23, 0x32

    const/4 v13, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v21, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v21, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v12 .. v23}, Landroidx/compose/material/SurfaceKt;->Surface-F-jzlyU(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJLandroidx/compose/foundation/BorderStroke;FLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 307
    :cond_22
    move v13, v3

    move v7, v8

    move-object v8, v9

    move-object v9, v10

    move-object v2, v12

    move-wide v3, v14

    move-wide/from16 v5, v16

    goto :goto_17

    .line 225
    .end local v8    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .end local v9    # "indicator":Lkotlin/jvm/functions/Function3;
    .end local v10    # "divider":Lkotlin/jvm/functions/Function2;
    .end local v12    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v14    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v16    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local v21    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local p2, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local p4, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local p6    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .restart local p7    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local p8    # "divider":Lkotlin/jvm/functions/Function2;
    :cond_23
    move-object/from16 v21, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v21    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-object/from16 v2, p1

    move v13, v3

    move-wide v3, v6

    move-wide v5, v8

    move v7, v12

    move-object v8, v14

    move-object/from16 v9, p8

    .line 307
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local p6    # "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .end local p7    # "indicator":Lkotlin/jvm/functions/Function3;
    .end local p8    # "divider":Lkotlin/jvm/functions/Function2;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .local v7, "$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0":F
    .local v8, "indicator":Lkotlin/jvm/functions/Function3;
    .local v9, "divider":Lkotlin/jvm/functions/Function2;
    .local v13, "$dirty":I
    :goto_17
    invoke-interface/range {v21 .. v21}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v14

    if-eqz v14, :cond_24

    new-instance v0, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda4;

    move/from16 v1, p0

    move-object/from16 v10, p9

    move/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda4;-><init>(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;II)V

    invoke-interface {v14, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_24
    return-void
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$0(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11
    .param p0, "$selectedTabIndex"    # I
    .param p1, "tabPositions"    # Ljava/util/List;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "CN(tabPositions)232@11660L70:TabRow.kt#jmzs0o"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.ScrollableTabRow.<anonymous> (TabRow.kt:232)"

    const v2, -0xdee7834

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 233
    :cond_0
    sget-object v3, Landroidx/compose/material/TabRowDefaults;->INSTANCE:Landroidx/compose/material/TabRowDefaults;

    sget-object v0, Landroidx/compose/material/TabRowDefaults;->INSTANCE:Landroidx/compose/material/TabRowDefaults;

    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/compose/material/TabPosition;

    invoke-virtual {v0, v1, v2}, Landroidx/compose/material/TabRowDefaults;->tabIndicatorOffset(Landroidx/compose/ui/Modifier;Landroidx/compose/material/TabPosition;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    const/16 v9, 0xc00

    const/4 v10, 0x6

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v8, p2

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v3 .. v10}, Landroidx/compose/material/TabRowDefaults;->Indicator-9IZ8Weo(Landroidx/compose/ui/Modifier;FJLandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 234
    :cond_1
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p2
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$1(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 24
    .param p0, "$$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0"    # F
    .param p1, "$tabs"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p4, "$selectedTabIndex"    # I
    .param p5, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p6, "$changed"    # I

    move-object/from16 v0, p5

    move/from16 v1, p6

    const-string v2, "C238@12003L21,239@12054L24,241@12123L147,250@12521L2377,244@12279L2619:TabRow.kt#jmzs0o"

    invoke-static {v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v2, v1, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eq v2, v5, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    and-int/lit8 v6, v1, 0x1

    invoke-interface {v0, v2, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v2

    if-eqz v2, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v6, "androidx.compose.material.ScrollableTabRow.<anonymous> (TabRow.kt:238)"

    const v7, -0x5de31a8b

    invoke-static {v7, v1, v2, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 239
    :cond_1
    invoke-static {v4, v0, v4, v3}, Landroidx/compose/foundation/ScrollKt;->rememberScrollState(ILandroidx/compose/runtime/Composer;II)Landroidx/compose/foundation/ScrollState;

    move-result-object v9

    .line 240
    .local v9, "scrollState":Landroidx/compose/foundation/ScrollState;
    move v2, v4

    .local v2, "$changed$iv":I
    move-object/from16 v6, p5

    .local v6, "$composer$iv":Landroidx/compose/runtime/Composer;
    const/4 v7, 0x0

    .line 541
    .local v7, "$i$f$rememberCoroutineScope":I
    const v8, 0x2e20b340

    const-string v10, "CC(rememberCoroutineScope)N(getContext)600@27430L68:Effects.kt#9igjgp"

    invoke-static {v6, v8, v10}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    .line 542
    nop

    .line 546
    move-object v8, v6

    .line 547
    .local v8, "composer$iv":Landroidx/compose/runtime/Composer;
    const v10, 0x28c0fdc4

    const-string v11, "CC(remember):Effects.kt#9igjgp"

    invoke-static {v6, v10, v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v10, 0x0

    .local v10, "invalid$iv$iv":Z
    move-object v11, v6

    .local v11, "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    const/4 v12, 0x0

    .line 548
    .local v12, "$i$f$cache":I
    invoke-interface {v11}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it$iv$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 549
    .local v14, "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v13, v15, :cond_2

    .line 550
    const/4 v15, 0x0

    .line 547
    .local v15, "$i$a$-cache-EffectsKt$rememberCoroutineScope$2$iv":I
    const/16 v16, 0x0

    .line 551
    .local v16, "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1":I
    sget-object v16, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    .line 547
    .end local v16    # "$i$a$-rememberCoroutineScope-EffectsKt$rememberCoroutineScope$1":I
    move-object/from16 v4, v16

    check-cast v4, Lkotlin/coroutines/CoroutineContext;

    invoke-static {v4, v8}, Landroidx/compose/runtime/EffectsKt;->createCompositionCoroutineScope(Lkotlin/coroutines/CoroutineContext;Landroidx/compose/runtime/Composer;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v4

    .line 550
    .end local v15    # "$i$a$-cache-EffectsKt$rememberCoroutineScope$2$iv":I
    nop

    .line 552
    .local v4, "value$iv$iv":Ljava/lang/Object;
    invoke-interface {v11, v4}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 553
    move-object v13, v4

    .end local v4    # "value$iv$iv":Ljava/lang/Object;
    goto :goto_1

    .line 554
    :cond_2
    nop

    .line 548
    .end local v13    # "it$iv$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1$iv$iv":I
    :goto_1
    nop

    .line 547
    .end local v10    # "invalid$iv$iv":Z
    .end local v11    # "$this$cache$iv$iv":Landroidx/compose/runtime/Composer;
    .end local v12    # "$i$f$cache":I
    check-cast v13, Lkotlinx/coroutines/CoroutineScope;

    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 541
    invoke-static {v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 547
    nop

    .line 240
    .end local v2    # "$changed$iv":I
    .end local v6    # "$composer$iv":Landroidx/compose/runtime/Composer;
    .end local v7    # "$i$f$rememberCoroutineScope":I
    .end local v8    # "composer$iv":Landroidx/compose/runtime/Composer;
    move-object v2, v13

    .line 242
    .local v2, "coroutineScope":Lkotlinx/coroutines/CoroutineScope;
    const v4, -0x718690b8

    const-string v6, "CC(remember):TabRow.kt#9igjgp"

    invoke-static {v0, v4, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v0, v9}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v4

    invoke-interface {v0, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v7

    or-int/2addr v4, v7

    .local v4, "invalid$iv":Z
    move-object/from16 v7, p5

    .local v7, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v8, 0x0

    .line 555
    .local v8, "$i$f$cache":I
    invoke-interface {v7}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v10

    .local v10, "it$iv":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 556
    .local v11, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v4, :cond_4

    sget-object v12, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v12}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v12

    if-ne v10, v12, :cond_3

    goto :goto_2

    .line 560
    :cond_3
    goto :goto_3

    .line 557
    :cond_4
    :goto_2
    const/4 v12, 0x0

    .line 243
    .local v12, "$i$a$-cache-TabRowKt$ScrollableTabRow$2$scrollableTabData$1":I
    new-instance v13, Landroidx/compose/material/ScrollableTabData;

    invoke-direct {v13, v9, v2}, Landroidx/compose/material/ScrollableTabData;-><init>(Landroidx/compose/foundation/ScrollState;Lkotlinx/coroutines/CoroutineScope;)V

    .line 557
    .end local v12    # "$i$a$-cache-TabRowKt$ScrollableTabRow$2$scrollableTabData$1":I
    nop

    .line 558
    .local v13, "value$iv":Ljava/lang/Object;
    invoke-interface {v7, v13}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 559
    move-object v10, v13

    .line 555
    .end local v10    # "it$iv":Ljava/lang/Object;
    .end local v11    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v13    # "value$iv":Ljava/lang/Object;
    :goto_3
    nop

    .line 242
    .end local v4    # "invalid$iv":Z
    .end local v7    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v8    # "$i$f$cache":I
    check-cast v10, Landroidx/compose/material/ScrollableTabData;

    invoke-static {v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 241
    move-object v4, v10

    .line 246
    .local v4, "scrollableTabData":Landroidx/compose/material/ScrollableTabData;
    sget-object v7, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v7, Landroidx/compose/ui/Modifier;

    const/4 v8, 0x0

    const/4 v10, 0x0

    invoke-static {v7, v8, v3, v10}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 247
    sget-object v7, Landroidx/compose/ui/Alignment;->Companion:Landroidx/compose/ui/Alignment$Companion;

    invoke-virtual {v7}, Landroidx/compose/ui/Alignment$Companion;->getCenterStart()Landroidx/compose/ui/Alignment;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v3, v7, v8, v5, v10}, Landroidx/compose/foundation/layout/SizeKt;->wrapContentSize$default(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;ZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 248
    const/16 v13, 0xe

    const/4 v14, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v8, v3

    invoke-static/range {v8 .. v14}, Landroidx/compose/foundation/ScrollKt;->horizontalScroll$default(Landroidx/compose/ui/Modifier;Landroidx/compose/foundation/ScrollState;ZLandroidx/compose/foundation/gestures/FlingBehavior;ZILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 249
    invoke-static {v3}, Landroidx/compose/foundation/selection/SelectableGroupKt;->selectableGroup(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 250
    invoke-static {v3}, Landroidx/compose/ui/draw/ClipKt;->clipToBounds(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v3

    .line 251
    const v5, -0x71865642

    invoke-static {v0, v5, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    move/from16 v5, p0

    invoke-interface {v0, v5}, Landroidx/compose/runtime/Composer;->changed(F)Z

    move-result v6

    move-object/from16 v7, p1

    invoke-interface {v0, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v8

    or-int/2addr v6, v8

    move-object/from16 v8, p2

    invoke-interface {v0, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v10

    or-int/2addr v6, v10

    move-object/from16 v10, p3

    invoke-interface {v0, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v6, v11

    invoke-interface {v0, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v11

    or-int/2addr v6, v11

    move/from16 v11, p4

    invoke-interface {v0, v11}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v12

    or-int/2addr v6, v12

    .local v6, "invalid$iv":Z
    move-object/from16 v12, p5

    .local v12, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v13, 0x0

    .line 561
    .local v13, "$i$f$cache":I
    invoke-interface {v12}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v14

    .local v14, "it$iv":Ljava/lang/Object;
    const/4 v15, 0x0

    .line 562
    .local v15, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v6, :cond_6

    sget-object v16, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v16 .. v16}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v1

    if-ne v14, v1, :cond_5

    goto :goto_4

    .line 566
    :cond_5
    move-object/from16 v21, v4

    goto :goto_5

    .line 563
    :cond_6
    :goto_4
    const/4 v1, 0x0

    .line 251
    .local v1, "$i$a$-cache-TabRowKt$ScrollableTabRow$2$1":I
    new-instance v17, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda8;

    move-object/from16 v21, v4

    move/from16 v18, v5

    move-object/from16 v19, v7

    move-object/from16 v20, v8

    move-object/from16 v23, v10

    move/from16 v22, v11

    .end local v4    # "scrollableTabData":Landroidx/compose/material/ScrollableTabData;
    .local v21, "scrollableTabData":Landroidx/compose/material/ScrollableTabData;
    invoke-direct/range {v17 .. v23}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda8;-><init>(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILkotlin/jvm/functions/Function3;)V

    .line 563
    .end local v1    # "$i$a$-cache-TabRowKt$ScrollableTabRow$2$1":I
    move-object/from16 v1, v17

    .line 564
    .local v1, "value$iv":Ljava/lang/Object;
    invoke-interface {v12, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 565
    move-object v14, v1

    .line 561
    .end local v1    # "value$iv":Ljava/lang/Object;
    .end local v14    # "it$iv":Ljava/lang/Object;
    .end local v15    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_5
    nop

    .line 251
    .end local v6    # "invalid$iv":Z
    .end local v12    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v13    # "$i$f$cache":I
    check-cast v14, Lkotlin/jvm/functions/Function2;

    invoke-static {v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 245
    const/4 v8, 0x0

    invoke-static {v3, v14, v0, v8, v8}, Landroidx/compose/ui/layout/SubcomposeLayoutKt;->SubcomposeLayout(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v2    # "coroutineScope":Lkotlinx/coroutines/CoroutineScope;
    .end local v9    # "scrollState":Landroidx/compose/foundation/ScrollState;
    .end local v21    # "scrollableTabData":Landroidx/compose/material/ScrollableTabData;
    goto :goto_6

    .line 238
    :cond_7
    invoke-interface {v0}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 306
    :cond_8
    :goto_6
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v1
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$1$1$0(FLkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 26
    .param p0, "$$v$c$androidx-compose-ui-unit-Dp$-edgePadding$0"    # F
    .param p1, "$tabs"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$scrollableTabData"    # Landroidx/compose/material/ScrollableTabData;
    .param p4, "$selectedTabIndex"    # I
    .param p5, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p6, "$this$SubcomposeLayout"    # Landroidx/compose/ui/layout/SubcomposeMeasureScope;
    .param p7, "constraints"    # Landroidx/compose/ui/unit/Constraints;

    .line 252
    move-object/from16 v3, p6

    sget v0, Landroidx/compose/material/TabRowKt;->ScrollableTabRowMinimumTabWidth:F

    invoke-interface {v3, v0}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->roundToPx-0680j_4(F)I

    move-result v6

    .line 253
    .local v6, "minTabWidth":I
    move/from16 v12, p0

    invoke-interface {v3, v12}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->roundToPx-0680j_4(F)I

    move-result v1

    .line 254
    .local v1, "padding":I
    invoke-virtual/range {p7 .. p7}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v4

    const/16 v10, 0xe

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v4 .. v11}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v13

    .line 257
    move v11, v6

    .end local v6    # "minTabWidth":I
    .local v11, "minTabWidth":I
    .local v13, "tabConstraints":J
    sget-object v0, Landroidx/compose/material/TabSlots;->Tabs:Landroidx/compose/material/TabSlots;

    move-object/from16 v15, p1

    invoke-interface {v3, v0, v15}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v0

    .local v0, "$this$fastMap$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 567
    .local v2, "$i$f$fastMap":I
    nop

    .line 568
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 569
    .local v4, "target$iv":Ljava/util/ArrayList;
    move-object v5, v0

    .local v5, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 570
    .local v6, "$i$f$fastForEach":I
    nop

    .line 571
    const/4 v7, 0x0

    .local v7, "index$iv$iv":I
    move-object v8, v5

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_0
    if-ge v7, v8, :cond_0

    .line 572
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 573
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    .local v10, "it$iv":Ljava/lang/Object;
    const/16 v16, 0x0

    .line 569
    .local v16, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object/from16 v17, v0

    .end local v0    # "$this$fastMap$iv":Ljava/util/List;
    .local v17, "$this$fastMap$iv":Ljava/util/List;
    move-object v0, v4

    check-cast v0, Ljava/util/Collection;

    move/from16 v18, v1

    .end local v1    # "padding":I
    .local v18, "padding":I
    move-object v1, v10

    check-cast v1, Landroidx/compose/ui/layout/Measurable;

    .local v1, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v19, 0x0

    .line 257
    .local v19, "$i$a$-fastMap-TabRowKt$ScrollableTabRow$2$1$1$tabPlaceables$1":I
    invoke-interface {v1, v13, v14}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v1

    .line 569
    .end local v1    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v19    # "$i$a$-fastMap-TabRowKt$ScrollableTabRow$2$1$1$tabPlaceables$1":I
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 573
    .end local v10    # "it$iv":Ljava/lang/Object;
    .end local v16    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 571
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    goto :goto_0

    .end local v17    # "$this$fastMap$iv":Ljava/util/List;
    .end local v18    # "padding":I
    .restart local v0    # "$this$fastMap$iv":Ljava/util/List;
    .local v1, "padding":I
    :cond_0
    move-object/from16 v17, v0

    move/from16 v18, v1

    .line 575
    .end local v0    # "$this$fastMap$iv":Ljava/util/List;
    .end local v1    # "padding":I
    .end local v7    # "index$iv$iv":I
    .restart local v17    # "$this$fastMap$iv":Ljava/util/List;
    .restart local v18    # "padding":I
    nop

    .line 576
    .end local v5    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEach":I
    move-object v2, v4

    check-cast v2, Ljava/util/List;

    .line 257
    .end local v2    # "$i$f$fastMap":I
    .end local v4    # "target$iv":Ljava/util/ArrayList;
    .end local v17    # "$this$fastMap$iv":Ljava/util/List;
    nop

    .line 256
    nop

    .line 259
    .local v2, "tabPlaceables":Ljava/util/List;
    new-instance v8, Lkotlin/jvm/internal/Ref$IntRef;

    invoke-direct {v8}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .local v8, "layoutWidth":Lkotlin/jvm/internal/Ref$IntRef;
    mul-int/lit8 v1, v18, 0x2

    iput v1, v8, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 260
    new-instance v9, Lkotlin/jvm/internal/Ref$IntRef;

    invoke-direct {v9}, Lkotlin/jvm/internal/Ref$IntRef;-><init>()V

    .line 261
    .local v9, "layoutHeight":Lkotlin/jvm/internal/Ref$IntRef;
    move-object v0, v2

    .local v0, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 577
    .local v1, "$i$f$fastForEach":I
    nop

    .line 578
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v0

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_1
    if-ge v4, v5, :cond_1

    .line 579
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 580
    .local v6, "item$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Landroidx/compose/ui/layout/Placeable;

    .local v7, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v10, 0x0

    .line 262
    .local v10, "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$1":I
    move-object/from16 v16, v0

    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .local v16, "$this$fastForEach$iv":Ljava/util/List;
    iget v0, v8, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    invoke-virtual {v7}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v17

    add-int v0, v0, v17

    iput v0, v8, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 263
    iget v0, v9, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    move/from16 v17, v1

    .end local v1    # "$i$f$fastForEach":I
    .local v17, "$i$f$fastForEach":I
    invoke-virtual {v7}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, v9, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 264
    nop

    .line 580
    .end local v7    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v10    # "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$1":I
    nop

    .line 578
    .end local v6    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    goto :goto_1

    .end local v16    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v17    # "$i$f$fastForEach":I
    .restart local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .restart local v1    # "$i$f$fastForEach":I
    :cond_1
    move-object/from16 v16, v0

    move/from16 v17, v1

    .line 582
    .end local v0    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEach":I
    .end local v4    # "index$iv":I
    .restart local v16    # "$this$fastForEach$iv":Ljava/util/List;
    .restart local v17    # "$i$f$fastForEach":I
    nop

    .line 267
    .end local v16    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v17    # "$i$f$fastForEach":I
    move-object/from16 v19, v3

    check-cast v19, Landroidx/compose/ui/layout/MeasureScope;

    iget v0, v8, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    iget v1, v9, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    new-instance v23, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda9;

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move-object/from16 v10, p5

    move-object/from16 v7, p7

    move/from16 v20, v0

    move/from16 v21, v1

    move/from16 v1, v18

    move-object/from16 v0, v23

    .end local v18    # "padding":I
    .local v1, "padding":I
    invoke-direct/range {v0 .. v10}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda9;-><init>(ILjava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILandroidx/compose/ui/unit/Constraints;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/functions/Function3;)V

    move-object/from16 v16, v2

    .end local v2    # "tabPlaceables":Ljava/util/List;
    .local v16, "tabPlaceables":Ljava/util/List;
    const/16 v24, 0x4

    const/16 v25, 0x0

    const/16 v22, 0x0

    invoke-static/range {v19 .. v25}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v0

    .line 304
    return-object v0
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$1$1$0$2(ILjava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;Landroidx/compose/material/ScrollableTabData;ILandroidx/compose/ui/unit/Constraints;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/internal/Ref$IntRef;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 25
    .param p0, "$padding"    # I
    .param p1, "$tabPlaceables"    # Ljava/util/List;
    .param p2, "$this_SubcomposeLayout"    # Landroidx/compose/ui/layout/SubcomposeMeasureScope;
    .param p3, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p4, "$scrollableTabData"    # Landroidx/compose/material/ScrollableTabData;
    .param p5, "$selectedTabIndex"    # I
    .param p6, "$constraints"    # Landroidx/compose/ui/unit/Constraints;
    .param p7, "$layoutWidth"    # Lkotlin/jvm/internal/Ref$IntRef;
    .param p8, "$layoutHeight"    # Lkotlin/jvm/internal/Ref$IntRef;
    .param p9, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p10, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 269
    move-object/from16 v0, p2

    move-object/from16 v1, p7

    move-object/from16 v2, p8

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    check-cast v3, Ljava/util/List;

    .line 270
    .local v3, "tabPositions":Ljava/util/List;
    const/4 v4, 0x0

    .local v4, "left":I
    move/from16 v4, p0

    .line 271
    move-object/from16 v5, p1

    .local v5, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 583
    .local v6, "$i$f$fastForEach":I
    nop

    .line 584
    const/4 v7, 0x0

    .local v7, "index$iv":I
    move-object v8, v5

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    move v11, v4

    .end local v4    # "left":I
    .local v11, "left":I
    :goto_0
    if-ge v7, v8, :cond_0

    .line 585
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 586
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v10, v4

    check-cast v10, Landroidx/compose/ui/layout/Placeable;

    .local v10, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v16, 0x0

    .line 272
    .local v16, "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$1":I
    const/4 v14, 0x4

    const/4 v15, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v9, p10

    invoke-static/range {v9 .. v15}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 273
    new-instance v9, Landroidx/compose/material/TabPosition;

    invoke-interface {v0, v11}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->toDp-u2uoSUM(I)F

    move-result v12

    invoke-virtual {v10}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v13

    invoke-interface {v0, v13}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->toDp-u2uoSUM(I)F

    move-result v13

    const/4 v14, 0x0

    invoke-direct {v9, v12, v13, v14}, Landroidx/compose/material/TabPosition;-><init>(FFLkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 274
    invoke-virtual {v10}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v9

    add-int/2addr v11, v9

    .line 275
    nop

    .line 586
    .end local v10    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v16    # "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$1":I
    nop

    .line 584
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 588
    .end local v7    # "index$iv":I
    :cond_0
    nop

    .line 279
    .end local v5    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEach":I
    sget-object v4, Landroidx/compose/material/TabSlots;->Divider:Landroidx/compose/material/TabSlots;

    move-object/from16 v5, p3

    invoke-interface {v0, v4, v5}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v4

    .local v4, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 589
    .restart local v6    # "$i$f$fastForEach":I
    nop

    .line 590
    const/4 v7, 0x0

    .restart local v7    # "index$iv":I
    move-object v8, v4

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_1
    if-ge v7, v8, :cond_1

    .line 591
    invoke-interface {v4, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 592
    .local v9, "item$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/compose/ui/layout/Measurable;

    .local v10, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v12, 0x0

    .line 281
    .local v12, "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$2":I
    nop

    .line 282
    invoke-virtual/range {p6 .. p6}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v13

    .line 284
    iget v15, v1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 285
    move-object/from16 v24, v4

    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .local v24, "$this$fastForEach$iv":Ljava/util/List;
    iget v4, v1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    .line 283
    nop

    .line 282
    const/16 v19, 0x8

    const/16 v20, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move/from16 v16, v4

    invoke-static/range {v13 .. v20}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v13

    .line 281
    invoke-interface {v10, v13, v14}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v18

    .line 280
    nop

    .line 288
    .local v18, "placeable":Landroidx/compose/ui/layout/Placeable;
    iget v4, v2, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    invoke-virtual/range {v18 .. v18}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v13

    sub-int v20, v4, v13

    const/16 v22, 0x4

    const/16 v23, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    move-object/from16 v17, p10

    invoke-static/range {v17 .. v23}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 289
    nop

    .line 592
    .end local v10    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v12    # "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$2":I
    .end local v18    # "placeable":Landroidx/compose/ui/layout/Placeable;
    nop

    .line 590
    .end local v9    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v4, v24

    goto :goto_1

    .end local v24    # "$this$fastForEach$iv":Ljava/util/List;
    .restart local v4    # "$this$fastForEach$iv":Ljava/util/List;
    :cond_1
    move-object/from16 v24, v4

    .line 594
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v7    # "index$iv":I
    .restart local v24    # "$this$fastForEach$iv":Ljava/util/List;
    nop

    .line 293
    .end local v6    # "$i$f$fastForEach":I
    .end local v24    # "$this$fastForEach$iv":Ljava/util/List;
    sget-object v4, Landroidx/compose/material/TabSlots;->Indicator:Landroidx/compose/material/TabSlots;

    new-instance v6, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda2;

    move-object/from16 v7, p9

    invoke-direct {v6, v7, v3}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda2;-><init>(Lkotlin/jvm/functions/Function3;Ljava/util/List;)V

    const v8, -0x2933d4e

    const/4 v9, 0x1

    invoke-static {v8, v9, v6}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v6

    check-cast v6, Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, v4, v6}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v4

    .line 294
    nop

    .restart local v4    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 595
    .restart local v6    # "$i$f$fastForEach":I
    nop

    .line 596
    const/4 v8, 0x0

    .local v8, "index$iv":I
    move-object v9, v4

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    :goto_2
    if-ge v8, v9, :cond_2

    .line 597
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 598
    .local v10, "item$iv":Ljava/lang/Object;
    move-object v12, v10

    check-cast v12, Landroidx/compose/ui/layout/Measurable;

    .local v12, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v13, 0x0

    .line 295
    .local v13, "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$4":I
    sget-object v14, Landroidx/compose/ui/unit/Constraints;->Companion:Landroidx/compose/ui/unit/Constraints$Companion;

    iget v15, v1, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    iget v0, v2, Lkotlin/jvm/internal/Ref$IntRef;->element:I

    invoke-virtual {v14, v15, v0}, Landroidx/compose/ui/unit/Constraints$Companion;->fixed-JhjzzOo(II)J

    move-result-wide v14

    invoke-interface {v12, v14, v15}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v18

    const/16 v22, 0x4

    const/16 v23, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v17, p10

    invoke-static/range {v17 .. v23}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 296
    nop

    .line 598
    .end local v12    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v13    # "$i$a$-fastForEach-TabRowKt$ScrollableTabRow$2$1$1$2$4":I
    nop

    .line 596
    .end local v10    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p2

    goto :goto_2

    .line 600
    .end local v8    # "index$iv":I
    :cond_2
    nop

    .line 298
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEach":I
    nop

    .line 299
    move-object/from16 v0, p2

    check-cast v0, Landroidx/compose/ui/unit/Density;

    .line 300
    nop

    .line 301
    nop

    .line 302
    nop

    .line 298
    move/from16 v4, p0

    move-object/from16 v6, p4

    move/from16 v8, p5

    invoke-virtual {v6, v0, v4, v3, v8}, Landroidx/compose/material/ScrollableTabData;->onLaidOut(Landroidx/compose/ui/unit/Density;ILjava/util/List;I)V

    .line 304
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$1$1$0$2$2(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p1, "$tabPositions"    # Ljava/util/List;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "C292@14431L23:TabRow.kt#jmzs0o"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p3, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.ScrollableTabRow.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TabRow.kt:292)"

    const v3, -0x2933d4e

    invoke-static {v3, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 293
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, p1, p2, v0}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    :cond_2
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final ScrollableTabRow_sKfQg0A$lambda$2(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 14

    or-int/lit8 v0, p10, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v12

    move v1, p0

    move-object v2, p1

    move-wide/from16 v3, p2

    move-wide/from16 v5, p4

    move/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move/from16 v13, p11

    move-object/from16 v11, p12

    invoke-static/range {v1 .. v13}, Landroidx/compose/material/TabRowKt;->ScrollableTabRow-sKfQg0A(ILandroidx/compose/ui/Modifier;JJFLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final TabRow-pAZo6Ak(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
    .locals 25
    .param p0, "selectedTabIndex"    # I
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0"    # J
    .param p4, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0"    # J
    .param p6, "indicator"    # Lkotlin/jvm/functions/Function3;
    .param p7, "divider"    # Lkotlin/jvm/functions/Function2;
    .param p8, "tabs"    # Lkotlin/jvm/functions/Function2;
    .param p9, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p10, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroidx/compose/ui/Modifier;",
            "JJ",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/util/List<",
            "Landroidx/compose/material/TabPosition;",
            ">;-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/runtime/Composer;",
            "-",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 146
    move/from16 v1, p0

    move-object/from16 v9, p8

    move/from16 v10, p10

    const v0, 0x6bf9fe0

    move-object/from16 v2, p9

    invoke-interface {v2, v0}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v2

    .end local p9    # "$composer":Landroidx/compose/runtime/Composer;
    .local v2, "$composer":Landroidx/compose/runtime/Composer;
    const-string v3, "C(TabRow)N(selectedTabIndex,modifier,backgroundColor:c#ui.graphics.Color,contentColor:c#ui.graphics.Color,indicator,divider,tabs)150@7336L1392,146@7204L1524:TabRow.kt#jmzs0o"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p10

    .local v3, "$dirty":I
    and-int/lit8 v4, v10, 0x6

    if-nez v4, :cond_1

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x4

    goto :goto_0

    :cond_0
    const/4 v4, 0x2

    :goto_0
    or-int/2addr v3, v4

    :cond_1
    and-int/lit8 v4, p11, 0x2

    if-eqz v4, :cond_2

    or-int/lit8 v3, v3, 0x30

    move-object/from16 v5, p1

    goto :goto_2

    :cond_2
    and-int/lit8 v5, v10, 0x30

    if-nez v5, :cond_4

    move-object/from16 v5, p1

    invoke-interface {v2, v5}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    const/16 v6, 0x20

    goto :goto_1

    :cond_3
    const/16 v6, 0x10

    :goto_1
    or-int/2addr v3, v6

    goto :goto_2

    :cond_4
    move-object/from16 v5, p1

    :goto_2
    and-int/lit16 v6, v10, 0x180

    if-nez v6, :cond_7

    and-int/lit8 v6, p11, 0x4

    if-nez v6, :cond_5

    move-wide/from16 v6, p2

    invoke-interface {v2, v6, v7}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v8

    if-eqz v8, :cond_6

    const/16 v8, 0x100

    goto :goto_3

    :cond_5
    move-wide/from16 v6, p2

    :cond_6
    const/16 v8, 0x80

    :goto_3
    or-int/2addr v3, v8

    goto :goto_4

    :cond_7
    move-wide/from16 v6, p2

    :goto_4
    and-int/lit16 v8, v10, 0xc00

    if-nez v8, :cond_a

    and-int/lit8 v8, p11, 0x8

    if-nez v8, :cond_8

    move-wide/from16 v11, p4

    invoke-interface {v2, v11, v12}, Landroidx/compose/runtime/Composer;->changed(J)Z

    move-result v8

    if-eqz v8, :cond_9

    const/16 v8, 0x800

    goto :goto_5

    :cond_8
    move-wide/from16 v11, p4

    :cond_9
    const/16 v8, 0x400

    :goto_5
    or-int/2addr v3, v8

    goto :goto_6

    :cond_a
    move-wide/from16 v11, p4

    :goto_6
    and-int/lit8 v8, p11, 0x10

    if-eqz v8, :cond_b

    or-int/lit16 v3, v3, 0x6000

    move-object/from16 v13, p6

    goto :goto_8

    :cond_b
    and-int/lit16 v13, v10, 0x6000

    if-nez v13, :cond_d

    move-object/from16 v13, p6

    invoke-interface {v2, v13}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    const/16 v14, 0x4000

    goto :goto_7

    :cond_c
    const/16 v14, 0x2000

    :goto_7
    or-int/2addr v3, v14

    goto :goto_8

    :cond_d
    move-object/from16 v13, p6

    :goto_8
    and-int/lit8 v14, p11, 0x20

    const/high16 v15, 0x30000

    if-eqz v14, :cond_e

    or-int/2addr v3, v15

    move-object/from16 v15, p7

    goto :goto_a

    :cond_e
    and-int/2addr v15, v10

    if-nez v15, :cond_10

    move-object/from16 v15, p7

    invoke-interface {v2, v15}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_f

    const/high16 v16, 0x20000

    goto :goto_9

    :cond_f
    const/high16 v16, 0x10000

    :goto_9
    or-int v3, v3, v16

    goto :goto_a

    :cond_10
    move-object/from16 v15, p7

    :goto_a
    const/high16 v16, 0x180000

    and-int v17, v10, v16

    if-nez v17, :cond_12

    invoke-interface {v2, v9}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_11

    const/high16 v17, 0x100000

    goto :goto_b

    :cond_11
    const/high16 v17, 0x80000

    :goto_b
    or-int v3, v3, v17

    :cond_12
    const v17, 0x92493

    and-int v0, v3, v17

    move/from16 p9, v4

    const v4, 0x92492

    if-eq v0, v4, :cond_13

    const/4 v0, 0x1

    goto :goto_c

    :cond_13
    const/4 v0, 0x0

    :goto_c
    and-int/lit8 v4, v3, 0x1

    invoke-interface {v2, v0, v4}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->startDefaults()V

    const-string v0, "137@6739L6,138@6788L32,140@6927L125"

    invoke-static {v2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, v10, 0x1

    if-eqz v0, :cond_17

    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->getDefaultsInvalid()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_d

    .line 135
    :cond_14
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    and-int/lit8 v0, p11, 0x4

    if-eqz v0, :cond_15

    and-int/lit16 v3, v3, -0x381

    :cond_15
    and-int/lit8 v0, p11, 0x8

    if-eqz v0, :cond_16

    and-int/lit16 v0, v3, -0x1c01

    move v5, v0

    move-object v3, v13

    move-object v4, v15

    move-object/from16 v0, p1

    move-wide v13, v6

    move/from16 v6, v16

    move-wide v15, v11

    .end local v3    # "$dirty":I
    .local v0, "$dirty":I
    goto/16 :goto_12

    .end local v0    # "$dirty":I
    .restart local v3    # "$dirty":I
    :cond_16
    move-object/from16 v0, p1

    move v5, v3

    move-object v3, v13

    move-object v4, v15

    move-wide v13, v6

    move/from16 v6, v16

    move-wide v15, v11

    goto/16 :goto_12

    .line 146
    :cond_17
    :goto_d
    if-eqz p9, :cond_18

    .line 137
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    goto :goto_e

    .line 146
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :cond_18
    move-object/from16 v0, p1

    .line 137
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local v0    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_e
    and-int/lit8 v17, p11, 0x4

    if-eqz v17, :cond_19

    .line 138
    sget-object v4, Landroidx/compose/material/MaterialTheme;->INSTANCE:Landroidx/compose/material/MaterialTheme;

    const/4 v5, 0x6

    invoke-virtual {v4, v2, v5}, Landroidx/compose/material/MaterialTheme;->getColors(Landroidx/compose/runtime/Composer;I)Landroidx/compose/material/Colors;

    move-result-object v4

    invoke-static {v4}, Landroidx/compose/material/ColorsKt;->getPrimarySurface(Landroidx/compose/material/Colors;)J

    move-result-wide v4

    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v4, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    and-int/lit16 v3, v3, -0x381

    goto :goto_f

    .line 137
    .end local v4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :cond_19
    move-wide v4, v6

    .line 138
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local v4    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    :goto_f
    and-int/lit8 v6, p11, 0x8

    if-eqz v6, :cond_1a

    .line 139
    shr-int/lit8 v6, v3, 0x6

    and-int/lit8 v6, v6, 0xe

    invoke-static {v4, v5, v2, v6}, Landroidx/compose/material/ColorsKt;->contentColorFor-ek8zF_U(JLandroidx/compose/runtime/Composer;I)J

    move-result-wide v6

    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .local v6, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    and-int/lit16 v3, v3, -0x1c01

    goto :goto_10

    .line 138
    .end local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :cond_1a
    move-wide v6, v11

    .line 139
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :goto_10
    if-eqz v8, :cond_1b

    .line 141
    new-instance v8, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda10;

    invoke-direct {v8, v1}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda10;-><init>(I)V

    const v11, 0x71116865

    move-object/from16 p1, v0

    const/4 v0, 0x1

    const/16 v12, 0x36

    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    invoke-static {v11, v0, v8, v2, v12}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lkotlin/jvm/functions/Function3;

    move-object v13, v0

    .end local p6    # "indicator":Lkotlin/jvm/functions/Function3;
    .local v0, "indicator":Lkotlin/jvm/functions/Function3;
    goto :goto_11

    .line 139
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    .restart local p6    # "indicator":Lkotlin/jvm/functions/Function3;
    :cond_1b
    move-object/from16 p1, v0

    .line 141
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p6    # "indicator":Lkotlin/jvm/functions/Function3;
    .local v13, "indicator":Lkotlin/jvm/functions/Function3;
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    :goto_11
    if-eqz v14, :cond_1c

    sget-object v0, Landroidx/compose/material/ComposableSingletons$TabRowKt;->INSTANCE:Landroidx/compose/material/ComposableSingletons$TabRowKt;

    invoke-virtual {v0}, Landroidx/compose/material/ComposableSingletons$TabRowKt;->getLambda$-1216856915$material()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    move-wide/from16 v23, v4

    move v5, v3

    move-object v3, v13

    move-wide/from16 v13, v23

    move-wide/from16 v23, v6

    move/from16 v6, v16

    move-wide/from16 v15, v23

    move-object v4, v0

    move-object/from16 v0, p1

    .end local p7    # "divider":Lkotlin/jvm/functions/Function2;
    .local v0, "divider":Lkotlin/jvm/functions/Function2;
    goto :goto_12

    .end local v0    # "divider":Lkotlin/jvm/functions/Function2;
    .restart local p7    # "divider":Lkotlin/jvm/functions/Function2;
    :cond_1c
    move-wide/from16 v23, v4

    move v5, v3

    move-object v3, v13

    move-wide/from16 v13, v23

    move-object/from16 v0, p1

    move-object v4, v15

    move-wide/from16 v23, v6

    move/from16 v6, v16

    move-wide/from16 v15, v23

    .line 135
    .end local v6    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p7    # "divider":Lkotlin/jvm/functions/Function2;
    .local v0, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "indicator":Lkotlin/jvm/functions/Function3;
    .local v4, "divider":Lkotlin/jvm/functions/Function2;
    .local v5, "$dirty":I
    .local v13, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v15, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    :goto_12
    invoke-interface {v2}, Landroidx/compose/runtime/Composer;->endDefaults()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v7

    if-eqz v7, :cond_1d

    const/4 v7, -0x1

    const-string v8, "androidx.compose.material.TabRow (TabRow.kt:145)"

    const v11, 0x6bf9fe0

    invoke-static {v11, v5, v7, v8}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 148
    :cond_1d
    invoke-static {v0}, Landroidx/compose/foundation/selection/SelectableGroupKt;->selectableGroup(Landroidx/compose/ui/Modifier;)Landroidx/compose/ui/Modifier;

    move-result-object v11

    .line 149
    nop

    .line 150
    nop

    .line 151
    new-instance v7, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda11;

    invoke-direct {v7, v9, v4, v3}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda11;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;)V

    const v8, -0x260df3e4

    move/from16 p1, v6

    const/4 v6, 0x1

    const/16 v12, 0x36

    invoke-static {v8, v6, v7, v2, v12}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v6

    move-object/from16 v19, v6

    check-cast v19, Lkotlin/jvm/functions/Function2;

    and-int/lit16 v6, v5, 0x380

    or-int v6, v6, p1

    and-int/lit16 v7, v5, 0x1c00

    or-int v21, v6, v7

    .line 147
    const/4 v12, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v22, 0x32

    move-object/from16 v20, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v20, "$composer":Landroidx/compose/runtime/Composer;
    invoke-static/range {v11 .. v22}, Landroidx/compose/material/SurfaceKt;->Surface-F-jzlyU(Landroidx/compose/ui/Modifier;Landroidx/compose/ui/graphics/Shape;JJLandroidx/compose/foundation/BorderStroke;FLkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 184
    :cond_1e
    move-object v2, v0

    move-object v7, v3

    move-object v8, v4

    move v12, v5

    move-wide v3, v13

    move-wide v5, v15

    goto :goto_13

    .line 135
    .end local v0    # "modifier":Landroidx/compose/ui/Modifier;
    .end local v4    # "divider":Lkotlin/jvm/functions/Function2;
    .end local v5    # "$dirty":I
    .end local v13    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local v15    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local v20    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v3, "$dirty":I
    .restart local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .restart local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .restart local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .restart local p6    # "indicator":Lkotlin/jvm/functions/Function3;
    .restart local p7    # "divider":Lkotlin/jvm/functions/Function2;
    :cond_1f
    move-object/from16 v20, v2

    .end local v2    # "$composer":Landroidx/compose/runtime/Composer;
    .restart local v20    # "$composer":Landroidx/compose/runtime/Composer;
    invoke-interface/range {v20 .. v20}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    move-wide/from16 v23, v11

    move v12, v3

    move-wide v3, v6

    move-wide/from16 v5, v23

    move-object/from16 v2, p1

    move-object v7, v13

    move-object v8, v15

    .line 184
    .end local p1    # "modifier":Landroidx/compose/ui/Modifier;
    .end local p2    # "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .end local p4    # "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .end local p6    # "indicator":Lkotlin/jvm/functions/Function3;
    .end local p7    # "divider":Lkotlin/jvm/functions/Function2;
    .local v2, "modifier":Landroidx/compose/ui/Modifier;
    .local v3, "$v$c$androidx-compose-ui-graphics-Color$-backgroundColor$0":J
    .local v5, "$v$c$androidx-compose-ui-graphics-Color$-contentColor$0":J
    .local v7, "indicator":Lkotlin/jvm/functions/Function3;
    .local v8, "divider":Lkotlin/jvm/functions/Function2;
    .local v12, "$dirty":I
    :goto_13
    invoke-interface/range {v20 .. v20}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v13

    if-eqz v13, :cond_20

    new-instance v0, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda1;

    move/from16 v11, p11

    invoke-direct/range {v0 .. v11}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda1;-><init>(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;II)V

    invoke-interface {v13, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_20
    return-void
.end method

.method private static final TabRow_pAZo6Ak$lambda$0(ILjava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 11
    .param p0, "$selectedTabIndex"    # I
    .param p1, "tabPositions"    # Ljava/util/List;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "CN(tabPositions)141@6972L70:TabRow.kt#jmzs0o"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.TabRow.<anonymous> (TabRow.kt:141)"

    const v2, 0x71116865

    invoke-static {v2, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 142
    :cond_0
    sget-object v3, Landroidx/compose/material/TabRowDefaults;->INSTANCE:Landroidx/compose/material/TabRowDefaults;

    sget-object v0, Landroidx/compose/material/TabRowDefaults;->INSTANCE:Landroidx/compose/material/TabRowDefaults;

    sget-object v1, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v1, Landroidx/compose/ui/Modifier;

    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/compose/material/TabPosition;

    invoke-virtual {v0, v1, v2}, Landroidx/compose/material/TabRowDefaults;->tabIndicatorOffset(Landroidx/compose/ui/Modifier;Landroidx/compose/material/TabPosition;)Landroidx/compose/ui/Modifier;

    move-result-object v4

    const/16 v9, 0xc00

    const/4 v10, 0x6

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move-object v8, p2

    .end local p2    # "$composer":Landroidx/compose/runtime/Composer;
    .local v8, "$composer":Landroidx/compose/runtime/Composer;
    invoke-virtual/range {v3 .. v10}, Landroidx/compose/material/TabRowDefaults;->Indicator-9IZ8Weo(Landroidx/compose/ui/Modifier;FJLandroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 143
    :cond_1
    sget-object p2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p2
.end method

.method private static final TabRow_pAZo6Ak$lambda$1(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 9
    .param p0, "$tabs"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "C151@7388L1334,151@7346L1376:TabRow.kt#jmzs0o"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p4, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p4, 0x1

    invoke-interface {p3, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.TabRow.<anonymous> (TabRow.kt:151)"

    const v4, -0x260df3e4

    invoke-static {v4, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 152
    :cond_1
    sget-object v0, Landroidx/compose/ui/Modifier;->Companion:Landroidx/compose/ui/Modifier$Companion;

    check-cast v0, Landroidx/compose/ui/Modifier;

    const/4 v1, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v1, v3, v4}, Landroidx/compose/foundation/layout/SizeKt;->fillMaxWidth$default(Landroidx/compose/ui/Modifier;FILjava/lang/Object;)Landroidx/compose/ui/Modifier;

    move-result-object v0

    const v1, 0x259f80d2

    const-string v3, "CC(remember):TabRow.kt#9igjgp"

    invoke-static {p3, v1, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {p3, p0}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    invoke-interface {p3, p1}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    invoke-interface {p3, p2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    or-int/2addr v1, v3

    .local v1, "invalid$iv":Z
    move-object v3, p3

    .local v3, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v4, 0x0

    .line 492
    .local v4, "$i$f$cache":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v5

    .local v5, "it$iv":Ljava/lang/Object;
    const/4 v6, 0x0

    .line 493
    .local v6, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v1, :cond_3

    sget-object v7, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v7}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v7

    if-ne v5, v7, :cond_2

    goto :goto_1

    .line 497
    :cond_2
    goto :goto_2

    .line 494
    :cond_3
    :goto_1
    const/4 v7, 0x0

    .line 152
    .local v7, "$i$a$-cache-TabRowKt$TabRow$2$1":I
    new-instance v8, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda5;

    invoke-direct {v8, p0, p1, p2}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda5;-><init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;)V

    .line 494
    .end local v7    # "$i$a$-cache-TabRowKt$TabRow$2$1":I
    nop

    .line 495
    .local v8, "value$iv":Ljava/lang/Object;
    invoke-interface {v3, v8}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 496
    move-object v5, v8

    .line 492
    .end local v5    # "it$iv":Ljava/lang/Object;
    .end local v6    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v8    # "value$iv":Ljava/lang/Object;
    :goto_2
    nop

    .line 152
    .end local v1    # "invalid$iv":Z
    .end local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v4    # "$i$f$cache":I
    check-cast v5, Lkotlin/jvm/functions/Function2;

    invoke-static {p3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v1, 0x6

    invoke-static {v0, v5, p3, v1, v2}, Landroidx/compose/ui/layout/SubcomposeLayoutKt;->SubcomposeLayout(Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_3

    .line 151
    :cond_4
    invoke-interface {p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 183
    :cond_5
    :goto_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final TabRow_pAZo6Ak$lambda$1$0$0(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function3;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Landroidx/compose/ui/unit/Constraints;)Landroidx/compose/ui/layout/MeasureResult;
    .locals 27
    .param p0, "$tabs"    # Lkotlin/jvm/functions/Function2;
    .param p1, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p2, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p3, "$this$SubcomposeLayout"    # Landroidx/compose/ui/layout/SubcomposeMeasureScope;
    .param p4, "constraints"    # Landroidx/compose/ui/unit/Constraints;

    .line 153
    move-object/from16 v2, p3

    invoke-virtual/range {p4 .. p4}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v0

    invoke-static {v0, v1}, Landroidx/compose/ui/unit/Constraints;->getMaxWidth-impl(J)I

    move-result v3

    .line 154
    .local v3, "tabRowWidth":I
    sget-object v0, Landroidx/compose/material/TabSlots;->Tabs:Landroidx/compose/material/TabSlots;

    move-object/from16 v10, p0

    invoke-interface {v2, v0, v10}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v11

    .line 155
    .local v11, "tabMeasurables":Ljava/util/List;
    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v12

    .line 156
    .local v12, "tabCount":I
    div-int v15, v3, v12

    .line 158
    .local v15, "tabWidth":I
    move-object v0, v11

    .local v0, "$this$fastMap$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 498
    .local v1, "$i$f$fastMap":I
    nop

    .line 499
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 500
    .local v4, "target$iv":Ljava/util/ArrayList;
    move-object v5, v0

    .local v5, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 501
    .local v6, "$i$f$fastForEach":I
    nop

    .line 502
    const/4 v7, 0x0

    .local v7, "index$iv$iv":I
    move-object v8, v5

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_0
    if-ge v7, v8, :cond_0

    .line 503
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 504
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v21, v9

    .local v21, "it$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 500
    .local v22, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object v13, v4

    check-cast v13, Ljava/util/Collection;

    move-object/from16 v14, v21

    check-cast v14, Landroidx/compose/ui/layout/Measurable;

    .local v14, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v23, 0x0

    .line 159
    .local v23, "$i$a$-fastMap-TabRowKt$TabRow$2$1$1$tabPlaceables$1":I
    move-object/from16 v16, v13

    move-object/from16 v17, v14

    .end local v14    # "it":Landroidx/compose/ui/layout/Measurable;
    .local v17, "it":Landroidx/compose/ui/layout/Measurable;
    invoke-virtual/range {p4 .. p4}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v13

    const/16 v19, 0xc

    const/16 v20, 0x0

    move-object/from16 v18, v17

    .end local v17    # "it":Landroidx/compose/ui/layout/Measurable;
    .local v18, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v17, 0x0

    move-object/from16 v24, v18

    .end local v18    # "it":Landroidx/compose/ui/layout/Measurable;
    .local v24, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v18, 0x0

    move-object/from16 v25, v16

    move/from16 v16, v15

    move-object/from16 v26, v24

    move/from16 v24, v1

    move-object/from16 v1, v26

    move-object/from16 v26, v0

    move-object/from16 v0, v25

    .end local v0    # "$this$fastMap$iv":Ljava/util/List;
    .local v1, "it":Landroidx/compose/ui/layout/Measurable;
    .local v24, "$i$f$fastMap":I
    .local v26, "$this$fastMap$iv":Ljava/util/List;
    invoke-static/range {v13 .. v20}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v13

    invoke-interface {v1, v13, v14}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v1

    .line 500
    .end local v1    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v23    # "$i$a$-fastMap-TabRowKt$TabRow$2$1$1$tabPlaceables$1":I
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 504
    .end local v21    # "it$iv":Ljava/lang/Object;
    .end local v22    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 502
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    move/from16 v1, v24

    move-object/from16 v0, v26

    goto :goto_0

    .end local v24    # "$i$f$fastMap":I
    .end local v26    # "$this$fastMap$iv":Ljava/util/List;
    .restart local v0    # "$this$fastMap$iv":Ljava/util/List;
    .local v1, "$i$f$fastMap":I
    :cond_0
    move-object/from16 v26, v0

    move/from16 v24, v1

    .line 506
    .end local v0    # "$this$fastMap$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastMap":I
    .end local v7    # "index$iv$iv":I
    .restart local v24    # "$i$f$fastMap":I
    .restart local v26    # "$this$fastMap$iv":Ljava/util/List;
    nop

    .line 507
    .end local v5    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEach":I
    move-object v1, v4

    check-cast v1, Ljava/util/List;

    .line 158
    .end local v4    # "target$iv":Ljava/util/ArrayList;
    .end local v24    # "$i$f$fastMap":I
    .end local v26    # "$this$fastMap$iv":Ljava/util/List;
    nop

    .line 157
    nop

    .line 162
    .local v1, "tabPlaceables":Ljava/util/List;
    move-object v0, v1

    .local v0, "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v4, 0x0

    .line 508
    .local v4, "$i$f$fastMaxBy":I
    nop

    .line 509
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v5

    const/4 v7, 0x0

    if-eqz v5, :cond_1

    const/4 v5, 0x0

    goto :goto_2

    .line 510
    :cond_1
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .line 511
    .local v5, "maxElem$iv":Ljava/lang/Object;
    move-object v8, v5

    check-cast v8, Landroidx/compose/ui/layout/Placeable;

    .local v8, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v9, 0x0

    .line 162
    .local v9, "$i$a$-fastMaxBy-TabRowKt$TabRow$2$1$1$tabRowHeight$1":I
    invoke-virtual {v8}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v8

    .line 511
    .end local v8    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v9    # "$i$a$-fastMaxBy-TabRowKt$TabRow$2$1$1$tabRowHeight$1":I
    nop

    .line 512
    .local v8, "maxValue$iv":I
    const/4 v9, 0x1

    .local v9, "i$iv":I
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v13

    if-gt v9, v13, :cond_3

    .line 513
    :goto_1
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    .line 514
    .local v14, "e$iv":Ljava/lang/Object;
    move-object/from16 v16, v14

    check-cast v16, Landroidx/compose/ui/layout/Placeable;

    .local v16, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v17, 0x0

    .line 162
    .local v17, "$i$a$-fastMaxBy-TabRowKt$TabRow$2$1$1$tabRowHeight$1":I
    invoke-virtual/range {v16 .. v16}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v16

    .line 514
    .end local v16    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v17    # "$i$a$-fastMaxBy-TabRowKt$TabRow$2$1$1$tabRowHeight$1":I
    move/from16 v17, v16

    .line 515
    .local v17, "v$iv":I
    move/from16 v7, v17

    .end local v17    # "v$iv":I
    .local v7, "v$iv":I
    if-ge v8, v7, :cond_2

    .line 516
    move-object v5, v14

    .line 517
    move v8, v7

    .line 512
    .end local v7    # "v$iv":I
    .end local v14    # "e$iv":Ljava/lang/Object;
    :cond_2
    if-eq v9, v13, :cond_3

    add-int/lit8 v9, v9, 0x1

    const/4 v7, 0x0

    goto :goto_1

    .line 520
    .end local v9    # "i$iv":I
    :cond_3
    nop

    .line 162
    .end local v0    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v4    # "$i$f$fastMaxBy":I
    .end local v5    # "maxElem$iv":Ljava/lang/Object;
    .end local v8    # "maxValue$iv":I
    :goto_2
    check-cast v5, Landroidx/compose/ui/layout/Placeable;

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v0

    move v4, v0

    goto :goto_3

    :cond_4
    const/4 v4, 0x0

    .line 165
    .local v4, "tabRowHeight":I
    :goto_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v12}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v7, 0x0

    :goto_4
    if-ge v7, v12, :cond_5

    .line 521
    move v5, v7

    .local v5, "index":I
    const/4 v8, 0x0

    .line 165
    .local v8, "$i$a$-List-TabRowKt$TabRow$2$1$1$tabPositions$1":I
    new-instance v9, Landroidx/compose/material/TabPosition;

    invoke-interface {v2, v15}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->toDp-u2uoSUM(I)F

    move-result v13

    .local v13, "arg0$iv":F
    move v14, v5

    .local v14, "other$iv":I
    const/16 v16, 0x0

    .line 522
    .local v16, "$i$f$times-u2uoSUM":I
    int-to-float v6, v14

    mul-float/2addr v6, v13

    invoke-static {v6}, Landroidx/compose/ui/unit/Dp;->constructor-impl(F)F

    move-result v6

    .line 165
    .end local v13    # "arg0$iv":F
    .end local v14    # "other$iv":I
    .end local v16    # "$i$f$times-u2uoSUM":I
    invoke-interface {v2, v15}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->toDp-u2uoSUM(I)F

    move-result v13

    const/4 v14, 0x0

    invoke-direct {v9, v6, v13, v14}, Landroidx/compose/material/TabPosition;-><init>(FFLkotlin/jvm/internal/DefaultConstructorMarker;)V

    .end local v5    # "index":I
    .end local v8    # "$i$a$-List-TabRowKt$TabRow$2$1$1$tabPositions$1":I
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    :cond_5
    move-object v8, v0

    check-cast v8, Ljava/util/List;

    .line 164
    nop

    .line 167
    .local v8, "tabPositions":Ljava/util/List;
    move-object v13, v2

    check-cast v13, Landroidx/compose/ui/layout/MeasureScope;

    new-instance v0, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda6;

    move-object/from16 v7, p2

    move-object/from16 v5, p4

    move v9, v3

    move v6, v4

    move v4, v15

    move-object/from16 v3, p1

    .end local v3    # "tabRowWidth":I
    .end local v15    # "tabWidth":I
    .local v4, "tabWidth":I
    .local v6, "tabRowHeight":I
    .local v9, "tabRowWidth":I
    invoke-direct/range {v0 .. v9}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda6;-><init>(Ljava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;ILandroidx/compose/ui/unit/Constraints;ILkotlin/jvm/functions/Function3;Ljava/util/List;I)V

    move v4, v6

    move v3, v9

    move-object v6, v0

    move-object v0, v8

    .end local v6    # "tabRowHeight":I
    .end local v8    # "tabPositions":Ljava/util/List;
    .end local v9    # "tabRowWidth":I
    .local v0, "tabPositions":Ljava/util/List;
    .restart local v3    # "tabRowWidth":I
    .local v4, "tabRowHeight":I
    .restart local v15    # "tabWidth":I
    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v5, 0x0

    move-object v2, v13

    invoke-static/range {v2 .. v8}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v2

    .line 181
    return-object v2
.end method

.method private static final TabRow_pAZo6Ak$lambda$1$0$0$3(Ljava/util/List;Landroidx/compose/ui/layout/SubcomposeMeasureScope;Lkotlin/jvm/functions/Function2;ILandroidx/compose/ui/unit/Constraints;ILkotlin/jvm/functions/Function3;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 23
    .param p0, "$tabPlaceables"    # Ljava/util/List;
    .param p1, "$this_SubcomposeLayout"    # Landroidx/compose/ui/layout/SubcomposeMeasureScope;
    .param p2, "$divider"    # Lkotlin/jvm/functions/Function2;
    .param p3, "$tabWidth"    # I
    .param p4, "$constraints"    # Landroidx/compose/ui/unit/Constraints;
    .param p5, "$tabRowHeight"    # I
    .param p6, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p7, "$tabPositions"    # Ljava/util/List;
    .param p8, "$tabRowWidth"    # I
    .param p9, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 168
    move-object/from16 v0, p1

    move/from16 v1, p5

    move-object/from16 v2, p0

    .local v2, "$this$fastForEachIndexed$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 523
    .local v3, "$i$f$fastForEachIndexed":I
    nop

    .line 524
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v2

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v5

    :goto_0
    if-ge v4, v5, :cond_0

    .line 525
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 526
    .local v6, "item$iv":Ljava/lang/Object;
    move-object v8, v6

    check-cast v8, Landroidx/compose/ui/layout/Placeable;

    .local v8, "placeable":Landroidx/compose/ui/layout/Placeable;
    move v7, v4

    .local v7, "index":I
    move v14, v7

    .end local v7    # "index":I
    .local v14, "index":I
    const/4 v15, 0x0

    .line 169
    .local v15, "$i$a$-fastForEachIndexed-TabRowKt$TabRow$2$1$1$1$1":I
    mul-int v9, v14, p3

    const/4 v12, 0x4

    const/4 v13, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v7, p9

    invoke-static/range {v7 .. v13}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 170
    nop

    .line 526
    .end local v8    # "placeable":Landroidx/compose/ui/layout/Placeable;
    .end local v14    # "index":I
    .end local v15    # "$i$a$-fastForEachIndexed-TabRowKt$TabRow$2$1$1$1$1":I
    nop

    .line 524
    .end local v6    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 528
    .end local v4    # "index$iv":I
    :cond_0
    nop

    .line 172
    .end local v2    # "$this$fastForEachIndexed$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastForEachIndexed":I
    sget-object v2, Landroidx/compose/material/TabSlots;->Divider:Landroidx/compose/material/TabSlots;

    move-object/from16 v3, p2

    invoke-interface {v0, v2, v3}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v2

    .local v2, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v4, 0x0

    .line 529
    .local v4, "$i$f$fastForEach":I
    nop

    .line 530
    const/4 v5, 0x0

    .local v5, "index$iv":I
    move-object v6, v2

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->size()I

    move-result v6

    :goto_1
    if-ge v5, v6, :cond_1

    .line 531
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 532
    .local v7, "item$iv":Ljava/lang/Object;
    move-object v8, v7

    check-cast v8, Landroidx/compose/ui/layout/Measurable;

    .local v8, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v9, 0x0

    .line 173
    .local v9, "$i$a$-fastForEach-TabRowKt$TabRow$2$1$1$1$2":I
    invoke-virtual/range {p4 .. p4}, Landroidx/compose/ui/unit/Constraints;->unbox-impl()J

    move-result-wide v10

    const/16 v16, 0xb

    const/16 v17, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-static/range {v10 .. v17}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v10

    invoke-interface {v8, v10, v11}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v17

    .line 174
    .local v17, "placeable":Landroidx/compose/ui/layout/Placeable;
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v10

    sub-int v19, v1, v10

    const/16 v21, 0x4

    const/16 v22, 0x0

    const/16 v18, 0x0

    const/16 v20, 0x0

    move-object/from16 v16, p9

    invoke-static/range {v16 .. v22}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 175
    nop

    .line 532
    .end local v8    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v9    # "$i$a$-fastForEach-TabRowKt$TabRow$2$1$1$1$2":I
    .end local v17    # "placeable":Landroidx/compose/ui/layout/Placeable;
    nop

    .line 530
    .end local v7    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 534
    .end local v5    # "index$iv":I
    :cond_1
    nop

    .line 177
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v4    # "$i$f$fastForEach":I
    sget-object v2, Landroidx/compose/material/TabSlots;->Indicator:Landroidx/compose/material/TabSlots;

    new-instance v4, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda7;

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    invoke-direct {v4, v5, v6}, Landroidx/compose/material/TabRowKt$$ExternalSyntheticLambda7;-><init>(Lkotlin/jvm/functions/Function3;Ljava/util/List;)V

    const v7, -0xd271620

    const/4 v8, 0x1

    invoke-static {v7, v8, v4}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->composableLambdaInstance(IZLjava/lang/Object;)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v4

    check-cast v4, Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, v2, v4}, Landroidx/compose/ui/layout/SubcomposeMeasureScope;->subcompose(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/util/List;

    move-result-object v2

    .line 178
    nop

    .restart local v2    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v4, 0x0

    .line 535
    .restart local v4    # "$i$f$fastForEach":I
    nop

    .line 536
    const/4 v7, 0x0

    .local v7, "index$iv":I
    move-object v8, v2

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_2
    if-ge v7, v8, :cond_2

    .line 537
    invoke-interface {v2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 538
    .local v9, "item$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/compose/ui/layout/Measurable;

    .local v10, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v11, 0x0

    .line 179
    .local v11, "$i$a$-fastForEach-TabRowKt$TabRow$2$1$1$1$4":I
    sget-object v12, Landroidx/compose/ui/unit/Constraints;->Companion:Landroidx/compose/ui/unit/Constraints$Companion;

    move/from16 v13, p8

    invoke-virtual {v12, v13, v1}, Landroidx/compose/ui/unit/Constraints$Companion;->fixed-JhjzzOo(II)J

    move-result-wide v14

    invoke-interface {v10, v14, v15}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v17

    const/16 v21, 0x4

    const/16 v22, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v16, p9

    invoke-static/range {v16 .. v22}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 180
    nop

    .line 538
    .end local v10    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v11    # "$i$a$-fastForEach-TabRowKt$TabRow$2$1$1$1$4":I
    nop

    .line 536
    .end local v9    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_2
    move/from16 v13, p8

    .line 540
    .end local v7    # "index$iv":I
    nop

    .line 181
    .end local v2    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v4    # "$i$f$fastForEach":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v2
.end method

.method private static final TabRow_pAZo6Ak$lambda$1$0$0$3$2(Lkotlin/jvm/functions/Function3;Ljava/util/List;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$indicator"    # Lkotlin/jvm/functions/Function3;
    .param p1, "$tabPositions"    # Ljava/util/List;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I

    const-string v0, "C176@8515L23:TabRow.kt#jmzs0o"

    invoke-static {p2, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p3, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p3, 0x1

    invoke-interface {p2, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.compose.material.TabRow.<anonymous>.<anonymous>.<anonymous>.<anonymous>.<anonymous> (TabRow.kt:176)"

    const v3, -0xd271620

    invoke-static {v3, p3, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 177
    :cond_1
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p0, p1, p2, v0}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    :cond_2
    invoke-interface {p2}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final TabRow_pAZo6Ak$lambda$2(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 13

    or-int/lit8 v0, p9, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v11

    move v1, p0

    move-object v2, p1

    move-wide v3, p2

    move-wide/from16 v5, p4

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move/from16 v12, p10

    move-object/from16 v10, p11

    invoke-static/range {v1 .. v12}, Landroidx/compose/material/TabRowKt;->TabRow-pAZo6Ak(ILandroidx/compose/ui/Modifier;JJLkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final synthetic access$getScrollableTabRowScrollSpec$p()Landroidx/compose/animation/core/AnimationSpec;
    .locals 1

    .line 1
    sget-object v0, Landroidx/compose/material/TabRowKt;->ScrollableTabRowScrollSpec:Landroidx/compose/animation/core/AnimationSpec;

    return-object v0
.end method
