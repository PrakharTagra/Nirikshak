.class public Landroidx/camera/core/impl/QuirkSettingsLoader;
.super Ljava/lang/Object;
.source "QuirkSettingsLoader.java"

# interfaces
.implements Landroidx/arch/core/util/Function;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/QuirkSettingsLoader$MetadataHolderService;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/arch/core/util/Function<",
        "Landroid/content/Context;",
        "Landroidx/camera/core/impl/QuirkSettings;",
        ">;"
    }
.end annotation


# static fields
.field public static final KEY_DEFAULT_QUIRK_ENABLED:Ljava/lang/String; = "androidx.camera.core.quirks.DEFAULT_QUIRK_ENABLED"

.field public static final KEY_QUIRK_FORCE_DISABLED:Ljava/lang/String; = "androidx.camera.core.quirks.FORCE_DISABLED"

.field public static final KEY_QUIRK_FORCE_ENABLED:Ljava/lang/String; = "androidx.camera.core.quirks.FORCE_ENABLED"

.field private static final TAG:Ljava/lang/String; = "QuirkSettingsLoader"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static buildQuirkSettings(Landroid/content/Context;Landroid/os/Bundle;)Landroidx/camera/core/impl/QuirkSettings;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "metadata"    # Landroid/os/Bundle;

    .line 150
    const-string v0, "androidx.camera.core.quirks.DEFAULT_QUIRK_ENABLED"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 151
    .local v0, "defaultEnabled":Z
    const-string v1, "androidx.camera.core.quirks.FORCE_ENABLED"

    invoke-static {p0, p1, v1}, Landroidx/camera/core/impl/QuirkSettingsLoader;->loadQuirks(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "forceEnabled":[Ljava/lang/String;
    const-string v2, "androidx.camera.core.quirks.FORCE_DISABLED"

    invoke-static {p0, p1, v2}, Landroidx/camera/core/impl/QuirkSettingsLoader;->loadQuirks(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 154
    .local v2, "forceDisabled":[Ljava/lang/String;
    const-string v3, "Loaded quirk settings from metadata:"

    const-string v4, "QuirkSettingsLoader"

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  KEY_DEFAULT_QUIRK_ENABLED = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  KEY_QUIRK_FORCE_ENABLED = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "  KEY_QUIRK_FORCE_DISABLED = "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    new-instance v3, Landroidx/camera/core/impl/QuirkSettings$Builder;

    invoke-direct {v3}, Landroidx/camera/core/impl/QuirkSettings$Builder;-><init>()V

    .line 160
    invoke-virtual {v3, v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->setEnabledWhenDeviceHasQuirk(Z)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v3

    .line 161
    invoke-static {v1}, Landroidx/camera/core/impl/QuirkSettingsLoader;->resolveQuirkNames([Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/QuirkSettings$Builder;->forceEnableQuirks(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v3

    .line 162
    invoke-static {v2}, Landroidx/camera/core/impl/QuirkSettingsLoader;->resolveQuirkNames([Ljava/lang/String;)Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroidx/camera/core/impl/QuirkSettings$Builder;->forceDisableQuirks(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v3

    .line 163
    invoke-virtual {v3}, Landroidx/camera/core/impl/QuirkSettings$Builder;->build()Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v3

    .line 159
    return-object v3
.end method

.method private static loadQuirks(Landroid/content/Context;Landroid/os/Bundle;Ljava/lang/String;)[Ljava/lang/String;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "metadata"    # Landroid/os/Bundle;
    .param p2, "key"    # Ljava/lang/String;

    .line 174
    invoke-virtual {p1, p2}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 175
    new-array v0, v1, [Ljava/lang/String;

    return-object v0

    .line 177
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 178
    .local v2, "resourceId":I
    const-string v3, "QuirkSettingsLoader"

    if-ne v2, v0, :cond_1

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Resource ID not found for key: "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    new-array v0, v1, [Ljava/lang/String;

    return-object v0

    .line 183
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 184
    :catch_0
    move-exception v0

    .line 185
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Quirk class names resource not found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 187
    .end local v0    # "e":Landroid/content/res/Resources$NotFoundException;
    new-array v0, v1, [Ljava/lang/String;

    return-object v0
.end method

.method private static resolveQuirkName(Ljava/lang/String;)Ljava/lang/Class;
    .locals 4
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;"
        }
    .end annotation

    .line 208
    const-string v0, "QuirkSettingsLoader"

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 209
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v2, Landroidx/camera/core/impl/Quirk;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 210
    return-object v1

    .line 212
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " does not implement the Quirk interface."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 216
    .end local v1    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_0

    .line 214
    :catch_0
    move-exception v1

    .line 215
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Class not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2, v1}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 217
    .end local v1    # "e":Ljava/lang/ClassNotFoundException;
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private static resolveQuirkNames([Ljava/lang/String;)Ljava/util/Set;
    .locals 5
    .param p0, "nameArray"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;"
        }
    .end annotation

    .line 193
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 194
    .local v0, "quirkSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;>;"
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    .line 195
    .local v3, "quirkName":Ljava/lang/String;
    invoke-static {v3}, Landroidx/camera/core/impl/QuirkSettingsLoader;->resolveQuirkName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 196
    .local v4, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;"
    if-eqz v4, :cond_0

    .line 197
    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 194
    .end local v3    # "quirkName":Ljava/lang/String;
    .end local v4    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;"
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 200
    :cond_1
    return-object v0
.end method


# virtual methods
.method public apply(Landroid/content/Context;)Landroidx/camera/core/impl/QuirkSettings;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .line 123
    const-string v0, "QuirkSettingsLoader"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 125
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Landroid/content/ComponentName;

    const-class v4, Landroidx/camera/core/impl/QuirkSettingsLoader$MetadataHolderService;

    invoke-direct {v3, p1, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v4, 0x280

    invoke-virtual {v1, v3, v4}, Landroid/content/pm/PackageManager;->getServiceInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ServiceInfo;

    move-result-object v3

    iget-object v3, v3, Landroid/content/pm/ServiceInfo;->metaData:Landroid/os/Bundle;

    .line 129
    .local v3, "metadata":Landroid/os/Bundle;
    if-nez v3, :cond_0

    .line 130
    const-string v4, "No metadata in MetadataHolderService."

    invoke-static {v0, v4}, Landroidx/camera/core/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    return-object v2

    .line 133
    :cond_0
    invoke-static {p1, v3}, Landroidx/camera/core/impl/QuirkSettingsLoader;->buildQuirkSettings(Landroid/content/Context;Landroid/os/Bundle;)Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 134
    .end local v3    # "metadata":Landroid/os/Bundle;
    :catch_0
    move-exception v3

    .line 135
    .local v3, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const-string v4, "QuirkSettings$MetadataHolderService is not found."

    invoke-static {v0, v4}, Landroidx/camera/core/Logger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .end local v3    # "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    return-object v2
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 78
    check-cast p1, Landroid/content/Context;

    invoke-virtual {p0, p1}, Landroidx/camera/core/impl/QuirkSettingsLoader;->apply(Landroid/content/Context;)Landroidx/camera/core/impl/QuirkSettings;

    move-result-object p1

    return-object p1
.end method
