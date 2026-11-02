.class public final Landroidx/camera/core/impl/utils/ContextUtil;
.super Ljava/lang/Object;
.source "ContextUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/utils/ContextUtil$Api34Impl;,
        Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    return-void
.end method

.method public static getApplicationContext(Landroid/content/Context;)Landroid/content/Context;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 39
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 40
    .local v0, "resultContext":Landroid/content/Context;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_0

    .line 41
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil$Api34Impl;->getDeviceId(Landroid/content/Context;)I

    move-result v1

    .line 42
    .local v1, "deviceIdContext":I
    invoke-static {v0}, Landroidx/camera/core/impl/utils/ContextUtil$Api34Impl;->getDeviceId(Landroid/content/Context;)I

    move-result v2

    .line 43
    .local v2, "deviceIdResultContext":I
    if-eq v1, v2, :cond_0

    .line 44
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/ContextUtil$Api34Impl;->createDeviceContext(Landroid/content/Context;I)Landroid/content/Context;

    move-result-object v0

    .line 47
    .end local v1    # "deviceIdContext":I
    .end local v2    # "deviceIdResultContext":I
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1e

    if-lt v1, v2, :cond_1

    .line 48
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->getAttributionTag(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "attributeTagContext":Ljava/lang/String;
    invoke-static {v0}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->getAttributionTag(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 50
    .local v2, "attributeTagResultContext":Ljava/lang/String;
    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 51
    invoke-static {v0, v1}, Landroidx/camera/core/impl/utils/ContextUtil$Api30Impl;->createAttributionContext(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Context;

    move-result-object v0

    .line 55
    .end local v1    # "attributeTagContext":Ljava/lang/String;
    .end local v2    # "attributeTagResultContext":Ljava/lang/String;
    :cond_1
    return-object v0
.end method

.method public static getApplicationFromContext(Landroid/content/Context;)Landroid/app/Application;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 75
    const/4 v0, 0x0

    .line 76
    .local v0, "application":Landroid/app/Application;
    invoke-static {p0}, Landroidx/camera/core/impl/utils/ContextUtil;->getApplicationContext(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    .line 77
    .local v1, "appContext":Landroid/content/Context;
    :goto_0
    instance-of v2, v1, Landroid/content/ContextWrapper;

    if-eqz v2, :cond_1

    .line 78
    instance-of v2, v1, Landroid/app/Application;

    if-eqz v2, :cond_0

    .line 79
    move-object v0, v1

    check-cast v0, Landroid/app/Application;

    .line 80
    goto :goto_1

    .line 82
    :cond_0
    move-object v2, v1

    check-cast v2, Landroid/content/ContextWrapper;

    invoke-virtual {v2}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    goto :goto_0

    .line 85
    :cond_1
    :goto_1
    return-object v0
.end method
