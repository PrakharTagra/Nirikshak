.class final synthetic Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;
.super Ljava/lang/Object;
.source "NavDisplay.android.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u001a-\u0010\u0002\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00060\u00050\u0004\u0012\u0004\u0012\u00020\u00070\u0003\u00a2\u0006\u0002\u0008\u0008\"\u0008\u0008\u0000\u0010\u0006*\u00020\t\u001a-\u0010\n\u001a\u001f\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00060\u00050\u0004\u0012\u0004\u0012\u00020\u00070\u0003\u00a2\u0006\u0002\u0008\u0008\"\u0008\u0008\u0000\u0010\u0006*\u00020\t\u001a3\u0010\u000b\u001a%\u0012\u0010\u0012\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00060\u00050\u0004\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00070\u000c\u00a2\u0006\u0002\u0008\u0008\"\u0008\u0008\u0000\u0010\u0006*\u00020\t\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\r"
    }
    d2 = {
        "DEFAULT_TRANSITION_DURATION_MILLISECOND",
        "",
        "defaultTransitionSpec",
        "Lkotlin/Function1;",
        "Landroidx/compose/animation/AnimatedContentTransitionScope;",
        "Landroidx/navigation3/scene/Scene;",
        "T",
        "Landroidx/compose/animation/ContentTransform;",
        "Lkotlin/ExtensionFunctionType;",
        "",
        "defaultPopTransitionSpec",
        "defaultPredictivePopTransitionSpec",
        "Lkotlin/Function2;",
        "navigation3-ui"
    }
    k = 0x5
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
    xs = "androidx/navigation3/ui/NavDisplayKt"
.end annotation


# direct methods
.method public static synthetic $r8$lambda$F0KIGQV9gT61eEOxl3f1NDioHo0(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$WCiVdyfSMhm7s5O-VTdk6d7c4ZI(Landroidx/compose/animation/AnimatedContentTransitionScope;I)Landroidx/compose/animation/ContentTransform;
    .locals 0

    invoke-static {p0, p1}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultPredictivePopTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;I)Landroidx/compose/animation/ContentTransform;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$s5xwkMKz9B3rNRZBe0F1gaQNY7s(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 0

    invoke-static {p0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt;->defaultPopTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;

    move-result-object p0

    return-object p0
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

    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda2;

    invoke-direct {v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda2;-><init>()V

    .line 48
    return-object v0
.end method

.method private static final defaultPopTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 8
    .param p0, "<this>"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 44
    new-instance v0, Landroidx/compose/animation/ContentTransform;

    .line 45
    const/16 v1, 0x2bc

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    invoke-static {v1, v2, v3, v4, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v5

    check-cast v5, Landroidx/compose/animation/core/FiniteAnimationSpec;

    const/4 v6, 0x0

    const/4 v7, 0x2

    invoke-static {v5, v6, v7, v3}, Landroidx/compose/animation/EnterExitTransitionKt;->fadeIn$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FILjava/lang/Object;)Landroidx/compose/animation/EnterTransition;

    move-result-object v5

    .line 46
    invoke-static {v1, v2, v3, v4, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/FiniteAnimationSpec;

    invoke-static {v1, v6, v7, v3}, Landroidx/compose/animation/EnterExitTransitionKt;->fadeOut$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FILjava/lang/Object;)Landroidx/compose/animation/ExitTransition;

    move-result-object v2

    .line 44
    move-object v1, v5

    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Landroidx/compose/animation/ContentTransform;-><init>(Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;FLandroidx/compose/animation/SizeTransform;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 47
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

    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda1;

    invoke-direct {v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda1;-><init>()V

    .line 62
    return-object v0
.end method

.method private static final defaultPredictivePopTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;I)Landroidx/compose/animation/ContentTransform;
    .locals 8
    .param p0, "<this>"    # Landroidx/compose/animation/AnimatedContentTransitionScope;
    .param p1, "it"    # I

    .line 53
    new-instance v0, Landroidx/compose/animation/ContentTransform;

    .line 56
    nop

    .line 57
    nop

    .line 55
    const/4 v1, 0x4

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x44c80000    # 1600.0f

    const/4 v4, 0x0

    invoke-static {v2, v3, v4, v1, v4}, Landroidx/compose/animation/core/AnimationSpecKt;->spring$default(FFLjava/lang/Object;ILjava/lang/Object;)Landroidx/compose/animation/core/SpringSpec;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/FiniteAnimationSpec;

    .line 54
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v1, v2, v3, v4}, Landroidx/compose/animation/EnterExitTransitionKt;->fadeIn$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FILjava/lang/Object;)Landroidx/compose/animation/EnterTransition;

    move-result-object v1

    .line 60
    const/4 v6, 0x5

    const/4 v7, 0x0

    const/4 v2, 0x0

    const v3, 0x3f333333    # 0.7f

    const-wide/16 v4, 0x0

    invoke-static/range {v2 .. v7}, Landroidx/compose/animation/EnterExitTransitionKt;->scaleOut-L8ZKh-E$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FJILjava/lang/Object;)Landroidx/compose/animation/ExitTransition;

    move-result-object v2

    .line 53
    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Landroidx/compose/animation/ContentTransform;-><init>(Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;FLandroidx/compose/animation/SizeTransform;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 61
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

    new-instance v0, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/navigation3/ui/NavDisplayKt__NavDisplay_androidKt$$ExternalSyntheticLambda0;-><init>()V

    .line 40
    return-object v0
.end method

.method private static final defaultTransitionSpec$lambda$0$NavDisplayKt__NavDisplay_androidKt(Landroidx/compose/animation/AnimatedContentTransitionScope;)Landroidx/compose/animation/ContentTransform;
    .locals 8
    .param p0, "<this>"    # Landroidx/compose/animation/AnimatedContentTransitionScope;

    .line 36
    new-instance v0, Landroidx/compose/animation/ContentTransform;

    .line 37
    const/16 v1, 0x2bc

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x6

    invoke-static {v1, v2, v3, v4, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v5

    check-cast v5, Landroidx/compose/animation/core/FiniteAnimationSpec;

    const/4 v6, 0x0

    const/4 v7, 0x2

    invoke-static {v5, v6, v7, v3}, Landroidx/compose/animation/EnterExitTransitionKt;->fadeIn$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FILjava/lang/Object;)Landroidx/compose/animation/EnterTransition;

    move-result-object v5

    .line 38
    invoke-static {v1, v2, v3, v4, v3}, Landroidx/compose/animation/core/AnimationSpecKt;->tween$default(IILandroidx/compose/animation/core/Easing;ILjava/lang/Object;)Landroidx/compose/animation/core/TweenSpec;

    move-result-object v1

    check-cast v1, Landroidx/compose/animation/core/FiniteAnimationSpec;

    invoke-static {v1, v6, v7, v3}, Landroidx/compose/animation/EnterExitTransitionKt;->fadeOut$default(Landroidx/compose/animation/core/FiniteAnimationSpec;FILjava/lang/Object;)Landroidx/compose/animation/ExitTransition;

    move-result-object v2

    .line 36
    move-object v1, v5

    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Landroidx/compose/animation/ContentTransform;-><init>(Landroidx/compose/animation/EnterTransition;Landroidx/compose/animation/ExitTransition;FLandroidx/compose/animation/SizeTransform;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 39
    return-object v0
.end method
