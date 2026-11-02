.class public abstract Landroidx/camera/core/CameraEffect;
.super Ljava/lang/Object;
.source "CameraEffect.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/CameraEffect$Formats;,
        Landroidx/camera/core/CameraEffect$OutputOptions;,
        Landroidx/camera/core/CameraEffect$Targets;,
        Landroidx/camera/core/CameraEffect$Transformations;
    }
.end annotation


# static fields
.field public static final IMAGE_CAPTURE:I = 0x4

.field public static final OUTPUT_OPTION_ONE_FOR_ALL_TARGETS:I = 0x0

.field public static final OUTPUT_OPTION_ONE_FOR_EACH_TARGET:I = 0x1

.field public static final PREVIEW:I = 0x1

.field private static final SURFACE_PROCESSOR_TARGETS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static final TRANSFORMATION_ARBITRARY:I = 0x0

.field public static final TRANSFORMATION_CAMERA_AND_SURFACE_ROTATION:I = 0x1

.field public static final TRANSFORMATION_PASSTHROUGH:I = 0x2

.field public static final VIDEO_CAPTURE:I = 0x2


# instance fields
.field private final mErrorListener:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final mExecutor:Ljava/util/concurrent/Executor;

.field private final mImageProcessor:Landroidx/camera/core/ImageProcessor;

.field private final mOutputOption:I

.field private final mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

.field private final mTargets:I

.field private final mTransformation:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 138
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Integer;

    .line 139
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 140
    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v1

    .line 141
    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 142
    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    .line 138
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Landroidx/camera/core/CameraEffect;->SURFACE_PROCESSOR_TARGETS:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>(IIILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V
    .locals 1
    .param p1, "targets"    # I
    .param p2, "outputOption"    # I
    .param p3, "transformation"    # I
    .param p4, "executor"    # Ljava/util/concurrent/Executor;
    .param p5, "surfaceProcessor"    # Landroidx/camera/core/SurfaceProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(III",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/SurfaceProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 294
    .local p6, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 295
    sget-object v0, Landroidx/camera/core/CameraEffect;->SURFACE_PROCESSOR_TARGETS:Ljava/util/List;

    invoke-static {v0, p1}, Landroidx/camera/core/processing/TargetUtils;->checkSupportedTargets(Ljava/util/Collection;I)V

    .line 296
    iput p1, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    .line 297
    iput p2, p0, Landroidx/camera/core/CameraEffect;->mOutputOption:I

    .line 298
    iput p3, p0, Landroidx/camera/core/CameraEffect;->mTransformation:I

    .line 299
    iput-object p4, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    .line 300
    iput-object p5, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    .line 301
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    .line 302
    iput-object p6, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    .line 303
    return-void
.end method

.method protected constructor <init>(IILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V
    .locals 7
    .param p1, "targets"    # I
    .param p2, "transformation"    # I
    .param p3, "executor"    # Ljava/util/concurrent/Executor;
    .param p4, "surfaceProcessor"    # Landroidx/camera/core/SurfaceProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/SurfaceProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 258
    .local p5, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    const/4 v2, 0x0

    move-object v0, p0

    move v1, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    .end local p1    # "targets":I
    .end local p2    # "transformation":I
    .end local p3    # "executor":Ljava/util/concurrent/Executor;
    .end local p4    # "surfaceProcessor":Landroidx/camera/core/SurfaceProcessor;
    .end local p5    # "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    .local v1, "targets":I
    .local v3, "transformation":I
    .local v4, "executor":Ljava/util/concurrent/Executor;
    .local v5, "surfaceProcessor":Landroidx/camera/core/SurfaceProcessor;
    .local v6, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/CameraEffect;-><init>(IIILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V

    .line 260
    return-void
.end method

.method protected constructor <init>(ILjava/util/concurrent/Executor;Landroidx/camera/core/ImageProcessor;Landroidx/core/util/Consumer;)V
    .locals 3
    .param p1, "targets"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "imageProcessor"    # Landroidx/camera/core/ImageProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/ImageProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 239
    .local p4, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 240
    const/4 v0, 0x4

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "Currently ImageProcessor can only target IMAGE_CAPTURE."

    invoke-static {v0, v2}, Landroidx/core/util/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 242
    iput p1, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    .line 243
    iput v1, p0, Landroidx/camera/core/CameraEffect;->mTransformation:I

    .line 244
    iput v1, p0, Landroidx/camera/core/CameraEffect;->mOutputOption:I

    .line 245
    iput-object p2, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    .line 247
    iput-object p3, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    .line 248
    iput-object p4, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    .line 249
    return-void
.end method

.method protected constructor <init>(ILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V
    .locals 7
    .param p1, "targets"    # I
    .param p2, "executor"    # Ljava/util/concurrent/Executor;
    .param p3, "surfaceProcessor"    # Landroidx/camera/core/SurfaceProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/camera/core/SurfaceProcessor;",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 333
    .local p4, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    .end local p1    # "targets":I
    .end local p2    # "executor":Ljava/util/concurrent/Executor;
    .end local p3    # "surfaceProcessor":Landroidx/camera/core/SurfaceProcessor;
    .end local p4    # "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    .local v1, "targets":I
    .local v4, "executor":Ljava/util/concurrent/Executor;
    .local v5, "surfaceProcessor":Landroidx/camera/core/SurfaceProcessor;
    .local v6, "errorListener":Landroidx/core/util/Consumer;, "Landroidx/core/util/Consumer<Ljava/lang/Throwable;>;"
    invoke-direct/range {v0 .. v6}, Landroidx/camera/core/CameraEffect;-><init>(IIILjava/util/concurrent/Executor;Landroidx/camera/core/SurfaceProcessor;Landroidx/core/util/Consumer;)V

    .line 335
    return-void
.end method


# virtual methods
.method public createSurfaceProcessorInternal()Landroidx/camera/core/processing/SurfaceProcessorInternal;
    .locals 1

    .line 412
    new-instance v0, Landroidx/camera/core/processing/SurfaceProcessorWithExecutor;

    invoke-direct {v0, p0}, Landroidx/camera/core/processing/SurfaceProcessorWithExecutor;-><init>(Landroidx/camera/core/CameraEffect;)V

    return-object v0
.end method

.method public getErrorListener()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 381
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mErrorListener:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 370
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getImageProcessor()Landroidx/camera/core/ImageProcessor;
    .locals 1

    .line 398
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mImageProcessor:Landroidx/camera/core/ImageProcessor;

    return-object v0
.end method

.method public getOutputOption()I
    .locals 1

    .line 360
    iget v0, p0, Landroidx/camera/core/CameraEffect;->mOutputOption:I

    return v0
.end method

.method public getSurfaceProcessor()Landroidx/camera/core/SurfaceProcessor;
    .locals 1

    .line 389
    iget-object v0, p0, Landroidx/camera/core/CameraEffect;->mSurfaceProcessor:Landroidx/camera/core/SurfaceProcessor;

    return-object v0
.end method

.method public getTargets()I
    .locals 1

    .line 342
    iget v0, p0, Landroidx/camera/core/CameraEffect;->mTargets:I

    return v0
.end method

.method public getTransformation()I
    .locals 1

    .line 351
    iget v0, p0, Landroidx/camera/core/CameraEffect;->mTransformation:I

    return v0
.end method
