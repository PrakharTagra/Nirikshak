.class public final Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;
.super Ljava/lang/Object;
.source "Effects.kt"

# interfaces
.implements Landroidx/compose/runtime/DisposableEffectResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->PrepareBackStack(Ljava/util/List;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEffects.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Effects.kt\nandroidx/compose/runtime/DisposableEffectScope$onDispose$1\n+ 2 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n+ 3 ListUtils.kt\nandroidx/navigation3/runtime/ListUtilsKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,69:1\n260#2:70\n262#2,3:94\n261#2,10:97\n272#2:118\n25#3,2:71\n69#3,2:73\n59#3,13:75\n28#3:88\n29#3:93\n32#3,2:107\n78#3,5:109\n35#3:114\n37#3:117\n1557#4:89\n1628#4,3:90\n1863#4,2:115\n*S KotlinDebug\n*F\n+ 1 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n*L\n260#1:71,2\n260#1:73,2\n260#1:75,13\n260#1:88\n260#1:93\n270#1:107,2\n270#1:109,5\n270#1:114\n270#1:117\n260#1:89\n260#1:90,3\n270#1:115,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004\u00b8\u0006\u0000"
    }
    d2 = {
        "androidx/compose/runtime/DisposableEffectScope$onDispose$1",
        "Landroidx/compose/runtime/DisposableEffectResult;",
        "dispose",
        "",
        "runtime"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $contentKey$inlined:Ljava/lang/Object;

.field final synthetic $keysInBackStack$inlined:Ljava/util/Set;

.field final synthetic $keysInComposition$inlined:Ljava/util/Set;

.field final synthetic $latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;

.field final synthetic $latestEntries$delegate$inlined:Landroidx/compose/runtime/State;


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/State;Landroidx/compose/runtime/State;)V
    .locals 0

    iput-object p1, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    iput-object p2, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$keysInBackStack$inlined:Ljava/util/Set;

    iput-object p3, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$keysInComposition$inlined:Ljava/util/Set;

    iput-object p4, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$latestEntries$delegate$inlined:Landroidx/compose/runtime/State;

    iput-object p5, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 17

    .line 68
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 70
    .local v1, "$i$a$-onDispose-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1":I
    iget-object v2, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$latestEntries$delegate$inlined:Landroidx/compose/runtime/State;

    invoke-static {v2}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->access$PrepareBackStack$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v2

    .local v2, "$this$fastMapOrMap$iv":Ljava/util/List;
    const/4 v3, 0x0

    .line 71
    .local v3, "$i$f$fastMapOrMap":I
    instance-of v4, v2, Ljava/util/RandomAccess;

    if-eqz v4, :cond_1

    .line 72
    move-object v4, v2

    .local v4, "$this$fastMap$iv$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 73
    .local v5, "$i$f$fastMap":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 74
    .local v6, "target$iv$iv":Ljava/util/ArrayList;
    move-object v7, v4

    .local v7, "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    const/4 v8, 0x0

    .line 75
    .local v8, "$i$f$fastForEach":I
    const/4 v9, 0x0

    .local v9, "index$iv$iv$iv":I
    move-object v10, v7

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->size()I

    move-result v10

    :goto_0
    if-ge v9, v10, :cond_0

    .line 76
    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    .line 77
    .local v11, "item$iv$iv$iv":Ljava/lang/Object;
    move-object v12, v11

    .local v12, "it$iv$iv":Ljava/lang/Object;
    const/4 v13, 0x0

    .line 74
    .local v13, "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    move-object v14, v6

    check-cast v14, Ljava/util/Collection;

    move-object v15, v12

    check-cast v15, Landroidx/navigation3/runtime/NavEntry;

    .local v15, "entry":Landroidx/navigation3/runtime/NavEntry;
    const/16 v16, 0x0

    .line 70
    .local v16, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$latestBackStack$1":I
    invoke-virtual {v15}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v15

    .line 74
    .end local v15    # "entry":Landroidx/navigation3/runtime/NavEntry;
    .end local v16    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$latestBackStack$1":I
    invoke-interface {v14, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 77
    .end local v12    # "it$iv$iv":Ljava/lang/Object;
    .end local v13    # "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv$iv":I
    nop

    .line 75
    .end local v11    # "item$iv$iv$iv":Ljava/lang/Object;
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 79
    .end local v9    # "index$iv$iv$iv":I
    :cond_0
    nop

    .line 87
    .end local v7    # "$this$fastForEach$iv$iv$iv":Ljava/util/List;
    .end local v8    # "$i$f$fastForEach":I
    move-object v4, v6

    check-cast v4, Ljava/util/List;

    .end local v4    # "$this$fastMap$iv$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastMap":I
    .end local v6    # "target$iv$iv":Ljava/util/ArrayList;
    goto :goto_2

    .line 88
    :cond_1
    move-object v4, v2

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$map$iv$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 89
    .local v5, "$i$f$map":I
    new-instance v6, Ljava/util/ArrayList;

    const/16 v7, 0xa

    invoke-static {v4, v7}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v7

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v6, Ljava/util/Collection;

    .local v6, "destination$iv$iv$iv":Ljava/util/Collection;
    move-object v7, v4

    .local v7, "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    const/4 v8, 0x0

    .line 90
    .local v8, "$i$f$mapTo":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    .line 91
    .local v10, "item$iv$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Landroidx/navigation3/runtime/NavEntry;

    .local v11, "entry":Landroidx/navigation3/runtime/NavEntry;
    const/4 v12, 0x0

    .line 70
    .local v12, "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$latestBackStack$1":I
    invoke-virtual {v11}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v11

    .line 91
    .end local v11    # "entry":Landroidx/navigation3/runtime/NavEntry;
    .end local v12    # "$i$a$-fastMapOrMap-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$latestBackStack$1":I
    invoke-interface {v6, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 92
    .end local v10    # "item$iv$iv$iv":Ljava/lang/Object;
    :cond_2
    nop

    .end local v6    # "destination$iv$iv$iv":Ljava/util/Collection;
    .end local v7    # "$this$mapTo$iv$iv$iv":Ljava/lang/Iterable;
    .end local v8    # "$i$f$mapTo":I
    check-cast v6, Ljava/util/List;

    .line 89
    move-object v4, v6

    .line 93
    .end local v4    # "$this$map$iv$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$map":I
    :goto_2
    nop

    .line 70
    .end local v2    # "$this$fastMapOrMap$iv":Ljava/util/List;
    .end local v3    # "$i$f$fastMapOrMap":I
    nop

    .line 94
    .local v4, "latestBackStack":Ljava/util/List;
    iget-object v2, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v4, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 95
    iget-object v2, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$keysInBackStack$inlined:Ljava/util/Set;

    iget-object v3, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v2, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    goto :goto_3

    .line 96
    :cond_3
    const/4 v2, 0x0

    .line 94
    :goto_3
    nop

    .line 97
    nop

    .line 102
    .local v2, "popped":Z
    if-eqz v2, :cond_8

    iget-object v3, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$keysInComposition$inlined:Ljava/util/Set;

    iget-object v5, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v3, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    .line 106
    iget-object v3, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;

    invoke-static {v3}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->access$PrepareBackStack$lambda$1(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v3

    .local v3, "$this$fastForEachReversedOrForEachReversed$iv":Ljava/util/List;
    const/4 v5, 0x0

    .line 107
    .local v5, "$i$f$fastForEachReversedOrForEachReversed":I
    instance-of v6, v3, Ljava/util/RandomAccess;

    if-eqz v6, :cond_6

    .line 108
    move-object v6, v3

    .local v6, "$this$fastForEachReversed$iv$iv":Ljava/util/List;
    const/4 v7, 0x0

    .line 109
    .local v7, "$i$f$fastForEachReversed":I
    move-object v8, v6

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v8}, Ljava/util/Collection;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ltz v8, :cond_5

    :cond_4
    move v9, v8

    .local v9, "index$iv$iv":I
    add-int/lit8 v8, v8, -0x1

    .line 110
    invoke-interface {v6, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .line 111
    .local v10, "item$iv$iv":Ljava/lang/Object;
    move-object v11, v10

    check-cast v11, Landroidx/navigation3/runtime/NavEntryDecorator;

    .local v11, "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    const/4 v12, 0x0

    .line 106
    .local v12, "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$1":I
    invoke-virtual {v11}, Landroidx/navigation3/runtime/NavEntryDecorator;->getOnPop$navigation3_runtime()Lkotlin/jvm/functions/Function1;

    move-result-object v13

    iget-object v14, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v13, v14}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .end local v11    # "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    .end local v12    # "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$1":I
    nop

    .line 109
    .end local v10    # "item$iv$iv":Ljava/lang/Object;
    if-gez v8, :cond_4

    .line 113
    .end local v9    # "index$iv$iv":I
    :cond_5
    nop

    .end local v6    # "$this$fastForEachReversed$iv$iv":Ljava/util/List;
    .end local v7    # "$i$f$fastForEachReversed":I
    goto :goto_5

    .line 114
    :cond_6
    move-object v6, v3

    check-cast v6, Ljava/lang/Iterable;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    check-cast v6, Ljava/lang/Iterable;

    .local v6, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 115
    .local v7, "$i$f$forEach":I
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .local v9, "element$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/navigation3/runtime/NavEntryDecorator;

    .local v10, "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    const/4 v11, 0x0

    .line 106
    .local v11, "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$1":I
    invoke-virtual {v10}, Landroidx/navigation3/runtime/NavEntryDecorator;->getOnPop$navigation3_runtime()Lkotlin/jvm/functions/Function1;

    move-result-object v12

    iget-object v13, v0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$PrepareBackStack$lambda$2$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v12, v13}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v10    # "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    .end local v11    # "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1$1":I
    nop

    .end local v9    # "element$iv$iv":Ljava/lang/Object;
    goto :goto_4

    .line 116
    :cond_7
    nop

    .line 117
    .end local v6    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .end local v7    # "$i$f$forEach":I
    :goto_5
    nop

    .line 118
    .end local v3    # "$this$fastForEachReversedOrForEachReversed$iv":Ljava/util/List;
    .end local v5    # "$i$f$fastForEachReversedOrForEachReversed":I
    :cond_8
    nop

    .line 68
    .end local v1    # "$i$a$-onDispose-DecoratedNavEntriesKt$PrepareBackStack$1$1$1$1":I
    .end local v2    # "popped":Z
    .end local v4    # "latestBackStack":Ljava/util/List;
    nop

    .line 69
    return-void
.end method
