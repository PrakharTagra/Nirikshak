.class public final Landroidx/navigation3/scene/SceneStateKt;
.super Ljava/lang/Object;
.source "SceneState.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSceneState.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SceneState.kt\nandroidx/navigation3/scene/SceneStateKt\n+ 2 ListUtils.kt\nandroidx/compose/ui/util/ListUtilsKt\n*L\n1#1,151:1\n151#2,2:152\n35#2,5:154\n153#2:159\n*S KotlinDebug\n*F\n+ 1 SceneState.kt\nandroidx/navigation3/scene/SceneStateKt\n*L\n77#1:152,2\n77#1:154,5\n77#1:159\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u001aM\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u00032\u0012\u0010\u0004\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\u00060\u00052\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u00082\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\nH\u0007\u00a2\u0006\u0002\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "rememberSceneState",
        "Landroidx/navigation3/scene/SceneState;",
        "T",
        "",
        "entries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
        "sceneStrategy",
        "Landroidx/navigation3/scene/SceneStrategy;",
        "onBack",
        "Lkotlin/Function0;",
        "",
        "(Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/scene/SceneState;",
        "navigation3-ui"
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
.method public static final rememberSceneState(Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/scene/SceneState;
    .locals 22
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p2, "onBack"    # Lkotlin/jvm/functions/Function0;
    .param p3, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p4, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "I)",
            "Landroidx/navigation3/scene/SceneState<",
            "TT;>;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move/from16 v3, p4

    const v4, -0xb83a80f

    invoke-interface {v2, v4}, Landroidx/compose/runtime/Composer;->startReplaceGroup(I)V

    const-string v5, "C(rememberSceneState)N(entries,sceneStrategy,onBack)*50@2045L37,51@2104L57,47@1947L248:SceneState.kt#erzv7c"

    invoke-static {v2, v5}, Landroidx/compose/runtime/ComposerKt;->sourceInformation(Landroidx/compose/runtime/Composer;Ljava/lang/String;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, -0x1

    const-string v6, "androidx.navigation3.scene.rememberSceneState (SceneState.kt:41)"

    invoke-static {v4, v3, v5, v6}, Landroidx/compose/runtime/ComposerKt;->traceEventStart(IIILjava/lang/String;)V

    .line 42
    :cond_0
    new-instance v4, Landroidx/navigation3/scene/SceneStrategyScope;

    move-object/from16 v5, p2

    invoke-direct {v4, v5}, Landroidx/navigation3/scene/SceneStrategyScope;-><init>(Lkotlin/jvm/functions/Function0;)V

    .local v4, "$this$rememberSceneState_u24lambda_u240":Landroidx/navigation3/scene/SceneStrategyScope;
    const/4 v6, 0x0

    .line 49
    .local v6, "$i$a$-with-SceneStateKt$rememberSceneState$1":I
    nop

    .line 51
    const/4 v7, 0x2

    new-array v7, v7, [Landroidx/navigation3/runtime/NavEntryDecorator;

    const/4 v8, 0x0

    invoke-static {v2, v8}, Landroidx/navigation3/scene/SceneSetupNavEntryDecoratorKt;->rememberSceneSetupNavEntryDecorator(Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/scene/SceneSetupNavEntryDecorator;

    move-result-object v9

    aput-object v9, v7, v8

    .line 52
    and-int/lit8 v9, v3, 0xe

    invoke-static {v0, v2, v9}, Landroidx/navigation3/scene/BackStackAwareLifecycleNavEntryDecoratorKt;->rememberBackStackAwareLifecycleNavEntryDecorator(Ljava/util/List;Landroidx/compose/runtime/Composer;I)Landroidx/navigation3/runtime/NavEntryDecorator;

    move-result-object v9

    const/4 v10, 0x1

    aput-object v9, v7, v10

    .line 51
    nop

    .line 50
    invoke-static {v7}, Lkotlin/collections/CollectionsKt;->listOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    and-int/lit8 v9, v3, 0xe

    .line 48
    invoke-static {v0, v7, v2, v9, v8}, Landroidx/navigation3/runtime/DecoratedNavEntriesKt;->rememberDecoratedNavEntries(Ljava/util/List;Ljava/util/List;Landroidx/compose/runtime/Composer;II)Ljava/util/List;

    move-result-object v7

    .line 47
    nop

    .line 58
    .local v7, "decoratedEntries":Ljava/util/List;
    new-array v9, v10, [Landroidx/navigation3/scene/Scene;

    invoke-static {v1, v4, v7}, Landroidx/navigation3/scene/SinglePaneSceneKt;->calculateSceneWithSinglePaneFallback(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v11

    aput-object v11, v9, v8

    .line 57
    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v9

    .line 56
    nop

    .line 63
    .local v9, "allScenes":Ljava/util/List;
    :goto_0
    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->last(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    instance-of v12, v11, Landroidx/navigation3/scene/OverlayScene;

    if-eqz v12, :cond_1

    check-cast v11, Landroidx/navigation3/scene/OverlayScene;

    goto :goto_1

    :cond_1
    const/4 v11, 0x0

    .line 64
    .local v11, "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    :goto_1
    if-eqz v11, :cond_2

    invoke-interface {v11}, Landroidx/navigation3/scene/OverlayScene;->getOverlaidEntries()Ljava/util/List;

    move-result-object v12

    goto :goto_2

    :cond_2
    const/4 v12, 0x0

    .line 65
    .local v12, "overlaidEntries":Ljava/util/List;
    :goto_2
    if-eqz v12, :cond_4

    .line 67
    move-object v14, v12

    check-cast v14, Ljava/util/Collection;

    invoke-interface {v14}, Ljava/util/Collection;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_3

    .line 71
    move-object v14, v9

    check-cast v14, Ljava/util/Collection;

    .line 72
    invoke-static {v1, v4, v12}, Landroidx/navigation3/scene/SinglePaneSceneKt;->calculateSceneWithSinglePaneFallback(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v15

    invoke-interface {v14, v15}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 67
    :cond_3
    const/4 v8, 0x0

    .line 68
    .local v8, "$i$a$-require-SceneStateKt$rememberSceneState$1$1":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Overlaid entries from "

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v13, " must not be empty"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 67
    .end local v8    # "$i$a$-require-SceneStateKt$rememberSceneState$1$1":I
    new-instance v10, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v10, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 74
    .end local v11    # "overlayScene":Landroidx/navigation3/scene/OverlayScene;
    :cond_4
    :goto_3
    if-nez v12, :cond_e

    .line 77
    .end local v12    # "overlaidEntries":Ljava/util/List;
    invoke-static {v9, v10}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v11

    .local v11, "$this$fastMap$iv":Ljava/util/List;
    const/4 v12, 0x0

    .line 152
    .local v12, "$i$f$fastMap":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 153
    .local v14, "target$iv":Ljava/util/ArrayList;
    move-object v15, v11

    .local v15, "$this$fastForEach$iv$iv":Ljava/util/List;
    const/16 v16, 0x0

    .line 154
    .local v16, "$i$f$fastForEach":I
    const/16 v17, 0x0

    .local v17, "index$iv$iv":I
    move-object/from16 v18, v15

    check-cast v18, Ljava/util/Collection;

    invoke-interface/range {v18 .. v18}, Ljava/util/Collection;->size()I

    move-result v13

    move/from16 v18, v8

    move/from16 v8, v17

    .end local v17    # "index$iv$iv":I
    .local v8, "index$iv$iv":I
    :goto_4
    if-ge v8, v13, :cond_5

    .line 155
    invoke-interface {v15, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    .line 156
    .local v17, "item$iv$iv":Ljava/lang/Object;
    move-object/from16 v19, v17

    .local v19, "it$iv":Ljava/lang/Object;
    const/16 v20, 0x0

    .line 153
    .local v20, "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv":I
    move-object v10, v14

    check-cast v10, Ljava/util/Collection;

    move-object/from16 v0, v19

    check-cast v0, Landroidx/navigation3/scene/Scene;

    .local v0, "it":Landroidx/navigation3/scene/Scene;
    const/16 v21, 0x0

    .line 77
    .local v21, "$i$a$-fastMap-SceneStateKt$rememberSceneState$1$overlayScenes$1":I
    const-string/jumbo v2, "null cannot be cast to non-null type androidx.navigation3.scene.OverlayScene<T of androidx.navigation3.scene.SceneStateKt.rememberSceneState>"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroidx/navigation3/scene/OverlayScene;

    .line 153
    .end local v0    # "it":Landroidx/navigation3/scene/Scene;
    .end local v21    # "$i$a$-fastMap-SceneStateKt$rememberSceneState$1$overlayScenes$1":I
    invoke-interface {v10, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 156
    .end local v19    # "it$iv":Ljava/lang/Object;
    .end local v20    # "$i$a$-fastForEach-ListUtilsKt$fastMap$1$iv":I
    nop

    .line 154
    .end local v17    # "item$iv$iv":Ljava/lang/Object;
    add-int/lit8 v8, v8, 0x1

    const/4 v10, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p3

    goto :goto_4

    .line 158
    .end local v8    # "index$iv$iv":I
    :cond_5
    nop

    .line 159
    .end local v15    # "$this$fastForEach$iv$iv":Ljava/util/List;
    .end local v16    # "$i$f$fastForEach":I
    move-object v0, v14

    check-cast v0, Ljava/util/List;

    .line 77
    .end local v11    # "$this$fastMap$iv":Ljava/util/List;
    .end local v12    # "$i$f$fastMap":I
    .end local v14    # "target$iv":Ljava/util/ArrayList;
    nop

    .line 79
    .local v0, "overlayScenes":Ljava/util/List;
    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->last(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/navigation3/scene/Scene;

    .line 81
    .local v2, "currentScene":Landroidx/navigation3/scene/Scene;
    const/4 v8, 0x1

    new-array v10, v8, [Landroidx/navigation3/scene/Scene;

    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    aput-object v11, v10, v18

    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10

    .line 85
    .local v10, "previousScenes":Ljava/util/List;
    :goto_5
    invoke-static {v10}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroidx/navigation3/scene/Scene;

    .line 86
    .local v11, "previousScene":Landroidx/navigation3/scene/Scene;
    if-eqz v11, :cond_6

    invoke-interface {v11}, Landroidx/navigation3/scene/Scene;->getPreviousEntries()Ljava/util/List;

    move-result-object v12

    goto :goto_6

    :cond_6
    const/4 v12, 0x0

    .line 87
    .local v12, "previousEntries":Ljava/util/List;
    :goto_6
    move-object v13, v12

    check-cast v13, Ljava/util/Collection;

    if-eqz v13, :cond_8

    invoke-interface {v13}, Ljava/util/Collection;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_7

    goto :goto_7

    :cond_7
    move/from16 v13, v18

    goto :goto_8

    :cond_8
    :goto_7
    move v13, v8

    :goto_8
    if-nez v13, :cond_9

    .line 91
    nop

    .line 92
    nop

    .line 93
    invoke-static {v1, v4, v12}, Landroidx/navigation3/scene/SinglePaneSceneKt;->calculateSceneWithSinglePaneFallback(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v13

    .line 91
    move/from16 v14, v18

    invoke-interface {v10, v14, v13}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_9

    .line 87
    :cond_9
    move/from16 v14, v18

    .line 96
    .end local v11    # "previousScene":Landroidx/navigation3/scene/Scene;
    :goto_9
    move-object v11, v12

    check-cast v11, Ljava/util/Collection;

    if-eqz v11, :cond_b

    invoke-interface {v11}, Ljava/util/Collection;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_a

    goto :goto_a

    :cond_a
    move v11, v14

    goto :goto_b

    :cond_b
    :goto_a
    move v11, v8

    :goto_b
    if-eqz v11, :cond_d

    .line 99
    .end local v12    # "previousEntries":Ljava/util/List;
    invoke-interface {v10, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 101
    new-instance v8, Landroidx/navigation3/scene/SceneState;

    .line 102
    nop

    .line 103
    nop

    .line 104
    nop

    .line 105
    nop

    .line 101
    invoke-direct {v8, v7, v0, v2, v10}, Landroidx/navigation3/scene/SceneState;-><init>(Ljava/util/List;Ljava/util/List;Landroidx/navigation3/scene/Scene;Ljava/util/List;)V

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->isTraceInProgress()Z

    move-result v11

    if-eqz v11, :cond_c

    invoke-static {}, Landroidx/compose/runtime/ComposerKt;->traceEventEnd()V

    :cond_c
    invoke-interface/range {p3 .. p3}, Landroidx/compose/runtime/Composer;->endReplaceGroup()V

    return-object v8

    .line 96
    .restart local v12    # "previousEntries":Ljava/util/List;
    :cond_d
    move/from16 v18, v14

    goto :goto_5

    .line 74
    .end local v0    # "overlayScenes":Ljava/util/List;
    .end local v2    # "currentScene":Landroidx/navigation3/scene/Scene;
    .end local v10    # "previousScenes":Ljava/util/List;
    .local v12, "overlaidEntries":Ljava/util/List;
    :cond_e
    move v14, v8

    move v8, v10

    move-object/from16 v0, p0

    move-object/from16 v2, p3

    move v8, v14

    goto/16 :goto_0
.end method
