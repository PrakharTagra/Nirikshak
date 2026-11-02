.class public final Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;
.super Ljava/lang/Object;
.source "Effects.kt"

# interfaces
.implements Landroidx/compose/runtime/DisposableEffectResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->decorateEntry(Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/Set;Ljava/util/Set;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEffects.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Effects.kt\nandroidx/compose/runtime/DisposableEffectScope$onDispose$1\n+ 2 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n+ 3 ListUtils.kt\nandroidx/navigation3/runtime/ListUtilsKt\n+ 4 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,69:1\n209#2,9:70\n218#2,2:84\n221#2:91\n32#3,2:79\n78#3,3:81\n82#3:86\n35#3:87\n37#3:90\n1863#4,2:88\n*S KotlinDebug\n*F\n+ 1 DecoratedNavEntries.kt\nandroidx/navigation3/runtime/DecoratedNavEntriesKt\n*L\n217#1:79,2\n217#1:81,3\n217#1:86\n217#1:87\n217#1:90\n217#1:88,2\n*E\n"
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

.field final synthetic $keysInBackstack$inlined:Ljava/util/Set;

.field final synthetic $keysInComposition$inlined:Ljava/util/Set;

.field final synthetic $latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;


# direct methods
.method public constructor <init>(Ljava/util/Set;Ljava/lang/Object;Ljava/util/Set;Landroidx/compose/runtime/State;)V
    .locals 0

    iput-object p1, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$keysInComposition$inlined:Ljava/util/Set;

    iput-object p2, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    iput-object p3, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$keysInBackstack$inlined:Ljava/util/Set;

    iput-object p4, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 14

    .line 68
    const/4 v0, 0x0

    .line 70
    .local v0, "$i$a$-onDispose-DecoratedNavEntriesKt$decorateEntry$1$1$1$1":I
    iget-object v1, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$keysInComposition$inlined:Ljava/util/Set;

    iget-object v2, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v1, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v1

    .line 71
    .local v1, "notInComposition":Z
    iget-object v2, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$keysInBackstack$inlined:Ljava/util/Set;

    iget-object v3, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 72
    .local v2, "popped":Z
    if-eqz v2, :cond_4

    if-eqz v1, :cond_4

    .line 78
    iget-object v3, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$latestDecorators$delegate$inlined:Landroidx/compose/runtime/State;

    invoke-static {v3}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->access$decorateEntry$lambda$0(Landroidx/compose/runtime/State;)Ljava/util/List;

    move-result-object v3

    .local v3, "$this$fastForEachReversedOrForEachReversed$iv":Ljava/util/List;
    const/4 v4, 0x0

    .line 79
    .local v4, "$i$f$fastForEachReversedOrForEachReversed":I
    instance-of v5, v3, Ljava/util/RandomAccess;

    if-eqz v5, :cond_2

    .line 80
    move-object v5, v3

    .local v5, "$this$fastForEachReversed$iv$iv":Ljava/util/List;
    const/4 v6, 0x0

    .line 81
    .local v6, "$i$f$fastForEachReversed":I
    move-object v7, v5

    check-cast v7, Ljava/util/Collection;

    invoke-interface {v7}, Ljava/util/Collection;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    if-ltz v7, :cond_1

    :cond_0
    move v8, v7

    .local v8, "index$iv$iv":I
    add-int/lit8 v7, v7, -0x1

    .line 82
    invoke-interface {v5, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .line 83
    .local v9, "item$iv$iv":Ljava/lang/Object;
    move-object v10, v9

    check-cast v10, Landroidx/navigation3/runtime/NavEntryDecorator;

    .local v10, "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    const/4 v11, 0x0

    .line 84
    .local v11, "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$decorateEntry$1$1$1$1$1":I
    invoke-virtual {v10}, Landroidx/navigation3/runtime/NavEntryDecorator;->getOnPop$navigation3_runtime()Lkotlin/jvm/functions/Function1;

    move-result-object v12

    iget-object v13, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v12, v13}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    nop

    .line 83
    .end local v10    # "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    .end local v11    # "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$decorateEntry$1$1$1$1$1":I
    nop

    .line 81
    .end local v9    # "item$iv$iv":Ljava/lang/Object;
    if-gez v7, :cond_0

    .line 86
    .end local v8    # "index$iv$iv":I
    :cond_1
    nop

    .end local v5    # "$this$fastForEachReversed$iv$iv":Ljava/util/List;
    .end local v6    # "$i$f$fastForEachReversed":I
    goto :goto_1

    .line 87
    :cond_2
    move-object v5, v3

    check-cast v5, Ljava/lang/Iterable;

    invoke-static {v5}, Lkotlin/collections/CollectionsKt;->reversed(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$forEach$iv$iv":Ljava/lang/Iterable;
    const/4 v6, 0x0

    .line 88
    .local v6, "$i$f$forEach":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Landroidx/navigation3/runtime/NavEntryDecorator;

    .local v9, "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    const/4 v10, 0x0

    .line 84
    .local v10, "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$decorateEntry$1$1$1$1$1":I
    invoke-virtual {v9}, Landroidx/navigation3/runtime/NavEntryDecorator;->getOnPop$navigation3_runtime()Lkotlin/jvm/functions/Function1;

    move-result-object v11

    iget-object v12, p0, Landroidx/navigation3/runtime/DecoratedNavEntriesKt$decorateEntry$lambda$1$0$0$$inlined$onDispose$1;->$contentKey$inlined:Ljava/lang/Object;

    invoke-interface {v11, v12}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    nop

    .line 88
    .end local v9    # "it":Landroidx/navigation3/runtime/NavEntryDecorator;
    .end local v10    # "$i$a$-fastForEachReversedOrForEachReversed-DecoratedNavEntriesKt$decorateEntry$1$1$1$1$1":I
    nop

    .end local v8    # "element$iv$iv":Ljava/lang/Object;
    goto :goto_0

    .line 89
    :cond_3
    nop

    .line 90
    .end local v5    # "$this$forEach$iv$iv":Ljava/lang/Iterable;
    .end local v6    # "$i$f$forEach":I
    :goto_1
    nop

    .line 91
    .end local v3    # "$this$fastForEachReversedOrForEachReversed$iv":Ljava/util/List;
    .end local v4    # "$i$f$fastForEachReversedOrForEachReversed":I
    :cond_4
    nop

    .line 68
    .end local v0    # "$i$a$-onDispose-DecoratedNavEntriesKt$decorateEntry$1$1$1$1":I
    .end local v1    # "notInComposition":Z
    .end local v2    # "popped":Z
    nop

    .line 69
    return-void
.end method
