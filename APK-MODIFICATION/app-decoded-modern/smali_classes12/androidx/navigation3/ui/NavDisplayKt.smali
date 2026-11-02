.class public final Landroidx/navigation3/ui/NavDisplayKt;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "androidx/navigation3/ui/NavDisplayKt__NavDisplayKt",
        "androidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt"
    }
    k = 0x4
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final DEFAULT_TRANSITION_DURATION_MILLISECOND:I = 0x2bc


# direct methods
.method public static final NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V
    .locals 0
    .param p0, "sceneState"    # Landroidx/navigation3/scene/SceneState;
    .param p1, "navigationEventState"    # Landroidx/navigationevent/compose/NavigationEventState;
    .param p2, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p3, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p4, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p5, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p6, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p7, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p8, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p9, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/scene/SceneState<",
            "TT;>;",
            "Landroidx/navigationevent/compose/NavigationEventState<",
            "Landroidx/navigation3/scene/SceneInfo<",
            "TT;>;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p0 .. p10}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay(Landroidx/navigation3/scene/SceneState;Landroidx/navigationevent/compose/NavigationEventState;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V

    return-void
.end method

.method public static final NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V
    .locals 0
    .param p0, "entries"    # Ljava/util/List;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p3, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p4, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p5, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p6, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p7, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p8, "onBack"    # Lkotlin/jvm/functions/Function0;
    .param p9, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p10, "$changed"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/Composer;",
            "II)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p0 .. p11}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;II)V

    return-void
.end method

.method public static final NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V
    .locals 0
    .param p0, "backStack"    # Ljava/util/List;
    .param p1, "modifier"    # Landroidx/compose/ui/Modifier;
    .param p2, "contentAlignment"    # Landroidx/compose/ui/Alignment;
    .param p3, "onBack"    # Lkotlin/jvm/functions/Function0;
    .param p4, "entryDecorators"    # Ljava/util/List;
    .param p5, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p6, "sizeTransform"    # Landroidx/compose/animation/SizeTransform;
    .param p7, "transitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p8, "popTransitionSpec"    # Lkotlin/jvm/functions/Function1;
    .param p9, "predictivePopTransitionSpec"    # Lkotlin/jvm/functions/Function2;
    .param p10, "entryProvider"    # Lkotlin/jvm/functions/Function1;
    .param p11, "$composer"    # Landroidx/compose/runtime/Composer;
    .param p12, "$changed"    # I
    .param p13, "$changed1"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Landroidx/compose/ui/Modifier;",
            "Landroidx/compose/ui/Alignment;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/util/List<",
            "+",
            "Landroidx/navigation3/runtime/NavEntryDecorator<",
            "TT;>;>;",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Landroidx/compose/animation/SizeTransform;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function2<",
            "-",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;-",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;",
            "Landroidx/compose/runtime/Composer;",
            "III)V"
        }
    .end annotation

    .line 1
    invoke-static/range {p0 .. p14}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplayKt;->NavDisplay(Ljava/util/List;Landroidx/compose/ui/Modifier;Landroidx/compose/ui/Alignment;Lkotlin/jvm/functions/Function0;Ljava/util/List;Landroidx/navigation3/scene/SceneStrategy;Landroidx/compose/animation/SizeTransform;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;Landroidx/compose/runtime/Composer;III)V

    return-void
.end method

.method public static final defaultPopTransitionSpec()Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultPopTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    return-object v0
.end method

.method public static final defaultPredictivePopTransitionSpec()Lkotlin/jvm/functions/Function2;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lkotlin/jvm/functions/Function2<",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Ljava/lang/Integer;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultPredictivePopTransitionSpec()Lkotlin/jvm/functions/Function2;

    move-result-object v0

    return-object v0
.end method

.method public static final defaultTransitionSpec()Lkotlin/jvm/functions/Function1;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/compose/animation/AnimatedContentTransitionScope<",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;>;",
            "Landroidx/compose/animation/ContentTransform;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultTransitionSpec()Lkotlin/jvm/functions/Function1;

    move-result-object v0

    return-object v0
.end method
