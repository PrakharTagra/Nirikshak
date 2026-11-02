.class public interface abstract Landroidx/navigation3/scene/SceneStrategy;
.super Ljava/lang/Object;
.source "SceneStrategy.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00e7\u0080\u0001\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0002J.\u0010\u0003\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0004*\u0008\u0012\u0004\u0012\u00028\u00000\u00052\u0012\u0010\u0006\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000\u00080\u0007H&J\u001d\u0010\t\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00002\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0000H\u0096\u0004\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u000b\u00c0\u0006\u0001"
    }
    d2 = {
        "Landroidx/navigation3/scene/SceneStrategy;",
        "T",
        "",
        "calculateScene",
        "Landroidx/navigation3/scene/Scene;",
        "Landroidx/navigation3/scene/SceneStrategyScope;",
        "entries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
        "then",
        "sceneStrategy",
        "navigation3-ui"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static synthetic $r8$lambda$dM9PjoW1eqonrz-4MMHdsMycy7c(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/navigation3/scene/SceneStrategy;->then$lambda$0(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object p0

    return-object p0
.end method

.method private static then$lambda$0(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .locals 2
    .param p0, "$firstStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p1, "$sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .param p2, "$this$SceneStrategy"    # Landroidx/navigation3/scene/SceneStrategyScope;
    .param p3, "entries"    # Ljava/util/List;

    .line 83
    move-object v0, p0

    .local v0, "$this$then_u24lambda_u240_u240":Landroidx/navigation3/scene/SceneStrategy;
    const/4 v1, 0x0

    .line 85
    .local v1, "$i$a$-with-SceneStrategy$then$1$1":I
    invoke-interface {v0, p2, p3}, Landroidx/navigation3/scene/SceneStrategy;->calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v0

    .line 83
    .end local v0    # "$this$then_u24lambda_u240_u240":Landroidx/navigation3/scene/SceneStrategy;
    .end local v1    # "$i$a$-with-SceneStrategy$then$1$1":I
    if-nez v0, :cond_0

    .line 87
    move-object v0, p1

    .local v0, "$this$then_u24lambda_u240_u241":Landroidx/navigation3/scene/SceneStrategy;
    const/4 v1, 0x0

    .line 89
    .local v1, "$i$a$-with-SceneStrategy$then$1$2":I
    invoke-interface {v0, p2, p3}, Landroidx/navigation3/scene/SceneStrategy;->calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object v0

    .line 87
    .end local v0    # "$this$then_u24lambda_u240_u241":Landroidx/navigation3/scene/SceneStrategy;
    .end local v1    # "$i$a$-with-SceneStrategy$then$1$2":I
    nop

    .line 90
    :cond_0
    return-object v0
.end method


# virtual methods
.method public abstract calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation3/scene/SceneStrategyScope<",
            "TT;>;",
            "Ljava/util/List<",
            "Landroidx/navigation3/runtime/NavEntry<",
            "TT;>;>;)",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;"
        }
    .end annotation
.end method

.method public then(Landroidx/navigation3/scene/SceneStrategy;)Landroidx/navigation3/scene/SceneStrategy;
    .locals 2
    .param p1, "sceneStrategy"    # Landroidx/navigation3/scene/SceneStrategy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;)",
            "Landroidx/navigation3/scene/SceneStrategy<",
            "TT;>;"
        }
    .end annotation

    .line 81
    move-object v0, p0

    .line 82
    .local v0, "firstStrategy":Landroidx/navigation3/scene/SceneStrategy;
    new-instance v1, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p1}, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;-><init>(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;)V

    return-object v1
.end method
