.class public final Landroidx/navigation3/runtime/DecoratedNavEntriesKt;
.super Ljava/lang/Object;
.source "DecoratedNavEntries.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nDecoratedNavEntries.kt\nKotlin\n*S Kotlin\n*F\n+ 1 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n+ 2 Composer.kt\nandroidx/compose/runtime/ComposerKt\n+ 3 ListUtils.kt\nandroidx/navigation3/runtime/ListUtilsKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 5 SnapshotState.kt\nandroidx/compose/runtime/SnapshotStateKt__SnapshotStateKt\n+ 6 Effects.kt\nandroidx/compose/runtime/DisposableEffectScope\n*L\n1#1,276:1\n1277#2,3:277\n1280#2,3:303\n1277#2,6:306\n1277#2,6:312\n1277#2,6:346\n1277#2,6:358\n25#3,2:280\n69#3,2:282\n59#3,13:284\n28#3:297\n29#3:302\n25#3,2:318\n69#3,2:320\n59#3,13:322\n28#3:335\n29#3:340\n40#3,2:341\n59#3,3:343\n63#3:352\n43#3:353\n45#3:356\n1557#4:298\n1628#4,3:299\n1557#4:336\n1628#4,3:337\n1863#4,2:354\n1827#4,8:364\n85#5:357\n85#5:377\n85#5:378\n66#6,5:372\n66#6,5:379\n*S KotlinDebug\n*F\n+ 1 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n*L\n125#1:277,3\n125#1:303,3\n168#1:306,6\n169#1:312,6\n258#1:346,6\n206#1:358,6\n125#1:280,2\n125#1:282,2\n125#1:284,13\n125#1:297\n125#1:302\n171#1:318,2\n171#1:320,2\n171#1:322,13\n171#1:335\n171#1:340\n254#1:341,2\n254#1:343,3\n254#1:352\n254#1:353\n254#1:356\n125#1:298\n125#1:299,3\n171#1:336\n171#1:337,3\n254#1:354,2\n226#1:364,8\n194#1:357\n252#1:377\n253#1:378\n208#1:372,5\n259#1:379,5\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010#\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u001au\u0010\u0000\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\u0001\"\u0008\u0008\u0000\u0010\u0003*\u00020\u00042\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00030\u00012\u0019\u0008\u0002\u0010\u0006\u001a\u0013\u0012\u000f\u0012\r\u0012\u0004\u0012\u0002H\u00030\u0007\u00a2\u0006\u0002\u0008\u00080\u00012\'\u0010\t\u001a#\u0012\u0013\u0012\u0011H\u0003\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u000c\u0012\u0004\u0008\u0008(\r\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\nH\u0007\u00a2\u0006\u0002\u0010\u000e\u001aR\u0010\u0000\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\u0001\"\u0008\u0008\u0000\u0010\u0003*\u00020\u00042\u0012\u0010\u000f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\u00012\u0019\u0008\u0002\u0010\u0006\u001a\u0013\u0012\u000f\u0012\r\u0012\u0004\u0012\u0002H\u00030\u0007\u00a2\u0006\u0002\u0008\u00080\u0001H\u0007\u00a2\u0006\u0002\u0010\u0010\u001a[\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u0002H\u00030\u0002\"\u0008\u0008\u0000\u0010\u0003*\u00020\u00042\u000c\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u0002H\u00030\u00022\u0012\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00070\u00012\u000c\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0015H\u0003\u00a2\u0006\u0002\u0010\u0017\u001a[\u0010\u0018\u001a\u00020\u0019\"\u0008\u0008\u0000\u0010\u0003*\u00020\u00042\u0012\u0010\u000f\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\u00012\u0012\u0010\u0013\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00070\u00012\u000c\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00152\u000c\u0010\u0016\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u0015H\u0003\u00a2\u0006\u0002\u0010\u001a\u00a8\u0006\u001b\u00b2\u0006 \u0010\u001c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00070\u0001\"\u0008\u0008\u0000\u0010\u0003*\u00020\u0004X\u008a\u0084\u0002\u00b2\u0006 \u0010\u001d\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00020\u0001\"\u0008\u0008\u0000\u0010\u0003*\u00020\u0004X\u008a\u0084\u0002\u00b2\u0006 \u0010\u001c\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00030\u00070\u0001\"\u0008\u0008\u0000\u0010\u0003*\u00020\u0004X\u008a\u0084\u0002"
    }
    d2 = {
        "rememberDecoratedNavEntries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
        "T",
        "",
        "backStack",
        "entryDecorators",
        "Landroidx/navigation3/runtime/NavEntryDecorator;",
        "Lkotlin/jvm/JvmSuppressWildcards;",
        "entryProvider",
        "Lkotlin/Function1;",
        "Lkotlin/ParameterName;",
        "name",
        "key",
        "(Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Ljava/util/List;",
        "entries",
        "(Ljava/util/List;Ljava/util/List;Landroidx/compose/runtime/Composer;II)Ljava/util/List;",
        "decorateEntry",
        "entry",
        "decorators",
        "keysInBackstack",
        "",
        "keysInComposition",
        "(Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntry;",
        "PrepareBackStack",
        "",
        "(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)V",
        "navigation3-runtime",
        "latestDecorators",
        "latestEntries"
    }
    k = 0x2
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$4VxxOnJ-qv83i74tgwWySYDelZw(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;
    .locals 0

    invoke-static/range {p0 .. p5}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack$lambda$2$0$0(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$4p5rTg13pNqj1qnOHg8-WhvQNuM(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Ljava/util/List;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p8}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry$lambda$1(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Ljava/util/List;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$CwZ5FNtx7_3OTcx-G_ff1EtBBEU(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack$lambda$3(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WrhFbMb-ggeMsy8zj7regnqEGSg(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry$lambda$1$0$0(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$Xq5HM5jYZbE9jtCj-H7XFYyibQo(Landroidx/navigation3/runtime/NavEntryDecorator;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry$lambda$1$1$0(Landroidx/navigation3/runtime/NavEntryDecorator;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method private static final PrepareBackStack(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)V
    .locals 27
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "decorators"    # Ljava/util/List;
    .param p2, "keysInBackstack"    # Ljava/util/Set;
    .param p3, "keysInComposition"    # Ljava/util/Set;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "I)V"
        }
    .end annotation

    .line 247
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v6, p3

    move/from16 v0, p5

    const v3, -0x2af6f038

    move-object/from16 v4, p4

    invoke-interface {v4, v3}, Landroidx/compose/runtime/Composer;->startRestartGroup(I)Landroidx/compose/runtime/Composer;

    move-result-object v9

    .end local p4    # "$composer":Landroidx/compose/runtime/Composer;
    .local v9, "$composer":Landroidx/compose/runtime/Composer;
    const-string v4, "C(PrepareBackStack)N(entries,decorators,keysInBackstack,keysInComposition)251@10680L29,252@10738L32,*257@10974L770,257@10927L817:DecoratedNavEntries.kt#aulyik"

    invoke-static {v9, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    move/from16 v4, p5

    .local v4, "$dirty":I
    and-int/lit8 v5, v0, 0x6

    if-nez v5, :cond_1

    invoke-interface {v9, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x4

    goto :goto_0

    :cond_0
    const/4 v5, 0x2

    :goto_0
    or-int/2addr v4, v5

    :cond_1
    and-int/lit8 v5, v0, 0x30

    if-nez v5, :cond_3

    invoke-interface {v9, v2}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const/16 v5, 0x20

    goto :goto_1

    :cond_2
    const/16 v5, 0x10

    :goto_1
    or-int/2addr v4, v5

    :cond_3
    and-int/lit16 v5, v0, 0x180

    if-nez v5, :cond_5

    move-object/from16 v10, p2

    invoke-interface {v9, v10}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    const/16 v5, 0x100

    goto :goto_2

    :cond_4
    const/16 v5, 0x80

    :goto_2
    or-int/2addr v4, v5

    goto :goto_3

    :cond_5
    move-object/from16 v10, p2

    :goto_3
    and-int/lit16 v5, v0, 0xc00

    if-nez v5, :cond_7

    invoke-interface {v9, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    const/16 v5, 0x800

    goto :goto_4

    :cond_6
    const/16 v5, 0x400

    :goto_4
    or-int/2addr v4, v5

    :cond_7
    move v11, v4

    .end local v4    # "$dirty":I
    .local v11, "$dirty":I
    and-int/lit16 v4, v11, 0x493

    const/16 v5, 0x492

    if-eq v4, v5, :cond_8

    const/4 v4, 0x1

    goto :goto_5

    :cond_8
    const/4 v4, 0x0

    :goto_5
    and-int/lit8 v5, v11, 0x1

    invoke-interface {v9, v4, v5}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v4

    if-eqz v4, :cond_11

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_9

    const/4 v4, -0x1

    const-string v5, "androidx.navigation3.runtime.PrepareBackStack (DecoratedNavEntries.kt:246)"

    invoke-static {v3, v11, v4, v5}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 248
    :cond_9
    move-object/from16 v5, p2

    .line 252
    .local v5, "keysInBackStack":Ljava/util/Set;
    and-int/lit8 v3, v11, 0xe

    invoke-static {v1, v9, v3}, Landroidx/compose/runtime/SnapshotStateKt;->rememberUpdatedState(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v7

    .line 253
    .local v7, "latestEntries$delegate":Landroidx/compose/runtime/State;
    shr-int/lit8 v3, v11, 0x3

    and-int/lit8 v3, v3, 0xe

    invoke-static {v2, v9, v3}, Landroidx/compose/runtime/SnapshotStateKt;->rememberUpdatedState(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v8

    .line 254
    .local v8, "latestDecorators$delegate":Landroidx/compose/runtime/State;
    move-object/from16 v13, p0

    .local v13, "$this$fastForEachOrForEach$iv":Ljava/util/List;
    const/4 v14, 0x0

    .line 341
    .local v14, "$i$f$fastForEachOrForEach":I
    instance-of v3, v13, Ljava/util/RandomAccess;

    const-string v15, "CC(remember):DecoratedNavEntries.kt#9igjgp"

    if-eqz v3, :cond_d

    .line 342
    move-object v3, v13

    .local v3, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/16 v16, 0x0

    .line 343
    .local v16, "$i$f$fastForEach":I
    const/16 v17, 0x0

    .local v17, "index$iv$iv":I
    move-object/from16 v18, v3

    check-cast v18, Ljava/util/Collection;

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v12

    move/from16 v4, v17

    .end local v17    # "index$iv$iv":I
    .local v4, "index$iv$iv":I
    :goto_6
    if-ge v4, v12, :cond_c

    .line 344
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    .line 345
    .local v17, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v19, v17

    check-cast v19, Landroidx/navigation3/runtime/NavEntry;

    .local v19, "it":Landroidx/navigation3/runtime/NavEntry;
    const/16 v20, 0x0

    .line 255
    .local v20, "$i$a$-fastForEachOrForEach-DecoratedNavEntriesKt$PrepareBackStack$1":I
    move/from16 v21, v4

    .end local v4    # "index$iv$iv":I
    .local v21, "index$iv$iv":I
    invoke-virtual/range {v19 .. v19}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v4

    .line 256
    .local v4, "contentKey":Ljava/lang/Object;
    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 258
    move-object/from16 v22, v1

    check-cast v22, Ljava/lang/Iterable;

    invoke-static/range {v22 .. v22}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    const v1, 0x6043113

    invoke-static {v9, v1, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v9, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v18

    invoke-interface {v9, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v22

    or-int v18, v18, v22

    invoke-interface {v9, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v22

    or-int v18, v18, v22

    invoke-interface {v9, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v22

    or-int v18, v18, v22

    invoke-interface {v9, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v22

    or-int v18, v18, v22

    .local v18, "invalid$iv":Z
    move-object/from16 v22, v9

    .local v22, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v23, 0x0

    .line 346
    .local v23, "$i$f$cache":I
    invoke-interface/range {v22 .. v22}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .local v1, "it$iv":Ljava/lang/Object;
    const/16 v25, 0x0

    .line 347
    .local v25, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v18, :cond_b

    sget-object v26, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual/range {v26 .. v26}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_a

    goto :goto_7

    .line 351
    :cond_a
    move-object/from16 v26, v3

    move-object/from16 v2, v22

    move-object v3, v1

    const v1, 0x6043113

    goto :goto_8

    .line 348
    :cond_b
    :goto_7
    const/4 v2, 0x0

    .line 258
    .local v2, "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    move-object/from16 v26, v3

    .end local v3    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .local v26, "$this$fastForEach$iv$iv":Ljava/util/List;
    new-instance v3, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda1;

    move-object/from16 v24, v1

    const v1, 0x6043113

    .end local v1    # "it$iv":Ljava/lang/Object;
    .local v24, "it$iv":Ljava/lang/Object;
    invoke-direct/range {v3 .. v8}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    .line 348
    .end local v2    # "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    nop

    .line 349
    .local v3, "value$iv":Ljava/lang/Object;
    move-object/from16 v2, v22

    .end local v22    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .local v2, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v2, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 350
    nop

    .line 346
    .end local v3    # "value$iv":Ljava/lang/Object;
    .end local v24    # "it$iv":Ljava/lang/Object;
    .end local v25    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_8
    nop

    .line 258
    .end local v2    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v18    # "invalid$iv":Z
    .end local v23    # "$i$f$cache":I
    check-cast v3, Lkotlin/jvm/functions/Function1;

    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v2, 0x0

    invoke-static {v4, v0, v3, v9, v2}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    .line 274
    nop

    .line 345
    .end local v4    # "contentKey":Ljava/lang/Object;
    .end local v19    # "it":Landroidx/navigation3/runtime/NavEntry;
    .end local v20    # "$i$a$-fastForEachOrForEach-DecoratedNavEntriesKt$PrepareBackStack$1":I
    nop

    .line 343
    .end local v17    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v4, v21, 0x1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v0, p5

    move-object/from16 v3, v26

    .end local v21    # "index$iv$iv":I
    .local v4, "index$iv$iv":I
    goto/16 :goto_6

    .end local v26    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .local v3, "$this$fastForEach$iv$iv":Ljava/util/List;
    :cond_c
    move-object/from16 v26, v3

    move/from16 v21, v4

    .line 352
    .end local v3    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v4    # "index$iv$iv":I
    .restart local v26    # "$this$fastForEach$iv$iv":Ljava/util/List;
    nop

    .end local v16    # "$i$f$fastForEach":I
    .end local v26    # "$this$fastForEach$iv$iv":Ljava/util/List;
    goto/16 :goto_c

    .line 353
    :cond_d
    const v1, 0x6043113

    move-object v0, v13

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 354
    .local v2, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_9
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_10

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .local v16, "element$iv$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    check-cast v17, Landroidx/navigation3/runtime/NavEntry;

    .local v17, "it":Landroidx/navigation3/runtime/NavEntry;
    const/16 v18, 0x0

    .line 255
    .local v18, "$i$a$-fastForEachOrForEach-DecoratedNavEntriesKt$PrepareBackStack$1":I
    invoke-virtual/range {v17 .. v17}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v4

    .line 256
    .local v4, "contentKey":Ljava/lang/Object;
    invoke-interface {v5, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 258
    move-object/from16 v3, p0

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    invoke-static {v9, v1, v15}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v9, v7}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v19

    invoke-interface {v9, v4}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v20

    or-int v19, v19, v20

    invoke-interface {v9, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v20

    or-int v19, v19, v20

    invoke-interface {v9, v6}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v20

    or-int v19, v19, v20

    invoke-interface {v9, v8}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v20

    or-int v19, v19, v20

    .local v19, "invalid$iv":Z
    move-object/from16 v20, v9

    .local v20, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/16 v21, 0x0

    .line 346
    .local v21, "$i$f$cache":I
    invoke-interface/range {v20 .. v20}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v1

    .restart local v1    # "it$iv":Ljava/lang/Object;
    const/16 v22, 0x0

    .line 347
    .local v22, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v19, :cond_f

    sget-object v23, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    move-object/from16 v25, v0

    .end local v0    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .local v25, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    invoke-virtual/range {v23 .. v23}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v0

    if-ne v1, v0, :cond_e

    goto :goto_a

    .line 351
    :cond_e
    move-object v0, v3

    move-object/from16 v6, v20

    goto :goto_b

    .line 347
    .end local v25    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .restart local v0    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    :cond_f
    move-object/from16 v25, v0

    .line 348
    .end local v0    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .restart local v25    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    :goto_a
    const/4 v0, 0x0

    .line 258
    .local v0, "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    move-object/from16 v23, v3

    new-instance v3, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda1;

    move/from16 v26, v0

    move-object/from16 v0, v23

    .end local v0    # "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    .local v26, "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    invoke-direct/range {v3 .. v8}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda1;-><init>(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    .line 348
    .end local v26    # "$i$a$-cache-DecoratedNavEntriesKt$PrepareBackStack$1$1":I
    nop

    .line 349
    .local v3, "value$iv":Ljava/lang/Object;
    move-object/from16 v6, v20

    .end local v20    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .local v6, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    invoke-interface {v6, v3}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 350
    move-object v1, v3

    .line 346
    .end local v1    # "it$iv":Ljava/lang/Object;
    .end local v3    # "value$iv":Ljava/lang/Object;
    .end local v22    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_b
    nop

    .line 258
    .end local v6    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v19    # "invalid$iv":Z
    .end local v21    # "$i$f$cache":I
    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const/4 v3, 0x0

    invoke-static {v4, v0, v1, v9, v3}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    .line 274
    nop

    .line 354
    .end local v4    # "contentKey":Ljava/lang/Object;
    .end local v17    # "it":Landroidx/navigation3/runtime/NavEntry;
    .end local v18    # "$i$a$-fastForEachOrForEach-DecoratedNavEntriesKt$PrepareBackStack$1":I
    move-object/from16 v6, p3

    move-object/from16 v0, v25

    const v1, 0x6043113

    .end local v16    # "element$iv$iv":Ljava/lang/Object;
    goto/16 :goto_9

    .line 355
    .end local v25    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .local v0, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    :cond_10
    move-object/from16 v25, v0

    .line 356
    .end local v0    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEach":I
    :goto_c
    nop

    .end local v13    # "$this$fastForEachOrForEach$iv":Ljava/util/List;
    .end local v14    # "$i$f$fastForEachOrForEach":I
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_12

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v5    # "keysInBackStack":Ljava/util/Set;
    .end local v7    # "latestEntries$delegate":Landroidx/compose/runtime/State;
    .end local v8    # "latestDecorators$delegate":Landroidx/compose/runtime/State;
    goto :goto_d

    .line 242
    :cond_11
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 275
    :cond_12
    :goto_d
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->endRestartGroup()Landroidx/compose/runtime/ScopeUpdateScope;

    move-result-object v6

    if-eqz v6, :cond_13

    new-instance v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda2;

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v4, p3

    move/from16 v5, p5

    move-object v3, v10

    invoke-direct/range {v0 .. v5}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda2;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;I)V

    invoke-interface {v6, v0}, Landroidx/compose/runtime/ScopeUpdateScope;->updateScope(Lkotlin/jvm/functions/Function2;)V

    :cond_13
    return-void
.end method

.method private static final PrepareBackStack$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$latestEntries$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;"
        }
    .end annotation

    .line 252
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 377
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 252
    return-object v0
.end method

.method private static final PrepareBackStack$lambda$1(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;"
        }
    .end annotation

    .line 253
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 378
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 253
    return-object v0
.end method

.method private static final PrepareBackStack$lambda$2$0$0(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;
    .locals 8
    .param p0, "$contentKey"    # Ljava/lang/Object;
    .param p1, "$keysInBackStack"    # Ljava/util/Set;
    .param p2, "$keysInComposition"    # Ljava/util/Set;
    .param p3, "$latestEntries$delegate"    # Landroidx/compose/runtime/State;
    .param p4, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;
    .param p5, "$this$DisposableEffect"    # Landroidx/compose/runtime/DisposableEffectScope;

    .line 259
    move-object v0, p5

    .local v0, "this_$iv":Landroidx/compose/runtime/DisposableEffectScope;
    const/4 v1, 0x0

    .line 379
    .local v1, "$i$f$onDispose":I
    new-instance v2, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    .end local p0    # "$contentKey":Ljava/lang/Object;
    .end local p1    # "$keysInBackStack":Ljava/util/Set;
    .end local p2    # "$keysInComposition":Ljava/util/Set;
    .end local p3    # "$latestEntries$delegate":Landroidx/compose/runtime/State;
    .end local p4    # "$latestDecorators$delegate":Landroidx/compose/runtime/State;
    .local v3, "$contentKey":Ljava/lang/Object;
    .local v4, "$keysInBackStack":Ljava/util/Set;
    .local v5, "$keysInComposition":Ljava/util/Set;
    .local v6, "$latestEntries$delegate":Landroidx/compose/runtime/State;
    .local v7, "$latestDecorators$delegate":Landroidx/compose/runtime/State;
    invoke-direct/range {v2 .. v7}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;-><init>(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V

    check-cast v2, Landroidx/compose/runtime/DisposableEffectResult;

    .line 383
    nop

    .line 272
    .end local v0    # "this_$iv":Landroidx/compose/runtime/DisposableEffectScope;
    .end local v1    # "$i$f$onDispose":I
    return-object v2
.end method

.method private static final PrepareBackStack$lambda$3(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;ILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 7

    or-int/lit8 v0, p4, 0x1

    invoke-static {v0}, Landroidx/compose/runtime/RecomposeScopeImplKt;->updateChangedFlags(I)I

    move-result v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p5

    invoke-static/range {v1 .. v6}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public static final synthetic access$PrepareBackStack$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$latestEntries$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$PrepareBackStack$lambda$1(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack$lambda$1(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static final synthetic access$decorateEntry$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 1
    .param p0, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;

    .line 1
    invoke-static {p0}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method private static final decorateEntry(Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntry;
    .locals 8
    .param p0, "entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p1, "decorators"    # Ljava/util/List;
    .param p2, "keysInBackstack"    # Ljava/util/Set;
    .param p3, "keysInComposition"    # Ljava/util/Set;
    .param p4, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p5, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "I)",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;"
        }
    .end annotation

    const v0, -0x49d9f825    # -2.47405E-6f

    invoke-interface {p4, v0}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v1, "C(decorateEntry)N(entry,decorators,keysInBackstack,keysInComposition)193@8276L32:DecoratedNavEntries.kt#aulyik"

    invoke-static {p4, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    const-string v2, "androidx.navigation3.runtime.decorateEntry (DecoratedNavEntries.kt:192)"

    invoke-static {v0, p5, v1, v2}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 194
    :cond_0
    shr-int/lit8 v0, p5, 0x3

    and-int/lit8 v0, v0, 0xe

    invoke-static {p1, p4, v0}, Landroidx/compose/runtime/SnapshotStateKt;->rememberUpdatedState(Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/State;

    move-result-object v5

    .line 195
    .local v5, "latestDecorators$delegate":Landroidx/compose/runtime/State;
    invoke-virtual {p0}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v3

    .line 202
    .local v3, "contentKey":Ljava/lang/Object;
    const v0, -0x3b3c3108

    invoke-interface {p4, v0, v3}, Landroidx/compose/runtime/Composer;->startMovableGroup(ILjava/lang/Object;)V

    const-string v0, "202@8727L1339"

    invoke-static {p4, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 203
    new-instance v0, Landroidx/navigation3/runtime/NavEntry;

    new-instance v1, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda0;

    move-object v7, p0

    move-object v6, p1

    move-object v4, p2

    move-object v2, p3

    .end local p0    # "entry":Landroidx/navigation3/runtime/NavEntry;
    .end local p1    # "decorators":Ljava/util/List;
    .end local p2    # "keysInBackstack":Ljava/util/Set;
    .end local p3    # "keysInComposition":Ljava/util/Set;
    .local v2, "keysInComposition":Ljava/util/Set;
    .local v4, "keysInBackstack":Ljava/util/Set;
    .local v6, "decorators":Ljava/util/List;
    .local v7, "entry":Landroidx/navigation3/runtime/NavEntry;
    invoke-direct/range {v1 .. v7}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda0;-><init>(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Ljava/util/List;Landroidx/navigation3/runtime/NavEntry;)V

    const/16 p0, 0x36

    const p1, -0x506d619f

    const/4 p2, 0x1

    invoke-static {p1, p2, v1, p4, p0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object p0

    check-cast p0, Lkotlin/jvm/functions/Function3;

    invoke-direct {v0, v7, p0}, Landroidx/navigation3/runtime/NavEntry;-><init>(Landroidx/navigation3/runtime/NavEntry;Lkotlin/jvm/functions/Function3;)V

    invoke-interface {p4}, Landroidx/compose/runtime/Composer;->endMovableGroup()V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_1
    invoke-interface {p4}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    return-object v0
.end method

.method private static final decorateEntry$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;
    .locals 4
    .param p0, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/compose/runtime/State<",
            "+",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;>;)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;"
        }
    .end annotation

    .line 194
    const/4 v0, 0x0

    .local v0, "thisObj$iv":Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "property$iv":Lkotlin/reflect/KProperty;
    move-object v2, p0

    .local v2, "$this$getValue$iv":Landroidx/compose/runtime/State;
    const/4 v3, 0x0

    .line 357
    .local v3, "$i$f$getValue":I
    invoke-interface {v2}, Landroidx/compose/runtime/State;->getValue()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "thisObj$iv":Ljava/lang/Object;
    .end local v1    # "property$iv":Lkotlin/reflect/KProperty;
    .end local v2    # "$this$getValue$iv":Landroidx/compose/runtime/State;
    .end local v3    # "$i$f$getValue":I
    check-cast v0, Ljava/util/List;

    .line 194
    return-object v0
.end method

.method private static final decorateEntry$lambda$1(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Ljava/util/List;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 16
    .param p0, "$keysInComposition"    # Ljava/util/Set;
    .param p1, "$contentKey"    # Ljava/lang/Object;
    .param p2, "$keysInBackstack"    # Ljava/util/Set;
    .param p3, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;
    .param p4, "$decorators"    # Ljava/util/List;
    .param p5, "$entry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p6, "it"    # Ljava/lang/Object;
    .param p7, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p8, "$changed"    # I

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p7

    move/from16 v4, p8

    const-string v5, "CN(it)205@8905L823,205@8869L859,228@10047L9:DecoratedNavEntries.kt#aulyik"

    invoke-static {v3, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v5, v4, 0x11

    const/16 v6, 0x10

    const/4 v8, 0x0

    if-eq v5, v6, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :cond_0
    move v5, v8

    :goto_0
    and-int/lit8 v6, v4, 0x1

    invoke-interface {v3, v5, v6}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, -0x1

    const-string v6, "androidx.navigation3.runtime.decorateEntry.<anonymous>.<anonymous> (DecoratedNavEntries.kt:203)"

    const v9, -0x506d619f

    invoke-static {v9, v4, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 204
    :cond_1
    move-object/from16 v5, p0

    .line 206
    .local v5, "keysInComposition":Ljava/util/Set;
    const v6, 0x1564a398

    const-string v9, "CC(remember):DecoratedNavEntries.kt#9igjgp"

    invoke-static {v3, v6, v9}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v3, v5}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v6

    invoke-interface {v3, v0}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    invoke-interface {v3, v1}, Landroidx/compose/runtime/Composer;->changedInstance(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    invoke-interface {v3, v2}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v9

    or-int/2addr v6, v9

    .local v6, "invalid$iv":Z
    move-object/from16 v9, p7

    .local v9, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v10, 0x0

    .line 358
    .local v10, "$i$f$cache":I
    invoke-interface {v9}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v11

    .local v11, "it$iv":Ljava/lang/Object;
    const/4 v12, 0x0

    .line 359
    .local v12, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v6, :cond_3

    sget-object v13, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v13}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v13

    if-ne v11, v13, :cond_2

    goto :goto_1

    .line 363
    :cond_2
    goto :goto_2

    .line 360
    :cond_3
    :goto_1
    const/4 v13, 0x0

    .line 206
    .local v13, "$i$a$-cache-DecoratedNavEntriesKt$decorateEntry$1$1":I
    new-instance v14, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda3;

    invoke-direct {v14, v5, v0, v1, v2}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda3;-><init>(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;)V

    .line 360
    .end local v13    # "$i$a$-cache-DecoratedNavEntriesKt$decorateEntry$1$1":I
    nop

    .line 361
    .local v14, "value$iv":Ljava/lang/Object;
    invoke-interface {v9, v14}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 362
    move-object v11, v14

    .line 358
    .end local v11    # "it$iv":Ljava/lang/Object;
    .end local v12    # "$i$a$-let-ComposerKt$cache$1$iv":I
    .end local v14    # "value$iv":Ljava/lang/Object;
    :goto_2
    nop

    .line 206
    .end local v6    # "invalid$iv":Z
    .end local v9    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v10    # "$i$f$cache":I
    check-cast v11, Lkotlin/jvm/functions/Function1;

    invoke-static {v3}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    invoke-static {v0, v11, v3, v8}, Landroidx/compose/runtime/EffectsKt;->DisposableEffect(Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;I)V

    const v6, 0x156519fd

    invoke-interface {v3, v6}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v6, "*226@9975L36"

    invoke-static {v3, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 224
    nop

    .line 225
    invoke-static/range {p4 .. p4}, Landroidx/navigation3/runtime/ListUtilsKt;->fastDistinctOrDistinct(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    .line 226
    move-object/from16 v9, p5

    .local v6, "$this$foldRight$iv":Ljava/util/List;
    .local v9, "initial$iv":Ljava/lang/Object;
    const/4 v10, 0x0

    .line 364
    .local v10, "$i$f$foldRight":I
    move-object v11, v9

    .line 365
    .local v11, "accumulator$iv":Ljava/lang/Object;
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_4

    .line 366
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v12

    invoke-interface {v6, v12}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v12

    .line 367
    .local v12, "iterator$iv":Ljava/util/ListIterator;
    :goto_3
    invoke-interface {v12}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 368
    invoke-interface {v12}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroidx/navigation3/runtime/NavEntryDecorator;

    .local v13, "decorator":Landroidx/navigation3/runtime/NavEntryDecorator;
    move-object v14, v11

    .local v14, "wrappedEntry":Landroidx/navigation3/runtime/NavEntry;
    const/4 v15, 0x0

    .line 227
    .local v15, "$i$a$-foldRight-DecoratedNavEntriesKt$decorateEntry$1$2":I
    new-instance v8, Landroidx/navigation3/runtime/NavEntry;

    new-instance v7, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda4;

    invoke-direct {v7, v13, v14}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$$ExternalSyntheticLambda4;-><init>(Landroidx/navigation3/runtime/NavEntryDecorator;Landroidx/navigation3/runtime/NavEntry;)V

    const/16 v0, 0x36

    const v1, -0x13b7f6f4

    const/4 v2, 0x1

    invoke-static {v1, v2, v7, v3, v0}, Landroidx/compose/runtime/internal/ComposableLambdaKt;->rememberComposableLambda(IZLjava/lang/Object;Landroidx/compose/runtime/Composer;I)Landroidx/compose/runtime/internal/ComposableLambda;

    move-result-object v0

    check-cast v0, Lkotlin/jvm/functions/Function3;

    invoke-direct {v8, v14, v0}, Landroidx/navigation3/runtime/NavEntry;-><init>(Landroidx/navigation3/runtime/NavEntry;Lkotlin/jvm/functions/Function3;)V

    .line 368
    .end local v13    # "decorator":Landroidx/navigation3/runtime/NavEntryDecorator;
    .end local v14    # "wrappedEntry":Landroidx/navigation3/runtime/NavEntry;
    .end local v15    # "$i$a$-foldRight-DecoratedNavEntriesKt$decorateEntry$1$2":I
    move-object v11, v8

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    const/4 v8, 0x0

    goto :goto_3

    .line 371
    .end local v12    # "iterator$iv":Ljava/util/ListIterator;
    :cond_4
    nop

    .line 226
    .end local v6    # "$this$foldRight$iv":Ljava/util/List;
    .end local v9    # "initial$iv":Ljava/lang/Object;
    .end local v10    # "$i$f$foldRight":I
    .end local v11    # "accumulator$iv":Ljava/lang/Object;
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 229
    const/4 v0, 0x0

    invoke-virtual {v11, v3, v0}, Landroidx/navigation3/runtime/NavEntry;->Content(Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .end local v5    # "keysInComposition":Ljava/util/Set;
    goto :goto_4

    .line 203
    :cond_5
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    .line 230
    :cond_6
    :goto_4
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method private static final decorateEntry$lambda$1$0$0(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;
    .locals 3
    .param p0, "$keysInComposition"    # Ljava/util/Set;
    .param p1, "$contentKey"    # Ljava/lang/Object;
    .param p2, "$keysInBackstack"    # Ljava/util/Set;
    .param p3, "$latestDecorators$delegate"    # Landroidx/compose/runtime/State;
    .param p4, "$this$DisposableEffect"    # Landroidx/compose/runtime/DisposableEffectScope;

    .line 207
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 208
    move-object v0, p4

    .local v0, "this_$iv":Landroidx/compose/runtime/DisposableEffectScope;
    const/4 v1, 0x0

    .line 372
    .local v1, "$i$f$onDispose":I
    new-instance v2, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;

    invoke-direct {v2, p0, p1, p2, p3}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;-><init>(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;)V

    check-cast v2, Landroidx/compose/runtime/DisposableEffectResult;

    .line 376
    nop

    .line 221
    .end local v0    # "this_$iv":Landroidx/compose/runtime/DisposableEffectScope;
    .end local v1    # "$i$f$onDispose":I
    return-object v2
.end method

.method private static final decorateEntry$lambda$1$1$0(Landroidx/navigation3/runtime/NavEntryDecorator;Landroidx/navigation3/runtime/NavEntry;Ljava/lang/Object;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;
    .locals 4
    .param p0, "$decorator"    # Landroidx/navigation3/runtime/NavEntryDecorator;
    .param p1, "$wrappedEntry"    # Landroidx/navigation3/runtime/NavEntry;
    .param p2, "it"    # Ljava/lang/Object;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I

    const-string v0, "CN(it)226@9987L22:DecoratedNavEntries.kt#aulyik"

    invoke-static {p3, v0}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    and-int/lit8 v0, p4, 0x11

    const/16 v1, 0x10

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    and-int/lit8 v1, p4, 0x1

    invoke-interface {p3, v0, v1}, Landroidx/compose/runtime/Composer;->shouldExecute(ZI)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, -0x1

    const-string v1, "androidx.navigation3.runtime.decorateEntry.<anonymous>.<anonymous>.<anonymous>.<anonymous> (DecoratedNavEntries.kt:226)"

    const v3, -0x13b7f6f4

    invoke-static {v3, p4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 227
    :cond_1
    invoke-virtual {p0}, Landroidx/navigation3/runtime/NavEntryDecorator;->getDecorate$navigation3_runtime()Lkotlin/jvm/functions/Function3;

    move-result-object v0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, p3, v1}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    goto :goto_1

    :cond_2
    invoke-interface {p3}, Landroidx/compose/runtime/Composer;->skipToGroupEnd()V

    :cond_3
    :goto_1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public static final rememberDecoratedNavEntries(Ljava/util/List;Ljava/util/List;Landroidx/compose/runtime/Composer;II)Ljava/util/List;
    .locals 21
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "entryDecorators"    # Ljava/util/List;
    .param p2, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p3, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Landroidx/compose/runtime/Composer;",
            "II)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;"
        }
    .end annotation

    .line 167
    move-object/from16 v4, p2

    move/from16 v6, p3

    const v0, -0x30be0ab1

    const-string v1, "C(rememberDecoratedNavEntries)N(entries,entryDecorators)167@7272L27,168@7345L27,174@7541L87:DecoratedNavEntries.kt#aulyik"

    invoke-static {v4, v0, v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v1, p4, 0x2

    if-eqz v1, :cond_0

    .line 166
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v1

    .end local p1    # "entryDecorators":Ljava/util/List;
    .local v1, "entryDecorators":Ljava/util/List;
    goto :goto_0

    .line 167
    .end local v1    # "entryDecorators":Ljava/util/List;
    .restart local p1    # "entryDecorators":Ljava/util/List;
    :cond_0
    move-object/from16 v1, p1

    .line 166
    .end local p1    # "entryDecorators":Ljava/util/List;
    .restart local v1    # "entryDecorators":Ljava/util/List;
    :goto_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, -0x1

    const-string v3, "androidx.navigation3.runtime.rememberDecoratedNavEntries (DecoratedNavEntries.kt:166)"

    invoke-static {v0, v6, v2, v3}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 168
    :cond_1
    const v0, 0x699f98a

    const-string v2, "CC(remember):DecoratedNavEntries.kt#9igjgp"

    invoke-static {v4, v0, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v0, 0x0

    .local v0, "invalid$iv":Z
    move-object/from16 v3, p2

    .local v3, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 306
    .local v5, "$i$f$cache":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it$iv":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 307
    .local v8, "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_2

    .line 308
    const/4 v9, 0x0

    .line 168
    .local v9, "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$keysInBackstack$1":I
    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v10, Ljava/util/Set;

    .line 308
    .end local v9    # "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$keysInBackstack$1":I
    nop

    .line 309
    .local v10, "value$iv":Ljava/lang/Object;
    invoke-interface {v3, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 310
    move-object v7, v10

    .end local v10    # "value$iv":Ljava/lang/Object;
    goto :goto_1

    .line 311
    :cond_2
    nop

    .line 306
    .end local v7    # "it$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_1
    nop

    .line 168
    .end local v0    # "invalid$iv":Z
    .end local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache":I
    move-object v0, v7

    check-cast v0, Ljava/util/Set;

    .local v0, "keysInBackstack":Ljava/util/Set;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 169
    const v3, 0x69a02aa

    invoke-static {v4, v3, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    const/4 v2, 0x0

    .local v2, "invalid$iv":Z
    move-object/from16 v3, p2

    .restart local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v5, 0x0

    .line 312
    .restart local v5    # "$i$f$cache":I
    invoke-interface {v3}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .restart local v7    # "it$iv":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 313
    .restart local v8    # "$i$a$-let-ComposerKt$cache$1$iv":I
    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_3

    .line 314
    const/4 v9, 0x0

    .line 169
    .local v9, "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$keysInComposition$1":I
    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v10, Ljava/util/Set;

    .line 314
    .end local v9    # "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$keysInComposition$1":I
    nop

    .line 315
    .restart local v10    # "value$iv":Ljava/lang/Object;
    invoke-interface {v3, v10}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 316
    move-object v7, v10

    .end local v10    # "value$iv":Ljava/lang/Object;
    goto :goto_2

    .line 317
    :cond_3
    nop

    .line 312
    .end local v7    # "it$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_2
    nop

    .line 169
    .end local v2    # "invalid$iv":Z
    .end local v3    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v5    # "$i$f$cache":I
    move-object v3, v7

    check-cast v3, Ljava/util/Set;

    .local v3, "keysInComposition":Ljava/util/Set;
    invoke-static {v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    const v2, 0x69a0be6

    invoke-interface {v4, v2}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v2, "*171@7452L73"

    invoke-static {v4, v2}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    .line 171
    move-object/from16 v7, p0

    .local v7, "$this$fastMapOrMap$iv":Ljava/util/List;
    const/4 v8, 0x0

    .line 318
    .local v8, "$i$f$fastMapOrMap":I
    instance-of v2, v7, Ljava/util/RandomAccess;

    if-eqz v2, :cond_5

    .line 319
    move-object v9, v7

    .local v9, "$this$fastMap$iv$iv":Ljava/util/List;
    const/4 v10, 0x0

    .line 320
    .local v10, "$i$f$fastMap":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    move-object v11, v2

    .line 321
    .local v11, "target$iv$iv":Ljava/util/ArrayList;
    move-object v12, v9

    .local v12, "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    const/4 v13, 0x0

    .line 322
    .local v13, "$i$f$fastForEach":I
    const/4 v2, 0x0

    .local v2, "index$iv$iv$iv":I
    move-object v5, v12

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v5}, Ljava/util/Collection;->size()I

    move-result v14

    move v15, v2

    .end local v2    # "index$iv$iv$iv":I
    .local v15, "index$iv$iv$iv":I
    :goto_3
    if-ge v15, v14, :cond_4

    .line 323
    invoke-interface {v12, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    .line 324
    .local v16, "item$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 v17, v16

    .local v17, "it$iv$iv":Ljava/lang/Object;
    const/16 v18, 0x0

    .line 321
    .local v18, "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    move-object v2, v11

    check-cast v2, Ljava/util/Collection;

    move-object v5, v2

    move-object v2, v0

    .end local v0    # "keysInBackstack":Ljava/util/Set;
    .local v2, "keysInBackstack":Ljava/util/Set;
    move-object/from16 v0, v17

    check-cast v0, Landroidx/navigation3/runtime/NavEntry;

    .local v0, "entry":Landroidx/navigation3/runtime/NavEntry;
    const/16 v19, 0x0

    .line 172
    .local v19, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$decoratedEntries$1":I
    move-object/from16 v20, v5

    and-int/lit8 v5, v6, 0x70

    move-object/from16 v6, v20

    invoke-static/range {v0 .. v5}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry(Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntry;

    move-result-object v0

    .line 321
    .end local v0    # "entry":Landroidx/navigation3/runtime/NavEntry;
    .end local v19    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$decoratedEntries$1":I
    invoke-interface {v6, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 324
    .end local v17    # "it$iv$iv":Ljava/lang/Object;
    .end local v18    # "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    nop

    .line 322
    .end local v16    # "item$iv$iv$iv":Ljava/lang/Object;
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v4, p2

    move/from16 v6, p3

    move-object v0, v2

    goto :goto_3

    .end local v2    # "keysInBackstack":Ljava/util/Set;
    .local v0, "keysInBackstack":Ljava/util/Set;
    :cond_4
    move-object v2, v0

    .line 326
    .end local v0    # "keysInBackstack":Ljava/util/Set;
    .end local v15    # "index$iv$iv$iv":I
    .restart local v2    # "keysInBackstack":Ljava/util/Set;
    nop

    .line 334
    .end local v12    # "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    .end local v13    # "$i$f$fastForEach":I
    move-object v0, v11

    check-cast v0, Ljava/util/List;

    .end local v9    # "$this$fastMap$iv$iv":Ljava/util/List;
    .end local v10    # "$i$f$fastMap":I
    .end local v11    # "target$iv$iv":Ljava/util/ArrayList;
    goto :goto_5

    .line 335
    .end local v2    # "keysInBackstack":Ljava/util/Set;
    .restart local v0    # "keysInBackstack":Ljava/util/Set;
    :cond_5
    move-object v2, v0

    .end local v0    # "keysInBackstack":Ljava/util/Set;
    .restart local v2    # "keysInBackstack":Ljava/util/Set;
    move-object v6, v7

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$map$iv$iv":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 336
    .local v9, "$i$f$map":I
    new-instance v0, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v6, v4}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object v10, v0

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination$iv$iv$iv":Ljava/util/Collection;
    move-object v11, v6

    .local v11, "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 337
    .local v12, "$i$f$mapTo":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    .line 338
    .local v14, "item$iv$iv$iv":Ljava/lang/Object;
    move-object v0, v14

    check-cast v0, Landroidx/navigation3/runtime/NavEntry;

    .local v0, "entry":Landroidx/navigation3/runtime/NavEntry;
    const/4 v15, 0x0

    .line 172
    .local v15, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$decoratedEntries$1":I
    and-int/lit8 v5, p3, 0x70

    move-object/from16 v4, p2

    invoke-static/range {v0 .. v5}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry(Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntry;

    move-result-object v0

    .line 338
    .end local v0    # "entry":Landroidx/navigation3/runtime/NavEntry;
    .end local v15    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$decoratedEntries$1":I
    invoke-interface {v10, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 339
    .end local v14    # "item$iv$iv$iv":Ljava/lang/Object;
    :cond_6
    nop

    .end local v10    # "destination$iv$iv$iv":Ljava/util/Collection;
    .end local v11    # "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "$i$f$mapTo":I
    move-object v0, v10

    check-cast v0, Ljava/util/List;

    .line 336
    nop

    .line 340
    .end local v6    # "$this$map$iv$iv":Ljava/lang/Iterable;
    .end local v9    # "$i$f$map":I
    :goto_5
    nop

    .line 171
    .end local v7    # "$this$fastMapOrMap$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastMapOrMap":I
    invoke-interface/range {p2 .. p2}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    .line 170
    nop

    .line 175
    .local v0, "decoratedEntries":Ljava/util/List;
    and-int/lit8 v5, p3, 0x70

    move-object/from16 v4, p2

    invoke-static/range {v0 .. v5}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 167
    :cond_7
    invoke-static/range {p2 .. p2}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 176
    return-object v0
.end method

.method public static final rememberDecoratedNavEntries(Ljava/util/List;Ljava/util/List;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;II)Ljava/util/List;
    .locals 23
    .param p0, "backStack"    # Ljava/util/List;
    .param p1, "entryDecorators"    # Ljava/util/List;
    .param p2, "entryProvider"    # Lkotlin/jvm/functions/Function1;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/runtime/Composer;",
            "II)",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;"
        }
    .end annotation

    .line 122
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move/from16 v2, p4

    const v3, -0xf142da4

    const-string v4, "C(rememberDecoratedNavEntries)N(backStack,entryDecorators,entryProvider)124@5259L92,126@5364L53:DecoratedNavEntries.kt#aulyik"

    invoke-static {v1, v3, v4}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    and-int/lit8 v4, p5, 0x2

    if-eqz v4, :cond_0

    .line 120
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v4

    .end local p1    # "entryDecorators":Ljava/util/List;
    .local v4, "entryDecorators":Ljava/util/List;
    goto :goto_0

    .line 122
    .end local v4    # "entryDecorators":Ljava/util/List;
    .restart local p1    # "entryDecorators":Ljava/util/List;
    :cond_0
    move-object/from16 v4, p1

    .line 120
    .end local p1    # "entryDecorators":Ljava/util/List;
    .restart local v4    # "entryDecorators":Ljava/util/List;
    :goto_0
    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_1

    const/4 v5, -0x1

    const-string v6, "androidx.navigation3.runtime.rememberDecoratedNavEntries (DecoratedNavEntries.kt:121)"

    invoke-static {v3, v2, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 125
    :cond_1
    move-object/from16 v3, p0

    check-cast v3, Ljava/lang/Iterable;

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    const v5, 0x6540cdb8

    const-string v6, "CC(remember):DecoratedNavEntries.kt#9igjgp"

    invoke-static {v1, v5, v6}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerStart(Landroidx/compose/runtime/Composer;ILjava/lang/String;)V

    invoke-interface {v1, v3}, Landroidx/compose/runtime/Composer;->changed(Ljava/lang/Object;)Z

    move-result v3

    .local v3, "invalid$iv":Z
    move-object/from16 v5, p3

    .local v5, "$this$cache$iv":Landroidx/compose/runtime/Composer;
    const/4 v6, 0x0

    .line 277
    .local v6, "$i$f$cache":I
    invoke-interface {v5}, Landroidx/compose/runtime/Composer;->rememberedValue()Ljava/lang/Object;

    move-result-object v7

    .local v7, "it$iv":Ljava/lang/Object;
    const/4 v8, 0x0

    .line 278
    .local v8, "$i$a$-let-ComposerKt$cache$1$iv":I
    if-nez v3, :cond_3

    sget-object v9, Landroidx/compose/runtime/Composer;->Companion:Landroidx/compose/runtime/Composer$Companion;

    invoke-virtual {v9}, Landroidx/compose/runtime/Composer$Companion;->getEmpty()Ljava/lang/Object;

    move-result-object v9

    if-ne v7, v9, :cond_2

    goto :goto_1

    .line 305
    :cond_2
    move/from16 p1, v3

    goto/16 :goto_5

    .line 279
    :cond_3
    :goto_1
    const/4 v9, 0x0

    .line 125
    .local v9, "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1":I
    move-object/from16 v10, p0

    .local v10, "$this$fastMapOrMap$iv":Ljava/util/List;
    const/4 v11, 0x0

    .line 280
    .local v11, "$i$f$fastMapOrMap":I
    instance-of v12, v10, Ljava/util/RandomAccess;

    if-eqz v12, :cond_5

    .line 281
    move-object v12, v10

    .local v12, "$this$fastMap$iv$iv":Ljava/util/List;
    const/4 v13, 0x0

    .line 282
    .local v13, "$i$f$fastMap":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 283
    .local v14, "target$iv$iv":Ljava/util/ArrayList;
    move-object v15, v12

    .local v15, "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    const/16 v16, 0x0

    .line 284
    .local v16, "$i$f$fastForEach":I
    const/16 v17, 0x0

    .local v17, "index$iv$iv$iv":I
    move-object/from16 v18, v15

    check-cast v18, Ljava/util/Collection;

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v2

    move/from16 p1, v3

    move/from16 v3, v17

    .end local v17    # "index$iv$iv$iv":I
    .local v3, "index$iv$iv$iv":I
    .local p1, "invalid$iv":Z
    :goto_2
    if-ge v3, v2, :cond_4

    .line 285
    invoke-interface {v15, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    .line 286
    .local v17, "item$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 v18, v17

    .local v18, "it$iv$iv":Ljava/lang/Object;
    const/16 v19, 0x0

    .line 283
    .local v19, "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    move/from16 p5, v2

    move-object v2, v14

    check-cast v2, Ljava/util/Collection;

    move-object/from16 v20, v18

    .local v20, "key":Ljava/lang/Object;
    const/16 v21, 0x0

    .line 125
    .local v21, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1$1":I
    move/from16 v22, v3

    move-object/from16 v3, v20

    .end local v20    # "key":Ljava/lang/Object;
    .local v3, "key":Ljava/lang/Object;
    .local v22, "index$iv$iv$iv":I
    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v3, v20

    check-cast v3, Landroidx/navigation3/runtime/NavEntry;

    .line 283
    .end local v3    # "key":Ljava/lang/Object;
    .end local v21    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1$1":I
    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 286
    .end local v18    # "it$iv$iv":Ljava/lang/Object;
    .end local v19    # "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    nop

    .line 284
    .end local v17    # "item$iv$iv$iv":Ljava/lang/Object;
    add-int/lit8 v3, v22, 0x1

    move/from16 v2, p5

    .end local v22    # "index$iv$iv$iv":I
    .local v3, "index$iv$iv$iv":I
    goto :goto_2

    :cond_4
    move/from16 v22, v3

    .line 288
    .end local v3    # "index$iv$iv$iv":I
    nop

    .line 296
    .end local v15    # "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    .end local v16    # "$i$f$fastForEach":I
    move-object v2, v14

    check-cast v2, Ljava/util/List;

    .end local v12    # "$this$fastMap$iv$iv":Ljava/util/List;
    .end local v13    # "$i$f$fastMap":I
    .end local v14    # "target$iv$iv":Ljava/util/ArrayList;
    goto :goto_4

    .line 297
    .end local p1    # "invalid$iv":Z
    .local v3, "invalid$iv":Z
    :cond_5
    move/from16 p1, v3

    .end local v3    # "invalid$iv":Z
    .restart local p1    # "invalid$iv":Z
    move-object v2, v10

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$map$iv$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 298
    .local v3, "$i$f$map":I
    new-instance v12, Ljava/util/ArrayList;

    const/16 v13, 0xa

    invoke-static {v2, v13}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v12, Ljava/util/Collection;

    .local v12, "destination$iv$iv$iv":Ljava/util/Collection;
    move-object v13, v2

    .local v13, "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v14, 0x0

    .line 299
    .local v14, "$i$f$mapTo":I
    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_3
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_6

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .line 300
    .local v16, "item$iv$iv$iv":Ljava/lang/Object;
    move-object/from16 p5, v16

    .local p5, "key":Ljava/lang/Object;
    const/16 v17, 0x0

    .line 125
    .local v17, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1$1":I
    move-object/from16 v18, v2

    move-object/from16 v2, p5

    .end local p5    # "key":Ljava/lang/Object;
    .local v2, "key":Ljava/lang/Object;
    .local v18, "$this$map$iv$iv":Ljava/lang/Iterable;
    invoke-interface {v0, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v2, v19

    check-cast v2, Landroidx/navigation3/runtime/NavEntry;

    .line 300
    .end local v2    # "key":Ljava/lang/Object;
    .end local v17    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1$1":I
    invoke-interface {v12, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, v18

    goto :goto_3

    .line 301
    .end local v16    # "item$iv$iv$iv":Ljava/lang/Object;
    .end local v18    # "$this$map$iv$iv":Ljava/lang/Iterable;
    .local v2, "$this$map$iv$iv":Ljava/lang/Iterable;
    :cond_6
    move-object/from16 v18, v2

    .end local v2    # "$this$map$iv$iv":Ljava/lang/Iterable;
    .end local v12    # "destination$iv$iv$iv":Ljava/util/Collection;
    .end local v13    # "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    .end local v14    # "$i$f$mapTo":I
    .restart local v18    # "$this$map$iv$iv":Ljava/lang/Iterable;
    move-object v2, v12

    check-cast v2, Ljava/util/List;

    .line 298
    nop

    .line 302
    .end local v3    # "$i$f$map":I
    .end local v18    # "$this$map$iv$iv":Ljava/lang/Iterable;
    :goto_4
    nop

    .line 125
    .end local v10    # "$this$fastMapOrMap$iv":Ljava/util/List;
    .end local v11    # "$i$f$fastMapOrMap":I
    nop

    .line 279
    .end local v9    # "$i$a$-cache-DecoratedNavEntriesKt$rememberDecoratedNavEntries$entries$1":I
    nop

    .line 303
    .local v2, "value$iv":Ljava/lang/Object;
    invoke-interface {v5, v2}, Landroidx/compose/runtime/Composer;->updateRememberedValue(Ljava/lang/Object;)V

    .line 304
    move-object v7, v2

    .line 277
    .end local v2    # "value$iv":Ljava/lang/Object;
    .end local v7    # "it$iv":Ljava/lang/Object;
    .end local v8    # "$i$a$-let-ComposerKt$cache$1$iv":I
    :goto_5
    nop

    .line 125
    .end local v5    # "$this$cache$iv":Landroidx/compose/runtime/Composer;
    .end local v6    # "$i$f$cache":I
    .end local p1    # "invalid$iv":Z
    check-cast v7, Ljava/util/List;

    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 124
    nop

    .line 127
    .local v7, "entries":Ljava/util/List;
    and-int/lit8 v2, p4, 0x70

    const/4 v3, 0x0

    invoke-static {v7, v4, v1, v2, v3}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->rememberDecoratedNavEntries(Ljava/util/List;Ljava/util/List;Landroidx/compose/runtime/Composer;II)Ljava/util/List;

    move-result-object v2

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v3

    if-eqz v3, :cond_7

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    .line 122
    :cond_7
    invoke-static {v1}, Landroidx/compose/runtime/ComposerKt;->sourceInformationMarkerEnd(Landroidx/compose/runtime/Composer;)V

    .line 127
    return-object v2
.end method
