.class public final Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;
.super Landroidx/camera/core/processing/OpenGlRenderer;
.source "DualOpenGlRenderer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DualOpenGlRenderer"


# instance fields
.field private mPrimaryExternalTextureId:I

.field private final mPrimaryLayoutSettings:Landroidx/camera/core/LayoutSettings;

.field private mSecondaryExternalTextureId:I

.field private final mSecondaryLayoutSettings:Landroidx/camera/core/LayoutSettings;


# direct methods
.method public constructor <init>(Landroidx/camera/core/LayoutSettings;Landroidx/camera/core/LayoutSettings;)V
    .locals 1
    .param p1, "primaryLayoutSettings"    # Landroidx/camera/core/LayoutSettings;
    .param p2, "secondaryLayoutSettings"    # Landroidx/camera/core/LayoutSettings;

    .line 70
    invoke-direct {p0}, Landroidx/camera/core/processing/OpenGlRenderer;-><init>()V

    .line 60
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryExternalTextureId:I

    .line 61
    iput v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryExternalTextureId:I

    .line 71
    iput-object p1, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryLayoutSettings:Landroidx/camera/core/LayoutSettings;

    .line 72
    iput-object p2, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryLayoutSettings:Landroidx/camera/core/LayoutSettings;

    .line 73
    return-void
.end method

.method private static getTransformMatrix(Landroid/util/Size;Landroid/util/Size;Landroidx/camera/core/LayoutSettings;)[F
    .locals 7
    .param p0, "overlaySize"    # Landroid/util/Size;
    .param p1, "backgroundSize"    # Landroid/util/Size;
    .param p2, "layoutSettings"    # Landroidx/camera/core/LayoutSettings;

    .line 208
    invoke-static {}, Landroidx/camera/core/processing/util/GLUtils;->create4x4IdentityMatrix()[F

    move-result-object v2

    .line 209
    .local v2, "aspectRatioMatrix":[F
    invoke-static {}, Landroidx/camera/core/processing/util/GLUtils;->create4x4IdentityMatrix()[F

    move-result-object v4

    .line 210
    .local v4, "overlayFrameAnchorMatrix":[F
    invoke-static {}, Landroidx/camera/core/processing/util/GLUtils;->create4x4IdentityMatrix()[F

    move-result-object v0

    .line 212
    .local v0, "transformationMatrix":[F
    nop

    .line 215
    invoke-virtual {p0}, Landroid/util/Size;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v1, v3

    .line 216
    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v3, v5

    .line 212
    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v2, v5, v1, v3, v6}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 220
    nop

    .line 223
    invoke-virtual {p2}, Landroidx/camera/core/LayoutSettings;->getOffsetX()F

    move-result v1

    invoke-virtual {p2}, Landroidx/camera/core/LayoutSettings;->getWidth()F

    move-result v3

    div-float/2addr v1, v3

    .line 224
    invoke-virtual {p2}, Landroidx/camera/core/LayoutSettings;->getOffsetY()F

    move-result v3

    invoke-virtual {p2}, Landroidx/camera/core/LayoutSettings;->getHeight()F

    move-result v6

    div-float/2addr v3, v6

    .line 220
    const/4 v6, 0x0

    invoke-static {v4, v5, v1, v3, v6}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 228
    const/4 v3, 0x0

    const/4 v1, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 236
    return-object v0
.end method

.method private renderInternal(Landroidx/camera/core/processing/util/OutputSurface;Landroidx/camera/core/SurfaceOutput;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/LayoutSettings;IZ)V
    .locals 9
    .param p1, "outputSurface"    # Landroidx/camera/core/processing/util/OutputSurface;
    .param p2, "surfaceOutput"    # Landroidx/camera/core/SurfaceOutput;
    .param p3, "surfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p4, "layoutSettings"    # Landroidx/camera/core/LayoutSettings;
    .param p5, "externalTextureId"    # I
    .param p6, "isPrimary"    # Z

    .line 163
    invoke-virtual {p0, p5}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->useAndConfigureProgramWithTexture(I)V

    .line 164
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getWidth()I

    move-result v0

    .line 165
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getHeight()I

    move-result v1

    .line 164
    const/4 v2, 0x0

    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 166
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getWidth()I

    move-result v0

    .line 167
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getHeight()I

    move-result v1

    .line 166
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glScissor(IIII)V

    .line 169
    const/16 v0, 0x10

    new-array v1, v0, [F

    .line 170
    .local v1, "textureTransform":[F
    invoke-virtual {p3, v1}, Landroid/graphics/SurfaceTexture;->getTransformMatrix([F)V

    .line 172
    new-array v0, v0, [F

    .line 173
    .local v0, "surfaceOutputMatrix":[F
    invoke-interface {p2, v0, v1, p6}, Landroidx/camera/core/SurfaceOutput;->updateTransformMatrix([F[FZ)V

    .line 176
    iget-object v3, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mCurrentProgram:Landroidx/camera/core/processing/util/GLUtils$Program2D;

    invoke-static {v3}, Landroidx/core/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/camera/core/processing/util/GLUtils$Program2D;

    .line 177
    .local v3, "currentProgram":Landroidx/camera/core/processing/util/GLUtils$Program2D;
    instance-of v4, v3, Landroidx/camera/core/processing/util/GLUtils$SamplerShaderProgram;

    if-eqz v4, :cond_0

    .line 178
    move-object v4, v3

    check-cast v4, Landroidx/camera/core/processing/util/GLUtils$SamplerShaderProgram;

    invoke-virtual {v4, v0}, Landroidx/camera/core/processing/util/GLUtils$SamplerShaderProgram;->updateTextureMatrix([F)V

    .line 181
    :cond_0
    new-instance v4, Landroid/util/Size;

    .line 182
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {p4}, Landroidx/camera/core/LayoutSettings;->getWidth()F

    move-result v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    .line 183
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p4}, Landroidx/camera/core/LayoutSettings;->getHeight()F

    move-result v7

    mul-float/2addr v6, v7

    float-to-int v6, v6

    invoke-direct {v4, v5, v6}, Landroid/util/Size;-><init>(II)V

    new-instance v5, Landroid/util/Size;

    .line 184
    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Landroidx/camera/core/processing/util/OutputSurface;->getHeight()I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/util/Size;-><init>(II)V

    .line 181
    invoke-static {v4, v5, p4}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->getTransformMatrix(Landroid/util/Size;Landroid/util/Size;Landroidx/camera/core/LayoutSettings;)[F

    move-result-object v4

    .line 186
    .local v4, "transTransform":[F
    invoke-virtual {v3, v4}, Landroidx/camera/core/processing/util/GLUtils$Program2D;->updateTransformMatrix([F)V

    .line 188
    invoke-virtual {p4}, Landroidx/camera/core/LayoutSettings;->getAlpha()F

    move-result v5

    invoke-virtual {v3, v5}, Landroidx/camera/core/processing/util/GLUtils$Program2D;->updateAlpha(F)V

    .line 190
    const/16 v5, 0xbe2

    invoke-static {v5}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 191
    const/16 v6, 0x302

    const/4 v7, 0x1

    const/16 v8, 0x303

    invoke-static {v6, v8, v7, v8}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 197
    const/4 v6, 0x5

    const/4 v7, 0x4

    invoke-static {v6, v2, v7}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 198
    const-string/jumbo v2, "glDrawArrays"

    invoke-static {v2}, Landroidx/camera/core/processing/util/GLUtils;->checkGlErrorOrThrow(Ljava/lang/String;)V

    .line 200
    invoke-static {v5}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 201
    return-void
.end method


# virtual methods
.method public getTextureName(Z)I
    .locals 2
    .param p1, "isPrimary"    # Z

    .line 100
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/camera/core/processing/util/GLUtils;->checkInitializedOrThrow(Ljava/util/concurrent/atomic/AtomicBoolean;Z)V

    .line 101
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mGlThread:Ljava/lang/Thread;

    invoke-static {v0}, Landroidx/camera/core/processing/util/GLUtils;->checkGlThreadOrThrow(Ljava/lang/Thread;)V

    .line 103
    if-eqz p1, :cond_0

    iget v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryExternalTextureId:I

    goto :goto_0

    :cond_0
    iget v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryExternalTextureId:I

    :goto_0
    return v0
.end method

.method public init(Landroidx/camera/core/DynamicRange;Ljava/util/Map;)Landroidx/camera/core/processing/util/GraphicDeviceInfo;
    .locals 2
    .param p1, "dynamicRange"    # Landroidx/camera/core/DynamicRange;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/camera/core/DynamicRange;",
            "Ljava/util/Map<",
            "Landroidx/camera/core/processing/util/GLUtils$InputFormat;",
            "Landroidx/camera/core/processing/ShaderProvider;",
            ">;)",
            "Landroidx/camera/core/processing/util/GraphicDeviceInfo;"
        }
    .end annotation

    .line 79
    .local p2, "shaderProviderOverrides":Ljava/util/Map;, "Ljava/util/Map<Landroidx/camera/core/processing/util/GLUtils$InputFormat;Landroidx/camera/core/processing/ShaderProvider;>;"
    invoke-super {p0, p1, p2}, Landroidx/camera/core/processing/OpenGlRenderer;->init(Landroidx/camera/core/DynamicRange;Ljava/util/Map;)Landroidx/camera/core/processing/util/GraphicDeviceInfo;

    move-result-object v0

    .line 80
    .local v0, "graphicDeviceInfo":Landroidx/camera/core/processing/util/GraphicDeviceInfo;
    invoke-static {}, Landroidx/camera/core/processing/util/GLUtils;->createTexture()I

    move-result v1

    iput v1, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryExternalTextureId:I

    .line 81
    invoke-static {}, Landroidx/camera/core/processing/util/GLUtils;->createTexture()I

    move-result v1

    iput v1, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryExternalTextureId:I

    .line 82
    return-object v0
.end method

.method public release()V
    .locals 1

    .line 87
    invoke-super {p0}, Landroidx/camera/core/processing/OpenGlRenderer;->release()V

    .line 88
    const/4 v0, -0x1

    iput v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryExternalTextureId:I

    .line 89
    iput v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryExternalTextureId:I

    .line 90
    return-void
.end method

.method public render(JLandroid/view/Surface;Landroidx/camera/core/SurfaceOutput;Landroid/graphics/SurfaceTexture;Landroid/graphics/SurfaceTexture;)V
    .locals 9
    .param p1, "timestampNs"    # J
    .param p3, "surface"    # Landroid/view/Surface;
    .param p4, "surfaceOutput"    # Landroidx/camera/core/SurfaceOutput;
    .param p5, "primarySurfaceTexture"    # Landroid/graphics/SurfaceTexture;
    .param p6, "secondarySurfaceTexture"    # Landroid/graphics/SurfaceTexture;

    .line 118
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mInitialized:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroidx/camera/core/processing/util/GLUtils;->checkInitializedOrThrow(Ljava/util/concurrent/atomic/AtomicBoolean;Z)V

    .line 119
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mGlThread:Ljava/lang/Thread;

    invoke-static {v0}, Landroidx/camera/core/processing/util/GLUtils;->checkGlThreadOrThrow(Ljava/lang/Thread;)V

    .line 121
    invoke-virtual {p0, p3}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->getOutSurfaceOrThrow(Landroid/view/Surface;)Landroidx/camera/core/processing/util/OutputSurface;

    move-result-object v0

    .line 123
    .local v0, "outputSurface":Landroidx/camera/core/processing/util/OutputSurface;
    sget-object v1, Landroidx/camera/core/processing/util/GLUtils;->NO_OUTPUT_SURFACE:Landroidx/camera/core/processing/util/OutputSurface;

    if-ne v0, v1, :cond_1

    .line 124
    invoke-virtual {p0, p3}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->createOutputSurfaceInternal(Landroid/view/Surface;)Landroidx/camera/core/processing/util/OutputSurface;

    move-result-object v0

    .line 125
    if-nez v0, :cond_0

    .line 126
    return-void

    .line 129
    :cond_0
    iget-object v1, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mOutputSurfaceMap:Ljava/util/Map;

    invoke-interface {v1, p3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v0

    goto :goto_0

    .line 123
    :cond_1
    move-object v3, v0

    .line 132
    .end local v0    # "outputSurface":Landroidx/camera/core/processing/util/OutputSurface;
    .local v3, "outputSurface":Landroidx/camera/core/processing/util/OutputSurface;
    :goto_0
    iget-object v0, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    if-eq p3, v0, :cond_2

    .line 133
    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->makeCurrent(Landroid/opengl/EGLSurface;)V

    .line 134
    iput-object p3, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mCurrentSurface:Landroid/view/Surface;

    .line 137
    :cond_2
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {v1, v1, v1, v0}, Landroid/opengl/GLES30;->glClearColor(FFFF)V

    .line 138
    const/16 v0, 0x4000

    invoke-static {v0}, Landroid/opengl/GLES30;->glClear(I)V

    .line 140
    iget-object v6, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryLayoutSettings:Landroidx/camera/core/LayoutSettings;

    iget v7, p0, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mPrimaryExternalTextureId:I

    const/4 v8, 0x1

    move-object v2, p0

    move-object v4, p4

    move-object v5, p5

    .end local p4    # "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    .end local p5    # "primarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    .local v4, "surfaceOutput":Landroidx/camera/core/SurfaceOutput;
    .local v5, "primarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    invoke-direct/range {v2 .. v8}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->renderInternal(Landroidx/camera/core/processing/util/OutputSurface;Landroidx/camera/core/SurfaceOutput;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/LayoutSettings;IZ)V

    .line 144
    move-object p4, v5

    .end local v5    # "primarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    .local p4, "primarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    iget-object v6, v2, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryLayoutSettings:Landroidx/camera/core/LayoutSettings;

    iget v7, v2, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mSecondaryExternalTextureId:I

    move-object v5, p6

    .end local p6    # "secondarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    .local v5, "secondarySurfaceTexture":Landroid/graphics/SurfaceTexture;
    invoke-direct/range {v2 .. v8}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->renderInternal(Landroidx/camera/core/processing/util/OutputSurface;Landroidx/camera/core/SurfaceOutput;Landroid/graphics/SurfaceTexture;Landroidx/camera/core/LayoutSettings;IZ)V

    .line 147
    iget-object p5, v2, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object p6

    invoke-static {p5, p6, p1, p2}, Landroid/opengl/EGLExt;->eglPresentationTimeANDROID(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;J)Z

    .line 149
    iget-object p5, v2, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->mEglDisplay:Landroid/opengl/EGLDisplay;

    invoke-virtual {v3}, Landroidx/camera/core/processing/util/OutputSurface;->getEglSurface()Landroid/opengl/EGLSurface;

    move-result-object p6

    invoke-static {p5, p6}, Landroid/opengl/EGL14;->eglSwapBuffers(Landroid/opengl/EGLDisplay;Landroid/opengl/EGLSurface;)Z

    move-result p5

    if-nez p5, :cond_3

    .line 150
    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string p6, "Failed to swap buffers with EGL error: 0x"

    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    .line 151
    invoke-static {}, Landroid/opengl/EGL14;->eglGetError()I

    move-result p6

    .line 150
    invoke-static {p6}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p6

    invoke-virtual {p5, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    const-string p6, "DualOpenGlRenderer"

    invoke-static {p6, p5}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    const/4 p5, 0x0

    invoke-virtual {p0, p3, p5}, Landroidx/camera/core/processing/concurrent/DualOpenGlRenderer;->removeOutputSurfaceInternal(Landroid/view/Surface;Z)V

    .line 154
    :cond_3
    return-void
.end method
