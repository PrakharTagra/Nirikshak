.class public Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;
.super Ljava/lang/Object;
.source "DualSurfaceProcessorNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;,
        Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;",
        "Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DualSurfaceProcessorNode"


# instance fields
.field private mInput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

.field private mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

.field final mPrimaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field final mSecondaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field final mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceProcessorInternal;)V
    .locals 0
    .param p1, "primaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "secondaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "surfaceProcessor"    # Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    iput-object p1, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mPrimaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 93
    iput-object p2, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSecondaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 94
    iput-object p3, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 95
    return-void
.end method

.method private createAndSendSurfaceOutput(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 7
    .param p1, "primaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "secondaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "primarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p4, "secondarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map$Entry<",
            "Landroidx/camera/core/processing/concurrent/DualOutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 215
    .local p5, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceEdge;

    .line 216
    .local v0, "outputEdge":Landroidx/camera/core/processing/SurfaceEdge;
    nop

    .line 217
    invoke-virtual {p3}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v1

    .line 218
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v2}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getPrimaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    .line 219
    invoke-virtual {p3}, Landroidx/camera/core/processing/SurfaceEdge;->hasCameraTransform()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    move-object v3, p1

    goto :goto_0

    :cond_0
    move-object v3, v4

    .line 220
    :goto_0
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v5}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getPrimaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v5

    .line 221
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v6}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getPrimaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v6

    .line 216
    invoke-static {v1, v2, v3, v5, v6}, Landroidx/camera/core/SurfaceOutput$CameraInputInfo;->of(Landroid/util/Size;Landroid/graphics/Rect;Landroidx/camera/core/impl/CameraInternal;IZ)Landroidx/camera/core/SurfaceOutput$CameraInputInfo;

    move-result-object v1

    .line 222
    .local v1, "primaryCameraInputInfo":Landroidx/camera/core/SurfaceOutput$CameraInputInfo;
    nop

    .line 223
    invoke-virtual {p4}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v2

    .line 224
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getSecondaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v3

    .line 225
    invoke-virtual {p4}, Landroidx/camera/core/processing/SurfaceEdge;->hasCameraTransform()Z

    move-result v5

    if-eqz v5, :cond_1

    move-object v4, p2

    .line 226
    :cond_1
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v5}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getSecondaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v5

    .line 227
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v6}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getSecondaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v6

    invoke-virtual {v6}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v6

    .line 222
    invoke-static {v2, v3, v4, v5, v6}, Landroidx/camera/core/SurfaceOutput$CameraInputInfo;->of(Landroid/util/Size;Landroid/graphics/Rect;Landroidx/camera/core/impl/CameraInternal;IZ)Landroidx/camera/core/SurfaceOutput$CameraInputInfo;

    move-result-object v2

    .line 228
    .local v2, "secondaryCameraInputInfo":Landroidx/camera/core/SurfaceOutput$CameraInputInfo;
    nop

    .line 229
    invoke-interface {p5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getPrimaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutConfig;->getFormat()I

    move-result v3

    .line 228
    invoke-virtual {v0, v3, v1, v2}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceOutputFuture(ILandroidx/camera/core/SurfaceOutput$CameraInputInfo;Landroidx/camera/core/SurfaceOutput$CameraInputInfo;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    .line 232
    .local v3, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/core/SurfaceOutput;>;"
    new-instance v4, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$1;

    invoke-direct {v4, p0, v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$1;-><init>(Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;Landroidx/camera/core/processing/SurfaceEdge;)V

    .line 253
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v5

    .line 232
    invoke-static {v3, v4, v5}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 254
    return-void
.end method

.method private sendSurfaceOutputs(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V
    .locals 9
    .param p1, "primaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "secondaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "primarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p4, "secondarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/concurrent/DualOutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 191
    .local p5, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Ljava/util/Map$Entry;

    .line 192
    .local v7, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    .end local p1    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local p2    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local p3    # "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .end local p4    # "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v3, "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v4, "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v5, "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v6, "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-direct/range {v2 .. v7}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    .line 199
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/camera/core/processing/SurfaceEdge;

    new-instance v2, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$$ExternalSyntheticLambda1;

    move-object v8, v7

    move-object v7, v6

    move-object v6, v5

    move-object v5, v4

    move-object v4, v3

    move-object v3, p0

    .end local v3    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v4, "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v5, "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v6, "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v7, "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v8, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-direct/range {v2 .. v8}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    move-object v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    .end local v8    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    .restart local v3    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v4, "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .local v5, "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v6, "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .local v7, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-virtual {p1, v2}, Landroidx/camera/core/processing/SurfaceEdge;->addOnInvalidatedListener(Ljava/lang/Runnable;)V

    .line 203
    .end local v7    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    move-object p1, v3

    move-object p2, v4

    move-object p3, v5

    move-object p4, v6

    goto :goto_0

    .line 204
    .end local v3    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v4    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .end local v5    # "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .end local v6    # "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .restart local p1    # "primaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local p2    # "secondaryCameraInternal":Landroidx/camera/core/impl/CameraInternal;
    .restart local p3    # "primarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    .restart local p4    # "secondarySurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    :cond_0
    return-void
.end method

.method private sendSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;Z)V
    .locals 4
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p4, "isPrimary"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/impl/CameraInternal;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/concurrent/DualOutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;Z)V"
        }
    .end annotation

    .line 172
    .local p3, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/concurrent/DualOutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-virtual {p2, p1, p4}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;Z)Landroidx/camera/core/SurfaceRequest;

    move-result-object v0

    .line 176
    .local v0, "surfaceRequest":Landroidx/camera/core/SurfaceRequest;
    :try_start_0
    iget-object v1, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    invoke-interface {v1, v0}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->onInputSurface(Landroidx/camera/core/SurfaceRequest;)V
    :try_end_0
    .catch Landroidx/camera/core/ProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 179
    goto :goto_0

    .line 177
    :catch_0
    move-exception v1

    .line 178
    .local v1, "e":Landroidx/camera/core/ProcessingException;
    const-string v2, "DualSurfaceProcessorNode"

    const-string v3, "Failed to send SurfaceRequest to SurfaceProcessor."

    invoke-static {v2, v3, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 180
    .end local v1    # "e":Landroidx/camera/core/ProcessingException;
    :goto_0
    return-void
.end method

.method private transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/util/OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;
    .locals 14
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "outConfig"    # Landroidx/camera/core/processing/util/OutConfig;

    .line 128
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 129
    .local v0, "cropRect":Landroid/graphics/Rect;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v1

    .line 130
    .local v1, "rotationDegrees":I
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v2

    .line 133
    .local v2, "mirroring":Z
    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    move-object v8, v3

    .line 138
    .local v8, "sensorToBufferTransform":Landroid/graphics/Matrix;
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v3

    .line 139
    .local v3, "rotatedCropSize":Landroid/util/Size;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-static {v3, v4}, Landroidx/camera/core/impl/utils/TransformUtils;->isAspectRatioMatchingWithRoundingError(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v4

    invoke-static {v4}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 142
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-static {v4}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRect(Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v10

    .line 145
    .local v10, "newCropRect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v4

    .line 146
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v5

    .line 145
    invoke-virtual {v4, v5}, Landroidx/camera/core/impl/StreamSpec$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v4

    .line 146
    invoke-virtual {v4}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v7

    .line 148
    .local v7, "streamSpec":Landroidx/camera/core/impl/StreamSpec;
    new-instance v4, Landroidx/camera/core/processing/SurfaceEdge;

    .line 149
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getTargets()I

    move-result v5

    .line 150
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getFormat()I

    move-result v6

    .line 156
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result v9

    sub-int v11, v9, v1

    .line 159
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->isMirroring()Z

    move-result v9

    if-eq v9, v2, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    :goto_0
    move v13, v9

    const/4 v9, 0x0

    const/4 v12, -0x1

    invoke-direct/range {v4 .. v13}, Landroidx/camera/core/processing/SurfaceEdge;-><init>(IILandroidx/camera/core/impl/StreamSpec;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V

    .line 161
    .local v4, "outputSurface":Landroidx/camera/core/processing/SurfaceEdge;
    return-object v4
.end method


# virtual methods
.method synthetic lambda$release$1$androidx-camera-core-processing-concurrent-DualSurfaceProcessorNode()V
    .locals 2

    .line 265
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    invoke-virtual {v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/SurfaceEdge;

    .line 268
    .local v1, "surface":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceEdge;->close()V

    .line 269
    .end local v1    # "surface":Landroidx/camera/core/processing/SurfaceEdge;
    goto :goto_0

    .line 271
    :cond_0
    return-void
.end method

.method synthetic lambda$sendSurfaceOutputs$0$androidx-camera-core-processing-concurrent-DualSurfaceProcessorNode(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 0
    .param p1, "primaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "secondaryCameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p3, "primarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p4, "secondarySurfaceEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p5, "output"    # Ljava/util/Map$Entry;

    .line 200
    invoke-direct/range {p0 .. p5}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    return-void
.end method

.method public release()V
    .locals 1

    .line 261
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    invoke-interface {v0}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->release()V

    .line 264
    new-instance v0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Threads;->runOnMain(Ljava/lang/Runnable;)V

    .line 272
    return-void
.end method

.method public transform(Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;)Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;
    .locals 7
    .param p1, "in"    # Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    .line 104
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 105
    iput-object p1, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    .line 106
    new-instance v0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    invoke-direct {v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    .line 108
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;->getPrimarySurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v4

    .line 109
    .local v4, "primaryInputSurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;->getSecondarySurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v5

    .line 111
    .local v5, "secondaryInputSurfaceEdge":Landroidx/camera/core/processing/SurfaceEdge;
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    invoke-virtual {v0}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;->getOutConfigs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/processing/concurrent/DualOutConfig;

    .line 112
    .local v1, "config":Landroidx/camera/core/processing/concurrent/DualOutConfig;
    iget-object v2, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    .line 114
    invoke-virtual {v1}, Landroidx/camera/core/processing/concurrent/DualOutConfig;->getPrimaryOutConfig()Landroidx/camera/core/processing/util/OutConfig;

    move-result-object v3

    .line 112
    invoke-direct {p0, v4, v3}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/util/OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    .end local v1    # "config":Landroidx/camera/core/processing/concurrent/DualOutConfig;
    goto :goto_0

    .line 116
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mPrimaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v1, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    const/4 v2, 0x1

    invoke-direct {p0, v0, v4, v1, v2}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->sendSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;Z)V

    .line 117
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSecondaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v1, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v5, v1, v2}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->sendSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;Z)V

    .line 119
    iget-object v2, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mPrimaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v3, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mSecondaryCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    iget-object v6, p0, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->sendSurfaceOutputs(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V

    .line 121
    iget-object v0, v1, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    return-object v0
.end method

.method public bridge synthetic transform(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 63
    check-cast p1, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode;->transform(Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$In;)Landroidx/camera/core/processing/concurrent/DualSurfaceProcessorNode$Out;

    move-result-object p1

    return-object p1
.end method
