.class public final synthetic Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/navigation3/scene/SceneStrategy;


# instance fields
.field public final synthetic f$0:Landroidx/navigation3/scene/SceneStrategy;

.field public final synthetic f$1:Landroidx/navigation3/scene/SceneStrategy;


# direct methods
.method public synthetic constructor <init>(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;->f$0:Landroidx/navigation3/scene/SceneStrategy;

    iput-object p2, p0, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;->f$1:Landroidx/navigation3/scene/SceneStrategy;

    return-void
.end method


# virtual methods
.method public final calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .locals 2

    .line 0
    iget-object v0, p0, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;->f$0:Landroidx/navigation3/scene/SceneStrategy;

    iget-object v1, p0, Landroidx/navigation3/scene/SceneStrategy$$ExternalSyntheticLambda0;->f$1:Landroidx/navigation3/scene/SceneStrategy;

    invoke-static {v0, v1, p1, p2}, Landroidx/navigation3/scene/SceneStrategy;->$r8$lambda$dM9PjoW1eqonrz-4MMHdsMycy7c(Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategy;Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;

    move-result-object p1

    return-object p1
.end method
