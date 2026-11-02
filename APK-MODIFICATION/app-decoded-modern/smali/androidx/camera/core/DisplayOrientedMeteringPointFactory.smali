.class public final Landroidx/camera/core/DisplayOrientedMeteringPointFactory;
.super Landroidx/camera/core/MeteringPointFactory;
.source "DisplayOrientedMeteringPointFactory.java"


# instance fields
.field private final mCameraInfo:Landroidx/camera/core/CameraInfo;

.field private final mDisplay:Landroid/view/Display;

.field private final mHeight:F

.field private final mWidth:F


# direct methods
.method public constructor <init>(Landroid/view/Display;Landroidx/camera/core/CameraInfo;FF)V
    .locals 0
    .param p1, "display"    # Landroid/view/Display;
    .param p2, "cameraInfo"    # Landroidx/camera/core/CameraInfo;
    .param p3, "width"    # F
    .param p4, "height"    # F

    .line 84
    invoke-direct {p0}, Landroidx/camera/core/MeteringPointFactory;-><init>()V

    .line 85
    iput p3, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mWidth:F

    .line 86
    iput p4, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mHeight:F

    .line 87
    iput-object p1, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mDisplay:Landroid/view/Display;

    .line 88
    iput-object p2, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mCameraInfo:Landroidx/camera/core/CameraInfo;

    .line 89
    return-void
.end method

.method private getRelativeCameraOrientation(Z)I
    .locals 3
    .param p1, "compensateForMirroring"    # Z

    .line 149
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    move-result v0

    .line 150
    .local v0, "displayRotation":I
    iget-object v1, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mCameraInfo:Landroidx/camera/core/CameraInfo;

    invoke-interface {v1, v0}, Landroidx/camera/core/CameraInfo;->getSensorRotationDegrees(I)I

    move-result v1

    .line 151
    .local v1, "rotationDegrees":I
    if-eqz p1, :cond_0

    .line 152
    rsub-int v2, v1, 0x168

    rem-int/lit16 v2, v2, 0x168
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v1, v2

    .line 156
    .end local v0    # "displayRotation":I
    :cond_0
    goto :goto_0

    .line 154
    .end local v1    # "rotationDegrees":I
    :catch_0
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    .line 157
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "rotationDegrees":I
    :goto_0
    return v1
.end method


# virtual methods
.method protected convertPoint(FF)Landroid/graphics/PointF;
    .locals 10
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 99
    iget v0, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mWidth:F

    .line 100
    .local v0, "width":F
    iget v1, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mHeight:F

    .line 102
    .local v1, "height":F
    iget-object v2, p0, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->mCameraInfo:Landroidx/camera/core/CameraInfo;

    invoke-interface {v2}, Landroidx/camera/core/CameraInfo;->getLensFacing()I

    move-result v2

    .line 103
    .local v2, "lensFacing":I
    if-nez v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 104
    .local v3, "compensateForMirroring":Z
    :goto_0
    invoke-direct {p0, v3}, Landroidx/camera/core/DisplayOrientedMeteringPointFactory;->getRelativeCameraOrientation(Z)I

    move-result v4

    .line 105
    .local v4, "relativeCameraOrientation":I
    move v5, p1

    .line 106
    .local v5, "outputX":F
    move v6, p2

    .line 107
    .local v6, "outputY":F
    move v7, v0

    .line 108
    .local v7, "outputWidth":F
    move v8, v1

    .line 110
    .local v8, "outputHeight":F
    const/16 v9, 0x5a

    if-eq v4, v9, :cond_1

    const/16 v9, 0x10e

    if-ne v4, v9, :cond_2

    .line 112
    :cond_1
    move v5, p2

    .line 113
    move v6, p1

    .line 114
    move v7, v1

    .line 115
    move v8, v0

    .line 118
    :cond_2
    sparse-switch v4, :sswitch_data_0

    goto :goto_1

    .line 128
    :sswitch_0
    sub-float v5, v7, v5

    .line 129
    goto :goto_1

    .line 124
    :sswitch_1
    sub-float v5, v7, v5

    .line 125
    sub-float v6, v8, v6

    .line 126
    goto :goto_1

    .line 121
    :sswitch_2
    sub-float v6, v8, v6

    .line 122
    nop

    .line 135
    :goto_1
    if-eqz v3, :cond_3

    .line 136
    sub-float v5, v7, v5

    .line 140
    :cond_3
    div-float/2addr v5, v7

    .line 141
    div-float/2addr v6, v8

    .line 143
    new-instance v9, Landroid/graphics/PointF;

    invoke-direct {v9, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    return-object v9

    :sswitch_data_0
    .sparse-switch
        0x5a -> :sswitch_2
        0xb4 -> :sswitch_1
        0x10e -> :sswitch_0
    .end sparse-switch
.end method
