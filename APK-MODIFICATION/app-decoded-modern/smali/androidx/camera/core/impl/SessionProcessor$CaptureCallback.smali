.class public interface abstract Landroidx/camera/core/impl/SessionProcessor$CaptureCallback;
.super Ljava/lang/Object;
.source "SessionProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/camera/core/impl/SessionProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CaptureCallback"
.end annotation


# virtual methods
.method public onCaptureCompleted(JILandroidx/camera/core/impl/CameraCaptureResult;)V
    .locals 0
    .param p1, "timestamp"    # J
    .param p3, "captureSequenceId"    # I
    .param p4, "captureResult"    # Landroidx/camera/core/impl/CameraCaptureResult;

    .line 252
    return-void
.end method

.method public onCaptureFailed(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 212
    return-void
.end method

.method public onCaptureProcessProgressed(I)V
    .locals 0
    .param p1, "progress"    # I

    .line 266
    return-void
.end method

.method public onCaptureProcessStarted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 203
    return-void
.end method

.method public onCaptureSequenceAborted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 232
    return-void
.end method

.method public onCaptureSequenceCompleted(I)V
    .locals 0
    .param p1, "captureSequenceId"    # I

    .line 225
    return-void
.end method

.method public onCaptureStarted(IJ)V
    .locals 0
    .param p1, "captureSequenceId"    # I
    .param p2, "timestamp"    # J

    .line 195
    return-void
.end method
