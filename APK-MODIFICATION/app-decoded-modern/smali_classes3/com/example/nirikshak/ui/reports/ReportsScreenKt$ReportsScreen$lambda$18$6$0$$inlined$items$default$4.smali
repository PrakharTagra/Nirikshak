.class public final Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;
.super Ljava/lang/Object;
.source "LazyDsl.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function4;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->ReportsScreen(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function4<",
        "Landroidx/compose/foundation/lazy/LazyItemScope;",
        "Ljava/lang/Integer;",
        "Landroidx/compose/runtime/Composer;",
        "Ljava/lang/Integer;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLazyDsl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LazyDsl.kt\nandroidx/compose/foundation/lazy/LazyDslKt$items$4\n+ 2 ReportsScreen.kt\ncom/example/nirikshak/ui/reports/ReportsScreenKt\n+ 3 Composer.kt\nandroidx/compose/runtime/ComposerKt\n*L\n1#1,523:1\n306#2,4:524\n316#2:534\n323#2,2:541\n1128#3,6:528\n1128#3,6:535\n*S KotlinDebug\n*F\n+ 1 ReportsScreen.kt\ncom/example/nirikshak/ui/reports/ReportsScreenKt\n*L\n309#1:528,6\n316#1:535,6\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $context$inlined:Landroid/content/Context;

.field final synthetic $items:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$items:Ljava/util/List;

    iput-object p2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$context$inlined:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "p1"    # Ljava/lang/Object;
    .param p2, "p2"    # Ljava/lang/Object;
    .param p3, "p3"    # Ljava/lang/Object;
    .param p4, "p4"    # Ljava/lang/Object;

    .line 178
    move-object v0, p1

    check-cast v0, Landroidx/compose/foundation/lazy/LazyItemScope;

    move-object v1, p2

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    move-object v2, p3

    check-cast v2, Landroidx/compose/runtime/Composer;

    move-object v3, p4

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke(Landroidx/compose/foundation/lazy/LazyItemScope;ILandroidx/compose/runtime/Composer;I)V
    .locals 21
    .param p1, "$this$items"    # Landroidx/compose/foundation/lazy/LazyItemScope;
    .param p2, "it"    # I
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p3

    const-string v3, "CN(it)178@8834L22:LazyDsl.kt#428nma"

    invoke-static {v2, v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v3, p4

    .local v3, "$dirty":I
    and-int/lit8 v4, p4, 0x6

    if-nez v4, :cond_1

    move-object/from16 v4, p1

    invoke-interface {v2, v4}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v3, v5

    goto :goto_1

    :cond_1
    move-object/from16 v4, p1

    :goto_1
    and-int/lit8 v5, p4, 0x30

    const/16 v6, 0x20

    if-nez v5, :cond_3

    invoke-interface {v2, v1}, Landroidx/compose/runtime/Composer;->changed(I)Z

    move-result v5

    if-eqz v5, :cond_2

    move v5, v6

    goto :goto_2

    :cond_2
    const/16 v5, 0x10

    :goto_2
    or-int/2addr v3, v5

    :cond_3
    and-int/lit16 v5, v3, 0x93

    const/16 v7, 0x92

    if-eq v5, v7, :cond_4

    const/4 v5, 0x1

    goto :goto_3

    :cond_4
    const/4 v5, 0x0

    :goto_3
    and-int/lit8 v7, v3, 0x1

    invoke-interface {v2, v5, v7}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_5

    const/4 v5, -0x1

    const-string v7, "androidx.compose.foundation.lazy.items.<anonymous> (LazyDsl.kt:178)"

    const v10, 0x2fd4df92

    invoke-static {v10, v3, v5, v7}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 179
    :cond_5
    iget-object v5, v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$items:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    and-int/lit8 v7, v3, 0xe

    .local v7, "$changed\\1":I
    move-object v10, v5

    check-cast v10, Lcom/example/nirikshak/ui/reports/OfficialReportItem;

    .local v10, "report\\1":Lcom/example/nirikshak/ui/reports/OfficialReportItem;
    move-object/from16 v5, p1

    .local v5, "$this$ReportsScreen_u24lambda_u2418_u246_u240_u241\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    move-object/from16 v11, p3

    .local v11, "$composer\\1":Landroidx/compose/runtime/Composer;
    const/16 v19, 0x0

    .line 524
    .local v19, "$i$a$-items$default-ReportsScreenKt$ReportsScreen$2$7$1$2\\1\\179\\0":I
    const v12, -0x3ababb6

    invoke-interface {v11, v12}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v12, "CN(report)*308@11681L318,315@12031L322,306@11610L755:ReportsScreen.kt#caawus"

    invoke-static {v11, v12}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-virtual {v10}, Lcom/example/nirikshak/ui/reports/OfficialReportItem;->getFileUrl()Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_6

    const-string v12, ""

    .line 526
    .local v12, "targetUrl\\1":Ljava/lang/String;
    :cond_6
    nop

    .line 527
    const v13, 0x6b3c93b5

    const-string v14, "CC(remember):ReportsScreen.kt#9igjgp"

    invoke-static {v11, v13, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v13

    iget-object v15, v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$context$inlined:Landroid/content/Context;

    invoke-interface {v11, v15}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v15

    or-int/2addr v13, v15

    and-int/lit8 v15, v7, 0x70

    xor-int/lit8 v15, v15, 0x30

    if-le v15, v6, :cond_7

    invoke-interface {v11, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_8

    :cond_7
    and-int/lit8 v15, v7, 0x30

    if-ne v15, v6, :cond_9

    :cond_8
    const/4 v15, 0x1

    goto :goto_4

    :cond_9
    const/4 v15, 0x0

    :goto_4
    or-int/2addr v13, v15

    .local v13, "invalid\\2":Z
    move-object v15, v11

    .local v15, "$this$cache\\2":Landroidx/compose/runtime/Composer;
    const/16 v16, 0x0

    .line 528
    .local v16, "$i$f$cache\\2\\527":I
    invoke-interface {v15}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v8

    .local v8, "it\\2":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 529
    .local v18, "$i$a$-let-ComposerKt$cache$1\\3\\528\\2":I
    if-nez v13, :cond_b

    sget-object v20, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v20 .. v20}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v8, v9, :cond_a

    goto :goto_5

    .line 533
    :cond_a
    goto :goto_6

    .line 530
    :cond_b
    :goto_5
    const/4 v9, 0x0

    .line 527
    .local v9, "$i$a$-cache-ReportsScreenKt$ReportsScreen$2$7$1$2$1\\4\\530\\1":I
    new-instance v6, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;

    iget-object v1, v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$context$inlined:Landroid/content/Context;

    invoke-direct {v6, v12, v1, v10}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/example/nirikshak/ui/reports/OfficialReportItem;)V

    check-cast v6, Lkotlin/jvm/functions/Function0;

    .line 530
    .end local v9    # "$i$a$-cache-ReportsScreenKt$ReportsScreen$2$7$1$2$1\\4\\530\\1":I
    nop

    .line 531
    .local v6, "value\\3":Ljava/lang/Object;
    invoke-interface {v15, v6}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 532
    move-object v8, v6

    .line 528
    .end local v6    # "value\\3":Ljava/lang/Object;
    .end local v8    # "it\\2":Ljava/lang/Object;
    .end local v18    # "$i$a$-let-ComposerKt$cache$1\\3\\528\\2":I
    :goto_6
    nop

    .line 527
    .end local v13    # "invalid\\2":Z
    .end local v15    # "$this$cache\\2":Landroidx/compose/runtime/Composer;
    .end local v16    # "$i$f$cache\\2\\527":I
    check-cast v8, Lkotlin/jvm/functions/Function0;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 534
    const v1, 0x6b3cbf79

    invoke-static {v11, v1, v14}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v11, v12}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v1

    iget-object v6, v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$context$inlined:Landroid/content/Context;

    invoke-interface {v11, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    or-int/2addr v1, v6

    and-int/lit8 v6, v7, 0x70

    xor-int/lit8 v6, v6, 0x30

    const/16 v9, 0x20

    if-le v6, v9, :cond_c

    invoke-interface {v11, v10}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_d

    :cond_c
    and-int/lit8 v6, v7, 0x30

    const/16 v9, 0x20

    if-ne v6, v9, :cond_e

    :cond_d
    const/16 v17, 0x1

    goto :goto_7

    :cond_e
    const/16 v17, 0x0

    :goto_7
    or-int v1, v1, v17

    .local v1, "invalid\\5":Z
    move-object v6, v11

    .local v6, "$this$cache\\5":Landroidx/compose/runtime/Composer;
    const/4 v9, 0x0

    .line 535
    .local v9, "$i$f$cache\\5\\534":I
    invoke-interface {v6}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v13

    .local v13, "it\\5":Ljava/lang/Object;
    const/4 v14, 0x0

    .line 536
    .local v14, "$i$a$-let-ComposerKt$cache$1\\6\\535\\5":I
    if-nez v1, :cond_10

    sget-object v15, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v15}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v15

    if-ne v13, v15, :cond_f

    goto :goto_8

    .line 540
    :cond_f
    move/from16 v16, v1

    goto :goto_9

    .line 537
    :cond_10
    :goto_8
    const/4 v15, 0x0

    .line 534
    .local v15, "$i$a$-cache-ReportsScreenKt$ReportsScreen$2$7$1$2$2\\7\\537\\1":I
    move/from16 v16, v1

    .end local v1    # "invalid\\5":Z
    .local v16, "invalid\\5":Z
    new-instance v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$2$1;

    iget-object v2, v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$lambda$18$6$0$$inlined$items$default$4;->$context$inlined:Landroid/content/Context;

    invoke-direct {v1, v12, v2, v10}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$2$1;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/example/nirikshak/ui/reports/OfficialReportItem;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    .line 537
    .end local v15    # "$i$a$-cache-ReportsScreenKt$ReportsScreen$2$7$1$2$2\\7\\537\\1":I
    nop

    .line 538
    .local v1, "value\\6":Ljava/lang/Object;
    invoke-interface {v6, v1}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 539
    move-object v13, v1

    .line 535
    .end local v1    # "value\\6":Ljava/lang/Object;
    .end local v13    # "it\\5":Ljava/lang/Object;
    .end local v14    # "$i$a$-let-ComposerKt$cache$1\\6\\535\\5":I
    :goto_9
    nop

    .line 534
    .end local v6    # "$this$cache\\5":Landroidx/compose/runtime/Composer;
    .end local v9    # "$i$f$cache\\5\\534":I
    .end local v16    # "invalid\\5":Z
    check-cast v13, Lkotlin/jvm/functions/Function0;

    invoke-static {v11}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    shr-int/lit8 v1, v7, 0x3

    and-int/lit8 v17, v1, 0xe

    .line 525
    move-object v1, v12

    move-object v12, v13

    .end local v12    # "targetUrl\\1":Ljava/lang/String;
    .local v1, "targetUrl\\1":Ljava/lang/String;
    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v18, 0x38

    move-object/from16 v16, v11

    move-object v11, v8

    .end local v11    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .local v16, "$composer\\1":Landroidx/compose/runtime/Composer;
    invoke-static/range {v10 .. v18}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->ReportCardItem(Lcom/example/nirikshak/ui/reports/OfficialReportItem;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;ZLkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    .line 541
    invoke-interface/range {v16 .. v16}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 542
    .end local v1    # "targetUrl\\1":Ljava/lang/String;
    nop

    .line 179
    .end local v5    # "$this$ReportsScreen_u24lambda_u2418_u246_u240_u241\\1":Landroidx/compose/foundation/lazy/LazyItemScope;
    .end local v7    # "$changed\\1":I
    .end local v10    # "report\\1":Lcom/example/nirikshak/ui/reports/OfficialReportItem;
    .end local v16    # "$composer\\1":Landroidx/compose/runtime/Composer;
    .end local v19    # "$i$a$-items$default-ReportsScreenKt$ReportsScreen$2$7$1$2\\1\\179\\0":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_12

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_a

    .line 178
    :cond_11
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 180
    :cond_12
    :goto_a
    return-void
.end method
