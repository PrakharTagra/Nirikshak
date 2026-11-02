.class public final synthetic Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/ListenableFuture;

.field public final synthetic f$1:Landroidx/lifecycle/LifecycleOwner;

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroidx/camera/view/PreviewView;

.field public final synthetic f$4:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$5:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/lifecycle/LifecycleOwner;Landroid/content/Context;Landroidx/camera/view/PreviewView;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$0:Lcom/google/common/util/concurrent/ListenableFuture;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$1:Landroidx/lifecycle/LifecycleOwner;

    iput-object p3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$3:Landroidx/camera/view/PreviewView;

    iput-object p5, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$4:Landroidx/compose/runtime/MutableState;

    iput-object p6, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$5:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 6

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$0:Lcom/google/common/util/concurrent/ListenableFuture;

    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$1:Landroidx/lifecycle/LifecycleOwner;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$3:Landroidx/camera/view/PreviewView;

    iget-object v4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$4:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda14;->f$5:Landroidx/compose/runtime/MutableState;

    invoke-static/range {v0 .. v5}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->$r8$lambda$UB5sfi5E7SMsOuFI6YAcYYNKIp4(Lcom/google/common/util/concurrent/ListenableFuture;Landroidx/lifecycle/LifecycleOwner;Landroid/content/Context;Landroidx/camera/view/PreviewView;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V

    return-void
.end method
