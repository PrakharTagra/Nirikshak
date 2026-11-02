.class public abstract Landroidx/camera/core/SurfaceOutput$CameraInputInfo;
.super Ljava/lang/Object;
.source "SurfaceOutput.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/SurfaceOutput;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CameraInputInfo"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 252
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static of(Landroid/util/Size;Landroid/graphics/Rect;Landroidx/camera/core/impl/CameraInternal;IZ)Landroidx/camera/core/SurfaceOutput$CameraInputInfo;
    .locals 6
    .param p0, "inputSize"    # Landroid/util/Size;
    .param p1, "inputCropRect"    # Landroid/graphics/Rect;
    .param p2, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "rotationDegrees"    # I
    .param p4, "mirroring"    # Z

    .line 292
    new-instance v0, Landroidx/camera/core/AutoValue_SurfaceOutput_CameraInputInfo;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    .end local p0    # "inputSize":Landroid/util/Size;
    .end local p1    # "inputCropRect":Landroid/graphics/Rect;
    .end local p2    # "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local p3    # "rotationDegrees":I
    .end local p4    # "mirroring":Z
    .local v1, "inputSize":Landroid/util/Size;
    .local v2, "inputCropRect":Landroid/graphics/Rect;
    .local v3, "cameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v4, "rotationDegrees":I
    .local v5, "mirroring":Z
    invoke-direct/range {v0 .. v5}, Landroidx/camera/core/AutoValue_SurfaceOutput_CameraInputInfo;-><init>(Landroid/util/Size;Landroid/graphics/Rect;Landroidx/camera/core/impl/CameraInternal;IZ)V

    return-object v0
.end method


# virtual methods
.method public abstract getCameraInternal()Landroidx/camera/core/impl/CameraInternal;
.end method

.method public abstract getInputCropRect()Landroid/graphics/Rect;
.end method

.method public abstract getInputSize()Landroid/util/Size;
.end method

.method public abstract getMirroring()Z
.end method

.method public abstract getRotationDegrees()I
.end method
