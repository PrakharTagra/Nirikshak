.class public final Landroidx/navigation3/scene/DialogSceneStrategy;
.super Ljava/lang/Object;
.source "DialogScene.kt"

# interfaces
.implements Landroidx/navigation3/scene/SceneStrategy;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/navigation3/scene/DialogSceneStrategy$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Landroidx/navigation3/scene/SceneStrategy<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 \u000c*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u0003:\u0001\u000cB\u0007\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J.\u0010\u0006\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0007*\u0008\u0012\u0004\u0012\u00028\u00000\u00082\u0012\u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000\u000b0\nH\u0016\u00a8\u0006\r"
    }
    d2 = {
        "Landroidx/navigation3/scene/DialogSceneStrategy;",
        "T",
        "",
        "Landroidx/navigation3/scene/SceneStrategy;",
        "<init>",
        "()V",
        "calculateScene",
        "Landroidx/navigation3/scene/Scene;",
        "Landroidx/navigation3/scene/SceneStrategyScope;",
        "entries",
        "",
        "Landroidx/navigation3/runtime/NavEntry;",
        "Companion",
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


# static fields
.field public static final $stable:I = 0x0

.field public static final Companion:Landroidx/navigation3/scene/DialogSceneStrategy$Companion;

.field public static final DIALOG_KEY:Ljava/lang/String; = "dialog"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/navigation3/scene/DialogSceneStrategy$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/navigation3/scene/DialogSceneStrategy$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/navigation3/scene/DialogSceneStrategy;->Companion:Landroidx/navigation3/scene/DialogSceneStrategy$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public calculateScene(Landroidx/navigation3/scene/SceneStrategyScope;Ljava/util/List;)Landroidx/navigation3/scene/Scene;
    .locals 9
    .param p1, "$this$calculateScene"    # Landroidx/navigation3/scene/SceneStrategyScope;
    .param p2, "entries"    # Ljava/util/List;
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

    .line 77
    invoke-static {p2}, Lkotlin/collections/CollectionsKt;->lastOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroidx/navigation3/runtime/NavEntry;

    .line 78
    .local v3, "lastEntry":Landroidx/navigation3/runtime/NavEntry;
    const/4 v0, 0x0

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroidx/navigation3/runtime/NavEntry;->getMetadata()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "dialog"

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    instance-of v2, v1, Landroidx/compose/ui/window/DialogProperties;

    if-eqz v2, :cond_1

    check-cast v1, Landroidx/compose/ui/window/DialogProperties;

    goto :goto_1

    :cond_1
    move-object v1, v0

    :goto_1
    move-object v8, v1

    .line 79
    .local v8, "dialogProperties":Landroidx/compose/ui/window/DialogProperties;
    if-eqz v8, :cond_2

    move-object v6, v8

    .local v6, "properties":Landroidx/compose/ui/window/DialogProperties;
    const/4 v0, 0x0

    .line 80
    .local v0, "$i$a$-let-DialogSceneStrategy$calculateScene$1":I
    new-instance v1, Landroidx/navigation3/scene/DialogScene;

    .line 81
    invoke-virtual {v3}, Landroidx/navigation3/runtime/NavEntry;->getContentKey()Ljava/lang/Object;

    move-result-object v2

    .line 82
    nop

    .line 83
    const/4 v4, 0x1

    move v5, v4

    invoke-static {p2, v5}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v4

    .line 84
    invoke-static {p2, v5}, Lkotlin/collections/CollectionsKt;->dropLast(Ljava/util/List;I)Ljava/util/List;

    move-result-object v5

    .line 85
    nop

    .line 86
    invoke-virtual {p1}, Landroidx/navigation3/scene/SceneStrategyScope;->getOnBack()Lkotlin/jvm/functions/Function0;

    move-result-object v7

    .line 80
    invoke-direct/range {v1 .. v7}, Landroidx/navigation3/scene/DialogScene;-><init>(Ljava/lang/Object;Landroidx/navigation3/runtime/NavEntry;Ljava/util/List;Ljava/util/List;Landroidx/compose/ui/window/DialogProperties;Lkotlin/jvm/functions/Function0;)V

    .line 87
    nop

    .line 79
    .end local v0    # "$i$a$-let-DialogSceneStrategy$calculateScene$1":I
    .end local v6    # "properties":Landroidx/compose/ui/window/DialogProperties;
    move-object v0, v1

    :cond_2
    check-cast v0, Landroidx/navigation3/scene/Scene;

    return-object v0
.end method
