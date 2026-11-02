.class public final synthetic Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$1:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$2:Landroidx/lifecycle/LifecycleOwner;

.field public final synthetic f$3:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$0:Landroidx/compose/runtime/MutableState;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$1:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$2:Landroidx/lifecycle/LifecycleOwner;

    iput-object p4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$3:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$0:Landroidx/compose/runtime/MutableState;

    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$1:Landroidx/compose/runtime/MutableState;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$2:Landroidx/lifecycle/LifecycleOwner;

    iget-object v3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$$ExternalSyntheticLambda11;->f$3:Landroidx/compose/runtime/MutableState;

    check-cast p1, Landroid/content/Context;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->$r8$lambda$iBevwinQRAb0fb1tsevcUzf3w38(Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/lifecycle/LifecycleOwner;Landroidx/compose/runtime/MutableState;Landroid/content/Context;)Landroidx/camera/view/PreviewView;

    move-result-object p1

    return-object p1
.end method
