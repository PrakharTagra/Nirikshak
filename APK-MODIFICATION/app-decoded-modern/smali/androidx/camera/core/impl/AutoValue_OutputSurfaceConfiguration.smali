.class final Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;
.super Landroidx/camera/core/impl/OutputSurfaceConfiguration;
.source "AutoValue_OutputSurfaceConfiguration.java"


# instance fields
.field private final imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

.field private final imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

.field private final postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

.field private final previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;


# direct methods
.method constructor <init>(Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;Landroidx/camera/core/impl/OutputSurface;)V
    .locals 2
    .param p1, "previewOutputSurface"    # Landroidx/camera/core/impl/OutputSurface;
    .param p2, "imageCaptureOutputSurface"    # Landroidx/camera/core/impl/OutputSurface;
    .param p3, "imageAnalysisOutputSurface"    # Landroidx/camera/core/impl/OutputSurface;
    .param p4, "postviewOutputSurface"    # Landroidx/camera/core/impl/OutputSurface;

    .line 23
    invoke-direct {p0}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;-><init>()V

    .line 24
    if-eqz p1, :cond_1

    .line 27
    iput-object p1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    .line 28
    if-eqz p2, :cond_0

    .line 31
    iput-object p2, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    .line 32
    iput-object p3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    .line 33
    iput-object p4, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    .line 34
    return-void

    .line 29
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null imageCaptureOutputSurface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 25
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Null previewOutputSurface"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 72
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 73
    return v0

    .line 75
    :cond_0
    instance-of v1, p1, Landroidx/camera/core/impl/OutputSurfaceConfiguration;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 76
    move-object v1, p1

    check-cast v1, Landroidx/camera/core/impl/OutputSurfaceConfiguration;

    .line 77
    .local v1, "that":Landroidx/camera/core/impl/OutputSurfaceConfiguration;
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getPreviewOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    .line 78
    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getImageCaptureOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    if-nez v3, :cond_1

    .line 79
    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getImageAnalysisOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v3

    if-nez v3, :cond_3

    goto :goto_0

    :cond_1
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getImageAnalysisOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :goto_0
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    if-nez v3, :cond_2

    .line 80
    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getPostviewOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v3

    if-nez v3, :cond_3

    goto :goto_1

    :cond_2
    iget-object v3, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v1}, Landroidx/camera/core/impl/OutputSurfaceConfiguration;->getPostviewOutputSurface()Landroidx/camera/core/impl/OutputSurface;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    :goto_1
    goto :goto_2

    :cond_3
    move v0, v2

    .line 77
    :goto_2
    return v0

    .line 82
    .end local v1    # "that":Landroidx/camera/core/impl/OutputSurfaceConfiguration;
    :cond_4
    return v2
.end method

.method public getImageAnalysisOutputSurface()Landroidx/camera/core/impl/OutputSurface;
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    return-object v0
.end method

.method public getImageCaptureOutputSurface()Landroidx/camera/core/impl/OutputSurface;
    .locals 1

    .line 45
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    return-object v0
.end method

.method public getPostviewOutputSurface()Landroidx/camera/core/impl/OutputSurface;
    .locals 1

    .line 57
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    return-object v0
.end method

.method public getPreviewOutputSurface()Landroidx/camera/core/impl/OutputSurface;
    .locals 1

    .line 39
    iget-object v0, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 87
    const/4 v0, 0x1

    .line 88
    .local v0, "h$":I
    const v1, 0xf4243

    mul-int/2addr v0, v1

    .line 89
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 90
    mul-int/2addr v0, v1

    .line 91
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    xor-int/2addr v0, v2

    .line 92
    mul-int/2addr v0, v1

    .line 93
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_0
    xor-int/2addr v0, v2

    .line 94
    mul-int/2addr v0, v1

    .line 95
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_1
    xor-int/2addr v0, v3

    .line 96
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OutputSurfaceConfiguration{previewOutputSurface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->previewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imageCaptureOutputSurface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageCaptureOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imageAnalysisOutputSurface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->imageAnalysisOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", postviewOutputSurface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/AutoValue_OutputSurfaceConfiguration;->postviewOutputSurface:Landroidx/camera/core/impl/OutputSurface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
