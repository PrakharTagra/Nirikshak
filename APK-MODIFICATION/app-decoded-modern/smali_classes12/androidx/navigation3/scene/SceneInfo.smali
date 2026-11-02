.class public final Landroidx/navigation3/scene/SceneInfo;
.super Landroidx/navigationevent/NavigationEventInfo;
.source "SceneInfo.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroidx/navigationevent/NavigationEventInfo;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0007\u0018\u0000*\u0008\u0008\u0000\u0010\u0001*\u00020\u00022\u00020\u0003B\u0015\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0013\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u0002H\u0096\u0002J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016R\u0017\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u0011"
    }
    d2 = {
        "Landroidx/navigation3/scene/SceneInfo;",
        "T",
        "",
        "Landroidx/navigationevent/NavigationEventInfo;",
        "scene",
        "Landroidx/navigation3/scene/Scene;",
        "<init>",
        "(Landroidx/navigation3/scene/Scene;)V",
        "getScene",
        "()Landroidx/navigation3/scene/Scene;",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
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
.field public static final $stable:I


# instance fields
.field private final scene:Landroidx/navigation3/scene/Scene;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroidx/navigation3/scene/Scene;)V
    .locals 0
    .param p1, "scene"    # Landroidx/navigation3/scene/Scene;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Landroidx/navigationevent/NavigationEventInfo;-><init>()V

    .line 32
    iput-object p1, p0, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "other"    # Ljava/lang/Object;

    .line 35
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    return v0

    .line 36
    :cond_0
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_1

    goto :goto_0

    .line 38
    :cond_1
    move-object v0, p1

    check-cast v0, Landroidx/navigation3/scene/SceneInfo;

    .line 40
    iget-object v0, p0, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    move-object v1, p1

    check-cast v1, Landroidx/navigation3/scene/SceneInfo;

    iget-object v1, v1, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 36
    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public final getScene()Landroidx/navigation3/scene/Scene;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/navigation3/scene/Scene<",
            "TT;>;"
        }
    .end annotation

    .line 32
    iget-object v0, p0, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 44
    iget-object v0, p0, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SceneInfo(scene="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/navigation3/scene/SceneInfo;->scene:Landroidx/navigation3/scene/Scene;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
