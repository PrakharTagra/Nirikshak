.class public final Landroidx/camera/video/internal/compat/Api23Impl;
.super Ljava/lang/Object;
.source "Api23Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method public static build(Landroid/media/AudioRecord$Builder;)Landroid/media/AudioRecord;
    .locals 1
    .param p0, "audioRecordBuilder"    # Landroid/media/AudioRecord$Builder;

    .line 76
    invoke-virtual {p0}, Landroid/media/AudioRecord$Builder;->build()Landroid/media/AudioRecord;

    move-result-object v0

    return-object v0
.end method

.method public static createAudioRecordBuilder()Landroid/media/AudioRecord$Builder;
    .locals 1

    .line 39
    new-instance v0, Landroid/media/AudioRecord$Builder;

    invoke-direct {v0}, Landroid/media/AudioRecord$Builder;-><init>()V

    return-object v0
.end method

.method public static setAudioFormat(Landroid/media/AudioRecord$Builder;Landroid/media/AudioFormat;)V
    .locals 0
    .param p0, "audioRecordBuilder"    # Landroid/media/AudioRecord$Builder;
    .param p1, "audioFormat"    # Landroid/media/AudioFormat;

    .line 57
    invoke-virtual {p0, p1}, Landroid/media/AudioRecord$Builder;->setAudioFormat(Landroid/media/AudioFormat;)Landroid/media/AudioRecord$Builder;

    .line 58
    return-void
.end method

.method public static setAudioSource(Landroid/media/AudioRecord$Builder;I)V
    .locals 0
    .param p0, "audioRecordBuilder"    # Landroid/media/AudioRecord$Builder;
    .param p1, "audioSource"    # I

    .line 48
    invoke-virtual {p0, p1}, Landroid/media/AudioRecord$Builder;->setAudioSource(I)Landroid/media/AudioRecord$Builder;

    .line 49
    return-void
.end method

.method public static setBufferSizeInBytes(Landroid/media/AudioRecord$Builder;I)V
    .locals 0
    .param p0, "audioRecordBuilder"    # Landroid/media/AudioRecord$Builder;
    .param p1, "bufferSizeInBytes"    # I

    .line 66
    invoke-virtual {p0, p1}, Landroid/media/AudioRecord$Builder;->setBufferSizeInBytes(I)Landroid/media/AudioRecord$Builder;

    .line 67
    return-void
.end method
