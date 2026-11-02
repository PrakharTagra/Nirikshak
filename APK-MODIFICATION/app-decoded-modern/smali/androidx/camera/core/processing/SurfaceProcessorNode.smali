.class public Landroidx/camera/core/processing/SurfaceProcessorNode;
.super Ljava/lang/Object;
.source "SurfaceProcessorNode.java"

# interfaces
.implements Landroidx/camera/core/processing/Node;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/processing/SurfaceProcessorNode$In;,
        Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Node<",
        "Landroidx/camera/core/processing/SurfaceProcessorNode$In;",
        "Landroidx/camera/core/processing/SurfaceProcessorNode$Out;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SurfaceProcessorNode"


# instance fields
.field final mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

.field private mInput:Landroidx/camera/core/processing/SurfaceProcessorNode$In;

.field private mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

.field final mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;


# direct methods
.method public constructor <init>(Landroidx/camera/core/impl/CameraInternal;Landroidx/camera/core/processing/SurfaceProcessorInternal;)V
    .locals 0
    .param p1, "cameraInternal"    # Landroidx/camera/core/impl/CameraInternal;
    .param p2, "surfaceProcessor"    # Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 99
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    .line 101
    iput-object p2, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    .line 102
    return-void
.end method

.method private createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 7
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map$Entry<",
            "Landroidx/camera/core/processing/util/OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 210
    .local p2, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/camera/core/processing/SurfaceEdge;

    .line 211
    .local v0, "outputEdge":Landroidx/camera/core/processing/SurfaceEdge;
    nop

    .line 212
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/core/impl/StreamSpec;->getResolution()Landroid/util/Size;

    move-result-object v1

    .line 213
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v2

    .line 214
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceEdge;->hasCameraTransform()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    goto :goto_0

    :cond_0
    move-object v3, v4

    .line 215
    :goto_0
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v5}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v5

    .line 216
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v6}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v6

    .line 211
    invoke-static {v1, v2, v3, v5, v6}, Landroidx/camera/core/SurfaceOutput$CameraInputInfo;->of(Landroid/util/Size;Landroid/graphics/Rect;Landroidx/camera/core/impl/CameraInternal;IZ)Landroidx/camera/core/SurfaceOutput$CameraInputInfo;

    move-result-object v1

    .line 217
    .local v1, "cameraInputInfo":Landroidx/camera/core/SurfaceOutput$CameraInputInfo;
    nop

    .line 218
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v2}, Landroidx/camera/core/processing/util/OutConfig;->getFormat()I

    move-result v2

    .line 217
    invoke-virtual {v0, v2, v1, v4}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceOutputFuture(ILandroidx/camera/core/SurfaceOutput$CameraInputInfo;Landroidx/camera/core/SurfaceOutput$CameraInputInfo;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v2

    .line 221
    .local v2, "future":Lcom/google/common/util/concurrent/ListenableFuture;, "Lcom/google/common/util/concurrent/ListenableFuture<Landroidx/camera/core/SurfaceOutput;>;"
    new-instance v3, Landroidx/camera/core/processing/SurfaceProcessorNode$1;

    invoke-direct {v3, p0, v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$1;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;Landroidx/camera/core/processing/SurfaceEdge;)V

    .line 242
    invoke-static {}, Landroidx/camera/core/impl/utils/executor/CameraXExecutors;->mainThreadExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v4

    .line 221
    invoke-static {v2, v3, v4}, Landroidx/camera/core/impl/utils/futures/Futures;->addCallback(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/camera/core/impl/utils/futures/FutureCallback;Ljava/util/concurrent/Executor;)V

    .line 243
    return-void
.end method

.method static synthetic lambda$setUpRotationUpdates$1(Ljava/util/Map;Landroidx/camera/core/SurfaceRequest$TransformationInfo;)V
    .locals 5
    .param p0, "outputs"    # Ljava/util/Map;
    .param p1, "info"    # Landroidx/camera/core/SurfaceRequest$TransformationInfo;

    .line 263
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 266
    .local v1, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    nop

    .line 267
    invoke-virtual {p1}, Landroidx/camera/core/SurfaceRequest$TransformationInfo;->getRotationDegrees()I

    move-result v2

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v3

    sub-int/2addr v2, v3

    .line 268
    .local v2, "rotationDegrees":I
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/util/OutConfig;

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 271
    neg-int v2, v2

    .line 273
    :cond_0
    invoke-static {v2}, Landroidx/camera/core/impl/utils/TransformUtils;->within360(I)I

    move-result v2

    .line 275
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/SurfaceEdge;

    const/4 v4, -0x1

    invoke-virtual {v3, v2, v4}, Landroidx/camera/core/processing/SurfaceEdge;->updateTransformation(II)V

    .line 276
    .end local v1    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    .end local v2    # "rotationDegrees":I
    goto :goto_0

    .line 277
    :cond_1
    return-void
.end method

.method private sendSurfaceOutputs(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V
    .locals 4
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/util/OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 197
    .local p2, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 198
    .local v1, "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    invoke-direct {p0, p1, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    .line 200
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/SurfaceEdge;

    new-instance v3, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;

    invoke-direct {v3, p0, p1, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    invoke-virtual {v2, v3}, Landroidx/camera/core/processing/SurfaceEdge;->addOnInvalidatedListener(Ljava/lang/Runnable;)V

    .line 202
    .end local v1    # "output":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    goto :goto_0

    .line 203
    :cond_0
    return-void
.end method

.method private sendSurfaceRequest(Landroidx/camera/core/processing/SurfaceEdge;)V
    .locals 3
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;

    .line 186
    :try_start_0
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mCameraInternal:Landroidx/camera/core/impl/CameraInternal;

    invoke-virtual {p1, v1}, Landroidx/camera/core/processing/SurfaceEdge;->createSurfaceRequest(Landroidx/camera/core/impl/CameraInternal;)Landroidx/camera/core/SurfaceRequest;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->onInputSurface(Landroidx/camera/core/SurfaceRequest;)V
    :try_end_0
    .catch Landroidx/camera/core/ProcessingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    goto :goto_0

    .line 187
    :catch_0
    move-exception v0

    .line 188
    .local v0, "e":Landroidx/camera/core/ProcessingException;
    const-string v1, "SurfaceProcessorNode"

    const-string v2, "Failed to send SurfaceRequest to SurfaceProcessor."

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 190
    .end local v0    # "e":Landroidx/camera/core/ProcessingException;
    :goto_0
    return-void
.end method

.method private transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/util/OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;
    .locals 15
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "outConfig"    # Landroidx/camera/core/processing/util/OutConfig;

    .line 130
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v0

    .line 131
    .local v0, "cropRect":Landroid/graphics/Rect;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getRotationDegrees()I

    move-result v1

    .line 132
    .local v1, "rotationDegrees":I
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->isMirroring()Z

    move-result v2

    .line 135
    .local v2, "mirroring":Z
    new-instance v3, Landroid/graphics/Matrix;

    .line 136
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getSensorToBufferTransform()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    move-object v9, v3

    .line 137
    .local v9, "sensorToBufferTransform":Landroid/graphics/Matrix;
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 139
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v4

    invoke-static {v4}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRectF(Landroid/util/Size;)Landroid/graphics/RectF;

    move-result-object v4

    .line 137
    invoke-static {v3, v4, v1, v2}, Landroidx/camera/core/impl/utils/TransformUtils;->getRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;IZ)Landroid/graphics/Matrix;

    move-result-object v3

    .line 140
    .local v3, "newTransform":Landroid/graphics/Matrix;
    invoke-virtual {v9, v3}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 144
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/TransformUtils;->getRotatedSize(Landroid/graphics/Rect;I)Landroid/util/Size;

    move-result-object v4

    .line 145
    .local v4, "rotatedCropSize":Landroid/util/Size;
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v5

    invoke-static {v4, v5}, Landroidx/camera/core/impl/utils/TransformUtils;->isAspectRatioMatchingWithRoundingError(Landroid/util/Size;Landroid/util/Size;)Z

    move-result v5

    invoke-static {v5}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 149
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->shouldRespectInputCropRect()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 150
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/graphics/Rect;->contains(Landroid/graphics/Rect;)Z

    move-result v5

    .line 152
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getCropRect()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v7

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    .line 151
    const-string v7, "Output crop rect %s must contain input crop rect %s"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 150
    invoke-static {v5, v6}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 153
    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 154
    .local v5, "newCropRect":Landroid/graphics/Rect;
    new-instance v6, Landroid/graphics/RectF;

    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getCropRect()Landroid/graphics/Rect;

    move-result-object v7

    invoke-direct {v6, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 155
    .local v6, "newCropRectF":Landroid/graphics/RectF;
    invoke-virtual {v3, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 156
    invoke-virtual {v6, v5}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 157
    .end local v6    # "newCropRectF":Landroid/graphics/RectF;
    move-object v11, v5

    goto :goto_0

    .line 158
    .end local v5    # "newCropRect":Landroid/graphics/Rect;
    :cond_0
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v5

    invoke-static {v5}, Landroidx/camera/core/impl/utils/TransformUtils;->sizeToRect(Landroid/util/Size;)Landroid/graphics/Rect;

    move-result-object v5

    move-object v11, v5

    .line 162
    .local v11, "newCropRect":Landroid/graphics/Rect;
    :goto_0
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getStreamSpec()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v5

    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec;->toBuilder()Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 163
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getSize()Landroid/util/Size;

    move-result-object v6

    .line 162
    invoke-virtual {v5, v6}, Landroidx/camera/core/impl/StreamSpec$Builder;->setResolution(Landroid/util/Size;)Landroidx/camera/core/impl/StreamSpec$Builder;

    move-result-object v5

    .line 163
    invoke-virtual {v5}, Landroidx/camera/core/impl/StreamSpec$Builder;->build()Landroidx/camera/core/impl/StreamSpec;

    move-result-object v8

    .line 165
    .local v8, "streamSpec":Landroidx/camera/core/impl/StreamSpec;
    new-instance v5, Landroidx/camera/core/processing/SurfaceEdge;

    .line 166
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getTargets()I

    move-result v6

    .line 167
    invoke-virtual/range {p2 .. p2}, Landroidx/camera/core/processing/util/OutConfig;->getFormat()I

    move-result v7

    .line 173
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->getRotationDegrees()I

    move-result v10

    sub-int v12, v10, v1

    .line 176
    invoke-virtual/range {p1 .. p1}, Landroidx/camera/core/processing/SurfaceEdge;->isMirroring()Z

    move-result v10

    if-eq v10, v2, :cond_1

    const/4 v10, 0x1

    goto :goto_1

    :cond_1
    const/4 v10, 0x0

    :goto_1
    move v14, v10

    const/4 v10, 0x0

    const/4 v13, -0x1

    invoke-direct/range {v5 .. v14}, Landroidx/camera/core/processing/SurfaceEdge;-><init>(IILandroidx/camera/core/impl/StreamSpec;Landroid/graphics/Matrix;ZLandroid/graphics/Rect;IIZ)V

    .line 178
    .local v5, "outputSurface":Landroidx/camera/core/processing/SurfaceEdge;
    return-object v5
.end method


# virtual methods
.method public getSurfaceProcessor()Landroidx/camera/core/processing/SurfaceProcessorInternal;
    .locals 1

    .line 303
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    return-object v0
.end method

.method synthetic lambda$release$2$androidx-camera-core-processing-SurfaceProcessorNode()V
    .locals 2

    .line 289
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    if-eqz v0, :cond_0

    .line 290
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-virtual {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;->values()Ljava/util/Collection;

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

    .line 292
    .local v1, "surface":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {v1}, Landroidx/camera/core/processing/SurfaceEdge;->close()V

    .line 293
    .end local v1    # "surface":Landroidx/camera/core/processing/SurfaceEdge;
    goto :goto_0

    .line 295
    :cond_0
    return-void
.end method

.method synthetic lambda$sendSurfaceOutputs$0$androidx-camera-core-processing-SurfaceProcessorNode(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V
    .locals 0
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceEdge;
    .param p2, "output"    # Ljava/util/Map$Entry;

    .line 201
    invoke-direct {p0, p1, p2}, Landroidx/camera/core/processing/SurfaceProcessorNode;->createAndSendSurfaceOutput(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map$Entry;)V

    return-void
.end method

.method public release()V
    .locals 1

    .line 285
    iget-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mSurfaceProcessor:Landroidx/camera/core/processing/SurfaceProcessorInternal;

    invoke-interface {v0}, Landroidx/camera/core/processing/SurfaceProcessorInternal;->release()V

    .line 288
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda2;-><init>(Landroidx/camera/core/processing/SurfaceProcessorNode;)V

    invoke-static {v0}, Landroidx/camera/core/impl/utils/Threads;->runOnMain(Ljava/lang/Runnable;)V

    .line 296
    return-void
.end method

.method setUpRotationUpdates(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V
    .locals 1
    .param p1, "inputEdge"    # Landroidx/camera/core/processing/SurfaceEdge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/util/OutConfig;",
            "Landroidx/camera/core/processing/SurfaceEdge;",
            ">;)V"
        }
    .end annotation

    .line 262
    .local p2, "outputs":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/util/OutConfig;Landroidx/camera/core/processing/SurfaceEdge;>;"
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda1;

    invoke-direct {v0, p2}, Landroidx/camera/core/processing/SurfaceProcessorNode$$ExternalSyntheticLambda1;-><init>(Ljava/util/Map;)V

    invoke-virtual {p1, v0}, Landroidx/camera/core/processing/SurfaceEdge;->addTransformationUpdateListener(Landroidx/core/util/Consumer;)V

    .line 278
    return-void
.end method

.method public transform(Landroidx/camera/core/processing/SurfaceProcessorNode$In;)Landroidx/camera/core/processing/SurfaceProcessorNode$Out;
    .locals 5
    .param p1, "input"    # Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    .line 111
    invoke-static {}, Landroidx/camera/core/impl/utils/Threads;->checkMainThread()V

    .line 112
    iput-object p1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mInput:Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    .line 113
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {v0}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;-><init>()V

    iput-object v0, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    .line 115
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getSurfaceEdge()Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v0

    .line 116
    .local v0, "inputSurface":Landroidx/camera/core/processing/SurfaceEdge;
    invoke-virtual {p1}, Landroidx/camera/core/processing/SurfaceProcessorNode$In;->getOutConfigs()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/processing/util/OutConfig;

    .line 117
    .local v2, "config":Landroidx/camera/core/processing/util/OutConfig;
    iget-object v3, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {p0, v0, v2}, Landroidx/camera/core/processing/SurfaceProcessorNode;->transformSingleOutput(Landroidx/camera/core/processing/SurfaceEdge;Landroidx/camera/core/processing/util/OutConfig;)Landroidx/camera/core/processing/SurfaceEdge;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Landroidx/camera/core/processing/SurfaceProcessorNode$Out;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    .end local v2    # "config":Landroidx/camera/core/processing/util/OutConfig;
    goto :goto_0

    .line 120
    :cond_0
    invoke-direct {p0, v0}, Landroidx/camera/core/processing/SurfaceProcessorNode;->sendSurfaceRequest(Landroidx/camera/core/processing/SurfaceEdge;)V

    .line 121
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-direct {p0, v0, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->sendSurfaceOutputs(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V

    .line 122
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    invoke-virtual {p0, v0, v1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->setUpRotationUpdates(Landroidx/camera/core/processing/SurfaceEdge;Ljava/util/Map;)V

    .line 123
    iget-object v1, p0, Landroidx/camera/core/processing/SurfaceProcessorNode;->mOutput:Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    return-object v1
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

    .line 76
    check-cast p1, Landroidx/camera/core/processing/SurfaceProcessorNode$In;

    invoke-virtual {p0, p1}, Landroidx/camera/core/processing/SurfaceProcessorNode;->transform(Landroidx/camera/core/processing/SurfaceProcessorNode$In;)Landroidx/camera/core/processing/SurfaceProcessorNode$Out;

    move-result-object p1

    return-object p1
.end method
