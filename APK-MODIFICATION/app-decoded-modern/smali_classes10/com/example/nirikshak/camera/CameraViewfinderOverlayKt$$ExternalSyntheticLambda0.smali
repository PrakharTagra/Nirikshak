.class public final synthetic Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:F

.field public final synthetic f$2:F

.field public final synthetic f$3:Lcom/example/nirikshak/camera/LevelSensorState;


# direct methods
.method public synthetic constructor <init>(JFFLcom/example/nirikshak/camera/LevelSensorState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$0:J

    iput p3, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$1:F

    iput p4, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$2:F

    iput-object p5, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$3:Lcom/example/nirikshak/camera/LevelSensorState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 0
    iget-wide v0, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$0:J

    iget v2, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$1:F

    iget v3, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$2:F

    iget-object v4, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda0;->f$3:Lcom/example/nirikshak/camera/LevelSensorState;

    move-object v5, p1

    check-cast v5, Landroidx/compose/ui/graphics/drawscope/DrawScope;

    invoke-static/range {v0 .. v5}, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt;->$r8$lambda$QlBQFK7rKhzvGAogXDPoK2v9LLM(JFFLcom/example/nirikshak/camera/LevelSensorState;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
