.class public final Landroidx/camera/core/ImageProcessingUtil;
.super Ljava/lang/Object;
.source "ImageProcessingUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/ImageProcessingUtil$Result;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ImageProcessingUtil"

.field private static sImageCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    const/4 v0, 0x0

    sput v0, Landroidx/camera/core/ImageProcessingUtil;->sImageCount:I

    .line 55
    const-string/jumbo v0, "image_processing_util_jni"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 56
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    return-void
.end method

.method public static applyPixelShiftForYUV(Landroidx/camera/core/ImageProxy;)Z
    .locals 4
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 310
    invoke-static {p0}, Landroidx/camera/core/ImageProcessingUtil;->isSupportedYUVFormat(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "ImageProcessingUtil"

    if-nez v0, :cond_0

    .line 311
    const-string v0, "Unsupported format for YUV to RGB"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    return v1

    .line 315
    :cond_0
    invoke-static {p0}, Landroidx/camera/core/ImageProcessingUtil;->applyPixelShiftInternal(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/ImageProcessingUtil$Result;

    move-result-object v0

    .line 317
    .local v0, "result":Landroidx/camera/core/ImageProcessingUtil$Result;
    sget-object v3, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    if-ne v0, v3, :cond_1

    .line 318
    const-string v3, "One pixel shift for YUV failure"

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    return v1

    .line 321
    :cond_1
    const/4 v1, 0x1

    return v1
.end method

.method private static applyPixelShiftInternal(Landroidx/camera/core/ImageProxy;)Landroidx/camera/core/ImageProcessingUtil$Result;
    .locals 15
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 450
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v8

    .line 451
    .local v8, "imageWidth":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v9

    .line 452
    .local v9, "imageHeight":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v0

    .line 453
    .local v0, "srcStrideY":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v2, v2, v3

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v2

    .line 454
    .local v2, "srcStrideU":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v4, v4, v5

    invoke-interface {v4}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v4

    .line 455
    .local v4, "srcStrideV":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v6

    aget-object v6, v6, v1

    invoke-interface {v6}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v6

    .line 456
    .local v6, "srcPixelStrideY":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v7

    aget-object v7, v7, v3

    invoke-interface {v7}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v7

    .line 458
    .local v7, "srcPixelStrideUV":I
    move v10, v6

    .line 459
    .local v10, "startOffsetY":I
    move v11, v7

    .line 460
    .local v11, "startOffsetU":I
    move v12, v7

    .line 462
    .local v12, "startOffsetV":I
    nop

    .line 463
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v13

    aget-object v1, v13, v1

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 465
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v13

    aget-object v3, v13, v3

    invoke-interface {v3}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 467
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v13

    aget-object v5, v13, v5

    invoke-interface {v5}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 462
    move-object v14, v1

    move v1, v0

    move-object v0, v14

    move-object v14, v3

    move v3, v2

    move-object v2, v14

    move-object v14, v5

    move v5, v4

    move-object v4, v14

    .end local v0    # "srcStrideY":I
    .end local v2    # "srcStrideU":I
    .end local v4    # "srcStrideV":I
    .local v1, "srcStrideY":I
    .local v3, "srcStrideU":I
    .local v5, "srcStrideV":I
    invoke-static/range {v0 .. v12}, Landroidx/camera/core/ImageProcessingUtil;->nativeShiftPixel(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIIIIIII)I

    move-result v0

    .line 476
    .local v0, "result":I
    if-eqz v0, :cond_0

    .line 477
    sget-object v2, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v2

    .line 479
    :cond_0
    sget-object v2, Landroidx/camera/core/ImageProcessingUtil$Result;->SUCCESS:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v2
.end method

.method public static convertJpegBytesToImage(Landroidx/camera/core/impl/ImageReaderProxy;[B)Landroidx/camera/core/ImageProxy;
    .locals 4
    .param p0, "jpegImageReaderProxy"    # Landroidx/camera/core/impl/ImageReaderProxy;
    .param p1, "jpegBytes"    # [B

    .line 78
    invoke-interface {p0}, Landroidx/camera/core/impl/ImageReaderProxy;->getImageFormat()I

    move-result v0

    const/16 v1, 0x100

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkArgument(Z)V

    .line 79
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    invoke-interface {p0}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 82
    .local v0, "surface":Landroid/view/Surface;
    invoke-static {v0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    invoke-static {p1, v0}, Landroidx/camera/core/ImageProcessingUtil;->nativeWriteJpegToSurface([BLandroid/view/Surface;)I

    move-result v1

    const-string v2, "ImageProcessingUtil"

    if-eqz v1, :cond_1

    .line 85
    const-string v1, "Failed to enqueue JPEG image."

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    const/4 v1, 0x0

    return-object v1

    .line 89
    :cond_1
    invoke-interface {p0}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v1

    .line 90
    .local v1, "imageProxy":Landroidx/camera/core/ImageProxy;
    if-nez v1, :cond_2

    .line 91
    const-string v3, "Failed to get acquire JPEG image."

    invoke-static {v2, v3}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    :cond_2
    return-object v1
.end method

.method public static convertYUVToBitmap(Landroidx/camera/core/ImageProxy;)Landroid/graphics/Bitmap;
    .locals 14
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 268
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x23

    if-ne v0, v1, :cond_1

    .line 272
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v12

    .line 273
    .local v12, "imageWidth":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v13

    .line 274
    .local v13, "imageHeight":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v3

    .line 275
    .local v3, "srcStrideY":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v2, 0x1

    aget-object v0, v0, v2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v5

    .line 276
    .local v5, "srcStrideU":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v4, 0x2

    aget-object v0, v0, v4

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v7

    .line 277
    .local v7, "srcStrideV":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v8

    .line 278
    .local v8, "srcPixelStrideY":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v2

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v9

    .line 280
    .local v9, "srcPixelStrideUV":I
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v0

    .line 281
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v6

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 280
    invoke-static {v0, v6, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 282
    .local v10, "bitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v10}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v11

    .line 284
    .local v11, "bitmapStride":I
    nop

    .line 285
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 287
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v1

    aget-object v1, v1, v2

    invoke-interface {v1}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 289
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v2

    aget-object v2, v2, v4

    invoke-interface {v2}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v6

    .line 284
    move-object v2, v0

    move-object v4, v1

    invoke-static/range {v2 .. v13}, Landroidx/camera/core/ImageProcessingUtil;->nativeConvertAndroid420ToBitmap(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILandroid/graphics/Bitmap;III)I

    move-result v0

    .line 297
    .local v0, "result":I
    if-nez v0, :cond_0

    .line 300
    return-object v10

    .line 298
    :cond_0
    new-instance v1, Ljava/lang/UnsupportedOperationException;

    const-string v2, "YUV to RGB conversion failed"

    invoke-direct {v1, v2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 269
    .end local v0    # "result":I
    .end local v3    # "srcStrideY":I
    .end local v5    # "srcStrideU":I
    .end local v7    # "srcStrideV":I
    .end local v8    # "srcPixelStrideY":I
    .end local v9    # "srcPixelStrideUV":I
    .end local v10    # "bitmap":Landroid/graphics/Bitmap;
    .end local v11    # "bitmapStride":I
    .end local v12    # "imageWidth":I
    .end local v13    # "imageHeight":I
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Input image format must be YUV_420_888"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static convertYUVToRGB(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/ImageReaderProxy;Ljava/nio/ByteBuffer;IZ)Landroidx/camera/core/ImageProxy;
    .locals 8
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "rgbImageReaderProxy"    # Landroidx/camera/core/impl/ImageReaderProxy;
    .param p2, "rgbConvertedBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "rotationDegrees"    # I
    .param p4, "onePixelShiftEnabled"    # Z

    .line 204
    invoke-static {p0}, Landroidx/camera/core/ImageProcessingUtil;->isSupportedYUVFormat(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "ImageProcessingUtil"

    if-nez v0, :cond_0

    .line 205
    const-string v0, "Unsupported format for YUV to RGB"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    return-object v1

    .line 208
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 210
    .local v3, "startTimeMillis":J
    invoke-static {p3}, Landroidx/camera/core/ImageProcessingUtil;->isSupportedRotationDegrees(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 211
    const-string v0, "Unsupported rotation degrees for rotate RGB"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    return-object v1

    .line 216
    :cond_1
    nop

    .line 218
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->getSurface()Landroid/view/Surface;

    move-result-object v0

    .line 216
    invoke-static {p0, v0, p2, p3, p4}, Landroidx/camera/core/ImageProcessingUtil;->convertYUVToRGBInternal(Landroidx/camera/core/ImageProxy;Landroid/view/Surface;Ljava/nio/ByteBuffer;IZ)Landroidx/camera/core/ImageProcessingUtil$Result;

    move-result-object v0

    .line 223
    .local v0, "result":Landroidx/camera/core/ImageProcessingUtil$Result;
    sget-object v5, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    if-ne v0, v5, :cond_2

    .line 224
    const-string v5, "YUV to RGB conversion failure"

    invoke-static {v2, v5}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    return-object v1

    .line 227
    :cond_2
    const-string v5, "MH"

    const/4 v6, 0x3

    invoke-static {v5, v6}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 230
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 232
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v3

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    sget v7, Landroidx/camera/core/ImageProcessingUtil;->sImageCount:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    .line 230
    const-string v7, "Image processing performance profiling, duration: [%d], image count: %d"

    invoke-static {v5, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    sget v5, Landroidx/camera/core/ImageProcessingUtil;->sImageCount:I

    add-int/lit8 v5, v5, 0x1

    sput v5, Landroidx/camera/core/ImageProcessingUtil;->sImageCount:I

    .line 237
    :cond_3
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object v5

    .line 238
    .local v5, "rgbImageProxy":Landroidx/camera/core/ImageProxy;
    if-nez v5, :cond_4

    .line 239
    const-string v6, "YUV to RGB acquireLatestImage failure"

    invoke-static {v2, v6}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    return-object v1

    .line 244
    :cond_4
    new-instance v1, Landroidx/camera/core/SingleCloseImageProxy;

    invoke-direct {v1, v5}, Landroidx/camera/core/SingleCloseImageProxy;-><init>(Landroidx/camera/core/ImageProxy;)V

    .line 245
    .local v1, "wrappedRgbImageProxy":Landroidx/camera/core/SingleCloseImageProxy;
    new-instance v2, Landroidx/camera/core/ImageProcessingUtil$$ExternalSyntheticLambda0;

    invoke-direct {v2, v5, p0}, Landroidx/camera/core/ImageProcessingUtil$$ExternalSyntheticLambda0;-><init>(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;)V

    invoke-virtual {v1, v2}, Landroidx/camera/core/SingleCloseImageProxy;->addOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 251
    return-object v1
.end method

.method private static convertYUVToRGBInternal(Landroidx/camera/core/ImageProxy;Landroid/view/Surface;Ljava/nio/ByteBuffer;IZ)Landroidx/camera/core/ImageProcessingUtil$Result;
    .locals 17
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "surface"    # Landroid/view/Surface;
    .param p2, "rgbConvertedBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "rotation"    # I
    .param p4, "onePixelShiftEnabled"    # Z

    .line 413
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v11

    .line 414
    .local v11, "imageWidth":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v12

    .line 415
    .local v12, "imageHeight":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v2

    .line 416
    .local v2, "srcStrideY":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v3, 0x1

    aget-object v0, v0, v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v4

    .line 417
    .local v4, "srcStrideU":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v5, 0x2

    aget-object v0, v0, v5

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v6

    .line 418
    .local v6, "srcStrideV":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v7

    .line 419
    .local v7, "srcPixelStrideY":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v8

    .line 421
    .local v8, "srcPixelStrideUV":I
    if-eqz p4, :cond_0

    move v13, v7

    goto :goto_0

    :cond_0
    move v13, v1

    .line 422
    .local v13, "startOffsetY":I
    :goto_0
    if-eqz p4, :cond_1

    move v14, v8

    goto :goto_1

    :cond_1
    move v14, v1

    .line 423
    .local v14, "startOffsetU":I
    :goto_1
    if-eqz p4, :cond_2

    move v15, v8

    goto :goto_2

    :cond_2
    move v15, v1

    .line 425
    .local v15, "startOffsetV":I
    :goto_2
    nop

    .line 426
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 428
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 430
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v5

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 425
    move-object/from16 v9, p1

    move-object/from16 v10, p2

    move/from16 v16, p3

    invoke-static/range {v1 .. v16}, Landroidx/camera/core/ImageProcessingUtil;->nativeConvertAndroid420ToABGR(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILandroid/view/Surface;Ljava/nio/ByteBuffer;IIIIII)I

    move-result v0

    .line 442
    .local v0, "result":I
    if-eqz v0, :cond_3

    .line 443
    sget-object v1, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v1

    .line 445
    :cond_3
    sget-object v1, Landroidx/camera/core/ImageProcessingUtil$Result;->SUCCESS:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v1
.end method

.method public static convertYuvToJpegBytesIntoSurface(Landroid/media/Image;IILandroid/view/Surface;)Z
    .locals 1
    .param p0, "image"    # Landroid/media/Image;
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I
    .param p3, "outputSurface"    # Landroid/view/Surface;

    .line 157
    new-instance v0, Landroidx/camera/core/AndroidImageProxy;

    invoke-direct {v0, p0}, Landroidx/camera/core/AndroidImageProxy;-><init>(Landroid/media/Image;)V

    invoke-static {v0, p1, p2, p3}, Landroidx/camera/core/ImageProcessingUtil;->convertYuvToJpegBytesIntoSurface(Landroidx/camera/core/ImageProxy;IILandroid/view/Surface;)Z

    move-result v0

    return v0
.end method

.method public static convertYuvToJpegBytesIntoSurface(Landroidx/camera/core/ImageProxy;IILandroid/view/Surface;)Z
    .locals 3
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "jpegQuality"    # I
    .param p2, "rotationDegrees"    # I
    .param p3, "outputSurface"    # Landroid/view/Surface;

    .line 172
    nop

    .line 173
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, v0, p1, p2}, Landroidx/camera/core/internal/utils/ImageUtil;->yuvImageToJpegByteArray(Landroidx/camera/core/ImageProxy;Landroid/graphics/Rect;II)[B

    move-result-object v0

    .line 175
    .local v0, "jpegBytes":[B
    invoke-static {p3, v0}, Landroidx/camera/core/ImageProcessingUtil;->writeJpegBytesToSurface(Landroid/view/Surface;[B)Z

    move-result v1
    :try_end_0
    .catch Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 177
    .end local v0    # "jpegBytes":[B
    :catch_0
    move-exception v0

    .line 178
    .local v0, "e":Landroidx/camera/core/internal/utils/ImageUtil$CodecFailedException;
    const-string v1, "ImageProcessingUtil"

    const-string v2, "Failed to encode YUV to JPEG"

    invoke-static {v1, v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    const/4 v1, 0x0

    return v1
.end method

.method public static copyBitmapToByteBuffer(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V
    .locals 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "bufferStride"    # I

    .line 106
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v2

    .line 107
    .local v2, "bitmapStride":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 108
    .local v4, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 109
    .local v5, "height":I
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    .end local p1    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local p2    # "bufferStride":I
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    .local v1, "byteBuffer":Ljava/nio/ByteBuffer;
    .local v3, "bufferStride":I
    invoke-static/range {v0 .. v6}, Landroidx/camera/core/ImageProcessingUtil;->nativeCopyBetweenByteBufferAndBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;IIIIZ)I

    .line 111
    return-void
.end method

.method public static copyByteBufferToBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;I)V
    .locals 7
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;
    .param p1, "byteBuffer"    # Ljava/nio/ByteBuffer;
    .param p2, "bufferStride"    # I

    .line 123
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v3

    .line 124
    .local v3, "bitmapStride":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    .line 125
    .local v4, "width":I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    .line 126
    .local v5, "height":I
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    .end local p0    # "bitmap":Landroid/graphics/Bitmap;
    .end local p1    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local p2    # "bufferStride":I
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    .local v1, "byteBuffer":Ljava/nio/ByteBuffer;
    .local v2, "bufferStride":I
    invoke-static/range {v0 .. v6}, Landroidx/camera/core/ImageProcessingUtil;->nativeCopyBetweenByteBufferAndBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;IIIIZ)I

    .line 128
    return-void
.end method

.method private static isSupportedRotationDegrees(I)Z
    .locals 1
    .param p0, "rotationDegrees"    # I

    .line 400
    if-eqz p0, :cond_1

    const/16 v0, 0x5a

    if-eq p0, v0, :cond_1

    const/16 v0, 0xb4

    if-eq p0, v0, :cond_1

    const/16 v0, 0x10e

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static isSupportedYUVFormat(Landroidx/camera/core/ImageProxy;)Z
    .locals 2
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;

    .line 394
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getFormat()I

    move-result v0

    const/16 v1, 0x23

    if-ne v0, v1, :cond_0

    .line 395
    invoke-interface {p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 394
    :goto_0
    return v0
.end method

.method static synthetic lambda$convertYUVToRGB$0(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;)V
    .locals 0
    .param p0, "rgbImageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "image"    # Landroidx/camera/core/ImageProxy;

    .line 247
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 248
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 250
    :cond_0
    return-void
.end method

.method static synthetic lambda$rotateYUV$1(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;)V
    .locals 0
    .param p0, "rotatedImageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p2, "image"    # Landroidx/camera/core/ImageProxy;

    .line 385
    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 386
    invoke-interface {p1}, Landroidx/camera/core/ImageProxy;->close()V

    .line 388
    :cond_0
    return-void
.end method

.method private static native nativeConvertAndroid420ToABGR(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILandroid/view/Surface;Ljava/nio/ByteBuffer;IIIIII)I
.end method

.method private static native nativeConvertAndroid420ToBitmap(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIILandroid/graphics/Bitmap;III)I
.end method

.method private static native nativeCopyBetweenByteBufferAndBitmap(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;IIIIZ)I
.end method

.method private static native nativeRotateYUV(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)I
.end method

.method private static native nativeShiftPixel(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIIIIIII)I
.end method

.method private static native nativeWriteJpegToSurface([BLandroid/view/Surface;)I
.end method

.method public static rotateYUV(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/impl/ImageReaderProxy;Landroid/media/ImageWriter;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Landroidx/camera/core/ImageProxy;
    .locals 9
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "rotatedImageReaderProxy"    # Landroidx/camera/core/impl/ImageReaderProxy;
    .param p2, "rotatedImageWriter"    # Landroid/media/ImageWriter;
    .param p3, "yRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p4, "uRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p5, "vRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p6, "rotationDegrees"    # I

    .line 345
    invoke-static {p0}, Landroidx/camera/core/ImageProcessingUtil;->isSupportedYUVFormat(Landroidx/camera/core/ImageProxy;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "ImageProcessingUtil"

    if-nez v0, :cond_0

    .line 346
    const-string v0, "Unsupported format for rotate YUV"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    return-object v1

    .line 350
    :cond_0
    invoke-static {p6}, Landroidx/camera/core/ImageProcessingUtil;->isSupportedRotationDegrees(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 351
    const-string v0, "Unsupported rotation degrees for rotate YUV"

    invoke-static {v2, v0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 352
    return-object v1

    .line 355
    :cond_1
    sget-object v0, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    .line 359
    .local v0, "result":Landroidx/camera/core/ImageProcessingUtil$Result;
    if-lez p6, :cond_2

    .line 360
    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move v8, p6

    .end local p0    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .end local p2    # "rotatedImageWriter":Landroid/media/ImageWriter;
    .end local p3    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p4    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p5    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p6    # "rotationDegrees":I
    .local v3, "imageProxy":Landroidx/camera/core/ImageProxy;
    .local v4, "rotatedImageWriter":Landroid/media/ImageWriter;
    .local v5, "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v6, "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v7, "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .local v8, "rotationDegrees":I
    invoke-static/range {v3 .. v8}, Landroidx/camera/core/ImageProcessingUtil;->rotateYUVInternal(Landroidx/camera/core/ImageProxy;Landroid/media/ImageWriter;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Landroidx/camera/core/ImageProcessingUtil$Result;

    move-result-object v0

    goto :goto_0

    .line 359
    .end local v3    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .end local v4    # "rotatedImageWriter":Landroid/media/ImageWriter;
    .end local v5    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v6    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v7    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local v8    # "rotationDegrees":I
    .restart local p0    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .restart local p2    # "rotatedImageWriter":Landroid/media/ImageWriter;
    .restart local p3    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local p4    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local p5    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local p6    # "rotationDegrees":I
    :cond_2
    move-object v3, p0

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move v8, p6

    .line 369
    .end local p0    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .end local p2    # "rotatedImageWriter":Landroid/media/ImageWriter;
    .end local p3    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p4    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p5    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .end local p6    # "rotationDegrees":I
    .restart local v3    # "imageProxy":Landroidx/camera/core/ImageProxy;
    .restart local v4    # "rotatedImageWriter":Landroid/media/ImageWriter;
    .restart local v5    # "yRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v6    # "uRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v7    # "vRotatedBuffer":Ljava/nio/ByteBuffer;
    .restart local v8    # "rotationDegrees":I
    :goto_0
    sget-object p0, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    if-ne v0, p0, :cond_3

    .line 370
    const-string/jumbo p0, "rotate YUV failure"

    invoke-static {v2, p0}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 371
    return-object v1

    .line 375
    :cond_3
    invoke-interface {p1}, Landroidx/camera/core/impl/ImageReaderProxy;->acquireLatestImage()Landroidx/camera/core/ImageProxy;

    move-result-object p0

    .line 376
    .local p0, "rotatedImageProxy":Landroidx/camera/core/ImageProxy;
    if-nez p0, :cond_4

    .line 377
    const-string p2, "YUV rotation acquireLatestImage failure"

    invoke-static {v2, p2}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    return-object v1

    .line 381
    :cond_4
    new-instance p2, Landroidx/camera/core/SingleCloseImageProxy;

    invoke-direct {p2, p0}, Landroidx/camera/core/SingleCloseImageProxy;-><init>(Landroidx/camera/core/ImageProxy;)V

    .line 383
    .local p2, "wrappedRotatedImageProxy":Landroidx/camera/core/SingleCloseImageProxy;
    new-instance p3, Landroidx/camera/core/ImageProcessingUtil$$ExternalSyntheticLambda1;

    invoke-direct {p3, p0, v3}, Landroidx/camera/core/ImageProcessingUtil$$ExternalSyntheticLambda1;-><init>(Landroidx/camera/core/ImageProxy;Landroidx/camera/core/ImageProxy;)V

    invoke-virtual {p2, p3}, Landroidx/camera/core/SingleCloseImageProxy;->addOnImageCloseListener(Landroidx/camera/core/ForwardingImageProxy$OnImageCloseListener;)V

    .line 390
    return-object p2
.end method

.method private static rotateYUVInternal(Landroidx/camera/core/ImageProxy;Landroid/media/ImageWriter;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;I)Landroidx/camera/core/ImageProcessingUtil$Result;
    .locals 23
    .param p0, "imageProxy"    # Landroidx/camera/core/ImageProxy;
    .param p1, "rotatedImageWriter"    # Landroid/media/ImageWriter;
    .param p2, "yRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p3, "uRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p4, "vRotatedBuffer"    # Ljava/nio/ByteBuffer;
    .param p5, "rotationDegrees"    # I

    .line 491
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getWidth()I

    move-result v20

    .line 492
    .local v20, "imageWidth":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getHeight()I

    move-result v21

    .line 493
    .local v21, "imageHeight":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v2

    .line 494
    .local v2, "srcStrideY":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v3, 0x1

    aget-object v0, v0, v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v4

    .line 495
    .local v4, "srcStrideU":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    const/4 v5, 0x2

    aget-object v0, v0, v5

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getRowStride()I

    move-result v6

    .line 496
    .local v6, "srcStrideV":I
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v0

    aget-object v0, v0, v3

    invoke-interface {v0}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getPixelStride()I

    move-result v7

    .line 498
    .local v7, "srcPixelStrideUV":I
    invoke-static/range {p1 .. p1}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->dequeueInputImage(Landroid/media/ImageWriter;)Landroid/media/Image;

    move-result-object v0

    .line 499
    .local v0, "rotatedImage":Landroid/media/Image;
    if-nez v0, :cond_0

    .line 500
    sget-object v1, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v1

    .line 503
    :cond_0
    nop

    .line 504
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v8

    aget-object v8, v8, v1

    invoke-interface {v8}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 506
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v9

    aget-object v9, v9, v3

    invoke-interface {v9}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 508
    invoke-interface/range {p0 .. p0}, Landroidx/camera/core/ImageProxy;->getPlanes()[Landroidx/camera/core/ImageProxy$PlaneProxy;

    move-result-object v10

    aget-object v10, v10, v5

    invoke-interface {v10}, Landroidx/camera/core/ImageProxy$PlaneProxy;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 511
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v11

    aget-object v11, v11, v1

    invoke-virtual {v11}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v11

    .line 512
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v12

    aget-object v12, v12, v1

    invoke-virtual {v12}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v12

    .line 513
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v13

    aget-object v1, v13, v1

    invoke-virtual {v1}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v1

    .line 514
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v13

    aget-object v13, v13, v3

    invoke-virtual {v13}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v13

    .line 515
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v14

    aget-object v14, v14, v3

    invoke-virtual {v14}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v14

    .line 516
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v15

    aget-object v3, v15, v3

    invoke-virtual {v3}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v3

    .line 517
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v15

    aget-object v15, v15, v5

    invoke-virtual {v15}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v15

    .line 518
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v16

    aget-object v16, v16, v5

    invoke-virtual/range {v16 .. v16}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v16

    .line 519
    invoke-virtual {v0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v17

    aget-object v5, v17, v5

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getPixelStride()I

    move-result v5

    .line 503
    move-object/from16 v17, v10

    move v10, v1

    move-object v1, v8

    move-object v8, v11

    move-object v11, v13

    move v13, v3

    move-object v3, v9

    move v9, v12

    move v12, v14

    move-object v14, v15

    move/from16 v15, v16

    move/from16 v16, v5

    move-object/from16 v5, v17

    move-object/from16 v17, p2

    move-object/from16 v18, p3

    move-object/from16 v19, p4

    move/from16 v22, p5

    invoke-static/range {v1 .. v22}, Landroidx/camera/core/ImageProcessingUtil;->nativeRotateYUV(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;IILjava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;III)I

    move-result v1

    .line 527
    .local v1, "result":I
    if-eqz v1, :cond_1

    .line 528
    sget-object v3, Landroidx/camera/core/ImageProcessingUtil$Result;->ERROR_CONVERSION:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v3

    .line 531
    :cond_1
    move-object/from16 v3, p1

    invoke-static {v3, v0}, Landroidx/camera/core/internal/compat/ImageWriterCompat;->queueInputImage(Landroid/media/ImageWriter;Landroid/media/Image;)V

    .line 532
    sget-object v5, Landroidx/camera/core/ImageProcessingUtil$Result;->SUCCESS:Landroidx/camera/core/ImageProcessingUtil$Result;

    return-object v5
.end method

.method public static writeJpegBytesToSurface(Landroid/view/Surface;[B)Z
    .locals 2
    .param p0, "surface"    # Landroid/view/Surface;
    .param p1, "jpegBytes"    # [B

    .line 137
    invoke-static {p1}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    invoke-static {p0}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    invoke-static {p1, p0}, Landroidx/camera/core/ImageProcessingUtil;->nativeWriteJpegToSurface([BLandroid/view/Surface;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    const-string v0, "ImageProcessingUtil"

    const-string v1, "Failed to enqueue JPEG image."

    invoke-static {v0, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    const/4 v0, 0x0

    return v0

    .line 144
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
