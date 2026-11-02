.class final Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;
.super Ljava/lang/Object;
.source "Tab.kt"

# interfaces
.implements Landroidx/compose/ui/layout/MeasurePolicy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/compose/material/TabKt;->TabBaselineLayout(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nTab.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Tab.kt\nandroidx/compose/material/TabKt$TabBaselineLayout$2$1\n+ 2 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,427:1\n563#2,2:428\n34#2,6:430\n565#2:436\n563#2,2:438\n34#2,6:440\n565#2:446\n1#3:437\n*S KotlinDebug\n*F\n+ 1 Tab.kt\nandroidx/compose/material/TabKt$TabBaselineLayout$2$1\n*L\n310#1:428,2\n310#1:430,6\n310#1:436\n320#1:438,2\n320#1:440,6\n320#1:446\n*E\n"
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
.field final synthetic $icon:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $text:Lkotlin/jvm/functions/Function2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/runtime/Composer;",
            "Ljava/lang/Integer;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$19SkOFDB9gtHKDXKyQfTEFHV9eA(Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/MeasureScope;IILjava/lang/Integer;Ljava/lang/Integer;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p7}, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;->measure_3p2s80s$lambda$2(Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/MeasureScope;IILjava/lang/Integer;Ljava/lang/Integer;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method constructor <init>(Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;->$text:Lkotlin/jvm/functions/Function2;

    iput-object p2, p0, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;->$icon:Lkotlin/jvm/functions/Function2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final measure_3p2s80s$lambda$2(Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/MeasureScope;IILjava/lang/Integer;Ljava/lang/Integer;Landroidx/compose/ui/layout/Placeable$PlacementScope;)Lkotlin/Unit;
    .locals 8
    .param p0, "$textPlaceable"    # Landroidx/compose/ui/layout/Placeable;
    .param p1, "$iconPlaceable"    # Landroidx/compose/ui/layout/Placeable;
    .param p2, "$this_Layout"    # Landroidx/compose/ui/layout/MeasureScope;
    .param p3, "$tabWidth"    # I
    .param p4, "$tabHeight"    # I
    .param p5, "$firstBaseline"    # Ljava/lang/Integer;
    .param p6, "$lastBaseline"    # Ljava/lang/Integer;
    .param p7, "$this$layout"    # Landroidx/compose/ui/layout/Placeable$PlacementScope;

    .line 336
    nop

    .line 337
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 338
    nop

    .line 339
    move-object v1, p2

    check-cast v1, Landroidx/compose/ui/unit/Density;

    .line 340
    nop

    .line 341
    nop

    .line 342
    nop

    .line 343
    nop

    .line 344
    invoke-static {p5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    .line 345
    invoke-static {p6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {p6}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 338
    move-object v2, p0

    move-object v3, p1

    move v4, p3

    move v5, p4

    move-object v0, p7

    .end local p0    # "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local p1    # "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local p3    # "$tabWidth":I
    .end local p4    # "$tabHeight":I
    .end local p7    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .local v0, "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .local v2, "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .local v3, "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .local v4, "$tabWidth":I
    .local v5, "$tabHeight":I
    invoke-static/range {v0 .. v7}, Landroidx/compose/material/TabKt;->access$placeTextAndIcon(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/Placeable;IIII)V

    goto :goto_0

    .line 337
    .end local v0    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .end local v2    # "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local v3    # "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local v4    # "$tabWidth":I
    .end local v5    # "$tabHeight":I
    .restart local p0    # "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .restart local p1    # "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .restart local p3    # "$tabWidth":I
    .restart local p4    # "$tabHeight":I
    .restart local p7    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    :cond_0
    move-object v2, p0

    move-object v3, p1

    move v4, p3

    move v5, p4

    move-object v0, p7

    .line 347
    .end local p0    # "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local p1    # "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .end local p3    # "$tabWidth":I
    .end local p4    # "$tabHeight":I
    .end local p7    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .restart local v0    # "$this$layout":Landroidx/compose/ui/layout/Placeable$PlacementScope;
    .restart local v2    # "$textPlaceable":Landroidx/compose/ui/layout/Placeable;
    .restart local v3    # "$iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    .restart local v4    # "$tabWidth":I
    .restart local v5    # "$tabHeight":I
    if-eqz v2, :cond_1

    invoke-static {v0, v2, v5}, Landroidx/compose/material/TabKt;->access$placeTextOrIcon(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;I)V

    goto :goto_0

    .line 348
    :cond_1
    if-eqz v3, :cond_2

    invoke-static {v0, v3, v5}, Landroidx/compose/material/TabKt;->access$placeTextOrIcon(Landroidx/compose/ui/layout/Placeable$PlacementScope;Landroidx/compose/ui/layout/Placeable;I)V

    .line 351
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final measure-3p2s80s(Landroidx/compose/ui/layout/MeasureScope;Ljava/util/List;J)Landroidx/compose/ui/layout/MeasureResult;
    .locals 17
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

    .line 308
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;->$text:Lkotlin/jvm/functions/Function2;

    const-string v2, "Collection contains no element matching the predicate."

    if-eqz v1, :cond_2

    .local v1, "it":Lkotlin/jvm/functions/Function2;
    const/4 v4, 0x0

    .line 309
    .local v4, "$i$a$-let-TabKt$TabBaselineLayout$2$1$textPlaceable$1":I
    nop

    .line 310
    move-object/from16 v5, p2

    .local v5, "$this$fastFirst$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 428
    .local v6, "$i$f$fastFirst":I
    nop

    .line 429
    move-object v7, v5

    .local v7, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v8, 0x0

    .line 430
    .local v8, "$i$f$fastForEach":I
    nop

    .line 431
    const/4 v9, 0x0

    .local v9, "index$iv$iv":I
    move-object v10, v7

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v10

    :goto_0
    if-ge v9, v10, :cond_1

    .line 432
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .line 433
    .local v11, "item$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    .local v12, "it$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 429
    .local v13, "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    move-object v14, v12

    check-cast v14, Landroidx/compose/ui/layout/Measurable;

    .local v14, "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v15, 0x0

    .line 310
    .local v15, "$i$a$-fastFirst-TabKt$TabBaselineLayout$2$1$textPlaceable$1$1":I
    invoke-static {v14}, Landroidx/compose/ui/layout/LayoutIdKt;->getLayoutId(Landroidx/compose/ui/layout/Measurable;)Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v16, v1

    .end local v1    # "it":Lkotlin/jvm/functions/Function2;
    .local v16, "it":Lkotlin/jvm/functions/Function2;
    const-string/jumbo v1, "text"

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 429
    .end local v14    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v15    # "$i$a$-fastFirst-TabKt$TabBaselineLayout$2$1$textPlaceable$1$1":I
    if-eqz v1, :cond_0

    .line 436
    .end local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastFirst":I
    .end local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastForEach":I
    .end local v9    # "index$iv$iv":I
    .end local v11    # "item$iv$iv":Ljava/lang/Object;
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v13    # "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    move-object v1, v12

    check-cast v1, Landroidx/compose/ui/layout/Measurable;

    .line 315
    const/16 v11, 0xb

    const/4 v12, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-wide/from16 v5, p3

    invoke-static/range {v5 .. v12}, Landroidx/compose/ui/unit/Constraints;->copy-Zbe2FdA$default(JIIIIILjava/lang/Object;)J

    move-result-wide v7

    .line 311
    invoke-interface {v1, v7, v8}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v1

    .line 316
    nop

    .line 308
    .end local v4    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$textPlaceable$1":I
    .end local v16    # "it":Lkotlin/jvm/functions/Function2;
    goto :goto_1

    .line 433
    .restart local v4    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$textPlaceable$1":I
    .restart local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .restart local v6    # "$i$f$fastFirst":I
    .restart local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .restart local v8    # "$i$f$fastForEach":I
    .restart local v9    # "index$iv$iv":I
    .restart local v11    # "item$iv$iv":Ljava/lang/Object;
    .restart local v16    # "it":Lkotlin/jvm/functions/Function2;
    :cond_0
    nop

    .line 431
    .end local v11    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v1, v16

    goto :goto_0

    .end local v16    # "it":Lkotlin/jvm/functions/Function2;
    .restart local v1    # "it":Lkotlin/jvm/functions/Function2;
    :cond_1
    move-object/from16 v16, v1

    .line 435
    .end local v1    # "it":Lkotlin/jvm/functions/Function2;
    .end local v9    # "index$iv$iv":I
    .restart local v16    # "it":Lkotlin/jvm/functions/Function2;
    nop

    .line 436
    .end local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastForEach":I
    invoke-static {v2}, Landroidx/compose/ui/util/ListUtilsKt;->throwNoSuchElementException(Ljava/lang/String;)Ljava/lang/Void;

    new-instance v1, Lkotlin/KotlinNothingValueException;

    invoke-direct {v1}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw v1

    .line 308
    .end local v4    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$textPlaceable$1":I
    .end local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastFirst":I
    .end local v16    # "it":Lkotlin/jvm/functions/Function2;
    :cond_2
    const/4 v1, 0x0

    .line 307
    :goto_1
    move-object v4, v1

    .line 320
    .local v4, "textPlaceable":Landroidx/compose/ui/layout/Placeable;
    iget-object v1, v0, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1;->$icon:Lkotlin/jvm/functions/Function2;

    if-eqz v1, :cond_5

    .line 437
    .restart local v1    # "it":Lkotlin/jvm/functions/Function2;
    const/4 v3, 0x0

    .line 320
    .local v3, "$i$a$-let-TabKt$TabBaselineLayout$2$1$iconPlaceable$1":I
    move-object/from16 v5, p2

    .restart local v5    # "$this$fastFirst$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 438
    .restart local v6    # "$i$f$fastFirst":I
    nop

    .line 439
    move-object v7, v5

    .restart local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    const/4 v8, 0x0

    .line 440
    .restart local v8    # "$i$f$fastForEach":I
    nop

    .line 441
    const/4 v9, 0x0

    .restart local v9    # "index$iv$iv":I
    move-object v10, v7

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v10

    :goto_2
    if-ge v9, v10, :cond_4

    .line 442
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .line 443
    .restart local v11    # "item$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    .restart local v12    # "it$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 439
    .restart local v13    # "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    move-object v14, v12

    check-cast v14, Landroidx/compose/ui/layout/Measurable;

    .restart local v14    # "it":Landroidx/compose/ui/layout/Measurable;
    const/4 v15, 0x0

    .line 320
    .local v15, "$i$a$-fastFirst-TabKt$TabBaselineLayout$2$1$iconPlaceable$1$1":I
    invoke-static {v14}, Landroidx/compose/ui/layout/LayoutIdKt;->getLayoutId(Landroidx/compose/ui/layout/Measurable;)Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v16, v1

    .end local v1    # "it":Lkotlin/jvm/functions/Function2;
    .restart local v16    # "it":Lkotlin/jvm/functions/Function2;
    const-string/jumbo v1, "icon"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    .line 439
    .end local v14    # "it":Landroidx/compose/ui/layout/Measurable;
    .end local v15    # "$i$a$-fastFirst-TabKt$TabBaselineLayout$2$1$iconPlaceable$1$1":I
    if-eqz v0, :cond_3

    .line 446
    .end local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastFirst":I
    .end local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastForEach":I
    .end local v9    # "index$iv$iv":I
    .end local v11    # "item$iv$iv":Ljava/lang/Object;
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v13    # "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    move-object v0, v12

    check-cast v0, Landroidx/compose/ui/layout/Measurable;

    .line 320
    move-wide/from16 v14, p3

    invoke-interface {v0, v14, v15}, Landroidx/compose/ui/layout/Measurable;->measure-BRTryo0(J)Landroidx/compose/ui/layout/Placeable;

    move-result-object v0

    move-object v5, v0

    .end local v3    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$iconPlaceable$1":I
    .end local v16    # "it":Lkotlin/jvm/functions/Function2;
    goto :goto_3

    .line 439
    .restart local v3    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$iconPlaceable$1":I
    .restart local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .restart local v6    # "$i$f$fastFirst":I
    .restart local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .restart local v8    # "$i$f$fastForEach":I
    .restart local v9    # "index$iv$iv":I
    .restart local v11    # "item$iv$iv":Ljava/lang/Object;
    .restart local v12    # "it$iv":Ljava/lang/Object;
    .restart local v13    # "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    .restart local v16    # "it":Lkotlin/jvm/functions/Function2;
    :cond_3
    move-wide/from16 v14, p3

    .line 443
    .end local v12    # "it$iv":Ljava/lang/Object;
    .end local v13    # "$i$a$-fastForEach-ListUtilsKt$fastFirst$2$iv":I
    nop

    .line 441
    .end local v11    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    goto :goto_2

    .line 445
    .end local v9    # "index$iv$iv":I
    .end local v16    # "it":Lkotlin/jvm/functions/Function2;
    .restart local v1    # "it":Lkotlin/jvm/functions/Function2;
    :cond_4
    nop

    .line 446
    .end local v7    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastForEach":I
    invoke-static {v2}, Landroidx/compose/ui/util/ListUtilsKt;->throwNoSuchElementException(Ljava/lang/String;)Ljava/lang/Void;

    new-instance v0, Lkotlin/KotlinNothingValueException;

    invoke-direct {v0}, Lkotlin/KotlinNothingValueException;-><init>()V

    throw v0

    .line 320
    .end local v1    # "it":Lkotlin/jvm/functions/Function2;
    .end local v3    # "$i$a$-let-TabKt$TabBaselineLayout$2$1$iconPlaceable$1":I
    .end local v5    # "$this$fastFirst$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastFirst":I
    :cond_5
    move-wide/from16 v14, p3

    const/4 v5, 0x0

    .line 319
    :goto_3
    nop

    .line 322
    .local v5, "iconPlaceable":Landroidx/compose/ui/layout/Placeable;
    const/4 v0, 0x0

    if-eqz v4, :cond_6

    invoke-virtual {v4}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v1

    goto :goto_4

    :cond_6
    move v1, v0

    :goto_4
    if-eqz v5, :cond_7

    invoke-virtual {v5}, Landroidx/compose/ui/layout/Placeable;->getWidth()I

    move-result v0

    :cond_7
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 325
    .local v7, "tabWidth":I
    if-eqz v4, :cond_8

    if-eqz v5, :cond_8

    .line 326
    invoke-static {}, Landroidx/compose/material/TabKt;->access$getLargeTabHeight$p()F

    move-result v0

    goto :goto_5

    .line 328
    :cond_8
    invoke-static {}, Landroidx/compose/material/TabKt;->access$getSmallTabHeight$p()F

    move-result v0

    .line 330
    :goto_5
    move-object/from16 v6, p1

    invoke-interface {v6, v0}, Landroidx/compose/ui/layout/MeasureScope;->roundToPx-0680j_4(F)I

    move-result v8

    .line 324
    nop

    .line 332
    .local v8, "tabHeight":I
    if-eqz v4, :cond_9

    invoke-static {}, Landroidx/compose/ui/layout/AlignmentLineKt;->getFirstBaseline()Landroidx/compose/ui/layout/HorizontalAlignmentLine;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/layout/AlignmentLine;

    invoke-virtual {v4, v0}, Landroidx/compose/ui/layout/Placeable;->get(Landroidx/compose/ui/layout/AlignmentLine;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    move-object v9, v0

    goto :goto_6

    :cond_9
    const/4 v9, 0x0

    .line 333
    .local v9, "firstBaseline":Ljava/lang/Integer;
    :goto_6
    if-eqz v4, :cond_a

    invoke-static {}, Landroidx/compose/ui/layout/AlignmentLineKt;->getLastBaseline()Landroidx/compose/ui/layout/HorizontalAlignmentLine;

    move-result-object v0

    check-cast v0, Landroidx/compose/ui/layout/AlignmentLine;

    invoke-virtual {v4, v0}, Landroidx/compose/ui/layout/Placeable;->get(Landroidx/compose/ui/layout/AlignmentLine;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object v10, v3

    goto :goto_7

    :cond_a
    const/4 v10, 0x0

    .line 335
    .local v10, "lastBaseline":Ljava/lang/Integer;
    :goto_7
    new-instance v3, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1$$ExternalSyntheticLambda0;

    invoke-direct/range {v3 .. v10}, Landroidx/compose/material/TabKt$TabBaselineLayout$2$1$$ExternalSyntheticLambda0;-><init>(Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/Placeable;Landroidx/compose/ui/layout/MeasureScope;IILjava/lang/Integer;Ljava/lang/Integer;)V

    move-object v0, v9

    move-object v1, v10

    .end local v9    # "firstBaseline":Ljava/lang/Integer;
    .end local v10    # "lastBaseline":Ljava/lang/Integer;
    .local v0, "firstBaseline":Ljava/lang/Integer;
    .local v1, "lastBaseline":Ljava/lang/Integer;
    const/4 v11, 0x4

    const/4 v12, 0x0

    const/4 v9, 0x0

    move-object/from16 v6, p1

    move-object v10, v3

    invoke-static/range {v6 .. v12}, Landroidx/compose/ui/layout/MeasureScope;->layout$default(Landroidx/compose/ui/layout/MeasureScope;IILjava/util/Map;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Landroidx/compose/ui/layout/MeasureResult;

    move-result-object v2

    .line 351
    return-object v2
.end method
