.class final Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;
.super Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;
.source "AutoValue_TakePictureManager_CaptureError.java"


# instance fields
.field private final imageCaptureException:Landroidx/camera/core/ImageCaptureException;

.field private final requestId:I


# direct methods
.method constructor <init>(ILandroidx/camera/core/ImageCaptureException;)V
    .locals 2
    .param p1, "requestId"    # I
    .param p2, "imageCaptureException"    # Landroidx/camera/core/ImageCaptureException;

    .line 17
    invoke-direct {p0}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;-><init>()V

    .line 18
    iput p1, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->requestId:I

    .line 19
    if-eqz p2, :cond_0

    .line 22
    iput-object p2, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->imageCaptureException:Landroidx/camera/core/ImageCaptureException;

    .line 23
    return-void

    .line 20
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null imageCaptureException"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 46
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 47
    return v0

    .line 49
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 50
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;

    .line 51
    .local v1, "that":Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;
    iget v3, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->requestId:I

    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->getRequestId()I

    move-result v4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->imageCaptureException:Landroidx/camera/core/ImageCaptureException;

    .line 52
    invoke-virtual {v1}, Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;->getImageCaptureException()Landroidx/camera/core/ImageCaptureException;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 51
    :goto_0
    return v0

    .line 54
    .end local v1    # "that":Landroidx/camera/core/imagecapture/TakePictureManager$CaptureError;
    :cond_2
    return v2
.end method

.method getImageCaptureException()Landroidx/camera/core/ImageCaptureException;
    .locals 1

    .line 33
    iget-object v0, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->imageCaptureException:Landroidx/camera/core/ImageCaptureException;

    return-object v0
.end method

.method getRequestId()I
    .locals 1

    .line 27
    iget v0, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->requestId:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 59
    const/4 v0, 0x1

    .line 60
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 61
    iget v2, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->requestId:I

    xor-int/2addr v0, v2

    .line 62
    mul-int/2addr v0, v1

    .line 63
    iget-object v1, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->imageCaptureException:Landroidx/camera/core/ImageCaptureException;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    .line 64
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CaptureError{requestId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->requestId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imageCaptureException="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/imagecapture/AutoValue_TakePictureManager_CaptureError;->imageCaptureException:Landroidx/camera/core/ImageCaptureException;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
