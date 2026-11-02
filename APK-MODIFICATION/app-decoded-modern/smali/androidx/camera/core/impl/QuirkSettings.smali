.class public Landroidx/camera/core/impl/QuirkSettings;
.super Ljava/lang/Object;
.source "QuirkSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/camera/core/impl/QuirkSettings$Builder;
    }
.end annotation


# instance fields
.field private final mEnabledWhenDeviceHasQuirk:Z

.field private final mForceDisabledQuirks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mForceEnabledQuirks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(ZLjava/util/Set;Ljava/util/Set;)V
    .locals 1
    .param p1, "enabledWhenDeviceHasQuirk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;)V"
        }
    .end annotation

    .line 60
    .local p2, "forceEnabledQuirks":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;>;"
    .local p3, "forceDisabledQuirks":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-boolean p1, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    .line 62
    if-nez p2, :cond_0

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    :goto_0
    iput-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    .line 64
    if-nez p3, :cond_1

    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    :goto_1
    iput-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    .line 66
    return-void
.end method

.method synthetic constructor <init>(ZLjava/util/Set;Ljava/util/Set;Landroidx/camera/core/impl/QuirkSettings$1;)V
    .locals 0
    .param p1, "x0"    # Z
    .param p2, "x1"    # Ljava/util/Set;
    .param p3, "x2"    # Ljava/util/Set;
    .param p4, "x3"    # Landroidx/camera/core/impl/QuirkSettings$1;

    .line 44
    invoke-direct {p0, p1, p2, p3}, Landroidx/camera/core/impl/QuirkSettings;-><init>(ZLjava/util/Set;Ljava/util/Set;)V

    return-void
.end method

.method public static withAllQuirksDisabled()Landroidx/camera/core/impl/QuirkSettings;
    .locals 2

    .line 87
    new-instance v0, Landroidx/camera/core/impl/QuirkSettings$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/QuirkSettings$Builder;->setEnabledWhenDeviceHasQuirk(Z)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->build()Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v0

    return-object v0
.end method

.method public static withDefaultBehavior()Landroidx/camera/core/impl/QuirkSettings;
    .locals 2

    .line 77
    new-instance v0, Landroidx/camera/core/impl/QuirkSettings$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/camera/core/impl/QuirkSettings$Builder;->setEnabledWhenDeviceHasQuirk(Z)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->build()Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v0

    return-object v0
.end method

.method public static withQuirksForceDisabled(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;)",
            "Landroidx/camera/core/impl/QuirkSettings;"
        }
    .end annotation

    .line 111
    .local p0, "quirks":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;>;"
    new-instance v0, Landroidx/camera/core/impl/QuirkSettings$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;-><init>()V

    invoke-virtual {v0, p0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->forceDisableQuirks(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->build()Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v0

    return-object v0
.end method

.method public static withQuirksForceEnabled(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;)",
            "Landroidx/camera/core/impl/QuirkSettings;"
        }
    .end annotation

    .line 99
    .local p0, "quirks":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;>;"
    new-instance v0, Landroidx/camera/core/impl/QuirkSettings$Builder;

    invoke-direct {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;-><init>()V

    invoke-virtual {v0, p0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->forceEnableQuirks(Ljava/util/Set;)Landroidx/camera/core/impl/QuirkSettings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/camera/core/impl/QuirkSettings$Builder;->build()Landroidx/camera/core/impl/QuirkSettings;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .line 166
    instance-of v0, p1, Landroidx/camera/core/impl/QuirkSettings;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 167
    return v1

    .line 169
    :cond_0
    const/4 v0, 0x1

    if-ne p0, p1, :cond_1

    .line 170
    return v0

    .line 172
    :cond_1
    move-object v2, p1

    check-cast v2, Landroidx/camera/core/impl/QuirkSettings;

    .line 173
    .local v2, "other":Landroidx/camera/core/impl/QuirkSettings;
    iget-boolean v3, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    iget-boolean v4, v2, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    iget-object v4, v2, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    .line 174
    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    iget-object v4, v2, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    .line 175
    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    move v1, v0

    goto :goto_0

    :cond_2
    nop

    .line 173
    :goto_0
    return v1
.end method

.method public getForceDisabledQuirks()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;"
        }
    .end annotation

    .line 140
    iget-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getForceEnabledQuirks()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;>;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 180
    iget-boolean v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    iget-object v2, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    filled-new-array {v0, v1, v2}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEnabledWhenDeviceHasQuirk()Z
    .locals 1

    .line 120
    iget-boolean v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    return v0
.end method

.method public shouldEnableQuirk(Ljava/lang/Class;Z)Z
    .locals 3
    .param p2, "deviceHasQuirk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/camera/core/impl/Quirk;",
            ">;Z)Z"
        }
    .end annotation

    .line 155
    .local p1, "quirk":Ljava/lang/Class;, "Ljava/lang/Class<+Landroidx/camera/core/impl/Quirk;>;"
    iget-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 156
    return v1

    .line 157
    :cond_0
    iget-object v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 158
    return v2

    .line 160
    :cond_1
    iget-boolean v0, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    if-eqz v0, :cond_2

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    move v1, v2

    :goto_0
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 186
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "QuirkSettings{enabledWhenDeviceHasQuirk="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/camera/core/impl/QuirkSettings;->mEnabledWhenDeviceHasQuirk:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", forceEnabledQuirks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceEnabledQuirks:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", forceDisabledQuirks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/camera/core/impl/QuirkSettings;->mForceDisabledQuirks:Ljava/util/Set;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
