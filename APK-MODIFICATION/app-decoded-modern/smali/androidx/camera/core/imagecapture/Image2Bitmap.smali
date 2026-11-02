.class public Landroidx/camera/core/imagecapture/Image2Bitmap;
.super Ljava/lang/Object;
.source "Image2Bitmap.java"

# interfaces
.implements Landroidx/camera/core/processing/Operation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/camera/core/processing/Operation<",
        "Landroidx/camera/core/processing/Packet<",
        "Landroidx/camera/core/ImageProxy;",
        ">;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Landroidx/camera/core/processing/Packet;)Landroid/graphics/Bitmap;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/processing/Packet<",
            "Landroidx/camera/core/ImageProxy;",
            ">;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 52
    .local p1, "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    const/4 v0, 0x0

    .line 54
    .local v0, "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    const/16 v1, 0x23

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v3

    if-ne v3, v1, :cond_4

    .line 55
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/ImageProxy;

    .line 56
    .local v3, "yuvImage":Landroidx/camera/core/ImageProxy;
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v4

    rem-int/lit16 v4, v4, 0xb4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    move v4, v5

    goto :goto_0

    :cond_0
    move v4, v2

    .line 57
    .local v4, "needFlip":Z
    :goto_0
    if-eqz v4, :cond_1

    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v6

    goto :goto_1

    :cond_1
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v6

    .line 58
    .local v6, "tempImageReaderWidth":I
    :goto_1
    if-eqz v4, :cond_2

    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v7

    goto :goto_2

    :cond_2
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v7

    .line 62
    .local v7, "tempImageReaderHeight":I
    :goto_2
    new-instance v8, Landroidx/camera/core/SafeCloseImageReaderProxy;

    .line 63
    const/4 v9, 0x2

    invoke-static {v6, v7, v5, v9}, Landroidx/camera/core/ImageReaderProxys;->createIsolatedReader(IIII)Landroidx/camera/core/impl/ImageReaderProxy;

    move-result-object v5

    invoke-direct {v8, v5}, Landroidx/camera/core/SafeCloseImageReaderProxy;-><init>(Landroidx/camera/core/impl/ImageReaderProxy;)V

    move-object v0, v8

    .line 68
    nop

    .line 69
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v5

    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v8

    mul-int/2addr v5, v8

    mul-int/lit8 v5, v5, 0x4

    .line 68
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 70
    .local v5, "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    nop

    .line 74
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v8

    .line 70
    invoke-static {v3, v0, v5, v8, v2}, Landroidx/camera/core/ImageProcessingUtil;->convertYUVToRGB(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/ImageReaderProxy;Ljava/nio/ByteBuffer;IZ)Landroidx/camera/core/ImageProxy;

    move-result-object v8

    .line 76
    .local v8, "imageProxyRGB":Landroidx/camera/core/ImageProxy;
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->close()V

    .line 77
    if-eqz v8, :cond_3

    .line 80
    invoke-static {v8}, Landroidx/camera/core/internal/utils/ImageUtil;->createBitmapFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 81
    .local v9, "bitmap":Landroid/graphics/Bitmap;
    invoke-interface {v8}, Landroidx/camera/core/ImageProxy;->close()V

    .line 82
    nop

    .line 83
    .end local v3    # "yuvImage":Landroidx/camera/core/ImageProxy;
    .end local v4    # "needFlip":Z
    .end local v5    # "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    .end local v6    # "tempImageReaderWidth":I
    .end local v7    # "tempImageReaderHeight":I
    .end local v8    # "imageProxyRGB":Landroidx/camera/core/ImageProxy;
    .local v9, "result":Landroid/graphics/Bitmap;
    goto :goto_3

    .line 78
    .end local v9    # "result":Landroid/graphics/Bitmap;
    .restart local v3    # "yuvImage":Landroidx/camera/core/ImageProxy;
    .restart local v4    # "needFlip":Z
    .restart local v5    # "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    .restart local v6    # "tempImageReaderWidth":I
    .restart local v7    # "tempImageReaderHeight":I
    .restart local v8    # "imageProxyRGB":Landroidx/camera/core/ImageProxy;
    :cond_3
    new-instance v9, Landroidx/camera/core/ImageCaptureException;

    const-string v10, "Can\'t covert YUV to RGB"

    const/4 v11, 0x0

    invoke-direct {v9, v2, v10, v11}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    throw v9

    .line 83
    .end local v3    # "yuvImage":Landroidx/camera/core/ImageProxy;
    .end local v4    # "needFlip":Z
    .end local v5    # "rgbConvertedBuffer":Ljava/nio/ByteBuffer;
    .end local v6    # "tempImageReaderWidth":I
    .end local v7    # "tempImageReaderHeight":I
    .end local v8    # "imageProxyRGB":Landroidx/camera/core/ImageProxy;
    .restart local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .restart local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    :cond_4
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v3

    const/16 v4, 0x100

    if-ne v3, v4, :cond_6

    .line 84
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getData()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/ImageProxy;

    .line 85
    .local v3, "jpegImage":Landroidx/camera/core/ImageProxy;
    invoke-static {v3}, Landroidx/camera/core/internal/utils/ImageUtil;->createBitmapFromImageProxy(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 86
    .local v4, "bitmap":Landroid/graphics/Bitmap;
    invoke-interface {v3}, Landroidx/camera/core/ImageProxy;->close()V

    .line 87
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getRotationDegrees()I

    move-result v5

    invoke-static {v4, v5}, Landroidx/camera/core/internal/utils/ImageUtil;->rotateBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v9, v1

    .line 88
    .end local v3    # "jpegImage":Landroidx/camera/core/ImageProxy;
    .end local v4    # "bitmap":Landroid/graphics/Bitmap;
    .restart local v9    # "result":Landroid/graphics/Bitmap;
    nop

    .line 92
    :goto_3
    nop

    .line 99
    if-eqz v0, :cond_5

    .line 100
    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->close()V

    .line 92
    :cond_5
    return-object v9

    .line 89
    .end local v9    # "result":Landroid/graphics/Bitmap;
    :cond_6
    :try_start_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid postview image format : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 90
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    throw v3
    :try_end_1
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 99
    .restart local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .restart local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    :catchall_0
    move-exception v1

    goto :goto_5

    .line 93
    :catch_0
    move-exception v3

    .line 94
    .local v3, "e":Ljava/lang/UnsupportedOperationException;
    :try_start_2
    invoke-virtual {p1}, Landroidx/camera/core/processing/Packet;->getFormat()I

    move-result v4

    if-ne v4, v1, :cond_7

    .line 95
    const-string v1, "YUV"

    goto :goto_4

    :cond_7
    const-string v1, "JPEG"

    .line 96
    .local v1, "format":Ljava/lang/String;
    :goto_4
    new-instance v4, Landroidx/camera/core/ImageCaptureException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Can\'t convert "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " to bitmap"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v2, v5, v3}, Landroidx/camera/core/ImageCaptureException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .end local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .end local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    .end local v1    # "format":Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/UnsupportedOperationException;
    .restart local v0    # "rgbImageReader":Landroidx/camera/core/SafeCloseImageReaderProxy;
    .restart local p1    # "imageProxyPacket":Landroidx/camera/core/processing/Packet;, "Landroidx/camera/core/processing/Packet<Landroidx/camera/core/ImageProxy;>;"
    :goto_5
    if-eqz v0, :cond_8

    .line 100
    invoke-virtual {v0}, Landroidx/camera/core/SafeCloseImageReaderProxy;->close()V

    .line 102
    :cond_8
    throw v1
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/core/ImageCaptureException;
        }
    .end annotation

    .line 45
    check-cast p1, Landroidx/camera/core/processing/Packet;

    invoke-virtual {p0, p1}, Landroidx/camera/core/imagecapture/Image2Bitmap;->apply(Landroidx/camera/core/processing/Packet;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method
