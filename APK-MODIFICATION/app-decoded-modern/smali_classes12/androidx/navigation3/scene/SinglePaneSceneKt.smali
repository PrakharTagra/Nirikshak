.class public final Landroidx/navigation3/scene/SinglePaneSceneKt;
.super Ljava/lang/Object;
.source "SinglePaneScene.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSinglePaneScene.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SinglePaneScene.kt\nandroidx/navigation3/scene/SinglePaneSceneKt\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,77:1\n1#2:78\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\u001aD\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0008\u0008\u0000\u0010\u0002*\u00020\u0003*\u0008\u0012\u0004\u0012\u0002H\u00020\u00042\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00020\u00062\u0012\u0010\u0007\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00020\t0\u0008H\u0000\u00a8\u0006\n"
    }
    d2 = {
        "calculateSceneWithSinglePaneFallback",
        "Landroidx/navigation3/scene/Scene;",
        "T",
        "",
        "Landroidx/navigation3/scene/SceneStrategy;",
        "scope",
        "Landroidx/navigation3/scene/SceneStrategyScope;",
        "entries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
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
.method public static final calculateSceneWithSinglePaneFallback(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .locals 2
    .param p0, "$this$calculateSceneWithSinglePaneFallback"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p1, "scope"    # Landroidx/navigation3/scene/SceneStrategyScope;
    .param p2, "entries"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;",
            "Landroidx/navigation3/scene/SceneStrategyScope<",
            "TT;>;",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;)",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;"
        }
    .end annotation

    .line 74
    invoke-interface {p0, p1, p2}, Landroidx/navigation3/scene/SceneStrategy;->calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v0

    if-nez v0, :cond_0

    .line 75
    new-instance v0, Landroidx/navigation3/scene/SinglePaneSceneStrategy;

    invoke-direct {v0}, Landroidx/navigation3/scene/SinglePaneSceneStrategy;-><init>()V

    .line 78
    .local v0, "$this$calculateSceneWithSinglePaneFallback_u24lambda_u240":Landroidx/navigation3/scene/SinglePaneSceneStrategy;
    const/4 v1, 0x0

    .line 75
    .local v1, "$i$a$-with-SinglePaneSceneKt$calculateSceneWithSinglePaneFallback$1":I
    invoke-virtual {v0, p1, p2}, Landroidx/navigation3/scene/SinglePaneSceneStrategy;->calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v0

    .line 74
    .end local v0    # "$this$calculateSceneWithSinglePaneFallback_u24lambda_u240":Landroidx/navigation3/scene/SinglePaneSceneStrategy;
    .end local v1    # "$i$a$-with-SinglePaneSceneKt$calculateSceneWithSinglePaneFallback$1":I
    :cond_0
    return-object v0
.end method
