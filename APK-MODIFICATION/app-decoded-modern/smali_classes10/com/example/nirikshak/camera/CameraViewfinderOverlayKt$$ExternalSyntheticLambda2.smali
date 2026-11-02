.class public final synthetic Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lcom/example/nirikshak/camera/LevelSensorState;


# direct methods
.method public synthetic constructor <init>(Lcom/example/nirikshak/camera/LevelSensorState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda2;->f$0:Lcom/example/nirikshak/camera/LevelSensorState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt$$ExternalSyntheticLambda2;->f$0:Lcom/example/nirikshak/camera/LevelSensorState;

    check-cast p1, Landroidx/compose/ui/graphics/drawscope/DrawScope;

    invoke-static {v0, p1}, Lcom/example/nirikshak/camera/CameraViewfinderOverlayKt;->$r8$lambda$40MLqvynh4lQLwzZlDIDvPNF5gk(Lcom/example/nirikshak/camera/LevelSensorState;Landroidx/compose/ui/graphics/drawscope/DrawScope;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
