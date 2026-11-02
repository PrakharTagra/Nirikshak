.class Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;
.super Ljava/lang/Object;
.source "ProcessingCaptureSession.java"

# interfaces
.implements Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/camera2/internal/ProcessingCaptureSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CaptureCallbackAdapter"
.end annotation


# instance fields
.field private mCameraCaptureCallbacks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;"
        }
    .end annotation
.end field

.field private final mCaptureConfigId:I

.field private mCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;


# direct methods
.method private constructor <init>(ILjava/util/List;)V
    .locals 1
    .param p1, "captureConfigId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroidx/camera/core/impl/CameraCaptureCallback;",
            ">;)V"
        }
    .end annotation

    .line 442
    .local p2, "cameraCaptureCallbacks":Ljava/util/List;, "Ljava/util/List<Landroidx/camera/core/impl/CameraCaptureCallback;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 439
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 443
    iput p1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureConfigId:I

    .line 444
    iput-object p2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCameraCaptureCallbacks:Ljava/util/List;

    .line 445
    return-void
.end method

.method synthetic constructor <init>(ILjava/util/List;Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Ljava/util/List;
    .param p3, "x2"    # Landroidx/camera/camera2/internal/ProcessingCaptureSession$1;

    .line 436
    invoke-direct {p0, p1, p2}, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;-><init>(ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(JILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "timestamp"    # J
    .param p3, "captureSequenceId"    # I
    .param p4, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 466
    iput-object p4, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    .line 467
    return-void
.end method

.method public onCaptureFailed(I)V
    .locals 5
    .param p1, "captureSequenceId"    # I

    .line 457
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 458
    .local v1, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    iget v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureConfigId:I

    new-instance v3, Landroidx/camera/core/impl/CameraCaptureFailure;

    sget-object v4, Landroidx/camera/core/impl/CameraCaptureFailure$Reason;->ERROR:Landroidx/camera/core/impl/CameraCaptureFailure$Reason;

    invoke-direct {v3, v4}, Landroidx/camera/core/impl/CameraCaptureFailure;-><init>(Landroidx/camera/core/impl/CameraCaptureFailure$Reason;)V

    invoke-virtual {v1, v2, v3}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureFailed(ILandroidx/camera/core/impl/CameraCaptureFailure;)V

    .line 460
    .end local v1    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 461
    :cond_0
    return-void
.end method

.method public onCaptureProcessProgressed(I)V
    .locals 3
    .param p1, "progress"    # I

    .line 480
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 481
    .local v1, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    iget v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureConfigId:I

    invoke-virtual {v1, v2, p1}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureProcessProgressed(II)V

    .line 482
    .end local v1    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 483
    :cond_0
    return-void
.end method

.method public onCaptureSequenceCompleted(I)V
    .locals 4
    .param p1, "captureSequenceId"    # I

    .line 471
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    if-eqz v0, :cond_0

    .line 472
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureResult:Landroidx/camera/core/impl/CameraCaptureResult;

    goto :goto_0

    :cond_0
    new-instance v0, Landroidx/camera/core/impl/CameraCaptureResult$EmptyCameraCaptureResult;

    invoke-direct {v0}, Landroidx/camera/core/impl/CameraCaptureResult$EmptyCameraCaptureResult;-><init>()V

    .line 473
    .local v0, "cameraCaptureResult":Landroidx/camera/core/impl/CameraCaptureResult;
    :goto_0
    iget-object v1, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 474
    .local v2, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    iget v3, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureConfigId:I

    invoke-virtual {v2, v3, v0}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureCompleted(ILandroidx/camera/core/impl/CameraCaptureResult;)V

    .line 475
    .end local v2    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_1

    .line 476
    :cond_1
    return-void
.end method

.method public onCaptureStarted(IJ)V
    .locals 3
    .param p1, "captureSequenceId"    # I
    .param p2, "timestamp"    # J

    .line 449
    iget-object v0, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCameraCaptureCallbacks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraCaptureCallback;

    .line 450
    .local v1, "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    iget v2, p0, Landroidx/camera/camera2/internal/ProcessingCaptureSession$CaptureCallbackAdapter;->mCaptureConfigId:I

    invoke-virtual {v1, v2}, Landroidx/camera/core/impl/CameraCaptureCallback;->onCaptureStarted(I)V

    .line 451
    .end local v1    # "cameraCaptureCallback":Landroidx/camera/core/impl/CameraCaptureCallback;
    goto :goto_0

    .line 452
    :cond_0
    return-void
.end method
