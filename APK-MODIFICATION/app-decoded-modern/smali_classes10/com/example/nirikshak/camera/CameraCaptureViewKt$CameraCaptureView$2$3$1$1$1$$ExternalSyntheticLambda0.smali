.class public final synthetic Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Landroidx/camera/core/ImageCaptureException;

.field public final synthetic f$2:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/ImageCaptureException;

    iput-object p3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$2:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$1:Landroidx/camera/core/ImageCaptureException;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;->f$2:Landroidx/compose/runtime/MutableState;

    invoke-static {v0, v1, v2}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$r8$lambda$_yMUGC5kAJnAMtrbcv6U5wFm_uM(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V

    return-void
.end method
