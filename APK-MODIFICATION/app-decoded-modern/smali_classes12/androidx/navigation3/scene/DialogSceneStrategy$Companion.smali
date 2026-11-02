.class public final Landroidx/navigation3/scene/DialogSceneStrategy$Companion;
.super Ljava/lang/Object;
.source "DialogScene.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/navigation3/scene/DialogSceneStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001c\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00010\u00052\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0008R\u000e\u0010\t\u001a\u00020\u0006X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\n"
    }
    d2 = {
        "Landroidx/navigation3/scene/DialogSceneStrategy$Companion;",
        "",
        "<init>",
        "()V",
        "dialog",
        "",
        "",
        "dialogProperties",
        "Landroidx/compose/ui/window/DialogProperties;",
        "DIALOG_KEY",
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
.method private constructor <init>()V
    .locals 0

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Landroidx/navigation3/scene/DialogSceneStrategy$Companion;-><init>()V

    return-void
.end method

.method public static synthetic dialog$default(Landroidx/navigation3/scene/DialogSceneStrategy$Companion;Landroidx/compose/ui/window/DialogProperties;ILjava/lang/Object;)Ljava/util/Map;
    .locals 6

    .line 98
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 99
    new-instance v0, Landroidx/compose/ui/window/DialogProperties;

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Landroidx/compose/ui/window/DialogProperties;-><init>(ZZZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object p1, v0

    .line 98
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/navigation3/scene/DialogSceneStrategy$Companion;->dialog(Landroidx/compose/ui/window/DialogProperties;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final dialog(Landroidx/compose/ui/window/DialogProperties;)Ljava/util/Map;
    .locals 1
    .param p1, "dialogProperties"    # Landroidx/compose/ui/window/DialogProperties;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/compose/ui/window/DialogProperties;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 100
    const-string v0, "dialog"

    invoke-static {v0, p1}, Lkotlin/TuplesKt;->to(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
