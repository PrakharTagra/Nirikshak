.class public final Landroidx/camera/video/internal/utils/CodecUtil;
.super Ljava/lang/Object;
.source "CodecUtil.java"


# static fields
.field private static final MAX_CODEC_INFO_CACHE_COUNT:I = 0xa

.field private static final sCodecInfoCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Landroid/media/MediaCodecInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 42
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    sput-object v0, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    return-void
.end method

.method public static createCodec(Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroid/media/MediaCodec;
    .locals 1
    .param p0, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 53
    invoke-interface {p0}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroidx/camera/video/internal/utils/CodecUtil;->createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    return-object v0
.end method

.method private static createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;
    .locals 2
    .param p0, "mimeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 90
    :try_start_0
    invoke-static {p0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 91
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 92
    .local v0, "e":Ljava/lang/Exception;
    :goto_0
    new-instance v1, Landroidx/camera/video/internal/encoder/InvalidConfigException;

    invoke-direct {v1, v0}, Landroidx/camera/video/internal/encoder/InvalidConfigException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public static findCodecAndGetCodecInfo(Landroidx/camera/video/internal/encoder/EncoderConfig;)Landroid/media/MediaCodecInfo;
    .locals 5
    .param p0, "encoderConfig"    # Landroidx/camera/video/internal/encoder/EncoderConfig;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/camera/video/internal/encoder/InvalidConfigException;
        }
    .end annotation

    .line 64
    invoke-interface {p0}, Landroidx/camera/video/internal/encoder/EncoderConfig;->getMimeType()Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "mimeType":Ljava/lang/String;
    sget-object v1, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    monitor-enter v1

    .line 67
    :try_start_0
    sget-object v2, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    invoke-virtual {v2, v0}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/MediaCodecInfo;

    .line 68
    .local v2, "codecInfo":Landroid/media/MediaCodecInfo;
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 69
    if-eqz v2, :cond_0

    .line 70
    return-object v2

    .line 72
    :cond_0
    const/4 v1, 0x0

    .line 74
    .local v1, "codec":Landroid/media/MediaCodec;
    :try_start_1
    invoke-static {v0}, Landroidx/camera/video/internal/utils/CodecUtil;->createCodec(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v3

    move-object v1, v3

    .line 75
    invoke-virtual {v1}, Landroid/media/MediaCodec;->getCodecInfo()Landroid/media/MediaCodecInfo;

    move-result-object v3

    move-object v2, v3

    .line 76
    sget-object v3, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    monitor-enter v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 77
    :try_start_2
    sget-object v4, Landroidx/camera/video/internal/utils/CodecUtil;->sCodecInfoCache:Landroid/util/LruCache;

    invoke-virtual {v4, v0, v2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    nop

    .line 81
    if-eqz v1, :cond_1

    .line 82
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 79
    :cond_1
    return-object v2

    .line 78
    :catchall_0
    move-exception v4

    :try_start_3
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .end local v0    # "mimeType":Ljava/lang/String;
    .end local v1    # "codec":Landroid/media/MediaCodec;
    .end local v2    # "codecInfo":Landroid/media/MediaCodecInfo;
    .end local p0    # "encoderConfig":Landroidx/camera/video/internal/encoder/EncoderConfig;
    :try_start_4
    throw v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 81
    .restart local v0    # "mimeType":Ljava/lang/String;
    .restart local v1    # "codec":Landroid/media/MediaCodec;
    .restart local v2    # "codecInfo":Landroid/media/MediaCodecInfo;
    .restart local p0    # "encoderConfig":Landroidx/camera/video/internal/encoder/EncoderConfig;
    :catchall_1
    move-exception v3

    if-eqz v1, :cond_2

    .line 82
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 84
    :cond_2
    throw v3

    .line 68
    .end local v1    # "codec":Landroid/media/MediaCodec;
    .end local v2    # "codecInfo":Landroid/media/MediaCodecInfo;
    :catchall_2
    move-exception v2

    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v2
.end method
