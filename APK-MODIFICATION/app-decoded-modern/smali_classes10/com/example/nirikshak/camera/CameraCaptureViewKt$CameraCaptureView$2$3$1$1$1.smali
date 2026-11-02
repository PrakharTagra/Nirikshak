.class public final Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;
.super Ljava/lang/Object;
.source "CameraCaptureView.kt"

# interfaces
.implements Landroidx/camera/core/ImageCapture$OnImageSavedCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/camera/CameraCaptureViewKt;->CameraCaptureView(Lkotlin/jvm/functions/Function3;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0007\u001a\u00020\u0008H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "com/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1",
        "Landroidx/camera/core/ImageCapture$OnImageSavedCallback;",
        "onImageSaved",
        "",
        "outputFileResults",
        "Landroidx/camera/core/ImageCapture$OutputFileResults;",
        "onError",
        "exception",
        "Landroidx/camera/core/ImageCaptureException;",
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


# instance fields
.field final synthetic $capturedPhotoData$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Lkotlin/Pair<",
            "Ljava/io/File;",
            "Lcom/example/nirikshak/camera/QualityCheckResult;",
            ">;>;"
        }
    .end annotation
.end field

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $isCapturing$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $photoFile:Ljava/io/File;

.field final synthetic $showDimensionPopup$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$_yMUGC5kAJnAMtrbcv6U5wFm_uM(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->onError$lambda$2(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V

    return-void
.end method

.method public static synthetic $r8$lambda$oaUANuSsK1gkq0pKbq6Xc5GkuE0(Lcom/example/nirikshak/camera/QualityCheckResult;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->onImageSaved$lambda$0(Lcom/example/nirikshak/camera/QualityCheckResult;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V

    return-void
.end method

.method public static synthetic $r8$lambda$v2WxFa6DNCtfgOfaUdiFkYhsjKw(Landroid/content/Context;Ljava/lang/Exception;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->onImageSaved$lambda$1(Landroid/content/Context;Ljava/lang/Exception;Landroidx/compose/runtime/MutableState;)V

    return-void
.end method

.method constructor <init>(Ljava/io/File;Landroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 0
    .param p1, "$photoFile"    # Ljava/io/File;
    .param p2, "$context"    # Landroid/content/Context;
    .param p3, "$isCapturing$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p4, "$capturedPhotoData$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p5, "$showDimensionPopup$delegate"    # Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            "Landroid/content/Context;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Lkotlin/Pair<",
            "Ljava/io/File;",
            "Lcom/example/nirikshak/camera/QualityCheckResult;",
            ">;>;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$photoFile:Ljava/io/File;

    iput-object p2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$isCapturing$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$capturedPhotoData$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$showDimensionPopup$delegate:Landroidx/compose/runtime/MutableState;

    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static final onError$lambda$2(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V
    .locals 4
    .param p0, "$context"    # Landroid/content/Context;
    .param p1, "$exception"    # Landroidx/camera/core/ImageCaptureException;
    .param p2, "$isCapturing$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 299
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->access$CameraCaptureView$lambda$15(Landroidx/compose/runtime/MutableState;Z)V

    .line 300
    invoke-virtual {p1}, Landroidx/camera/core/ImageCaptureException;->getMessage()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Capture failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 301
    return-void
.end method

.method private static final onImageSaved$lambda$0(Lcom/example/nirikshak/camera/QualityCheckResult;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V
    .locals 3
    .param p0, "$qualityResult"    # Lcom/example/nirikshak/camera/QualityCheckResult;
    .param p1, "$isCapturing$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p2, "$capturedPhotoData$delegate"    # Landroidx/compose/runtime/MutableState;
    .param p3, "$showDimensionPopup$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 284
    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->access$CameraCaptureView$lambda$15(Landroidx/compose/runtime/MutableState;Z)V

    .line 286
    new-instance v1, Lkotlin/Pair;

    invoke-virtual {p0}, Lcom/example/nirikshak/camera/QualityCheckResult;->getNormalizedFile()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p2, v1}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->access$CameraCaptureView$lambda$18(Landroidx/compose/runtime/MutableState;Lkotlin/Pair;)V

    .line 287
    invoke-static {p3, v0}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->access$CameraCaptureView$lambda$21(Landroidx/compose/runtime/MutableState;Z)V

    .line 288
    return-void
.end method

.method private static final onImageSaved$lambda$1(Landroid/content/Context;Ljava/lang/Exception;Landroidx/compose/runtime/MutableState;)V
    .locals 4
    .param p0, "$context"    # Landroid/content/Context;
    .param p1, "$e"    # Ljava/lang/Exception;
    .param p2, "$isCapturing$delegate"    # Landroidx/compose/runtime/MutableState;

    .line 291
    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/example/nirikshak/camera/CameraCaptureViewKt;->access$CameraCaptureView$lambda$15(Landroidx/compose/runtime/MutableState;Z)V

    .line 292
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Processing error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    invoke-static {p0, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 293
    return-void
.end method


# virtual methods
.method public onError(Landroidx/camera/core/ImageCaptureException;)V
    .locals 4
    .param p1, "exception"    # Landroidx/camera/core/ImageCaptureException;

    const-string v0, "exception"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 298
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v0}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v0

    iget-object v1, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$isCapturing$delegate:Landroidx/compose/runtime/MutableState;

    new-instance v3, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1, p1, v2}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda0;-><init>(Landroid/content/Context;Landroidx/camera/core/ImageCaptureException;Landroidx/compose/runtime/MutableState;)V

    invoke-interface {v0, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 302
    return-void
.end method

.method public onImageSaved(Landroidx/camera/core/ImageCapture$OutputFileResults;)V
    .locals 7
    .param p1, "outputFileResults"    # Landroidx/camera/core/ImageCapture$OutputFileResults;

    const-string v0, "outputFileResults"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$photoFile:Ljava/io/File;

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 281
    .local v0, "rawUri":Landroid/net/Uri;
    nop

    .line 282
    :try_start_0
    sget-object v1, Lcom/example/nirikshak/camera/ImageQualityNormalizer;->INSTANCE:Lcom/example/nirikshak/camera/ImageQualityNormalizer;

    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v0}, Lcom/example/nirikshak/camera/ImageQualityNormalizer;->normalizeImage(Landroid/content/Context;Landroid/net/Uri;)Lcom/example/nirikshak/camera/QualityCheckResult;

    move-result-object v1

    .line 283
    .local v1, "qualityResult":Lcom/example/nirikshak/camera/QualityCheckResult;
    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v2}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$isCapturing$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$capturedPhotoData$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$showDimensionPopup$delegate:Landroidx/compose/runtime/MutableState;

    new-instance v6, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda1;

    invoke-direct {v6, v1, v3, v4, v5}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda1;-><init>(Lcom/example/nirikshak/camera/QualityCheckResult;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;)V

    invoke-interface {v2, v6}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1    # "qualityResult":Lcom/example/nirikshak/camera/QualityCheckResult;
    goto :goto_0

    .line 289
    :catch_0
    move-exception v1

    .line 290
    .local v1, "e":Ljava/lang/Exception;
    iget-object v2, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    invoke-static {v2}, Landroidx/core/content/ContextCompat;->getMainExecutor(Landroid/content/Context;)Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$context:Landroid/content/Context;

    iget-object v4, p0, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1;->$isCapturing$delegate:Landroidx/compose/runtime/MutableState;

    new-instance v5, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda2;

    invoke-direct {v5, v3, v1, v4}, Lcom/example/nirikshak/camera/CameraCaptureViewKt$CameraCaptureView$2$3$1$1$1$$ExternalSyntheticLambda2;-><init>(Landroid/content/Context;Ljava/lang/Exception;Landroidx/compose/runtime/MutableState;)V

    invoke-interface {v2, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 295
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
