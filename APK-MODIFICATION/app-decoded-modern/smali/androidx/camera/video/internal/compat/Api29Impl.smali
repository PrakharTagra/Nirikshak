.class public final Landroidx/camera/video/internal/compat/Api29Impl;
.super Ljava/lang/Object;
.source "Api29Impl.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static getActiveRecordingConfiguration(Landroid/media/AudioRecord;)Landroid/media/AudioRecordingConfiguration;
    .locals 1
    .param p0, "audioRecord"    # Landroid/media/AudioRecord;

    .line 47
    invoke-virtual {p0}, Landroid/media/AudioRecord;->getActiveRecordingConfiguration()Landroid/media/AudioRecordingConfiguration;

    move-result-object v0

    return-object v0
.end method

.method public static isClientSilenced(Landroid/media/AudioRecordingConfiguration;)Z
    .locals 1
    .param p0, "configuration"    # Landroid/media/AudioRecordingConfiguration;

    .line 73
    invoke-virtual {p0}, Landroid/media/AudioRecordingConfiguration;->isClientSilenced()Z

    move-result v0

    return v0
.end method

.method public static registerAudioRecordingCallback(Landroid/media/AudioRecord;Ljava/util/concurrent/Executor;Landroid/media/AudioManager$AudioRecordingCallback;)V
    .locals 0
    .param p0, "audioRecord"    # Landroid/media/AudioRecord;
    .param p1, "executor"    # Ljava/util/concurrent/Executor;
    .param p2, "callback"    # Landroid/media/AudioManager$AudioRecordingCallback;

    .line 57
    invoke-virtual {p0, p1, p2}, Landroid/media/AudioRecord;->registerAudioRecordingCallback(Ljava/util/concurrent/Executor;Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 58
    return-void
.end method

.method public static unregisterAudioRecordingCallback(Landroid/media/AudioRecord;Landroid/media/AudioManager$AudioRecordingCallback;)V
    .locals 0
    .param p0, "audioRecord"    # Landroid/media/AudioRecord;
    .param p1, "callback"    # Landroid/media/AudioManager$AudioRecordingCallback;

    .line 66
    invoke-virtual {p0, p1}, Landroid/media/AudioRecord;->unregisterAudioRecordingCallback(Landroid/media/AudioManager$AudioRecordingCallback;)V

    .line 67
    return-void
.end method
