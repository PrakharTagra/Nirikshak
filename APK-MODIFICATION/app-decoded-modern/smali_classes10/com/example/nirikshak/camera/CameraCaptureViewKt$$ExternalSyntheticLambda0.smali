.class public final synthetic Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lcom/example/nirikshak/camera/SensorLevelManager;

.field public final synthetic f$1:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$2:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public synthetic constructor <init>(Lcom/example/nirikshak/camera/SensorLevelManager;Landroidx/compose/runtime/MutableState;Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$0:Lcom/example/nirikshak/camera/SensorLevelManager;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$1:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/ExecutorService;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$0:Lcom/example/nirikshak/camera/SensorLevelManager;

    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$1:Landroidx/compose/runtime/MutableState;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda0;->f$2:Ljava/util/concurrent/ExecutorService;

    check-cast p1, Landroidx/compose/runtime/DisposableEffectScope;

    invoke-static {v0, v1, v2, p1}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->$r8$lambda$HQDs1DGHA0-HpMA6_ykHe6inOrk(Lcom/example/nirikshak/camera/SensorLevelManager;Landroidx/compose/runtime/MutableState;Ljava/util/concurrent/ExecutorService;Landroidx/compose/runtime/DisposableEffectScope;)Landroidx/compose/runtime/DisposableEffectResult;

    move-result-object p1

    return-object p1
.end method
