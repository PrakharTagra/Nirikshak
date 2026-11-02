.class public Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;
.super Ljava/lang/Object;
.source "VideoTimebaseConverter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "VideoTimebaseConverter"

.field private static final UPTIME_REALTIME_DIFF_THRESHOLD_US:J = 0x2dc6c0L


# instance fields
.field private final mCameraUseInconsistentTimebaseQuirk:Landroidx/camera/video/internal/compat/quirk/CameraUseInconsistentTimebaseQuirk;

.field private final mInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private mResolvedInputTimebase:Landroidx/camera/core/impl/Timebase;

.field private final mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

.field private mUptimeToRealtimeOffsetUs:J


# direct methods
.method public constructor <init>(Landroidx/camera/video/internal/encoder/TimeProvider;Landroidx/camera/core/impl/Timebase;Landroidx/camera/video/internal/compat/quirk/CameraUseInconsistentTimebaseQuirk;)V
    .locals 2
    .param p1, "timeProvider"    # Landroidx/camera/video/internal/encoder/TimeProvider;
    .param p2, "inputTimebase"    # Landroidx/camera/core/impl/Timebase;
    .param p3, "cameraUseInconsistentTimebaseQuirk"    # Landroidx/camera/video/internal/compat/quirk/CameraUseInconsistentTimebaseQuirk;

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    .line 69
    iput-object p1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    .line 70
    iput-object p2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 71
    iput-object p3, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mCameraUseInconsistentTimebaseQuirk:Landroidx/camera/video/internal/compat/quirk/CameraUseInconsistentTimebaseQuirk;

    .line 72
    return-void
.end method

.method private calculateUptimeToRealtimeOffsetUs()J
    .locals 17

    .line 151
    move-object/from16 v0, p0

    const-wide v1, 0x7fffffffffffffffL

    .line 152
    .local v1, "bestGap":J
    const-wide/16 v3, 0x0

    .line 153
    .local v3, "measured":J
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    const/4 v6, 0x3

    if-ge v5, v6, :cond_2

    .line 154
    iget-object v6, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v6}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v6

    .line 155
    .local v6, "uptime1":J
    iget-object v8, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v8}, Landroidx/camera/video/internal/encoder/TimeProvider;->realtimeUs()J

    move-result-wide v8

    .line 156
    .local v8, "realtime":J
    iget-object v10, v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v10}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v10

    .line 157
    .local v10, "uptime2":J
    sub-long v12, v10, v6

    .line 158
    .local v12, "gap":J
    if-eqz v5, :cond_0

    cmp-long v14, v12, v1

    if-gez v14, :cond_1

    .line 159
    :cond_0
    move-wide v1, v12

    .line 160
    add-long v14, v6, v10

    const/16 v16, 0x1

    shr-long v14, v14, v16

    sub-long v3, v8, v14

    .line 153
    .end local v6    # "uptime1":J
    .end local v8    # "realtime":J
    .end local v10    # "uptime2":J
    .end local v12    # "gap":J
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 163
    .end local v5    # "i":I
    :cond_2
    const-wide/16 v5, 0x0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    return-wide v5
.end method

.method private exceedUptimeRealtimeDiffThreshold()Z
    .locals 8

    .line 136
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v0

    .line 137
    .local v0, "uptimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/TimeProvider;->realtimeUs()J

    move-result-wide v2

    .line 138
    .local v2, "realTimeUs":J
    sub-long v4, v2, v0

    const-wide/32 v6, 0x2dc6c0

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4
.end method

.method private isCloseToRealtime(J)Z
    .locals 8
    .param p1, "timeUs"    # J

    .line 142
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v0}, Landroidx/camera/video/internal/encoder/TimeProvider;->uptimeUs()J

    move-result-wide v0

    .line 143
    .local v0, "uptimeUs":J
    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mTimeProvider:Landroidx/camera/video/internal/encoder/TimeProvider;

    invoke-interface {v2}, Landroidx/camera/video/internal/encoder/TimeProvider;->realtimeUs()J

    move-result-wide v2

    .line 144
    .local v2, "realtimeUs":J
    sub-long v4, p1, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    sub-long v6, p1, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    return v4
.end method

.method private resolveInputTimebase(J)Landroidx/camera/core/impl/Timebase;
    .locals 10
    .param p1, "timestampUs"    # J

    .line 100
    const/4 v0, 0x0

    .line 101
    .local v0, "isSystemTimeDiverged":Z
    iget-object v1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mCameraUseInconsistentTimebaseQuirk:Landroidx/camera/video/internal/compat/quirk/CameraUseInconsistentTimebaseQuirk;

    const-string v2, "VideoTimebaseConverter"

    if-eqz v1, :cond_0

    .line 102
    const-string v1, "CameraUseInconsistentTimebaseQuirk is enabled"

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 103
    :cond_0
    invoke-direct {p0}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->exceedUptimeRealtimeDiffThreshold()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 107
    const/4 v0, 0x1

    .line 112
    :goto_0
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->isCloseToRealtime(J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    sget-object v1, Landroidx/camera/core/impl/Timebase;->REALTIME:Landroidx/camera/core/impl/Timebase;

    goto :goto_1

    :cond_1
    sget-object v1, Landroidx/camera/core/impl/Timebase;->UPTIME:Landroidx/camera/core/impl/Timebase;

    :goto_1
    move-object v9, v1

    .line 114
    .local v9, "resolvedTimebase":Landroidx/camera/core/impl/Timebase;
    if-eqz v0, :cond_3

    iget-object v1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    if-eq v9, v1, :cond_3

    .line 115
    const-string v1, ""

    .line 116
    .local v1, "socModelInfo":Ljava/lang/String;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v3, v4, :cond_2

    .line 117
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ", SOC: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Landroid/os/Build;->SOC_MODEL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v7, v1

    goto :goto_2

    .line 116
    :cond_2
    move-object v7, v1

    .line 119
    .end local v1    # "socModelInfo":Ljava/lang/String;
    .local v7, "socModelInfo":Ljava/lang/String;
    :goto_2
    sget-object v3, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sget-object v5, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 127
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v8, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    filled-new-array/range {v3 .. v9}, [Ljava/lang/Object;

    move-result-object v1

    .line 119
    const-string v3, "Detected camera timebase inconsistent. Please file an issue at https://issuetracker.google.com/issues/new?component=618491&template=1257717 with this error message [Manufacturer: %s, Model: %s, Hardware: %s, API Level: %d%s].\nCamera timebase is inconsistent. The timebase reported by the camera is %s, but the actual timebase contained in the frame is detected as %s."

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .end local v7    # "socModelInfo":Ljava/lang/String;
    goto :goto_3

    .line 130
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Detect input timebase = "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    :goto_3
    return-object v9

    .line 109
    .end local v9    # "resolvedTimebase":Landroidx/camera/core/impl/Timebase;
    :cond_4
    iget-object v1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mInputTimebase:Landroidx/camera/core/impl/Timebase;

    return-object v1
.end method


# virtual methods
.method public convertToUptimeUs(J)J
    .locals 4
    .param p1, "timestampUs"    # J

    .line 81
    iget-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mResolvedInputTimebase:Landroidx/camera/core/impl/Timebase;

    if-nez v0, :cond_0

    .line 82
    invoke-direct {p0, p1, p2}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->resolveInputTimebase(J)Landroidx/camera/core/impl/Timebase;

    move-result-object v0

    iput-object v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mResolvedInputTimebase:Landroidx/camera/core/impl/Timebase;

    .line 84
    :cond_0
    sget-object v0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter$1;->$SwitchMap$androidx$camera$core$impl$Timebase:[I

    iget-object v1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mResolvedInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v1}, Landroidx/camera/core/impl/Timebase;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 94
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown timebase: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mResolvedInputTimebase:Landroidx/camera/core/impl/Timebase;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 92
    :pswitch_0
    return-wide p1

    .line 86
    :pswitch_1
    iget-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 87
    invoke-direct {p0}, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->calculateUptimeToRealtimeOffsetUs()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "mUptimeToRealtimeOffsetUs = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "VideoTimebaseConverter"

    invoke-static {v1, v0}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_1
    iget-wide v0, p0, Landroidx/camera/video/internal/workaround/VideoTimebaseConverter;->mUptimeToRealtimeOffsetUs:J

    sub-long v0, p1, v0

    return-wide v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
