.class public final Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;
.super Ljava/lang/Object;
.source "ExtendedCameraConfigProviderStore.java"


# static fields
.field private static final CAMERA_CONFIG_PROVIDERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Landroidx/camera/core/impl/CameraConfigProvider;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOCK:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 31
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->LOCK:Ljava/lang/Object;

    .line 34
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->CAMERA_CONFIG_PROVIDERS:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static addConfig(Ljava/lang/Object;Landroidx/camera/core/impl/CameraConfigProvider;)V
    .locals 2
    .param p0, "key"    # Ljava/lang/Object;
    .param p1, "provider"    # Landroidx/camera/core/impl/CameraConfigProvider;

    .line 44
    sget-object v0, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 45
    :try_start_0
    sget-object v1, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->CAMERA_CONFIG_PROVIDERS:Ljava/util/Map;

    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    monitor-exit v0

    .line 47
    return-void

    .line 46
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static clear()V
    .locals 2

    .line 72
    sget-object v0, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 73
    :try_start_0
    sget-object v1, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->CAMERA_CONFIG_PROVIDERS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 74
    monitor-exit v0

    .line 75
    return-void

    .line 74
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getConfigProvider(Ljava/lang/Object;)Landroidx/camera/core/impl/CameraConfigProvider;
    .locals 2
    .param p0, "key"    # Ljava/lang/Object;

    .line 58
    sget-object v0, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 59
    :try_start_0
    sget-object v1, Landroidx/camera/core/impl/ExtendedCameraConfigProviderStore;->CAMERA_CONFIG_PROVIDERS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/camera/core/impl/CameraConfigProvider;

    .line 60
    .local v1, "provider":Landroidx/camera/core/impl/CameraConfigProvider;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    if-nez v1, :cond_0

    .line 63
    sget-object v0, Landroidx/camera/core/impl/CameraConfigProvider;->EMPTY:Landroidx/camera/core/impl/CameraConfigProvider;

    return-object v0

    .line 65
    :cond_0
    return-object v1

    .line 60
    .end local v1    # "provider":Landroidx/camera/core/impl/CameraConfigProvider;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
