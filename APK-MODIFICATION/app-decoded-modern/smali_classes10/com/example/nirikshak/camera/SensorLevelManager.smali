.class public final Lcom/example/nirikshak/camera/SensorLevelManager;
.super Ljava/lang/Object;
.source "SensorLevelManager.kt"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nSensorLevelManager.kt\nKotlin\n*S Kotlin\n*F\n+ 1 SensorLevelManager.kt\ncom/example/nirikshak/camera/SensorLevelManager\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,150:1\n1586#2:151\n1661#2,3:152\n1586#2:155\n1661#2,3:156\n1586#2:159\n1661#2,3:160\n1586#2:163\n1661#2,3:164\n*S KotlinDebug\n*F\n+ 1 SensorLevelManager.kt\ncom/example/nirikshak/camera/SensorLevelManager\n*L\n80#1:151\n80#1:152,3\n82#1:155\n82#1:156,3\n111#1:159\n111#1:160,3\n113#1:163\n113#1:164,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0002\u0010\u0007\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001a\u0010\u0014\u001a\u00020\u000e2\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e0\u000cJ\u0006\u0010\u0016\u001a\u00020\u000eJ\u0012\u0010\u0017\u001a\u00020\u000e2\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0016J \u0010\u001a\u001a\u00020\u000e2\u0006\u0010\u001b\u001a\u00020\u00132\u0006\u0010\u001c\u001a\u00020\u00132\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J\u001a\u0010\u001f\u001a\u00020\u000e2\u0008\u0010 \u001a\u0004\u0018\u00010\t2\u0006\u0010!\u001a\u00020\"H\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0008\u001a\u0004\u0018\u00010\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e\u0018\u00010\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R \u0010\u000f\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u00110\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006#"
    }
    d2 = {
        "Lcom/example/nirikshak/camera/SensorLevelManager;",
        "Landroid/hardware/SensorEventListener;",
        "context",
        "Landroid/content/Context;",
        "<init>",
        "(Landroid/content/Context;)V",
        "sensorManager",
        "Landroid/hardware/SensorManager;",
        "rotationVectorSensor",
        "Landroid/hardware/Sensor;",
        "accelerometerSensor",
        "onStateChanged",
        "Lkotlin/Function1;",
        "Lcom/example/nirikshak/camera/LevelSensorState;",
        "",
        "motionHistory",
        "",
        "Lkotlin/Pair;",
        "",
        "",
        "startListening",
        "onUpdate",
        "stopListening",
        "onSensorChanged",
        "event",
        "Landroid/hardware/SensorEvent;",
        "publishState",
        "pitch",
        "roll",
        "isUnstable",
        "",
        "onAccuracyChanged",
        "sensor",
        "accuracy",
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


# instance fields
.field private final accelerometerSensor:Landroid/hardware/Sensor;

.field private final motionHistory:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lkotlin/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field private onStateChanged:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/example/nirikshak/camera/LevelSensorState;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private final rotationVectorSensor:Landroid/hardware/Sensor;

.field private final sensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public static synthetic $r8$lambda$7LZ69DC7aLenuiHK44CwiVWDqMg(JLkotlin/Pair;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/example/nirikshak/camera/SensorLevelManager;->onSensorChanged$lambda$0$0(JLkotlin/Pair;)Z

    move-result p0

    return p0
.end method

.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/example/nirikshak/camera/SensorLevelManager;->$stable:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.hardware.SensorManager"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    .line 32
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->rotationVectorSensor:Landroid/hardware/Sensor;

    .line 33
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->accelerometerSensor:Landroid/hardware/Sensor;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    check-cast v0, Ljava/util/List;

    iput-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    .line 29
    return-void
.end method

.method private static final onSensorChanged$lambda$0$0(JLkotlin/Pair;)Z
    .locals 4
    .param p0, "$currentTime"    # J
    .param p2, "it"    # Lkotlin/Pair;

    const-string v0, "it"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 77
    invoke-virtual {p2}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    sub-long v0, p0, v0

    const-wide/16 v2, 0x12c

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private final publishState(FFZ)V
    .locals 13
    .param p1, "pitch"    # F
    .param p2, "roll"    # F
    .param p3, "isUnstable"    # Z

    .line 123
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    .line 124
    .local v0, "absPitch":F
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    .line 127
    .local v1, "absRoll":F
    const/high16 v2, 0x40200000    # 2.5f

    cmpg-float v3, v0, v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-gtz v3, :cond_0

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_0

    move v2, v4

    goto :goto_0

    :cond_0
    move v2, v5

    :goto_0
    move v9, v2

    .line 129
    .local v9, "isLevel":Z
    const/high16 v2, 0x40a00000    # 5.0f

    cmpl-float v3, v0, v2

    if-gtz v3, :cond_2

    cmpl-float v2, v1, v2

    if-lez v2, :cond_1

    goto :goto_1

    :cond_1
    move v10, v5

    goto :goto_2

    :cond_2
    :goto_1
    move v10, v4

    .line 131
    .local v10, "isSeverelyTilted":Z
    :goto_2
    nop

    .line 132
    if-eqz v9, :cond_3

    sget-object v2, Lcom/example/nirikshak/camera/TiltDirection;->NONE:Lcom/example/nirikshak/camera/TiltDirection;

    move-object v12, v2

    goto :goto_5

    .line 133
    :cond_3
    cmpl-float v2, v0, v1

    const/4 v3, 0x0

    if-lez v2, :cond_5

    cmpl-float v2, p1, v3

    if-lez v2, :cond_4

    sget-object v2, Lcom/example/nirikshak/camera/TiltDirection;->TILT_BACKWARD:Lcom/example/nirikshak/camera/TiltDirection;

    goto :goto_3

    :cond_4
    sget-object v2, Lcom/example/nirikshak/camera/TiltDirection;->TILT_FORWARD:Lcom/example/nirikshak/camera/TiltDirection;

    :goto_3
    move-object v12, v2

    goto :goto_5

    .line 134
    :cond_5
    cmpl-float v2, p2, v3

    if-lez v2, :cond_6

    sget-object v2, Lcom/example/nirikshak/camera/TiltDirection;->TILT_RIGHT:Lcom/example/nirikshak/camera/TiltDirection;

    goto :goto_4

    :cond_6
    sget-object v2, Lcom/example/nirikshak/camera/TiltDirection;->TILT_LEFT:Lcom/example/nirikshak/camera/TiltDirection;

    :goto_4
    move-object v12, v2

    .line 131
    :goto_5
    nop

    .line 137
    .local v12, "tiltDirection":Lcom/example/nirikshak/camera/TiltDirection;
    new-instance v6, Lcom/example/nirikshak/camera/LevelSensorState;

    .line 138
    nop

    .line 139
    nop

    .line 140
    nop

    .line 141
    nop

    .line 142
    nop

    .line 143
    nop

    .line 137
    move v7, p1

    move v8, p2

    move/from16 v11, p3

    invoke-direct/range {v6 .. v12}, Lcom/example/nirikshak/camera/LevelSensorState;-><init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;)V

    .line 145
    .local v6, "state":Lcom/example/nirikshak/camera/LevelSensorState;
    iget-object v2, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->onStateChanged:Lkotlin/jvm/functions/Function1;

    if-eqz v2, :cond_7

    invoke-interface {v2, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    :cond_7
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .param p1, "sensor"    # Landroid/hardware/Sensor;
    .param p2, "accuracy"    # I

    .line 148
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 33
    .param p1, "event"    # Landroid/hardware/SensorEvent;

    .line 62
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    if-nez v2, :cond_0

    return-void

    .line 64
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 67
    .local v3, "currentTime":J
    iget-object v0, v2, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v7, 0x2

    const/4 v8, 0x3

    const/4 v9, 0x0

    const/16 v10, 0xa

    const/4 v11, 0x1

    if-ne v0, v11, :cond_5

    .line 68
    iget-object v0, v2, Landroid/hardware/SensorEvent;->values:[F

    aget v12, v0, v9

    .line 69
    .local v12, "x":F
    iget-object v0, v2, Landroid/hardware/SensorEvent;->values:[F

    aget v13, v0, v11

    .line 70
    .local v13, "y":F
    iget-object v0, v2, Landroid/hardware/SensorEvent;->values:[F

    aget v14, v0, v7

    .line 71
    .local v14, "z":F
    mul-float v0, v12, v12

    mul-float v15, v13, v13

    add-float/2addr v0, v15

    mul-float v15, v14, v14

    add-float/2addr v0, v15

    const-wide v15, 0x3fd6666666666666L    # 0.35

    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-float v5, v5

    .line 73
    .local v5, "magnitude":F
    const/4 v6, 0x0

    .line 74
    .local v6, "isUnstable":Z
    move v0, v7

    iget-object v7, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    monitor-enter v7

    const/16 v17, 0x0

    .line 75
    .local v17, "$i$a$-synchronized-SensorLevelManager$onSensorChanged$1\\1\\74\\0":I
    move/from16 v18, v0

    :try_start_0
    iget-object v0, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    new-instance v9, Lkotlin/Pair;

    move/from16 v20, v11

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-wide/from16 v21, v15

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v15

    invoke-direct {v9, v11, v15}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    iget-object v0, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    new-instance v9, Lcom/example/nirikshak/camera/SensorLevelManager$$ExternalSyntheticLambda0;

    invoke-direct {v9, v3, v4}, Lcom/example/nirikshak/camera/SensorLevelManager$$ExternalSyntheticLambda0;-><init>(J)V

    invoke-static {v0, v9}, Lkotlin/collections/CollectionsKt;->removeAll(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Z

    .line 79
    iget-object v0, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt v0, v8, :cond_4

    .line 80
    iget-object v0, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map\\2":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 151
    .local v9, "$i$f$map\\2\\80":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-static {v0, v10}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v11, v15}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination\\3":Ljava/util/Collection;
    move-object v15, v0

    .local v15, "$this$mapTo\\3":Ljava/lang/Iterable;
    const/16 v16, 0x0

    .line 152
    .local v16, "$i$f$mapTo\\3\\151":I
    invoke-interface {v15}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_0
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v24
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v24, :cond_1

    :try_start_1
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v24

    .line 153
    .local v24, "item\\3":Ljava/lang/Object;
    move-object/from16 v25, v24

    check-cast v25, Lkotlin/Pair;

    .local v25, "it\\4":Lkotlin/Pair;
    const/16 v26, 0x0

    .line 80
    .local v26, "$i$a$-map-SensorLevelManager$onSensorChanged$1$magnitudes$1\\4\\153\\1":I
    invoke-virtual/range {v25 .. v25}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Ljava/lang/Number;

    invoke-virtual/range {v27 .. v27}, Ljava/lang/Number;->floatValue()F

    move-result v27

    .end local v25    # "it\\4":Lkotlin/Pair;
    .end local v26    # "$i$a$-map-SensorLevelManager$onSensorChanged$1$magnitudes$1\\4\\153\\1":I
    invoke-static/range {v27 .. v27}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    .line 153
    invoke-interface {v11, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v8, 0x3

    goto :goto_0

    .line 74
    .end local v0    # "$this$map\\2":Ljava/lang/Iterable;
    .end local v9    # "$i$f$map\\2\\80":I
    .end local v11    # "destination\\3":Ljava/util/Collection;
    .end local v15    # "$this$mapTo\\3":Ljava/lang/Iterable;
    .end local v16    # "$i$f$mapTo\\3\\151":I
    .end local v17    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$1\\1\\74\\0":I
    .end local v24    # "item\\3":Ljava/lang/Object;
    :catchall_0
    move-exception v0

    move-wide/from16 v23, v3

    goto/16 :goto_4

    .line 154
    .restart local v0    # "$this$map\\2":Ljava/lang/Iterable;
    .restart local v9    # "$i$f$map\\2\\80":I
    .restart local v11    # "destination\\3":Ljava/util/Collection;
    .restart local v15    # "$this$mapTo\\3":Ljava/lang/Iterable;
    .restart local v16    # "$i$f$mapTo\\3\\151":I
    .restart local v17    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$1\\1\\74\\0":I
    :cond_1
    nop

    .end local v11    # "destination\\3":Ljava/util/Collection;
    .end local v15    # "$this$mapTo\\3":Ljava/lang/Iterable;
    .end local v16    # "$i$f$mapTo\\3\\151":I
    :try_start_2
    move-object v8, v11

    check-cast v8, Ljava/util/List;

    .line 151
    nop

    .line 80
    .end local v0    # "$this$map\\2":Ljava/lang/Iterable;
    .end local v9    # "$i$f$map\\2\\80":I
    nop

    .line 81
    .local v8, "magnitudes\\1":Ljava/util/List;
    move-object v0, v8

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->averageOfFloat(Ljava/lang/Iterable;)D

    move-result-wide v15

    .line 82
    .local v15, "mean\\1":D
    move-object v0, v8

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$map\\5":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 155
    .local v9, "$i$f$map\\5\\82":I
    new-instance v11, Ljava/util/ArrayList;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-wide/from16 v23, v3

    .end local v3    # "currentTime":J
    .local v23, "currentTime":J
    :try_start_3
    invoke-static {v0, v10}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v11, v3}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination\\6":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$mapTo\\6":Ljava/lang/Iterable;
    const/4 v4, 0x0

    .line 156
    .local v4, "$i$f$mapTo\\6\\155":I
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :goto_1
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v27

    if-eqz v27, :cond_2

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    .line 157
    .local v27, "item\\6":Ljava/lang/Object;
    move-object/from16 v28, v27

    check-cast v28, Ljava/lang/Number;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/Number;->floatValue()F

    move-result v28

    move/from16 v29, v28

    .local v29, "it\\7":F
    const/16 v28, 0x0

    .line 82
    .local v28, "$i$a$-map-SensorLevelManager$onSensorChanged$1$variance$1\\7\\157\\1":I
    move/from16 v30, v4

    move/from16 v10, v29

    move-object/from16 v29, v3

    .end local v3    # "$this$mapTo\\6":Ljava/lang/Iterable;
    .end local v4    # "$i$f$mapTo\\6\\155":I
    .local v10, "it\\7":F
    .local v29, "$this$mapTo\\6":Ljava/lang/Iterable;
    .local v30, "$i$f$mapTo\\6\\155":I
    float-to-double v3, v10

    sub-double/2addr v3, v15

    move-wide/from16 v31, v3

    float-to-double v3, v10

    sub-double/2addr v3, v15

    mul-double v3, v3, v31

    .end local v10    # "it\\7":F
    .end local v28    # "$i$a$-map-SensorLevelManager$onSensorChanged$1$variance$1\\7\\157\\1":I
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    .line 157
    invoke-interface {v11, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v3, v29

    move/from16 v4, v30

    const/16 v10, 0xa

    goto :goto_1

    .line 158
    .end local v27    # "item\\6":Ljava/lang/Object;
    .end local v29    # "$this$mapTo\\6":Ljava/lang/Iterable;
    .end local v30    # "$i$f$mapTo\\6\\155":I
    .restart local v3    # "$this$mapTo\\6":Ljava/lang/Iterable;
    .restart local v4    # "$i$f$mapTo\\6\\155":I
    :cond_2
    move-object/from16 v29, v3

    move/from16 v30, v4

    .end local v3    # "$this$mapTo\\6":Ljava/lang/Iterable;
    .end local v4    # "$i$f$mapTo\\6\\155":I
    .end local v11    # "destination\\6":Ljava/util/Collection;
    move-object v3, v11

    check-cast v3, Ljava/util/List;

    .line 155
    nop

    .end local v0    # "$this$map\\5":Ljava/lang/Iterable;
    .end local v9    # "$i$f$map\\5\\82":I
    check-cast v3, Ljava/lang/Iterable;

    .line 82
    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->averageOfDouble(Ljava/lang/Iterable;)D

    move-result-wide v3

    .line 84
    .local v3, "variance\\1":D
    cmpl-double v0, v3, v21

    if-lez v0, :cond_3

    move/from16 v0, v20

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    move v6, v0

    goto :goto_3

    .line 79
    .end local v8    # "magnitudes\\1":Ljava/util/List;
    .end local v15    # "mean\\1":D
    .end local v23    # "currentTime":J
    .local v3, "currentTime":J
    :cond_4
    move-wide/from16 v23, v3

    .line 86
    .end local v3    # "currentTime":J
    .restart local v23    # "currentTime":J
    :goto_3
    nop

    .end local v17    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$1\\1\\74\\0":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 74
    monitor-exit v7

    .line 89
    iget-object v0, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->rotationVectorSensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_6

    .line 90
    float-to-double v3, v13

    float-to-double v7, v12

    float-to-double v9, v12

    mul-double/2addr v7, v9

    float-to-double v9, v14

    move-wide v15, v7

    float-to-double v7, v14

    mul-double/2addr v9, v7

    add-double v7, v15, v9

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    const-wide v7, 0x4066800000000000L    # 180.0

    mul-double/2addr v3, v7

    const-wide v9, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v3, v9

    double-to-float v0, v3

    .line 91
    .local v0, "pitch":F
    float-to-double v3, v12

    neg-double v3, v3

    move-wide v15, v7

    float-to-double v7, v14

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v3

    mul-double/2addr v3, v15

    div-double/2addr v3, v9

    double-to-float v3, v3

    .line 92
    .local v3, "roll":F
    invoke-direct {v1, v0, v3, v6}, Lcom/example/nirikshak/camera/SensorLevelManager;->publishState(FFZ)V

    goto :goto_5

    .line 74
    .end local v0    # "pitch":F
    .end local v3    # "roll":F
    :catchall_1
    move-exception v0

    goto :goto_4

    .end local v23    # "currentTime":J
    .local v3, "currentTime":J
    :catchall_2
    move-exception v0

    move-wide/from16 v23, v3

    .end local v3    # "currentTime":J
    .restart local v23    # "currentTime":J
    :goto_4
    monitor-exit v7

    throw v0

    .line 67
    .end local v5    # "magnitude":F
    .end local v6    # "isUnstable":Z
    .end local v12    # "x":F
    .end local v13    # "y":F
    .end local v14    # "z":F
    .end local v23    # "currentTime":J
    .restart local v3    # "currentTime":J
    :cond_5
    move-wide/from16 v23, v3

    move/from16 v18, v7

    move/from16 v20, v11

    const-wide v21, 0x3fd6666666666666L    # 0.35

    .line 97
    .end local v3    # "currentTime":J
    .restart local v23    # "currentTime":J
    :cond_6
    :goto_5
    iget-object v0, v2, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/16 v3, 0xb

    if-ne v0, v3, :cond_b

    .line 98
    const/16 v0, 0x9

    new-array v3, v0, [F

    .line 99
    .local v3, "rotationMatrix":[F
    iget-object v0, v2, Landroid/hardware/SensorEvent;->values:[F

    invoke-static {v3, v0}, Landroid/hardware/SensorManager;->getRotationMatrixFromVector([F[F)V

    .line 101
    const/4 v0, 0x3

    new-array v4, v0, [F

    .line 102
    .local v4, "orientationValues":[F
    invoke-static {v3, v4}, Landroid/hardware/SensorManager;->getOrientation([F[F)[F

    .line 105
    aget v0, v4, v20

    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v5

    double-to-float v5, v5

    .line 106
    .local v5, "pitchDeg":F
    aget v0, v4, v18

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v6

    double-to-float v6, v6

    .line 108
    .local v6, "rollDeg":F
    const/4 v7, 0x0

    .line 109
    .local v7, "isUnstable":Z
    iget-object v8, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    monitor-enter v8

    const/4 v0, 0x0

    .line 110
    .local v0, "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    :try_start_4
    iget-object v9, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    const/4 v10, 0x3

    if-lt v9, v10, :cond_a

    .line 111
    iget-object v9, v1, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    check-cast v9, Ljava/lang/Iterable;

    .local v9, "$this$map\\9":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 159
    .local v10, "$i$f$map\\9\\111":I
    new-instance v11, Ljava/util/ArrayList;

    const/16 v12, 0xa

    invoke-static {v9, v12}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v13

    invoke-direct {v11, v13}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v11, Ljava/util/Collection;

    .local v11, "destination\\10":Ljava/util/Collection;
    move-object v12, v9

    .local v12, "$this$mapTo\\10":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 160
    .local v13, "$i$f$mapTo\\10\\159":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_6
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    if-eqz v15, :cond_7

    :try_start_5
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    .line 161
    .local v15, "item\\10":Ljava/lang/Object;
    move-object/from16 v16, v15

    check-cast v16, Lkotlin/Pair;

    .local v16, "it\\11":Lkotlin/Pair;
    const/16 v17, 0x0

    .line 111
    .local v17, "$i$a$-map-SensorLevelManager$onSensorChanged$2$magnitudes$1\\11\\161\\8":I
    invoke-virtual/range {v16 .. v16}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Number;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Number;->floatValue()F

    move-result v18

    move/from16 v16, v0

    .end local v0    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .end local v17    # "$i$a$-map-SensorLevelManager$onSensorChanged$2$magnitudes$1\\11\\161\\8":I
    .local v16, "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    invoke-static/range {v18 .. v18}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    .line 161
    invoke-interface {v11, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    move/from16 v0, v16

    goto :goto_6

    .line 109
    .end local v9    # "$this$map\\9":Ljava/lang/Iterable;
    .end local v10    # "$i$f$map\\9\\111":I
    .end local v11    # "destination\\10":Ljava/util/Collection;
    .end local v12    # "$this$mapTo\\10":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo\\10\\159":I
    .end local v15    # "item\\10":Ljava/lang/Object;
    .end local v16    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    :catchall_3
    move-exception v0

    move-object/from16 v26, v3

    goto/16 :goto_a

    .line 162
    .restart local v0    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .restart local v9    # "$this$map\\9":Ljava/lang/Iterable;
    .restart local v10    # "$i$f$map\\9\\111":I
    .restart local v11    # "destination\\10":Ljava/util/Collection;
    .restart local v12    # "$this$mapTo\\10":Ljava/lang/Iterable;
    .restart local v13    # "$i$f$mapTo\\10\\159":I
    :cond_7
    move/from16 v16, v0

    .end local v0    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .end local v11    # "destination\\10":Ljava/util/Collection;
    .end local v12    # "$this$mapTo\\10":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapTo\\10\\159":I
    .restart local v16    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    :try_start_6
    move-object v0, v11

    check-cast v0, Ljava/util/List;

    .line 159
    nop

    .line 111
    .end local v9    # "$this$map\\9":Ljava/lang/Iterable;
    .end local v10    # "$i$f$map\\9\\111":I
    nop

    .line 112
    .local v0, "magnitudes\\8":Ljava/util/List;
    move-object v9, v0

    check-cast v9, Ljava/lang/Iterable;

    invoke-static {v9}, Lkotlin/collections/CollectionsKt;->averageOfFloat(Ljava/lang/Iterable;)D

    move-result-wide v9

    .line 113
    .local v9, "mean\\8":D
    move-object v11, v0

    check-cast v11, Ljava/lang/Iterable;

    .local v11, "$this$map\\12":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 163
    .local v12, "$i$f$map\\12\\113":I
    new-instance v13, Ljava/util/ArrayList;

    const/16 v14, 0xa

    invoke-static {v11, v14}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v14

    invoke-direct {v13, v14}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v13, Ljava/util/Collection;

    .local v13, "destination\\13":Ljava/util/Collection;
    move-object v14, v11

    .local v14, "$this$mapTo\\13":Ljava/lang/Iterable;
    const/4 v15, 0x0

    .line 164
    .local v15, "$i$f$mapTo\\13\\163":I
    invoke-interface {v14}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_7
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_8

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    .line 165
    .local v18, "item\\13":Ljava/lang/Object;
    move-object/from16 v25, v18

    check-cast v25, Ljava/lang/Number;

    invoke-virtual/range {v25 .. v25}, Ljava/lang/Number;->floatValue()F

    move-result v25
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    move/from16 v26, v25

    .local v26, "it\\14":F
    const/16 v25, 0x0

    .line 113
    .local v25, "$i$a$-map-SensorLevelManager$onSensorChanged$2$variance$1\\14\\165\\8":I
    move-object/from16 v27, v0

    move/from16 v0, v26

    move-object/from16 v26, v3

    .end local v3    # "rotationMatrix":[F
    .local v0, "it\\14":F
    .local v26, "rotationMatrix":[F
    .local v27, "magnitudes\\8":Ljava/util/List;
    float-to-double v2, v0

    sub-double/2addr v2, v9

    move-wide/from16 v28, v2

    float-to-double v2, v0

    sub-double/2addr v2, v9

    mul-double v2, v2, v28

    .end local v0    # "it\\14":F
    .end local v25    # "$i$a$-map-SensorLevelManager$onSensorChanged$2$variance$1\\14\\165\\8":I
    :try_start_7
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    .line 165
    invoke-interface {v13, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, p1

    move-object/from16 v3, v26

    move-object/from16 v0, v27

    goto :goto_7

    .line 166
    .end local v18    # "item\\13":Ljava/lang/Object;
    .end local v26    # "rotationMatrix":[F
    .end local v27    # "magnitudes\\8":Ljava/util/List;
    .local v0, "magnitudes\\8":Ljava/util/List;
    .restart local v3    # "rotationMatrix":[F
    :cond_8
    move-object/from16 v27, v0

    move-object/from16 v26, v3

    .end local v0    # "magnitudes\\8":Ljava/util/List;
    .end local v3    # "rotationMatrix":[F
    .end local v13    # "destination\\13":Ljava/util/Collection;
    .end local v14    # "$this$mapTo\\13":Ljava/lang/Iterable;
    .end local v15    # "$i$f$mapTo\\13\\163":I
    .restart local v26    # "rotationMatrix":[F
    .restart local v27    # "magnitudes\\8":Ljava/util/List;
    move-object v0, v13

    check-cast v0, Ljava/util/List;

    .line 163
    nop

    .end local v11    # "$this$map\\12":Ljava/lang/Iterable;
    .end local v12    # "$i$f$map\\12\\113":I
    check-cast v0, Ljava/lang/Iterable;

    .line 113
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->averageOfDouble(Ljava/lang/Iterable;)D

    move-result-wide v2

    .line 114
    .local v2, "variance\\8":D
    cmpl-double v0, v2, v21

    if-lez v0, :cond_9

    move/from16 v19, v20

    goto :goto_8

    :cond_9
    const/16 v19, 0x0

    :goto_8
    move/from16 v7, v19

    goto :goto_9

    .line 110
    .end local v2    # "variance\\8":D
    .end local v9    # "mean\\8":D
    .end local v16    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .end local v26    # "rotationMatrix":[F
    .end local v27    # "magnitudes\\8":Ljava/util/List;
    .local v0, "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .restart local v3    # "rotationMatrix":[F
    :cond_a
    move/from16 v16, v0

    move-object/from16 v26, v3

    .line 116
    .end local v0    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .end local v3    # "rotationMatrix":[F
    .restart local v16    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    .restart local v26    # "rotationMatrix":[F
    :goto_9
    nop

    .end local v16    # "$i$a$-synchronized-SensorLevelManager$onSensorChanged$2\\8\\109\\0":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 109
    monitor-exit v8

    .line 118
    invoke-direct {v1, v5, v6, v7}, Lcom/example/nirikshak/camera/SensorLevelManager;->publishState(FFZ)V

    goto :goto_b

    .line 109
    :catchall_4
    move-exception v0

    goto :goto_a

    .end local v26    # "rotationMatrix":[F
    .restart local v3    # "rotationMatrix":[F
    :catchall_5
    move-exception v0

    move-object/from16 v26, v3

    .end local v3    # "rotationMatrix":[F
    .restart local v26    # "rotationMatrix":[F
    :goto_a
    monitor-exit v8

    throw v0

    .line 120
    .end local v4    # "orientationValues":[F
    .end local v5    # "pitchDeg":F
    .end local v6    # "rollDeg":F
    .end local v7    # "isUnstable":Z
    .end local v26    # "rotationMatrix":[F
    :cond_b
    :goto_b
    return-void
.end method

.method public final startListening(Lkotlin/jvm/functions/Function1;)V
    .locals 4
    .param p1, "onUpdate"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/example/nirikshak/camera/LevelSensorState;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "onUpdate"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    iput-object p1, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->onStateChanged:Lkotlin/jvm/functions/Function1;

    .line 42
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->rotationVectorSensor:Landroid/hardware/Sensor;

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    move-object v2, p0

    check-cast v2, Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->rotationVectorSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    goto :goto_0

    .line 44
    :cond_0
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    move-object v2, p0

    check-cast v2, Landroid/hardware/SensorEventListener;

    iget-object v3, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->accelerometerSensor:Landroid/hardware/Sensor;

    invoke-virtual {v0, v2, v3, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 48
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->accelerometerSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->rotationVectorSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_2

    .line 49
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    move-object v1, p0

    check-cast v1, Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->accelerometerSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 51
    :cond_2
    return-void
.end method

.method public final stopListening()V
    .locals 3

    .line 54
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->sensorManager:Landroid/hardware/SensorManager;

    move-object v1, p0

    check-cast v1, Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 55
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->onStateChanged:Lkotlin/jvm/functions/Function1;

    .line 56
    iget-object v0, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    monitor-enter v0

    const/4 v1, 0x0

    .line 57
    .local v1, "$i$a$-synchronized-SensorLevelManager$stopListening$1\\1\\56\\0":I
    :try_start_0
    iget-object v2, p0, Lcom/example/nirikshak/camera/SensorLevelManager;->motionHistory:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 58
    nop

    .end local v1    # "$i$a$-synchronized-SensorLevelManager$stopListening$1\\1\\56\\0":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    monitor-exit v0

    .line 59
    return-void

    .line 56
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
