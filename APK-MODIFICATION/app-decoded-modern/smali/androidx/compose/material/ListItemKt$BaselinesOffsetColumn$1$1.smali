.class final Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1;
.super Ljava/lang/Object;
.source "ListItem.kt"

# interfaces
.implements Landroidx/compose/ui/layout/MeasurePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/compose/material/ListItemKt;->BaselinesOffsetColumn(Ljava/util/List;Landroidx/compose/ui/Modifier;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nListItem.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ListItem.kt\nandroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1\n+ 2 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n*L\n1#1,444:1\n150#2,3:445\n34#2,6:448\n153#2:454\n269#2,3:455\n34#2,6:458\n272#2:464\n70#2,6:465\n70#2,6:471\n*S KotlinDebug\n*F\n+ 1 ListItem.kt\nandroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1\n*L\n368#1:445,3\n368#1:448,6\n368#1:454\n371#1:455,3\n371#1:458,6\n371#1:464\n374#1:465,6\n386#1:471,6\n*E\n"
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
.field final synthetic $offsets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/compose/ui/unit/Dp;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$FBjSNYVgKOLLPC3GgZaD712BMms(Ljava/util/List;[ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1;->measure_3p2s80s$lambda$3(Ljava/util/List;[ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/compose/ui/unit/Dp;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1;->$offsets:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final measure_3p2s80s$lambda$3(Ljava/util/List;[ILandroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 14
    .param p0, "$placeables"    # Ljava/util/List;
    .param p1, "$y"    # [I
    .param p2, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 386
    move-object v0, p0

    .local v0, "$this$fastForEachIndexed$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 471
    .local v1, "$i$f$fastForEachIndexed":I
    nop

    .line 472
    const/4 v2, 0x0

    .local v2, "index$iv":I
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_0

    .line 473
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    .line 474
    .local v4, "item$iv":Ljava/lang/Object;
    move-object v6, v4

    check-cast v6, Landroidx/compose/ui/layout/Placeable;

    .local v6, "placeable":Landroidx/compose/ui/layout/Placeable;
    move v5, v2

    .local v5, "index":I
    move v12, v5

    .end local v5    # "index":I
    .local v12, "index":I
    const/4 v13, 0x0

    .line 387
    .local v13, "$i$a$-fastForEachIndexed-ListItemKt$BaselinesOffsetColumn$1$1$2$1":I
    aget v8, p1, v12

    const/4 v10, 0x4

    const/4 v11, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    move-object/from16 v5, p2

    invoke-static/range {v5 .. v11}, Landroidx/compose/ui/layout/Placeable$PlacementScope;->placeRelative$default(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;IIFILjava/lang/Object;)V

    .line 388
    nop

    .line 474
    .end local v6    # "placeable":Landroidx/compose/ui/layout/Placeable;
    .end local v12    # "index":I
    .end local v13    # "$i$a$-fastForEachIndexed-ListItemKt$BaselinesOffsetColumn$1$1$2$1":I
    nop

    .line 472
    .end local v4    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 476
    .end local v2    # "index$iv":I
    :cond_0
    nop

    .line 389
    .end local v0    # "$this$fastForEachIndexed$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastForEachIndexed":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public final measure-3p2s80s(Landroidx/compose/ui/layout/MeasureScope;Ljava/util/List;J)Landroidx/compose/ui/layout/MeasureResult;
    .locals 22
    .param p1, "$this$Layout"    # Landroidx/compose/ui/layout/MeasureScope;
    .param p2, "measurables"    # Ljava/util/List;
    .param p3, "$v$c$androidx-compose-ui-unit-Constraints$-constraints$0"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/layout/MeasureScope;",
            "Ljava/util/List<",
            "+",
            "Landroidx/compose/ui/layout/Measurable;",
            ">;J)",
            "Landroidx/compose/ui/layout/MeasureResult;"
        }
    .end annotation

    .line 367
    const/4 v6, 0x3

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const v5, 0x7fffffff

    move-wide/from16 v0, p3

    invoke-static/range {v0 .. v7}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v2

    .line 368
    .local v2, "childConstraints":J
    move-object/from16 v0, p2

    .local v0, "$this$fastMap$iv":Ljava/util/List;
    const/4 v1, 0x0

    .line 445
    .local v1, "$i$f$fastMap":I
    nop

    .line 446
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 447
    .local v4, "target$iv":Ljava/util/ArrayList;
    move-object v5, v0

    .local v5, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 448
    .local v6, "$i$f$fastForEach":I
    nop

    .line 449
    const/4 v7, 0x0

    .local v7, "index$iv$iv":I
    move-object v8, v5

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_0
    if-ge v7, v8, :cond_0

    .line 450
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 451
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    .local v10, "it$iv":Ljava/lang/Object;
    const/4 v11, 0x0

    .line 447
    .local v11, "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    move-object v12, v4

    check-cast v12, Ljava/util/Collection;

    move-object v13, v10

    check-cast v13, Landroidx/compose/ui/layout/Measurable;

    .local v13, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v14, 0x0

    .line 368
    .local v14, "$i$a$-fastMap-ListItemKt$BaselinesOffsetColumn$1$1$placeables$1":I
    invoke-interface {v13, v2, v3}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v13

    .line 447
    .end local v13    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v14    # "$i$a$-fastMap-ListItemKt$BaselinesOffsetColumn$1$1$placeables$1":I
    invoke-interface {v12, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 451
    .end local v10    # "it$iv":Ljava/lang/Object;
    .end local v11    # "$i$a$-fastForEach-ListUtilsKt$fastMap$2$iv":I
    nop

    .line 449
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 453
    .end local v7    # "index$iv$iv":I
    :cond_0
    nop

    .line 454
    .end local v5    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEach":I
    move-object v0, v4

    check-cast v0, Ljava/util/List;

    .line 368
    .end local v0    # "$this$fastMap$iv":Ljava/util/List;
    .end local v1    # "$i$f$fastMap":I
    .end local v4    # "target$iv":Ljava/util/ArrayList;
    nop

    .line 371
    .local v0, "placeables":Ljava/util/List;
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .local v4, "initial$iv":Ljava/lang/Object;
    move-object v5, v0

    .local v5, "$this$fastFold$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 455
    .local v6, "$i$f$fastFold":I
    nop

    .line 456
    const/4 v7, 0x0

    .local v7, "accumulator$iv":Ljava/lang/Object;
    move-object v7, v4

    .line 457
    move-object v8, v5

    .local v8, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v9, 0x0

    .line 458
    .local v9, "$i$f$fastForEach":I
    nop

    .line 459
    const/4 v10, 0x0

    .local v10, "index$iv$iv":I
    move-object v11, v8

    check-cast v11, Ljava/util/Collection;

    invoke-interface {v11}, Ljava/util/Collection;->size()I

    move-result v11

    :goto_1
    if-ge v10, v11, :cond_1

    .line 460
    invoke-interface {v8, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    .line 461
    .local v12, "item$iv$iv":Ljava/lang/Object;
    move-object v13, v12

    .local v13, "e$iv":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 457
    .local v14, "$i$a$-fastForEach-ListUtilsKt$fastFold$2$iv":I
    move-object v15, v13

    check-cast v15, Landroidx/compose/ui/layout/Placeable;

    .local v15, "placeable":Landroidx/compose/ui/layout/Placeable;
    move-object/from16 v16, v7

    check-cast v16, Ljava/lang/Number;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Number;->intValue()I

    move-result v16

    .local v16, "maxWidth":I
    move/from16 v17, v16

    .end local v16    # "maxWidth":I
    .local v17, "maxWidth":I
    const/16 v16, 0x0

    .line 371
    .local v16, "$i$a$-fastFold-ListItemKt$BaselinesOffsetColumn$1$1$containerWidth$1":I
    invoke-virtual {v15}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v1

    move-wide/from16 v19, v2

    move/from16 v2, v17

    .end local v17    # "maxWidth":I
    .local v2, "maxWidth":I
    .local v19, "childConstraints":J
    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .end local v2    # "maxWidth":I
    .end local v15    # "placeable":Landroidx/compose/ui/layout/Placeable;
    .end local v16    # "$i$a$-fastFold-ListItemKt$BaselinesOffsetColumn$1$1$containerWidth$1":I
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 457
    move-object v7, v1

    .line 461
    .end local v13    # "e$iv":Ljava/lang/Object;
    .end local v14    # "$i$a$-fastForEach-ListUtilsKt$fastFold$2$iv":I
    nop

    .line 459
    .end local v12    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v10, v10, 0x1

    move-wide/from16 v2, v19

    const/4 v1, 0x0

    goto :goto_1

    .end local v19    # "childConstraints":J
    .local v2, "childConstraints":J
    :cond_1
    move-wide/from16 v19, v2

    .line 463
    .end local v2    # "childConstraints":J
    .end local v10    # "index$iv$iv":I
    .restart local v19    # "childConstraints":J
    nop

    .line 464
    .end local v8    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v9    # "$i$f$fastForEach":I
    nop

    .line 371
    .end local v4    # "initial$iv":Ljava/lang/Object;
    .end local v5    # "$this$fastFold$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastFold":I
    .end local v7    # "accumulator$iv":Ljava/lang/Object;
    move-object v1, v7

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    .line 370
    move v3, v1

    .line 372
    .local v3, "containerWidth":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [I

    .line 373
    .local v1, "y":[I
    const/4 v2, 0x0

    .line 374
    .local v2, "containerHeight":I
    move-object/from16 v9, p0

    iget-object v4, v9, Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1;->$offsets:Ljava/util/List;

    move-object v5, v0

    .local v5, "$this$fastForEachIndexed$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 465
    .local v6, "$i$f$fastForEachIndexed":I
    nop

    .line 466
    const/4 v7, 0x0

    .local v7, "index$iv":I
    move-object v8, v5

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    :goto_2
    if-ge v7, v8, :cond_3

    .line 467
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 468
    .local v10, "item$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Landroidx/compose/ui/layout/Placeable;

    .local v11, "placeable":Landroidx/compose/ui/layout/Placeable;
    move v12, v7

    .local v12, "index":I
    const/4 v13, 0x0

    .line 376
    .local v13, "$i$a$-fastForEachIndexed-ListItemKt$BaselinesOffsetColumn$1$1$1":I
    if-lez v12, :cond_2

    .line 377
    add-int/lit8 v14, v12, -0x1

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/compose/ui/layout/Placeable;

    invoke-virtual {v14}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v14

    add-int/lit8 v15, v12, -0x1

    invoke-interface {v0, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/compose/ui/layout/Placeable;

    invoke-static {}, Landroidx/compose/ui/layout/AlignmentLineKt;->getLastBaseline()Landroidx/compose/ui/layout/HorizontalAlignmentLine;

    move-result-object v16

    move/from16 v17, v2

    .end local v2    # "containerHeight":I
    .local v17, "containerHeight":I
    move-object/from16 v2, v16

    check-cast v2, Landroidx/compose/ui/layout/AlignmentLine;

    invoke-virtual {v15, v2}, Landroidx/compose/ui/layout/Placeable;->get(Landroidx/compose/ui/layout/AlignmentLine;)I

    move-result v2

    sub-int/2addr v14, v2

    goto :goto_3

    .line 378
    .end local v17    # "containerHeight":I
    .restart local v2    # "containerHeight":I
    :cond_2
    move/from16 v17, v2

    .end local v2    # "containerHeight":I
    .restart local v17    # "containerHeight":I
    const/4 v14, 0x0

    .line 376
    :goto_3
    nop

    .line 375
    nop

    .line 380
    .local v14, "toPreviousBaseline":I
    invoke-interface {v4, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/compose/ui/unit/Dp;

    invoke-virtual {v2}, Landroidx/compose/ui/unit/Dp;->unbox-impl()F

    move-result v2

    move-object/from16 v15, p1

    invoke-interface {v15, v2}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v2

    invoke-static {}, Landroidx/compose/ui/layout/AlignmentLineKt;->getFirstBaseline()Landroidx/compose/ui/layout/HorizontalAlignmentLine;

    move-result-object v16

    move/from16 v21, v2

    move-object/from16 v2, v16

    check-cast v2, Landroidx/compose/ui/layout/AlignmentLine;

    invoke-virtual {v11, v2}, Landroidx/compose/ui/layout/Placeable;->get(Landroidx/compose/ui/layout/AlignmentLine;)I

    move-result v2

    sub-int v2, v21, v2

    sub-int/2addr v2, v14

    move/from16 v16, v3

    const/4 v3, 0x0

    .end local v3    # "containerWidth":I
    .local v16, "containerWidth":I
    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 379
    nop

    .line 381
    .local v2, "topPadding":I
    add-int v18, v2, v17

    aput v18, v1, v12

    .line 382
    invoke-virtual {v11}, Landroidx/compose/ui/layout/Placeable;->getHeight()I

    move-result v18

    add-int v18, v2, v18

    add-int v17, v17, v18

    .line 383
    nop

    .line 468
    .end local v2    # "topPadding":I
    .end local v11    # "placeable":Landroidx/compose/ui/layout/Placeable;
    .end local v12    # "index":I
    .end local v13    # "$i$a$-fastForEachIndexed-ListItemKt$BaselinesOffsetColumn$1$1$1":I
    .end local v14    # "toPreviousBaseline":I
    nop

    .line 466
    .end local v10    # "item$iv":Ljava/lang/Object;
    add-int/lit8 v7, v7, 0x1

    move/from16 v3, v16

    move/from16 v2, v17

    goto :goto_2

    .end local v16    # "containerWidth":I
    .end local v17    # "containerHeight":I
    .local v2, "containerHeight":I
    .restart local v3    # "containerWidth":I
    :cond_3
    move-object/from16 v15, p1

    move/from16 v17, v2

    .line 470
    .end local v2    # "containerHeight":I
    .end local v7    # "index$iv":I
    .restart local v17    # "containerHeight":I
    nop

    .line 385
    .end local v5    # "$this$fastForEachIndexed$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEachIndexed":I
    new-instance v6, Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1$$ExternalSyntheticLambda0;

    invoke-direct {v6, v0, v1}, Landroidx/compose/material/ListItemKt$BaselinesOffsetColumn$1$1$$ExternalSyntheticLambda0;-><init>(Ljava/util/List;[I)V

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/4 v5, 0x0

    move-object v2, v15

    move/from16 v4, v17

    .end local v17    # "containerHeight":I
    .local v4, "containerHeight":I
    invoke-static/range {v2 .. v8}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v5

    .line 389
    .end local v4    # "containerHeight":I
    .restart local v17    # "containerHeight":I
    return-object v5
.end method
