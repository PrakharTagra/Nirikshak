.class public final Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$lambda$38$0$$inlined$onDispose$1;
.super Ljava/lang/Object;
.source "Effects.kt"

# interfaces
.implements Landroidx/compose/runtime/DisposableEffectResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/camera/CameraCaptureViewKt;->CameraCaptureView(Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEffects.kt\nKotlin\n*S Kotlin\n*F\n+ 1 Effects.kt\nandroidx/compose/runtime/DisposableEffectScope$onDispose$1\n+ 2 CameraCaptureView.kt\ncom/example/nirikshak/camera/CameraCaptureViewKt\n*L\n1#1,603:1\n127#2,3:604\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004\u00b8\u0006\u0000"
    }
    d2 = {
        "androidx/compose/runtime/DisposableEffectScope$onDispose$1",
        "Landroidx/compose/runtime/DisposableEffectResult;",
        "dispose",
        "",
        "runtime"
    }
    k = 0x1
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $cameraExecutor$inlined:Ljava/util/concurrent/ExecutorService;

.field final synthetic $sensorManager$inlined:Lcom/example/nirikshak/camera/SensorLevelManager;


# direct methods
.method public constructor <init>(Lcom/example/nirikshak/camera/SensorLevelManager;Ljava/util/concurrent/ExecutorService;)V
    .locals 0

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$lambda$38$0$$inlined$onDispose$1;->$sensorManager$inlined:Lcom/example/nirikshak/camera/SensorLevelManager;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$lambda$38$0$$inlined$onDispose$1;->$cameraExecutor$inlined:Ljava/util/concurrent/ExecutorService;

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 68
    const/4 v0, 0x0

    .line 604
    .local v0, "$i$a$-onDispose-CameraCaptureViewKt$CameraCaptureView$1$1$2\\1\\68\\0":I
    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$lambda$38$0$$inlined$onDispose$1;->$sensorManager$inlined:Lcom/example/nirikshak/camera/SensorLevelManager;

    invoke-virtual {v1}, Lcom/example/nirikshak/camera/SensorLevelManager;->stopListening()V

    .line 605
    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$lambda$38$0$$inlined$onDispose$1;->$cameraExecutor$inlined:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 606
    nop

    .line 68
    .end local v0    # "$i$a$-onDispose-CameraCaptureViewKt$CameraCaptureView$1$1$2\\1\\68\\0":I
    nop

    .line 69
    return-void
.end method
