.class public Landroidx/camera/core/impl/utils/SurfaceUtil;
.super Ljava/lang/Object;
.source "SurfaceUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;
    }
.end annotation


# static fields
.field public static final JNI_LIB_NAME:Ljava/lang/String; = "surface_util_jni"

.field private static final TAG:Ljava/lang/String; = "SurfaceUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 30
    const-string/jumbo v0, "surface_util_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static getSurfaceInfo(Landroid/view/Surface;)Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;
    .locals 3
    .param p0, "surface"    # Landroid/view/Surface;

    .line 59
    invoke-static {p0}, Landroidx/camera/core/impl/utils/SurfaceUtil;->nativeGetSurfaceInfo(Landroid/view/Surface;)[I

    move-result-object v0

    .line 60
    .local v0, "surfaceInfoArray":[I
    new-instance v1, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;

    invoke-direct {v1}, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;-><init>()V

    .line 61
    .local v1, "surfaceInfo":Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;
    const/4 v2, 0x0

    aget v2, v0, v2

    iput v2, v1, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->format:I

    .line 62
    const/4 v2, 0x1

    aget v2, v0, v2

    iput v2, v1, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->width:I

    .line 63
    const/4 v2, 0x2

    aget v2, v0, v2

    iput v2, v1, Landroidx/camera/core/impl/utils/SurfaceUtil$SurfaceInfo;->height:I

    .line 64
    return-object v1
.end method

.method private static native nativeGetSurfaceInfo(Landroid/view/Surface;)[I
.end method
