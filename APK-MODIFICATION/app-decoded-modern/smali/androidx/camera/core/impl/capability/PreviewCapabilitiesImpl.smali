.class public Landroidx/camera/core/impl/capability/PreviewCapabilitiesImpl;
.super Ljava/lang/Object;
.source "PreviewCapabilitiesImpl.java"

# interfaces
.implements Landroidx/camera/core/PreviewCapabilities;


# instance fields
.field private mIsStabilizationSupported:Z


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/CameraInfoInternal;)V
    .locals 1
    .param p1, "cameraInfoInternal"    # Landroidx/camera/core/impl/CameraInfoInternal;

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-interface {p1}, Landroidx/camera/core/impl/CameraInfoInternal;->isPreviewStabilizationSupported()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/camera/core/impl/capability/PreviewCapabilitiesImpl;->mIsStabilizationSupported:Z

    .line 37
    return-void
.end method

.method public static from(Landroidx/camera/core/CameraInfo;)Landroidx/camera/core/PreviewCapabilities;
    .locals 2
    .param p0, "cameraInfo"    # Landroidx/camera/core/CameraInfo;

    .line 44
    new-instance v0, Landroidx/camera/core/impl/capability/PreviewCapabilitiesImpl;

    move-object v1, p0

    check-cast v1, Landroidx/camera/core/impl/CameraInfoInternal;

    invoke-direct {v0, v1}, Landroidx/camera/core/impl/capability/PreviewCapabilitiesImpl;-><init>(Landroidx/camera/core/impl/CameraInfoInternal;)V

    return-object v0
.end method


# virtual methods
.method public isStabilizationSupported()Z
    .locals 1

    .line 49
    iget-boolean v0, p0, Landroidx/camera/core/impl/capability/PreviewCapabilitiesImpl;->mIsStabilizationSupported:Z

    return v0
.end method
