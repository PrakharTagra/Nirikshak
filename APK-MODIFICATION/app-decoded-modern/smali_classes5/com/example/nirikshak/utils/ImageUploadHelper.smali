.class public final Lcom/example/nirikshak/utils/ImageUploadHelper;
.super Ljava/lang/Object;
.source "ImageUploadHelper.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nImageUploadHelper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ImageUploadHelper.kt\ncom/example/nirikshak/utils/ImageUploadHelper\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,91:1\n1924#2,3:92\n*S KotlinDebug\n*F\n+ 1 ImageUploadHelper.kt\ncom/example/nirikshak/utils/ImageUploadHelper\n*L\n29#1:92,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\"\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\u00082\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0005J\"\u0010\u000b\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\u000c\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000eH\u0002J\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012\u00a8\u0006\u0013"
    }
    d2 = {
        "Lcom/example/nirikshak/utils/ImageUploadHelper;",
        "",
        "<init>",
        "()V",
        "prepareImageParts",
        "",
        "Lokhttp3/MultipartBody$Part;",
        "context",
        "Landroid/content/Context;",
        "items",
        "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
        "createMultipartPart",
        "item",
        "index",
        "",
        "createTextRequestBody",
        "Lokhttp3/RequestBody;",
        "text",
        "",
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

.field public static final INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/example/nirikshak/utils/ImageUploadHelper;

    invoke-direct {v0}, Lcom/example/nirikshak/utils/ImageUploadHelper;-><init>()V

    sput-object v0, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final createMultipartPart(Landroid/content/Context;Lcom/example/nirikshak/ui/scan/ScannedImageItem;I)Lokhttp3/MultipartBody$Part;
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "item"    # Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .param p3, "index"    # I

    .line 48
    add-int/lit8 v0, p3, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "inspection_sample_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, "_"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 51
    .local v1, "fileName":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->getImageUri()Landroid/net/Uri;

    move-result-object v2

    .line 52
    .local v2, "uri":Landroid/net/Uri;
    const-string v0, "images"

    const-string v3, "image/jpeg"

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, "file"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 53
    new-instance v4, Ljava/io/File;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_0

    const-string v5, ""

    :cond_0
    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 54
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 55
    sget-object v5, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    sget-object v6, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    invoke-virtual {v6, v3}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v3

    invoke-virtual {v5, v4, v3}, Lokhttp3/RequestBody$Companion;->create(Ljava/io/File;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object v3

    .line 56
    .local v3, "requestFile":Lokhttp3/RequestBody;
    sget-object v5, Lokhttp3/MultipartBody$Part;->Companion:Lokhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v5, v0, v1, v3}, Lokhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/MultipartBody$Part;

    move-result-object v0

    return-object v0

    .line 61
    .end local v3    # "requestFile":Lokhttp3/RequestBody;
    .end local v4    # "file":Ljava/io/File;
    :cond_1
    const/4 v4, 0x0

    if-eqz v2, :cond_2

    .line 62
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v5

    if-eqz v5, :cond_2

    check-cast v5, Ljava/io/Closeable;

    :try_start_0
    move-object v6, v5

    check-cast v6, Ljava/io/InputStream;

    .local v6, "inputStream\\1":Ljava/io/InputStream;
    const/4 v7, 0x0

    .line 63
    .local v7, "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    new-instance v8, Ljava/io/File;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    .local v8, "tempFile\\1":Ljava/io/File;
    new-instance v9, Ljava/io/FileOutputStream;

    invoke-direct {v9, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    check-cast v9, Ljava/io/Closeable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    move-object v10, v9

    check-cast v10, Ljava/io/FileOutputStream;

    .local v10, "outputStream\\2":Ljava/io/FileOutputStream;
    const/4 v11, 0x0

    .line 65
    .local v11, "$i$a$-use-ImageUploadHelper$createMultipartPart$1$1\\2\\64\\1":I
    move-object v12, v10

    check-cast v12, Ljava/io/OutputStream;

    const/4 v13, 0x0

    const/4 v14, 0x2

    invoke-static {v6, v12, v13, v14, v4}, Lkotlin/io/ByteStreamsKt;->copyTo$default(Ljava/io/InputStream;Ljava/io/OutputStream;IILjava/lang/Object;)J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .end local v10    # "outputStream\\2":Ljava/io/FileOutputStream;
    .end local v11    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1$1\\2\\64\\1":I
    :try_start_2
    invoke-static {v9, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 67
    sget-object v9, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    sget-object v10, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    invoke-virtual {v10, v3}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v3

    invoke-virtual {v9, v8, v3}, Lokhttp3/RequestBody$Companion;->create(Ljava/io/File;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object v3

    .line 68
    .local v3, "requestFile\\1":Lokhttp3/RequestBody;
    sget-object v9, Lokhttp3/MultipartBody$Part;->Companion:Lokhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v9, v0, v1, v3}, Lokhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/MultipartBody$Part;

    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 62
    .end local v3    # "requestFile\\1":Lokhttp3/RequestBody;
    .end local v6    # "inputStream\\1":Ljava/io/InputStream;
    .end local v7    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    .end local v8    # "tempFile\\1":Ljava/io/File;
    invoke-static {v5, v4}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    return-object v0

    .line 64
    .restart local v6    # "inputStream\\1":Ljava/io/InputStream;
    .restart local v7    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    .restart local v8    # "tempFile\\1":Ljava/io/File;
    :catchall_0
    move-exception v0

    move-object v3, v0

    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "uri":Landroid/net/Uri;
    .end local v6    # "inputStream\\1":Ljava/io/InputStream;
    .end local v7    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    .end local v8    # "tempFile\\1":Ljava/io/File;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .end local p3    # "index":I
    :try_start_3
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v1    # "fileName":Ljava/lang/String;
    .restart local v2    # "uri":Landroid/net/Uri;
    .restart local v6    # "inputStream\\1":Ljava/io/InputStream;
    .restart local v7    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    .restart local v8    # "tempFile\\1":Ljava/io/File;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .restart local p3    # "index":I
    :catchall_1
    move-exception v0

    :try_start_4
    invoke-static {v9, v3}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "uri":Landroid/net/Uri;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .end local p3    # "index":I
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 62
    .end local v6    # "inputStream\\1":Ljava/io/InputStream;
    .end local v7    # "$i$a$-use-ImageUploadHelper$createMultipartPart$1\\1\\62\\0":I
    .end local v8    # "tempFile\\1":Ljava/io/File;
    .restart local v1    # "fileName":Ljava/lang/String;
    .restart local v2    # "uri":Landroid/net/Uri;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .restart local p3    # "index":I
    :catchall_2
    move-exception v0

    move-object v3, v0

    .end local v1    # "fileName":Ljava/lang/String;
    .end local v2    # "uri":Landroid/net/Uri;
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .end local p3    # "index":I
    :try_start_5
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .restart local v1    # "fileName":Ljava/lang/String;
    .restart local v2    # "uri":Landroid/net/Uri;
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "item":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .restart local p3    # "index":I
    :catchall_3
    move-exception v0

    invoke-static {v5, v3}, Lkotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    .line 73
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 74
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 75
    .local v4, "bos":Ljava/io/ByteArrayOutputStream;
    invoke-virtual/range {p2 .. p2}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v5

    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x5a

    move-object v8, v4

    check-cast v8, Ljava/io/OutputStream;

    invoke-virtual {v5, v6, v7, v8}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 76
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    .line 77
    .local v10, "bytes":[B
    sget-object v9, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    invoke-static {v10}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    sget-object v5, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    invoke-virtual {v5, v3}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v11

    const/4 v14, 0x6

    const/4 v15, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v15}, Lokhttp3/RequestBody$Companion;->create$default(Lokhttp3/RequestBody$Companion;[BLokhttp3/MediaType;IIILjava/lang/Object;)Lokhttp3/RequestBody;

    move-result-object v3

    .line 78
    .local v3, "requestBody":Lokhttp3/RequestBody;
    sget-object v5, Lokhttp3/MultipartBody$Part;->Companion:Lokhttp3/MultipartBody$Part$Companion;

    invoke-virtual {v5, v0, v1, v3}, Lokhttp3/MultipartBody$Part$Companion;->createFormData(Ljava/lang/String;Ljava/lang/String;Lokhttp3/RequestBody;)Lokhttp3/MultipartBody$Part;

    move-result-object v0

    return-object v0

    .line 81
    .end local v3    # "requestBody":Lokhttp3/RequestBody;
    .end local v4    # "bos":Ljava/io/ByteArrayOutputStream;
    .end local v10    # "bytes":[B
    :cond_3
    return-object v4
.end method


# virtual methods
.method public final createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    const-string v0, "text"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 88
    sget-object v0, Lokhttp3/RequestBody;->Companion:Lokhttp3/RequestBody$Companion;

    sget-object v1, Lokhttp3/MediaType;->Companion:Lokhttp3/MediaType$Companion;

    const-string v2, "text/plain"

    invoke-virtual {v1, v2}, Lokhttp3/MediaType$Companion;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lokhttp3/RequestBody$Companion;->create(Ljava/lang/String;Lokhttp3/MediaType;)Lokhttp3/RequestBody;

    move-result-object v0

    return-object v0
.end method

.method public final prepareImageParts(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "items"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;)",
            "Ljava/util/List<",
            "Lokhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "items"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    .line 29
    .local v0, "parts":Ljava/util/List;
    move-object v1, p2

    check-cast v1, Ljava/lang/Iterable;

    .local v1, "$this$forEachIndexed\\1":Ljava/lang/Iterable;
    const/4 v2, 0x0

    .line 92
    .local v2, "$i$f$forEachIndexed\\1\\29":I
    const/4 v3, 0x0

    .line 93
    .local v3, "index\\1":I
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "item\\1":Ljava/lang/Object;
    add-int/lit8 v6, v3, 0x1

    .end local v3    # "index\\1":I
    .local v6, "index\\1":I
    if-gez v3, :cond_0

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_0
    move-object v7, v5

    check-cast v7, Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    .local v3, "index\\2":I
    .local v7, "item\\2":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    const/4 v8, 0x0

    .line 30
    .local v8, "$i$a$-forEachIndexed-ImageUploadHelper$prepareImageParts$1\\2\\93\\0":I
    nop

    .line 31
    :try_start_0
    sget-object v9, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    invoke-direct {v9, p1, v7, v3}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createMultipartPart(Landroid/content/Context;Lcom/example/nirikshak/ui/scan/ScannedImageItem;I)Lokhttp3/MultipartBody$Part;

    move-result-object v9

    .line 32
    .local v9, "part\\2":Lokhttp3/MultipartBody$Part;
    if-eqz v9, :cond_1

    .line 33
    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 35
    .end local v9    # "part\\2":Lokhttp3/MultipartBody$Part;
    :catch_0
    move-exception v9

    .line 36
    .local v9, "e\\2":Ljava/lang/Exception;
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 38
    .end local v9    # "e\\2":Ljava/lang/Exception;
    :cond_1
    :goto_1
    nop

    .line 93
    .end local v3    # "index\\2":I
    .end local v7    # "item\\2":Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .end local v8    # "$i$a$-forEachIndexed-ImageUploadHelper$prepareImageParts$1\\2\\93\\0":I
    move v3, v6

    .end local v5    # "item\\1":Ljava/lang/Object;
    goto :goto_0

    .line 94
    .end local v6    # "index\\1":I
    .local v3, "index\\1":I
    :cond_2
    nop

    .line 40
    .end local v1    # "$this$forEachIndexed\\1":Ljava/lang/Iterable;
    .end local v2    # "$i$f$forEachIndexed\\1\\29":I
    .end local v3    # "index\\1":I
    return-object v0
.end method
