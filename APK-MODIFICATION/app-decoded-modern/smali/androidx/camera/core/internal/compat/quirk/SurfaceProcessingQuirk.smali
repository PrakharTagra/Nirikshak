.class public interface abstract Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;
.super Ljava/lang/Object;
.source "SurfaceProcessingQuirk.java"

# interfaces
.implements Landroidx/camera/core/impl/Quirk;


# direct methods
.method public static workaroundBySurfaceProcessing(Landroidx/camera/core/impl/Quirks;)Z
    .locals 3
    .param p0, "quirks"    # Landroidx/camera/core/impl/Quirks;

    .line 44
    const-class v0, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;

    invoke-virtual {p0, v0}, Landroidx/camera/core/impl/Quirks;->getAll(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;

    .line 45
    .local v1, "quirk":Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;
    invoke-interface {v1}, Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;->workaroundBySurfaceProcessing()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 46
    const/4 v0, 0x1

    return v0

    .line 48
    .end local v1    # "quirk":Landroidx/camera/core/internal/compat/quirk/SurfaceProcessingQuirk;
    :cond_0
    goto :goto_0

    .line 49
    :cond_1
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public workaroundBySurfaceProcessing()Z
    .locals 1

    .line 36
    const/4 v0, 0x1

    return v0
.end method
