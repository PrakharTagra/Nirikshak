.class public abstract Landroidx/camera/video/MediaSpec;
.super Ljava/lang/Object;
.source "MediaSpec.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/video/MediaSpec$Builder;,
        Landroidx/camera/video/MediaSpec$OutputFormat;
    }
.end annotation


# static fields
.field private static final AAC_DEFAULT_PROFILE:I = 0x2

.field private static final AUDIO_ENCODER_MIME_MPEG4_DEFAULT:Ljava/lang/String; = "audio/mp4a-latm"

.field private static final AUDIO_ENCODER_MIME_WEBM_DEFAULT:Ljava/lang/String; = "audio/vorbis"

.field public static final OUTPUT_FORMAT_AUTO:I = -0x1

.field public static final OUTPUT_FORMAT_MPEG_4:I = 0x0

.field public static final OUTPUT_FORMAT_WEBM:I = 0x1

.field private static final VIDEO_ENCODER_MIME_MPEG4_DEFAULT:Ljava/lang/String; = "video/avc"

.field private static final VIDEO_ENCODER_MIME_WEBM_DEFAULT:Ljava/lang/String; = "video/x-vnd.on2.vp8"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    return-void
.end method

.method public static builder()Landroidx/camera/video/MediaSpec$Builder;
    .locals 2

    .line 145
    new-instance v0, Landroidx/camera/video/AutoValue_MediaSpec$Builder;

    invoke-direct {v0}, Landroidx/camera/video/AutoValue_MediaSpec$Builder;-><init>()V

    .line 146
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroidx/camera/video/AutoValue_MediaSpec$Builder;->setOutputFormat(I)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 147
    invoke-static {}, Landroidx/camera/video/AudioSpec;->builder()Landroidx/camera/video/AudioSpec$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/video/AudioSpec$Builder;->build()Landroidx/camera/video/AudioSpec;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setAudioSpec(Landroidx/camera/video/AudioSpec;)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 148
    invoke-static {}, Landroidx/camera/video/VideoSpec;->builder()Landroidx/camera/video/VideoSpec$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/camera/video/VideoSpec$Builder;->build()Landroidx/camera/video/VideoSpec;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/camera/video/MediaSpec$Builder;->setVideoSpec(Landroidx/camera/video/VideoSpec;)Landroidx/camera/video/MediaSpec$Builder;

    move-result-object v0

    .line 145
    return-object v0
.end method

.method public static outputFormatToAudioMime(I)Ljava/lang/String;
    .locals 1
    .param p0, "outputFormat"    # I

    .line 68
    packed-switch p0, :pswitch_data_0

    .line 76
    const-string v0, "audio/mp4a-latm"

    return-object v0

    .line 70
    :pswitch_0
    const-string v0, "audio/vorbis"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static outputFormatToAudioProfile(I)I
    .locals 2
    .param p0, "outputFormat"    # I

    .line 82
    invoke-static {p0}, Landroidx/camera/video/MediaSpec;->outputFormatToAudioMime(I)Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "audioMime":Ljava/lang/String;
    const-string v1, "audio/mp4a-latm"

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 84
    const/4 v1, 0x2

    return v1

    .line 87
    :cond_0
    const/4 v1, -0x1

    return v1
.end method

.method static outputFormatToMuxerFormat(I)I
    .locals 1
    .param p0, "outputFormat"    # I

    .line 106
    packed-switch p0, :pswitch_data_0

    .line 114
    const/4 v0, 0x0

    return v0

    .line 108
    :pswitch_0
    const/4 v0, 0x1

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public static outputFormatToVideoMime(I)Ljava/lang/String;
    .locals 1
    .param p0, "outputFormat"    # I

    .line 93
    packed-switch p0, :pswitch_data_0

    .line 101
    const-string/jumbo v0, "video/avc"

    return-object v0

    .line 95
    :pswitch_0
    const-string/jumbo v0, "video/x-vnd.on2.vp8"

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract getAudioSpec()Landroidx/camera/video/AudioSpec;
.end method

.method public abstract getOutputFormat()I
.end method

.method public abstract getVideoSpec()Landroidx/camera/video/VideoSpec;
.end method

.method public abstract toBuilder()Landroidx/camera/video/MediaSpec$Builder;
.end method
