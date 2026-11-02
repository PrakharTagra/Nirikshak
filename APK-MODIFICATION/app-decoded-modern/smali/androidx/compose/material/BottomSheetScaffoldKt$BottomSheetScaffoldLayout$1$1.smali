.class final Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;
.super Ljava/lang/Object;
.source "BottomSheetScaffold.kt"

# interfaces
.implements Landroidx/compose/ui/layout/MultiContentMeasurePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/compose/material/BottomSheetScaffoldKt;->BottomSheetScaffoldLayout-HJHHjMs(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;FLkotlin/jvm/functions/Function0;ILandroidx/compose/material/BottomSheetState;Landroidx/compose/runtime/Composer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$WhenMappings;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nBottomSheetScaffold.kt\nKotlin\n*S Kotlin\n*F\n+ 1 BottomSheetScaffold.kt\nandroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1\n+ 2 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n*L\n1#1,601:1\n150#2,3:602\n34#2,6:605\n153#2:611\n150#2,3:612\n34#2,6:615\n153#2:621\n168#2,13:622\n150#2,3:635\n34#2,6:638\n153#2:644\n150#2,3:645\n34#2,6:648\n153#2:654\n168#2,13:655\n168#2,13:668\n150#2,3:681\n34#2,6:684\n153#2:690\n168#2,13:691\n168#2,13:704\n34#2,6:717\n34#2,6:723\n34#2,6:729\n34#2,6:735\n34#2,6:741\n*S KotlinDebug\n*F\n+ 1 BottomSheetScaffold.kt\nandroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1\n*L\n492#1:602,3\n492#1:605,6\n492#1:611\n494#1:612,3\n494#1:615,6\n494#1:621\n495#1:622,13\n498#1:635,3\n498#1:638,6\n498#1:644\n500#1:645,3\n500#1:648,6\n500#1:654\n501#1:655,13\n502#1:668,13\n504#1:681,3\n504#1:684,6\n504#1:690\n505#1:691,13\n506#1:704,13\n532#1:717,6\n533#1:723,6\n534#1:729,6\n535#1:735,6\n536#1:741,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $$v$c$androidx-compose-material-FabPosition$-floatingActionButtonPosition$0:I

.field final synthetic $$v$c$androidx-compose-ui-unit-Dp$-sheetPeekHeight$0:F

.field final synthetic $sheetOffset:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $sheetState:Landroidx/compose/material/BottomSheetState;


# direct methods
.method public static synthetic $r8$lambda$QjNtxO_wSt25qy8VSAu4ERGjmH4(Lkotlin/jvm/functions/Function0;ILandroidx/compose/ui/layout/MeasureScope;IIFIILandroidx/compose/material/BottomSheetState;IILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p17}, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->measure_3p2s80s$lambda$10(Lkotlin/jvm/functions/Function0;ILandroidx/compose/ui/layout/MeasureScope;IIFIILandroidx/compose/material/BottomSheetState;IILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Lkotlin/jvm/functions/Function0;IFLandroidx/compose/material/BottomSheetState;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Float;",
            ">;IF",
            "Landroidx/compose/material/BottomSheetState;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$sheetOffset:Lkotlin/jvm/functions/Function0;

    iput p2, p0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$$v$c$androidx-compose-material-FabPosition$-floatingActionButtonPosition$0:I

    iput p3, p0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$$v$c$androidx-compose-ui-unit-Dp$-sheetPeekHeight$0:F

    iput-object p4, p0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$sheetState:Landroidx/compose/material/BottomSheetState;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final measure_3p2s80s$lambda$10(Lkotlin/jvm/functions/Function0;ILandroidx/compose/ui/layout/MeasureScope;IIFIILandroidx/compose/material/BottomSheetState;IILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 21
    .param p0, "$sheetOffset"    # Lkotlin/jvm/functions/Function0;
    .param p1, "$$v$c$androidx-compose-material-FabPosition$-floatingActionButtonPosition$0"    # I
    .param p2, "$this_Layout"    # Landroidx/compose/ui/layout/MeasureScope;
    .param p3, "$layoutWidth"    # I
    .param p4, "$fabWidth"    # I
    .param p5, "$$v$c$androidx-compose-ui-unit-Dp$-sheetPeekHeight$0"    # F
    .param p6, "$fabHeight"    # I
    .param p7, "$snackbarWidth"    # I
    .param p8, "$sheetState"    # Landroidx/compose/material/BottomSheetState;
    .param p9, "$snackbarHeight"    # I
    .param p10, "$layoutHeight"    # I
    .param p11, "$bodyPlaceables"    # Ljava/util/List;
    .param p12, "$topBarPlaceables"    # Ljava/util/List;
    .param p13, "$sheetPlaceables"    # Ljava/util/List;
    .param p14, "$fabPlaceable"    # Ljava/util/List;
    .param p15, "$snackbarPlaceables"    # Ljava/util/List;
    .param p16, "$topBarHeight"    # I
    .param p17, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 509
    move/from16 v0, p1

    move-object/from16 v1, p2

    invoke-interface/range {p0 .. p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    invoke-static {v2}, Lkotlin/math/MathKt;->roundToInt(F)I

    move-result v2

    .line 512
    .local v2, "sheetOffsetY":I
    nop

    .line 513
    sget-object v3, Landroidx/compose/material/FabPosition;->Companion:Landroidx/compose/material/FabPosition$Companion;

    invoke-virtual {v3}, Landroidx/compose/material/FabPosition$Companion;->getStart-5ygKITE()I

    move-result v3

    invoke-static {v0, v3}, Landroidx/compose/material/FabPosition;->equals-impl0(II)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Landroidx/compose/material/BottomSheetScaffoldKt;->access$getFabSpacing$p()F

    move-result v3

    invoke-interface {v1, v3}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v3

    goto :goto_0

    .line 514
    :cond_0
    sget-object v3, Landroidx/compose/material/FabPosition;->Companion:Landroidx/compose/material/FabPosition$Companion;

    invoke-virtual {v3}, Landroidx/compose/material/FabPosition$Companion;->getCenter-5ygKITE()I

    move-result v3

    invoke-static {v0, v3}, Landroidx/compose/material/FabPosition;->equals-impl0(II)Z

    move-result v3

    if-eqz v3, :cond_1

    sub-int v3, p3, p4

    div-int/lit8 v3, v3, 0x2

    goto :goto_0

    .line 515
    :cond_1
    sub-int v3, p3, p4

    invoke-static {}, Landroidx/compose/material/BottomSheetScaffoldKt;->access$getFabSpacing$p()F

    move-result v4

    invoke-interface {v1, v4}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v4

    sub-int/2addr v3, v4

    .line 512
    :goto_0
    nop

    .line 511
    move v6, v3

    .line 520
    .local v6, "fabOffsetX":I
    move/from16 v3, p5

    invoke-interface {v1, v3}, Landroidx/compose/ui/layout/MeasureScope;->toPx-0680j_4(F)F

    move-result v4

    div-int/lit8 v5, p6, 0x2

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_2

    .line 521
    sub-int v4, v2, p6

    invoke-static {}, Landroidx/compose/material/BottomSheetScaffoldKt;->access$getFabSpacing$p()F

    move-result v5

    invoke-interface {v1, v5}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v5

    sub-int/2addr v4, v5

    move v7, v4

    goto :goto_1

    .line 522
    :cond_2
    div-int/lit8 v4, p6, 0x2

    sub-int v4, v2, v4

    move v7, v4

    .line 520
    :goto_1
    nop

    .line 519
    nop

    .line 524
    .local v7, "fabOffsetY":I
    sub-int v4, p3, p7

    div-int/lit8 v11, v4, 0x2

    .line 526
    .local v11, "snackbarOffsetX":I
    invoke-virtual/range {p8 .. p8}, Landroidx/compose/material/BottomSheetState;->getCurrentValue()Landroidx/compose/material/BottomSheetValue;

    move-result-object v4

    sget-object v5, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v4}, Landroidx/compose/material/BottomSheetValue;->ordinal()I

    move-result v4

    aget v4, v5, v4

    packed-switch v4, :pswitch_data_0

    new-instance v4, Lkotlin/NoWhenBranchMatchedException;

    invoke-direct {v4}, Lkotlin/NoWhenBranchMatchedException;-><init>()V

    throw v4

    .line 528
    :pswitch_0
    sub-int v4, p10, p9

    goto :goto_2

    .line 527
    :pswitch_1
    sub-int v4, v7, p9

    .line 525
    :goto_2
    move v12, v4

    .line 532
    .local v12, "snackbarOffsetY":I
    move-object/from16 v4, p11

    .local v4, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 717
    .local v5, "$i$f$fastForEach":I
    nop

    .line 718
    const/4 v8, 0x0

    .local v8, "index$iv":I
    move-object v9, v4

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    :goto_3
    if-ge v8, v9, :cond_3

    .line 719
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 720
    .local v10, "item$iv":Ljava/lang/Object;
    move-object v14, v10

    check-cast v14, Landroidx/compose/ui/layout/Placeable;

    .local v14, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v20, 0x0

    .line 532
    .local v20, "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$1":I
    const/16 v18, 0x4

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    move/from16 v16, p16

    move-object/from16 v13, p17

    invoke-static/range {v13 .. v19}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 720
    .end local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v20    # "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$1":I
    nop

    .line 718
    .end local v10    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 722
    .end local v8    # "index$iv":I
    :cond_3
    nop

    .line 533
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEach":I
    move-object/from16 v4, p12

    .restart local v4    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 723
    .restart local v5    # "$i$f$fastForEach":I
    nop

    .line 724
    const/4 v8, 0x0

    .restart local v8    # "index$iv":I
    move-object v9, v4

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    :goto_4
    if-ge v8, v9, :cond_4

    .line 725
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 726
    .restart local v10    # "item$iv":Ljava/lang/Object;
    move-object v14, v10

    check-cast v14, Landroidx/compose/ui/layout/Placeable;

    .restart local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v20, 0x0

    .line 533
    .local v20, "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$2":I
    const/16 v18, 0x4

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v13, p17

    invoke-static/range {v13 .. v19}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 726
    .end local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v20    # "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$2":I
    nop

    .line 724
    .end local v10    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v8, v8, 0x1

    goto :goto_4

    .line 728
    .end local v8    # "index$iv":I
    :cond_4
    nop

    .line 534
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEach":I
    move-object/from16 v4, p13

    .restart local v4    # "$this$fastForEach$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 729
    .restart local v5    # "$i$f$fastForEach":I
    nop

    .line 730
    const/4 v8, 0x0

    .restart local v8    # "index$iv":I
    move-object v9, v4

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v9

    :goto_5
    if-ge v8, v9, :cond_5

    .line 731
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 732
    .restart local v10    # "item$iv":Ljava/lang/Object;
    move-object v14, v10

    check-cast v14, Landroidx/compose/ui/layout/Placeable;

    .restart local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v20, 0x0

    .line 534
    .local v20, "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$3":I
    const/16 v18, 0x4

    const/16 v19, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v13, p17

    invoke-static/range {v13 .. v19}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 732
    .end local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v20    # "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$3":I
    nop

    .line 730
    .end local v10    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    .line 734
    .end local v8    # "index$iv":I
    :cond_5
    nop

    .line 535
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEach":I
    move-object/from16 v13, p14

    .local v13, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v14, 0x0

    .line 735
    .local v14, "$i$f$fastForEach":I
    nop

    .line 736
    const/4 v4, 0x0

    .local v4, "index$iv":I
    move-object v5, v13

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v15

    :goto_6
    if-ge v4, v15, :cond_6

    .line 737
    invoke-interface {v13, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 738
    .local v16, "item$iv":Ljava/lang/Object;
    move-object/from16 v5, v16

    check-cast v5, Landroidx/compose/ui/layout/Placeable;

    .local v5, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v17, 0x0

    .line 535
    .local v17, "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$4":I
    const/4 v9, 0x4

    const/4 v10, 0x0

    const/4 v8, 0x0

    move/from16 v18, v4

    move-object/from16 v4, p17

    .end local v4    # "index$iv":I
    .local v18, "index$iv":I
    invoke-static/range {v4 .. v10}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 738
    .end local v5    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v17    # "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$4":I
    nop

    .line 736
    .end local v16    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v4, v18, 0x1

    .end local v18    # "index$iv":I
    .restart local v4    # "index$iv":I
    goto :goto_6

    :cond_6
    move/from16 v18, v4

    .line 740
    .end local v4    # "index$iv":I
    nop

    .line 536
    .end local v13    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v14    # "$i$f$fastForEach":I
    move-object/from16 v4, p15

    .local v4, "$this$fastForEach$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 741
    .local v5, "$i$f$fastForEach":I
    nop

    .line 742
    const/4 v8, 0x0

    .restart local v8    # "index$iv":I
    move-object v9, v4

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->size()I

    move-result v15

    :goto_7
    if-ge v8, v15, :cond_7

    .line 743
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 744
    .restart local v16    # "item$iv":Ljava/lang/Object;
    move-object/from16 v9, v16

    check-cast v9, Landroidx/compose/ui/layout/Placeable;

    .local v9, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v17, 0x0

    .line 536
    .local v17, "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$5":I
    const/4 v13, 0x4

    const/4 v14, 0x0

    move v10, v11

    move v11, v12

    .end local v12    # "snackbarOffsetY":I
    .local v10, "snackbarOffsetX":I
    .local v11, "snackbarOffsetY":I
    const/4 v12, 0x0

    move/from16 v18, v8

    move-object/from16 v8, p17

    .end local v8    # "index$iv":I
    .restart local v18    # "index$iv":I
    invoke-static/range {v8 .. v14}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 744
    .end local v9    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v17    # "$i$a$-fastForEach-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$1$5":I
    nop

    .line 742
    .end local v16    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v8, v18, 0x1

    move v12, v11

    move v11, v10

    .end local v18    # "index$iv":I
    .restart local v8    # "index$iv":I
    goto :goto_7

    .line 746
    .end local v8    # "index$iv":I
    .end local v10    # "snackbarOffsetX":I
    .local v11, "snackbarOffsetX":I
    .restart local v12    # "snackbarOffsetY":I
    :cond_7
    nop

    .line 537
    .end local v4    # "$this$fastForEach$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEach":I
    sget-object v4, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final measure-3p2s80s(Landroidx/compose/ui/layout/MeasureScope;Ljava/util/List;J)Landroidx/compose/ui/layout/MeasureResult;
    .locals 35
    .param p1, "$this$Layout"    # Landroidx/compose/ui/layout/MeasureScope;
    .param p3, "$v$c$androidx-compose-ui-unit-Constraints$-constraints$0"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/layout/MeasureScope;",
            "Ljava/util/List<",
            "+",
            "Ljava/util/List<",
            "+",
            "Landroidx/compose/ui/layout/Measurable;",
            ">;>;J)",
            "Landroidx/compose/ui/layout/MeasureResult;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    .local v3, "topBarMeasurables":Ljava/util/List;
    const/4 v4, 0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    .local v4, "bodyMeasurables":Ljava/util/List;
    const/4 v5, 0x2

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .local v5, "sheetMeasurables":Ljava/util/List;
    const/4 v6, 0x3

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .local v6, "fabMeasurables":Ljava/util/List;
    const/4 v7, 0x4

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 488
    .local v1, "snackbarHostMeasurables":Ljava/util/List;
    invoke-static/range {p3 .. p4}, Landroidx/compose/ui/unit/Constraints;->getMaxWidth-impl(J)I

    move-result v11

    .line 489
    .local v11, "layoutWidth":I
    invoke-static/range {p3 .. p4}, Landroidx/compose/ui/unit/Constraints;->getMaxHeight-impl(J)I

    move-result v18

    .line 490
    .local v18, "layoutHeight":I
    const/16 v25, 0xa

    const/16 v26, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-wide/from16 v19, p3

    invoke-static/range {v19 .. v26}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v7

    .line 492
    .local v7, "looseConstraints":J
    move-object v9, v5

    .local v9, "$this$fastMap$iv":Ljava/util/List;
    const/4 v10, 0x0

    .line 602
    .local v10, "$i$f$fastMap":I
    nop

    .line 603
    new-instance v12, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 604
    .local v12, "target$iv":Ljava/util/ArrayList;
    move-object v13, v9

    .local v13, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v14, 0x0

    .line 605
    .local v14, "$i$f$fastForEach":I
    nop

    .line 606
    const/4 v15, 0x0

    .local v15, "index$iv$iv":I
    move-object/from16 v16, v13

    check-cast v16, Ljava/util/Collection;

    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->size()I

    move-result v2

    :goto_0
    if-ge v15, v2, :cond_0

    .line 607
    invoke-interface {v13, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 608
    .local v16, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v19, v16

    .local v19, "it$iv":Ljava/lang/Object;
    const/16 v20, 0x0

    .line 604
    .local v20, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object/from16 p2, v1

    .end local v1    # "snackbarHostMeasurables":Ljava/util/List;
    .local p2, "snackbarHostMeasurables":Ljava/util/List;
    move-object v1, v12

    check-cast v1, Ljava/util/Collection;

    move/from16 v21, v2

    move-object/from16 v2, v19

    check-cast v2, Landroidx/compose/ui/layout/Measurable;

    .local v2, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v22, 0x0

    .line 492
    .local v22, "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$sheetPlaceables$1":I
    invoke-interface {v2, v7, v8}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v2

    .line 604
    .end local v2    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v22    # "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$sheetPlaceables$1":I
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 608
    .end local v19    # "it$iv":Ljava/lang/Object;
    .end local v20    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 606
    .end local v16    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v1, p2

    move/from16 v2, v21

    goto :goto_0

    .end local p2    # "snackbarHostMeasurables":Ljava/util/List;
    .restart local v1    # "snackbarHostMeasurables":Ljava/util/List;
    :cond_0
    move-object/from16 p2, v1

    .line 610
    .end local v1    # "snackbarHostMeasurables":Ljava/util/List;
    .end local v15    # "index$iv$iv":I
    .restart local p2    # "snackbarHostMeasurables":Ljava/util/List;
    nop

    .line 611
    .end local v13    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v14    # "$i$f$fastForEach":I
    move-object/from16 v21, v12

    check-cast v21, Ljava/util/List;

    .line 492
    .end local v9    # "$this$fastMap$iv":Ljava/util/List;
    .end local v10    # "$i$f$fastMap":I
    .end local v12    # "target$iv":Ljava/util/ArrayList;
    nop

    .line 494
    .local v21, "sheetPlaceables":Ljava/util/List;
    move-object v1, v3

    .local v1, "$this$fastMap$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 612
    .local v2, "$i$f$fastMap":I
    nop

    .line 613
    new-instance v9, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 614
    .local v9, "target$iv":Ljava/util/ArrayList;
    move-object v10, v1

    .local v10, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v12, 0x0

    .line 615
    .local v12, "$i$f$fastForEach":I
    nop

    .line 616
    const/4 v13, 0x0

    .local v13, "index$iv$iv":I
    move-object v14, v10

    check-cast v14, Ljava/util/Collection;

    invoke-interface {v14}, Ljava/util/Collection;->size()I

    move-result v14

    :goto_1
    if-ge v13, v14, :cond_1

    .line 617
    invoke-interface {v10, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 618
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    .local v16, "it$iv":Ljava/lang/Object;
    const/16 v19, 0x0

    .line 614
    .local v19, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object/from16 v20, v1

    .end local v1    # "$this$fastMap$iv":Ljava/util/List;
    .local v20, "$this$fastMap$iv":Ljava/util/List;
    move-object v1, v9

    check-cast v1, Ljava/util/Collection;

    move/from16 v22, v2

    .end local v2    # "$i$f$fastMap":I
    .local v22, "$i$f$fastMap":I
    move-object/from16 v2, v16

    check-cast v2, Landroidx/compose/ui/layout/Measurable;

    .local v2, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v23, 0x0

    .line 494
    .local v23, "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarPlaceables$1":I
    invoke-interface {v2, v7, v8}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v2

    .line 614
    .end local v2    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v23    # "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarPlaceables$1":I
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 618
    .end local v16    # "it$iv":Ljava/lang/Object;
    .end local v19    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 616
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v1, v20

    move/from16 v2, v22

    goto :goto_1

    .end local v20    # "$this$fastMap$iv":Ljava/util/List;
    .end local v22    # "$i$f$fastMap":I
    .restart local v1    # "$this$fastMap$iv":Ljava/util/List;
    .local v2, "$i$f$fastMap":I
    :cond_1
    move-object/from16 v20, v1

    move/from16 v22, v2

    .line 620
    .end local v1    # "$this$fastMap$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMap":I
    .end local v13    # "index$iv$iv":I
    .restart local v20    # "$this$fastMap$iv":Ljava/util/List;
    .restart local v22    # "$i$f$fastMap":I
    nop

    .line 621
    .end local v10    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v12    # "$i$f$fastForEach":I
    move-object/from16 v20, v9

    check-cast v20, Ljava/util/List;

    .line 494
    .end local v9    # "target$iv":Ljava/util/ArrayList;
    .end local v20    # "$this$fastMap$iv":Ljava/util/List;
    .end local v22    # "$i$f$fastMap":I
    nop

    .line 495
    .local v20, "topBarPlaceables":Ljava/util/List;
    move-object/from16 v1, v20

    .local v1, "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 622
    .local v2, "$i$f$fastMaxBy":I
    nop

    .line 623
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2

    const/4 v12, 0x0

    goto :goto_3

    .line 624
    :cond_2
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 625
    .local v12, "maxElem$iv":Ljava/lang/Object;
    move-object v9, v12

    check-cast v9, Landroidx/compose/ui/layout/Placeable;

    .local v9, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v13, 0x0

    .line 495
    .local v13, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarHeight$1":I
    invoke-virtual {v9}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v9

    .line 625
    .end local v9    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v13    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarHeight$1":I
    nop

    .line 626
    .local v9, "maxValue$iv":I
    const/4 v13, 0x1

    .local v13, "i$iv":I
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v14

    if-gt v13, v14, :cond_4

    .line 627
    :goto_2
    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 628
    .local v15, "e$iv":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Landroidx/compose/ui/layout/Placeable;

    .local v16, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v19, 0x0

    .line 495
    .local v19, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarHeight$1":I
    invoke-virtual/range {v16 .. v16}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v16

    .line 628
    .end local v16    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v19    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$topBarHeight$1":I
    move/from16 v19, v16

    .line 629
    .local v19, "v$iv":I
    move/from16 v10, v19

    .end local v19    # "v$iv":I
    .local v10, "v$iv":I
    if-ge v9, v10, :cond_3

    .line 630
    move-object v12, v15

    .line 631
    move v9, v10

    .line 626
    .end local v10    # "v$iv":I
    .end local v15    # "e$iv":Ljava/lang/Object;
    :cond_3
    if-eq v13, v14, :cond_4

    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 634
    .end local v13    # "i$iv":I
    :cond_4
    nop

    .line 495
    .end local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMaxBy":I
    .end local v9    # "maxValue$iv":I
    .end local v12    # "maxElem$iv":Ljava/lang/Object;
    :goto_3
    check-cast v12, Landroidx/compose/ui/layout/Placeable;

    if-eqz v12, :cond_5

    invoke-virtual {v12}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v1

    move/from16 v24, v1

    goto :goto_4

    :cond_5
    const/16 v24, 0x0

    .line 497
    .local v24, "topBarHeight":I
    :goto_4
    sub-int v32, v18, v24

    const/16 v33, 0x7

    const/16 v34, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    move-wide/from16 v27, v7

    .end local v7    # "looseConstraints":J
    .local v27, "looseConstraints":J
    invoke-static/range {v27 .. v34}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v1

    .line 498
    .end local v27    # "looseConstraints":J
    .local v1, "bodyConstraints":J
    .restart local v7    # "looseConstraints":J
    move-object v9, v4

    .local v9, "$this$fastMap$iv":Ljava/util/List;
    const/4 v10, 0x0

    .line 635
    .local v10, "$i$f$fastMap":I
    nop

    .line 636
    new-instance v12, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 637
    .local v12, "target$iv":Ljava/util/ArrayList;
    move-object v13, v9

    .local v13, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v14, 0x0

    .line 638
    .restart local v14    # "$i$f$fastForEach":I
    nop

    .line 639
    const/4 v15, 0x0

    .local v15, "index$iv$iv":I
    move-object/from16 v19, v13

    check-cast v19, Ljava/util/Collection;

    move-object/from16 v25, v3

    .end local v3    # "topBarMeasurables":Ljava/util/List;
    .local v25, "topBarMeasurables":Ljava/util/List;
    invoke-interface/range {v19 .. v19}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_5
    if-ge v15, v3, :cond_6

    .line 640
    invoke-interface {v13, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    .line 641
    .local v19, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v22, v19

    .local v22, "it$iv":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 637
    .local v23, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move/from16 v26, v3

    move-object v3, v12

    check-cast v3, Ljava/util/Collection;

    move-object/from16 v27, v4

    .end local v4    # "bodyMeasurables":Ljava/util/List;
    .local v27, "bodyMeasurables":Ljava/util/List;
    move-object/from16 v4, v22

    check-cast v4, Landroidx/compose/ui/layout/Measurable;

    .local v4, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v28, 0x0

    .line 498
    .local v28, "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$bodyPlaceables$1":I
    invoke-interface {v4, v1, v2}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v4

    .line 637
    .end local v4    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v28    # "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$bodyPlaceables$1":I
    invoke-interface {v3, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 641
    .end local v22    # "it$iv":Ljava/lang/Object;
    .end local v23    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 639
    .end local v19    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v15, v15, 0x1

    move/from16 v3, v26

    move-object/from16 v4, v27

    goto :goto_5

    .end local v27    # "bodyMeasurables":Ljava/util/List;
    .local v4, "bodyMeasurables":Ljava/util/List;
    :cond_6
    move-object/from16 v27, v4

    .line 643
    .end local v4    # "bodyMeasurables":Ljava/util/List;
    .end local v15    # "index$iv$iv":I
    .restart local v27    # "bodyMeasurables":Ljava/util/List;
    nop

    .line 644
    .end local v13    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v14    # "$i$f$fastForEach":I
    move-object/from16 v19, v12

    check-cast v19, Ljava/util/List;

    .line 498
    .end local v9    # "$this$fastMap$iv":Ljava/util/List;
    .end local v10    # "$i$f$fastMap":I
    .end local v12    # "target$iv":Ljava/util/ArrayList;
    nop

    .line 500
    .local v19, "bodyPlaceables":Ljava/util/List;
    move-object v3, v6

    .local v3, "$this$fastMap$iv":Ljava/util/List;
    const/4 v4, 0x0

    .line 645
    .local v4, "$i$f$fastMap":I
    nop

    .line 646
    new-instance v9, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v10

    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(I)V

    .line 647
    .local v9, "target$iv":Ljava/util/ArrayList;
    move-object v10, v3

    .local v10, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v12, 0x0

    .line 648
    .local v12, "$i$f$fastForEach":I
    nop

    .line 649
    const/4 v13, 0x0

    .local v13, "index$iv$iv":I
    move-object v14, v10

    check-cast v14, Ljava/util/Collection;

    invoke-interface {v14}, Ljava/util/Collection;->size()I

    move-result v14

    :goto_6
    if-ge v13, v14, :cond_7

    .line 650
    invoke-interface {v10, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 651
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v22, v15

    .restart local v22    # "it$iv":Ljava/lang/Object;
    const/16 v23, 0x0

    .line 647
    .restart local v23    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-wide/from16 v28, v1

    .end local v1    # "bodyConstraints":J
    .local v28, "bodyConstraints":J
    move-object v1, v9

    check-cast v1, Ljava/util/Collection;

    move-object/from16 v2, v22

    check-cast v2, Landroidx/compose/ui/layout/Measurable;

    .local v2, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v26, 0x0

    .line 500
    .local v26, "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabPlaceable$1":I
    invoke-interface {v2, v7, v8}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v2

    .line 647
    .end local v2    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v26    # "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabPlaceable$1":I
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 651
    .end local v22    # "it$iv":Ljava/lang/Object;
    .end local v23    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 649
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v13, v13, 0x1

    move-wide/from16 v1, v28

    goto :goto_6

    .end local v28    # "bodyConstraints":J
    .restart local v1    # "bodyConstraints":J
    :cond_7
    move-wide/from16 v28, v1

    .line 653
    .end local v1    # "bodyConstraints":J
    .end local v13    # "index$iv$iv":I
    .restart local v28    # "bodyConstraints":J
    nop

    .line 654
    .end local v10    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v12    # "$i$f$fastForEach":I
    move-object/from16 v22, v9

    check-cast v22, Ljava/util/List;

    .line 500
    .end local v3    # "$this$fastMap$iv":Ljava/util/List;
    .end local v4    # "$i$f$fastMap":I
    .end local v9    # "target$iv":Ljava/util/ArrayList;
    nop

    .line 501
    .local v22, "fabPlaceable":Ljava/util/List;
    move-object/from16 v1, v22

    .local v1, "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 655
    .local v2, "$i$f$fastMaxBy":I
    nop

    .line 656
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 v3, 0x0

    goto :goto_8

    .line 657
    :cond_8
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 658
    .local v3, "maxElem$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/compose/ui/layout/Placeable;

    .local v4, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v9, 0x0

    .line 501
    .local v9, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabWidth$1":I
    invoke-virtual {v4}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v4

    .line 658
    .end local v4    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v9    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabWidth$1":I
    nop

    .line 659
    .local v4, "maxValue$iv":I
    const/4 v9, 0x1

    .local v9, "i$iv":I
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v10

    if-gt v9, v10, :cond_a

    .line 660
    :goto_7
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 661
    .local v12, "e$iv":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, Landroidx/compose/ui/layout/Placeable;

    .local v13, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v14, 0x0

    .line 501
    .local v14, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabWidth$1":I
    invoke-virtual {v13}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v13

    .line 661
    .end local v13    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v14    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabWidth$1":I
    nop

    .line 662
    .local v13, "v$iv":I
    if-ge v4, v13, :cond_9

    .line 663
    move-object v3, v12

    .line 664
    move v4, v13

    .line 659
    .end local v12    # "e$iv":Ljava/lang/Object;
    .end local v13    # "v$iv":I
    :cond_9
    if-eq v9, v10, :cond_a

    add-int/lit8 v9, v9, 0x1

    goto :goto_7

    .line 667
    .end local v9    # "i$iv":I
    :cond_a
    nop

    .line 501
    .end local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMaxBy":I
    .end local v3    # "maxElem$iv":Ljava/lang/Object;
    .end local v4    # "maxValue$iv":I
    :goto_8
    check-cast v3, Landroidx/compose/ui/layout/Placeable;

    if-eqz v3, :cond_b

    invoke-virtual {v3}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v1

    move v12, v1

    goto :goto_9

    :cond_b
    const/4 v12, 0x0

    .line 502
    .local v12, "fabWidth":I
    :goto_9
    move-object/from16 v1, v22

    .restart local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 668
    .restart local v2    # "$i$f$fastMaxBy":I
    nop

    .line 669
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_c

    const/4 v3, 0x0

    goto :goto_b

    .line 670
    :cond_c
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 671
    .restart local v3    # "maxElem$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/compose/ui/layout/Placeable;

    .local v4, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v9, 0x0

    .line 502
    .local v9, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabHeight$1":I
    invoke-virtual {v4}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v4

    .line 671
    .end local v4    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v9    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabHeight$1":I
    nop

    .line 672
    .local v4, "maxValue$iv":I
    const/4 v9, 0x1

    .local v9, "i$iv":I
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v10

    if-gt v9, v10, :cond_e

    .line 673
    :goto_a
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .line 674
    .local v13, "e$iv":Ljava/lang/Object;
    move-object v14, v13

    check-cast v14, Landroidx/compose/ui/layout/Placeable;

    .local v14, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v15, 0x0

    .line 502
    .local v15, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabHeight$1":I
    invoke-virtual {v14}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v14

    .line 674
    .end local v14    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v15    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$fabHeight$1":I
    nop

    .line 675
    .local v14, "v$iv":I
    if-ge v4, v14, :cond_d

    .line 676
    move-object v3, v13

    .line 677
    move v4, v14

    .line 672
    .end local v13    # "e$iv":Ljava/lang/Object;
    .end local v14    # "v$iv":I
    :cond_d
    if-eq v9, v10, :cond_e

    add-int/lit8 v9, v9, 0x1

    goto :goto_a

    .line 680
    .end local v9    # "i$iv":I
    :cond_e
    nop

    .line 502
    .end local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMaxBy":I
    .end local v3    # "maxElem$iv":Ljava/lang/Object;
    .end local v4    # "maxValue$iv":I
    :goto_b
    check-cast v3, Landroidx/compose/ui/layout/Placeable;

    if-eqz v3, :cond_f

    invoke-virtual {v3}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v1

    move v14, v1

    goto :goto_c

    :cond_f
    const/4 v14, 0x0

    .line 504
    .local v14, "fabHeight":I
    :goto_c
    move-object/from16 v1, p2

    .local v1, "$this$fastMap$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 681
    .local v2, "$i$f$fastMap":I
    nop

    .line 682
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 683
    .local v3, "target$iv":Ljava/util/ArrayList;
    move-object v4, v1

    .local v4, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v9, 0x0

    .line 684
    .local v9, "$i$f$fastForEach":I
    nop

    .line 685
    const/4 v10, 0x0

    .local v10, "index$iv$iv":I
    move-object v13, v4

    check-cast v13, Ljava/util/Collection;

    invoke-interface {v13}, Ljava/util/Collection;->size()I

    move-result v13

    :goto_d
    if-ge v10, v13, :cond_10

    .line 686
    invoke-interface {v4, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    .line 687
    .local v15, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v23, v15

    .local v23, "it$iv":Ljava/lang/Object;
    const/16 v26, 0x0

    .line 683
    .local v26, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object/from16 v30, v1

    .end local v1    # "$this$fastMap$iv":Ljava/util/List;
    .local v30, "$this$fastMap$iv":Ljava/util/List;
    move-object v1, v3

    check-cast v1, Ljava/util/Collection;

    move/from16 v31, v2

    .end local v2    # "$i$f$fastMap":I
    .local v31, "$i$f$fastMap":I
    move-object/from16 v2, v23

    check-cast v2, Landroidx/compose/ui/layout/Measurable;

    .local v2, "it":Landroidx/compose/ui/layout/Measurable;
    const/16 v32, 0x0

    .line 504
    .local v32, "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarPlaceables$1":I
    invoke-interface {v2, v7, v8}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v2

    .line 683
    .end local v2    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v32    # "$i$a$-fastMap-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarPlaceables$1":I
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 687
    .end local v23    # "it$iv":Ljava/lang/Object;
    .end local v26    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 685
    .end local v15    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v1, v30

    move/from16 v2, v31

    goto :goto_d

    .end local v30    # "$this$fastMap$iv":Ljava/util/List;
    .end local v31    # "$i$f$fastMap":I
    .restart local v1    # "$this$fastMap$iv":Ljava/util/List;
    .local v2, "$i$f$fastMap":I
    :cond_10
    move-object/from16 v30, v1

    move/from16 v31, v2

    .line 689
    .end local v1    # "$this$fastMap$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMap":I
    .end local v10    # "index$iv$iv":I
    .restart local v30    # "$this$fastMap$iv":Ljava/util/List;
    .restart local v31    # "$i$f$fastMap":I
    nop

    .line 690
    .end local v4    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v9    # "$i$f$fastForEach":I
    move-object/from16 v23, v3

    check-cast v23, Ljava/util/List;

    .line 504
    .end local v3    # "target$iv":Ljava/util/ArrayList;
    .end local v30    # "$this$fastMap$iv":Ljava/util/List;
    .end local v31    # "$i$f$fastMap":I
    nop

    .line 505
    .local v23, "snackbarPlaceables":Ljava/util/List;
    move-object/from16 v1, v23

    .local v1, "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 691
    .local v2, "$i$f$fastMaxBy":I
    nop

    .line 692
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_11

    const/4 v3, 0x0

    goto :goto_f

    .line 693
    :cond_11
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 694
    .local v3, "maxElem$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/compose/ui/layout/Placeable;

    .local v4, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v9, 0x0

    .line 505
    .local v9, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarWidth$1":I
    invoke-virtual {v4}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v4

    .line 694
    .end local v4    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v9    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarWidth$1":I
    nop

    .line 695
    .local v4, "maxValue$iv":I
    const/4 v9, 0x1

    .local v9, "i$iv":I
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v10

    if-gt v9, v10, :cond_13

    .line 696
    :goto_e
    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    .line 697
    .restart local v13    # "e$iv":Ljava/lang/Object;
    move-object v15, v13

    check-cast v15, Landroidx/compose/ui/layout/Placeable;

    .local v15, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v26, 0x0

    .line 505
    .local v26, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarWidth$1":I
    invoke-virtual {v15}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v15

    .line 697
    .end local v15    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v26    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarWidth$1":I
    nop

    .line 698
    .local v15, "v$iv":I
    if-ge v4, v15, :cond_12

    .line 699
    move-object v3, v13

    .line 700
    move v4, v15

    .line 695
    .end local v13    # "e$iv":Ljava/lang/Object;
    .end local v15    # "v$iv":I
    :cond_12
    if-eq v9, v10, :cond_13

    add-int/lit8 v9, v9, 0x1

    goto :goto_e

    .line 703
    .end local v9    # "i$iv":I
    :cond_13
    nop

    .line 505
    .end local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMaxBy":I
    .end local v3    # "maxElem$iv":Ljava/lang/Object;
    .end local v4    # "maxValue$iv":I
    :goto_f
    check-cast v3, Landroidx/compose/ui/layout/Placeable;

    if-eqz v3, :cond_14

    invoke-virtual {v3}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v9

    move v15, v9

    goto :goto_10

    :cond_14
    const/4 v15, 0x0

    .line 506
    .local v15, "snackbarWidth":I
    :goto_10
    move-object/from16 v1, v23

    .restart local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    const/4 v2, 0x0

    .line 704
    .restart local v2    # "$i$f$fastMaxBy":I
    nop

    .line 705
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_15

    const/4 v10, 0x0

    goto :goto_12

    .line 706
    :cond_15
    const/4 v9, 0x0

    invoke-interface {v1, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 707
    .restart local v3    # "maxElem$iv":Ljava/lang/Object;
    move-object v4, v3

    check-cast v4, Landroidx/compose/ui/layout/Placeable;

    .local v4, "it":Landroidx/compose/ui/layout/Placeable;
    const/4 v10, 0x0

    .line 506
    .local v10, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarHeight$1":I
    invoke-virtual {v4}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v4

    .line 707
    .end local v4    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v10    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarHeight$1":I
    nop

    .line 708
    .local v4, "maxValue$iv":I
    const/4 v10, 0x1

    .local v10, "i$iv":I
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->getLastIndex(Ljava/util/List;)I

    move-result v13

    if-gt v10, v13, :cond_17

    .line 709
    :goto_11
    invoke-interface {v1, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 710
    .local v16, "e$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Landroidx/compose/ui/layout/Placeable;

    .local v17, "it":Landroidx/compose/ui/layout/Placeable;
    const/16 v26, 0x0

    .line 506
    .local v26, "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarHeight$1":I
    invoke-virtual/range {v17 .. v17}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v17

    .line 710
    .end local v17    # "it":Landroidx/compose/ui/layout/Placeable;
    .end local v26    # "$i$a$-fastMaxBy-BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$snackbarHeight$1":I
    move/from16 v26, v17

    .line 711
    .local v26, "v$iv":I
    move/from16 v9, v26

    .end local v26    # "v$iv":I
    .local v9, "v$iv":I
    if-ge v4, v9, :cond_16

    .line 712
    move-object/from16 v3, v16

    .line 713
    move v4, v9

    .line 708
    .end local v9    # "v$iv":I
    .end local v16    # "e$iv":Ljava/lang/Object;
    :cond_16
    if-eq v10, v13, :cond_17

    add-int/lit8 v10, v10, 0x1

    const/4 v9, 0x0

    goto :goto_11

    :cond_17
    move-object v10, v3

    .line 716
    .end local v3    # "maxElem$iv":Ljava/lang/Object;
    .local v10, "maxElem$iv":Ljava/lang/Object;
    nop

    .line 506
    .end local v1    # "$this$fastMaxBy$iv":Ljava/util/List;
    .end local v2    # "$i$f$fastMaxBy":I
    .end local v4    # "maxValue$iv":I
    .end local v10    # "maxElem$iv":Ljava/lang/Object;
    :goto_12
    check-cast v10, Landroidx/compose/ui/layout/Placeable;

    if-eqz v10, :cond_18

    invoke-virtual {v10}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v2

    move/from16 v17, v2

    goto :goto_13

    :cond_18
    const/16 v17, 0x0

    .line 508
    .local v17, "snackbarHeight":I
    :goto_13
    move-wide v1, v7

    .end local v7    # "looseConstraints":J
    .local v1, "looseConstraints":J
    iget-object v8, v0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$sheetOffset:Lkotlin/jvm/functions/Function0;

    iget v9, v0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$$v$c$androidx-compose-material-FabPosition$-floatingActionButtonPosition$0:I

    iget v13, v0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$$v$c$androidx-compose-ui-unit-Dp$-sheetPeekHeight$0:F

    iget-object v3, v0, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1;->$sheetState:Landroidx/compose/material/BottomSheetState;

    new-instance v7, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$$ExternalSyntheticLambda0;

    move-object/from16 v10, p1

    move-object/from16 v16, v3

    invoke-direct/range {v7 .. v24}, Landroidx/compose/material/BottomSheetScaffoldKt$BottomSheetScaffoldLayout$1$1$$ExternalSyntheticLambda0;-><init>(Lkotlin/jvm/functions/Function0;ILandroidx/compose/ui/layout/MeasureScope;IIFIILandroidx/compose/material/BottomSheetState;IILjava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;I)V

    move v3, v12

    .end local v12    # "fabWidth":I
    .local v3, "fabWidth":I
    const/4 v12, 0x4

    const/4 v13, 0x0

    const/4 v10, 0x0

    move v8, v11

    move/from16 v9, v18

    move-object v11, v7

    move-object/from16 v7, p1

    .end local v11    # "layoutWidth":I
    .end local v18    # "layoutHeight":I
    .local v8, "layoutWidth":I
    .local v9, "layoutHeight":I
    invoke-static/range {v7 .. v13}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v1

    .line 537
    .end local v1    # "looseConstraints":J
    .end local v3    # "fabWidth":I
    .end local v8    # "layoutWidth":I
    .end local v9    # "layoutHeight":I
    .end local v14    # "fabHeight":I
    .end local v15    # "snackbarWidth":I
    .end local v17    # "snackbarHeight":I
    .end local v19    # "bodyPlaceables":Ljava/util/List;
    .end local v20    # "topBarPlaceables":Ljava/util/List;
    .end local v21    # "sheetPlaceables":Ljava/util/List;
    .end local v22    # "fabPlaceable":Ljava/util/List;
    .end local v23    # "snackbarPlaceables":Ljava/util/List;
    .end local v24    # "topBarHeight":I
    .end local v28    # "bodyConstraints":J
    return-object v1
.end method
