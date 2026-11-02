.class final Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;
.super Ljava/lang/Object;
.source "NavDisplay.kt"

# interfaces
.implements Lkotlinx/coroutines/flow/FlowCollector;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lkotlinx/coroutines/flow/FlowCollector;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNavDisplay.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NavDisplay.kt\nandroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 ObjectFloatMap.kt\nandroidx/collection/MutableObjectFloatMap\n+ 4 ObjectFloatMap.kt\nandroidx/collection/ObjectFloatMap\n+ 5 ScatterMap.kt\nandroidx/collection/ScatterMapKt\n*L\n1#1,645:1\n1863#2,2:646\n844#3:648\n846#3,4:662\n850#3:672\n374#4,6:649\n384#4,3:656\n387#4,2:660\n390#4,6:666\n1956#5:655\n1820#5:659\n*S KotlinDebug\n*F\n+ 1 NavDisplay.kt\nandroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3\n*L\n581#1:646,2\n587#1:648\n587#1:662,4\n587#1:672\n587#1:649,6\n587#1:656,3\n587#1:660,2\n587#1:666,6\n587#1:655\n587#1:659\n*E\n"
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
.field final synthetic $sceneMap:Landroidx/compose/runtime/snapshots/SnapshotStateMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateMap<",
            "Lkotlin/Pair<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Ljava/lang/Object;",
            ">;",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field final synthetic $transition:Landroidx/compose/animation/core/Transition;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/animation/core/Transition<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field final synthetic $zIndices:Landroidx/collection/MutableObjectFloatMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/collection/MutableObjectFloatMap<",
            "Lkotlin/Pair<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/compose/animation/core/Transition;Landroidx/compose/runtime/snapshots/SnapshotStateMap;Landroidx/collection/MutableObjectFloatMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/animation/core/Transition<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/runtime/snapshots/SnapshotStateMap<",
            "Lkotlin/Pair<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Ljava/lang/Object;",
            ">;",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/collection/MutableObjectFloatMap<",
            "Lkotlin/Pair<",
            "Lkotlin/reflect/KClass<",
            "*>;",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$transition:Landroidx/compose/animation/core/Transition;

    iput-object p2, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$sceneMap:Landroidx/compose/runtime/snapshots/SnapshotStateMap;

    iput-object p3, p0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$zIndices:Landroidx/collection/MutableObjectFloatMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 577
    move-object v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-virtual {p0, v0, p2}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->emit(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final emit(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 19
    .param p1, "it"    # Z
    .param p2, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 578
    move-object/from16 v0, p0

    iget-object v1, v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$transition:Landroidx/compose/animation/core/Transition;

    invoke-virtual {v1}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v1

    iget-object v2, v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$transition:Landroidx/compose/animation/core/Transition;

    invoke-virtual {v2}, Landroidx/compose/animation/core/Transition;->getTargetState()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/navigation3/scene/Scene;

    invoke-interface {v2}, Landroidx/navigation3/scene/Scene;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v1

    .line 581
    .local v1, "targetKey":Lkotlin/Pair;
    iget-object v2, v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$sceneMap:Landroidx/compose/runtime/snapshots/SnapshotStateMap;

    invoke-virtual {v2}, Landroidx/compose/runtime/snapshots/SnapshotStateMap;->keySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    iget-object v3, v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$sceneMap:Landroidx/compose/runtime/snapshots/SnapshotStateMap;

    const/4 v4, 0x0

    .line 646
    .local v4, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .local v6, "element$iv":Ljava/lang/Object;
    move-object v7, v6

    check-cast v7, Lkotlin/Pair;

    .local v7, "key":Lkotlin/Pair;
    const/4 v8, 0x0

    .line 582
    .local v8, "$i$a$-forEach-NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3$1":I
    invoke-static {v7, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 583
    invoke-virtual {v3, v7}, Landroidx/compose/runtime/snapshots/SnapshotStateMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 585
    :cond_0
    nop

    .line 646
    .end local v6    # "element$iv":Ljava/lang/Object;
    .end local v7    # "key":Lkotlin/Pair;
    .end local v8    # "$i$a$-forEach-NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3$1":I
    goto :goto_0

    .line 647
    :cond_1
    nop

    .line 587
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v4    # "$i$f$forEach":I
    iget-object v2, v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3;->$zIndices:Landroidx/collection/MutableObjectFloatMap;

    .local v2, "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    const/4 v3, 0x0

    .line 648
    .local v3, "$i$f$removeIf":I
    move-object v4, v2

    check-cast v4, Landroidx/collection/ObjectFloatMap;

    .local v4, "this_$iv$iv":Landroidx/collection/ObjectFloatMap;
    const/4 v5, 0x0

    .line 649
    .local v5, "$i$f$forEachIndexed":I
    iget-object v6, v4, Landroidx/collection/ObjectFloatMap;->metadata:[J

    .line 650
    .local v6, "m$iv$iv":[J
    array-length v7, v6

    add-int/lit8 v7, v7, -0x2

    .line 652
    .local v7, "lastIndex$iv$iv":I
    const/4 v8, 0x0

    .local v8, "i$iv$iv":I
    if-gt v8, v7, :cond_7

    .line 653
    :goto_1
    aget-wide v9, v6, v8

    .line 654
    .local v9, "slot$iv$iv":J
    move-wide v11, v9

    .local v11, "$this$maskEmptyOrDeleted$iv$iv$iv":J
    const/4 v13, 0x0

    .line 655
    .local v13, "$i$f$maskEmptyOrDeleted":I
    not-long v14, v11

    const/16 v16, 0x7

    shl-long v14, v14, v16

    and-long/2addr v14, v11

    const-wide v16, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long v11, v14, v16

    .line 654
    .end local v11    # "$this$maskEmptyOrDeleted$iv$iv$iv":J
    .end local v13    # "$i$f$maskEmptyOrDeleted":I
    cmp-long v11, v11, v16

    if-eqz v11, :cond_6

    .line 656
    sub-int v11, v8, v7

    not-int v11, v11

    ushr-int/lit8 v11, v11, 0x1f

    const/16 v12, 0x8

    rsub-int/lit8 v11, v11, 0x8

    .line 657
    .local v11, "bitCount$iv$iv":I
    const/4 v13, 0x0

    .local v13, "j$iv$iv":I
    :goto_2
    if-ge v13, v11, :cond_5

    .line 658
    const-wide/16 v14, 0xff

    and-long/2addr v14, v9

    .local v14, "value$iv$iv$iv":J
    const/16 v16, 0x0

    .line 659
    .local v16, "$i$f$isFull":I
    const-wide/16 v17, 0x80

    cmp-long v17, v14, v17

    if-gez v17, :cond_2

    const/16 v17, 0x1

    goto :goto_3

    :cond_2
    const/16 v17, 0x0

    .line 658
    .end local v14    # "value$iv$iv$iv":J
    .end local v16    # "$i$f$isFull":I
    :goto_3
    if-eqz v17, :cond_4

    .line 660
    shl-int/lit8 v14, v8, 0x3

    add-int/2addr v14, v13

    .line 661
    .local v14, "index$iv$iv":I
    move v15, v14

    .local v15, "index$iv":I
    const/16 v16, 0x0

    .line 662
    .local v16, "$i$a$-forEachIndexed-MutableObjectFloatMap$removeIf$1$iv":I
    move/from16 v17, v12

    iget-object v12, v2, Landroidx/collection/MutableObjectFloatMap;->keys:[Ljava/lang/Object;

    aget-object v12, v12, v15

    iget-object v0, v2, Landroidx/collection/MutableObjectFloatMap;->values:[F

    aget v0, v0, v15

    move-object v0, v12

    check-cast v0, Lkotlin/Pair;

    .local v0, "key":Lkotlin/Pair;
    const/4 v12, 0x0

    .line 587
    .local v12, "$i$a$-removeIf-NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3$2":I
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v18

    .line 662
    .end local v0    # "key":Lkotlin/Pair;
    .end local v12    # "$i$a$-removeIf-NavDisplayKt__NavDisplayKt$NavDisplay$12$1$3$2":I
    if-nez v18, :cond_3

    .line 663
    invoke-virtual {v2, v15}, Landroidx/collection/MutableObjectFloatMap;->removeValueAt(I)V

    .line 665
    :cond_3
    nop

    .line 661
    .end local v15    # "index$iv":I
    .end local v16    # "$i$a$-forEachIndexed-MutableObjectFloatMap$removeIf$1$iv":I
    goto :goto_4

    .line 658
    .end local v14    # "index$iv$iv":I
    :cond_4
    move/from16 v17, v12

    .line 666
    :goto_4
    shr-long v9, v9, v17

    .line 657
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v0, p0

    move/from16 v12, v17

    goto :goto_2

    :cond_5
    move/from16 v17, v12

    .line 668
    .end local v13    # "j$iv$iv":I
    move/from16 v0, v17

    if-ne v11, v0, :cond_8

    .line 652
    .end local v9    # "slot$iv$iv":J
    .end local v11    # "bitCount$iv$iv":I
    :cond_6
    if-eq v8, v7, :cond_7

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v0, p0

    goto :goto_1

    .line 671
    .end local v8    # "i$iv$iv":I
    :cond_7
    nop

    .line 672
    .end local v4    # "this_$iv$iv":Landroidx/collection/ObjectFloatMap;
    .end local v5    # "$i$f$forEachIndexed":I
    .end local v6    # "m$iv$iv":[J
    .end local v7    # "lastIndex$iv$iv":I
    :cond_8
    nop

    .line 588
    .end local v2    # "this_$iv":Landroidx/collection/MutableObjectFloatMap;
    .end local v3    # "$i$f$removeIf":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
