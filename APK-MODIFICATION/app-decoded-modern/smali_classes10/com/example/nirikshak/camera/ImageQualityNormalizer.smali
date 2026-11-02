.class public final Lcom/example/nirikshak/camera/ImageQualityNormalizer;
.super Ljava/lang/Object;
.source "ImageQualityNormalizer.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/example/nirikshak/camera/ImageQualityNormalizer;",
        "",
        "<init>",
        "()V",
        "normalizeImage",
        "Lcom/example/nirikshak/camera/QualityCheckResult;",
        "context",
        "Landroid/content/Context;",
        "sourceUri",
        "Landroid/net/Uri;",
        "app_debug"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final $stable:I

.field public static final INSTANCE:Lcom/example/nirikshak/camera/ImageQualityNormalizer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/example/nirikshak/camera/ImageQualityNormalizer;

    invoke-direct {v0}, Lcom/example/nirikshak/camera/ImageQualityNormalizer;-><init>()V

    sput-object v0, Lcom/example/nirikshak/camera/ImageQualityNormalizer;->INSTANCE:Lcom/example/nirikshak/camera/ImageQualityNormalizer;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final normalizeImage(Landroid/content/Context;Landroid/net/Uri;)Lcom/example/nirikshak/camera/QualityCheckResult;
    .locals 19
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sourceUri"    # Landroid/net/Uri;

    move-object/from16 v0, p2

    const-string v1, "context"

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sourceUri"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 36
    .local v1, "inputStream":Ljava/io/InputStream;
    const-string v3, ".jpg"

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v4

    const-string v5, "normalized_capture_"

    invoke-static {v5, v3, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v8

    .line 37
    .local v8, "tempFile":Ljava/io/File;
    invoke-virtual {v8}, Ljava/io/File;->deleteOnExit()V

    .line 40
    new-instance v3, Landroidx/exifinterface/media/ExifInterface;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-direct {v3, v4}, Landroidx/exifinterface/media/ExifInterface;-><init>(Ljava/io/InputStream;)V

    .line 41
    .local v3, "exif":Landroidx/exifinterface/media/ExifInterface;
    nop

    .line 42
    nop

    .line 43
    nop

    .line 41
    const-string v4, "Orientation"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroidx/exifinterface/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v4

    .line 47
    .local v4, "orientation":I
    invoke-static {v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v9

    .line 48
    .local v9, "originalBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 51
    new-instance v14, Landroid/graphics/Matrix;

    invoke-direct {v14}, Landroid/graphics/Matrix;-><init>()V

    .line 52
    .local v14, "matrix":Landroid/graphics/Matrix;
    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, -0x40800000    # -1.0f

    packed-switch v4, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 55
    :pswitch_1
    const/high16 v6, 0x43870000    # 270.0f

    invoke-virtual {v14, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    goto :goto_0

    .line 53
    :pswitch_2
    const/high16 v6, 0x42b40000    # 90.0f

    invoke-virtual {v14, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    goto :goto_0

    .line 57
    :pswitch_3
    invoke-virtual {v14, v6, v7}, Landroid/graphics/Matrix;->postScale(FF)Z

    goto :goto_0

    .line 54
    :pswitch_4
    const/high16 v6, 0x43340000    # 180.0f

    invoke-virtual {v14, v6}, Landroid/graphics/Matrix;->postRotate(F)Z

    goto :goto_0

    .line 56
    :pswitch_5
    invoke-virtual {v14, v7, v6}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 61
    :goto_0
    nop

    .line 62
    nop

    .line 63
    nop

    .line 64
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    .line 65
    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v13

    .line 66
    nop

    .line 67
    nop

    .line 60
    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v15, 0x1

    invoke-static/range {v9 .. v15}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object v6

    move-object v13, v9

    .end local v9    # "originalBitmap":Landroid/graphics/Bitmap;
    .local v13, "originalBitmap":Landroid/graphics/Bitmap;
    const-string v7, "createBitmap(...)"

    invoke-static {v6, v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v15, v6

    .line 70
    .local v15, "uprightBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 71
    .local v6, "currentLongest":I
    move-object v7, v15

    .line 74
    .local v7, "finalBitmap":Landroid/graphics/Bitmap;
    const/16 v9, 0xfa0

    if-le v6, v9, :cond_0

    .line 75
    const/high16 v9, 0x457a0000    # 4000.0f

    int-to-float v10, v6

    div-float/2addr v9, v10

    .line 76
    .local v9, "scaleFactor":F
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    int-to-float v10, v10

    mul-float/2addr v10, v9

    float-to-int v10, v10

    .line 77
    .local v10, "targetW":I
    invoke-virtual {v15}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    int-to-float v11, v11

    mul-float/2addr v11, v9

    float-to-int v11, v11

    .line 78
    .local v11, "targetH":I
    invoke-static {v15, v10, v11, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v12

    const-string v5, "createScaledBitmap(...)"

    invoke-static {v12, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v7, v12

    move-object v5, v7

    goto :goto_1

    .line 74
    .end local v9    # "scaleFactor":F
    .end local v10    # "targetW":I
    .end local v11    # "targetH":I
    :cond_0
    move-object v5, v7

    .line 82
    .end local v7    # "finalBitmap":Landroid/graphics/Bitmap;
    .local v5, "finalBitmap":Landroid/graphics/Bitmap;
    :goto_1
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v17, v7

    .line 83
    .local v17, "outputStream":Ljava/io/FileOutputStream;
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v9, 0x5f

    move-object/from16 v10, v17

    check-cast v10, Ljava/io/OutputStream;

    invoke-virtual {v5, v7, v9, v10}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 84
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileOutputStream;->flush()V

    .line 85
    invoke-virtual/range {v17 .. v17}, Ljava/io/FileOutputStream;->close()V

    .line 87
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v11

    .line 88
    .local v11, "longest":I
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    invoke-static {v7, v9}, Ljava/lang/Math;->min(II)I

    move-result v18

    .line 90
    .local v18, "shortest":I
    const/16 v7, 0x780

    if-lt v11, v7, :cond_1

    const/4 v7, 0x1

    goto :goto_2

    :cond_1
    const/4 v7, 0x0

    .line 91
    .local v7, "isResolutionSufficient":Z
    :goto_2
    const-string v9, "x"

    if-eqz v7, :cond_2

    .line 92
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    move-object/from16 v16, v1

    .end local v1    # "inputStream":Ljava/io/InputStream;
    .local v16, "inputStream":Ljava/io/InputStream;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Optimal OCR resolution ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") \u2022 Full frame uncropped"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v12, v1

    goto :goto_3

    .line 94
    .end local v16    # "inputStream":Ljava/io/InputStream;
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    :cond_2
    move-object/from16 v16, v1

    .end local v1    # "inputStream":Ljava/io/InputStream;
    .restart local v16    # "inputStream":Ljava/io/InputStream;
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Low resolution warning ("

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "). Please hold closer."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v12, v1

    .line 91
    :goto_3
    nop

    .line 97
    .local v12, "message":Ljava/lang/String;
    move v1, v6

    .end local v6    # "currentLongest":I
    .local v1, "currentLongest":I
    new-instance v6, Lcom/example/nirikshak/camera/QualityCheckResult;

    .line 98
    nop

    .line 99
    invoke-static {v8}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 100
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    .line 101
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    .line 102
    nop

    .line 103
    nop

    .line 97
    invoke-direct/range {v6 .. v12}, Lcom/example/nirikshak/camera/QualityCheckResult;-><init>(ZLjava/io/File;IIILjava/lang/String;)V

    return-object v6

    .line 34
    .end local v1    # "currentLongest":I
    .end local v3    # "exif":Landroidx/exifinterface/media/ExifInterface;
    .end local v4    # "orientation":I
    .end local v5    # "finalBitmap":Landroid/graphics/Bitmap;
    .end local v7    # "isResolutionSufficient":Z
    .end local v8    # "tempFile":Ljava/io/File;
    .end local v11    # "longest":I
    .end local v12    # "message":Ljava/lang/String;
    .end local v13    # "originalBitmap":Landroid/graphics/Bitmap;
    .end local v14    # "matrix":Landroid/graphics/Matrix;
    .end local v15    # "uprightBitmap":Landroid/graphics/Bitmap;
    .end local v16    # "inputStream":Ljava/io/InputStream;
    .end local v17    # "outputStream":Ljava/io/FileOutputStream;
    .end local v18    # "shortest":I
    :cond_3
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cannot open stream for URI: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
