.class public interface abstract Landroidx/camera/core/Camera;
.super Ljava/lang/Object;
.source "Camera.java"


# virtual methods
.method public abstract getCameraControl()Landroidx/camera/core/CameraControl;
.end method

.method public abstract getCameraInfo()Landroidx/camera/core/CameraInfo;
.end method

.method public abstract getExtendedConfig()Landroidx/camera/core/impl/CameraConfig;
.end method

.method public varargs isUseCasesCombinationSupported(Z[Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p1, "withStreamSharing"    # Z
    .param p2, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 108
    const/4 v0, 0x1

    return v0
.end method

.method public varargs isUseCasesCombinationSupported([Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 78
    const/4 v0, 0x1

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/Camera;->isUseCasesCombinationSupported(Z[Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method

.method public varargs isUseCasesCombinationSupportedByFramework([Landroidx/camera/core/UseCase;)Z
    .locals 1
    .param p1, "useCases"    # [Landroidx/camera/core/UseCase;

    .line 93
    const/4 v0, 0x0

    invoke-interface {p0, v0, p1}, Landroidx/camera/core/Camera;->isUseCasesCombinationSupported(Z[Landroidx/camera/core/UseCase;)Z

    move-result v0

    return v0
.end method
