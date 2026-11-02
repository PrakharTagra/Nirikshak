.class public final Lcom/example/nirikshak/camera/LevelSensorState;
.super Ljava/lang/Object;
.source "SensorLevelManager.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0012\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0087\u0008\u0018\u00002\u00020\u0001BC\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0006\u0012\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u0006\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0006\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\t\u0010\u0013\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0015\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0016\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0017\u001a\u00020\u0006H\u00c6\u0003J\t\u0010\u0018\u001a\u00020\nH\u00c6\u0003JE\u0010\u0019\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00062\u0008\u0008\u0002\u0010\t\u001a\u00020\nH\u00c6\u0001J\u0014\u0010\u001a\u001a\u00020\u00062\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u001c\u001a\u00020\u001dH\u00d6\u0081\u0004J\n\u0010\u001e\u001a\u00020\u001fH\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0010R\u0011\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0010R\u0011\u0010\u0008\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0010R\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\u00a8\u0006 "
    }
    d2 = {
        "Lcom/example/nirikshak/camera/LevelSensorState;",
        "",
        "pitch",
        "",
        "roll",
        "isLevel",
        "",
        "isSeverelyTilted",
        "isUnstableMotion",
        "tiltDirection",
        "Lcom/example/nirikshak/camera/TiltDirection;",
        "<init>",
        "(FFZZZLcom/example/nirikshak/camera/TiltDirection;)V",
        "getPitch",
        "()F",
        "getRoll",
        "()Z",
        "getTiltDirection",
        "()Lcom/example/nirikshak/camera/TiltDirection;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
        "toString",
        "",
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


# static fields
.field public static final $stable:I


# instance fields
.field private final isLevel:Z

.field private final isSeverelyTilted:Z

.field private final isUnstableMotion:Z

.field private final pitch:F

.field private final roll:F

.field private final tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 9

    const/16 v7, 0x3f

    const/4 v8, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v8}, Lcom/example/nirikshak/camera/LevelSensorState;-><init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;)V
    .locals 1
    .param p1, "pitch"    # F
    .param p2, "roll"    # F
    .param p3, "isLevel"    # Z
    .param p4, "isSeverelyTilted"    # Z
    .param p5, "isUnstableMotion"    # Z
    .param p6, "tiltDirection"    # Lcom/example/nirikshak/camera/TiltDirection;

    const-string v0, "tiltDirection"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput p1, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    .line 22
    iput p2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    .line 23
    iput-boolean p3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    .line 24
    iput-boolean p4, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    .line 25
    iput-boolean p5, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    .line 26
    iput-object p6, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    .line 20
    return-void
.end method

.method public synthetic constructor <init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 20
    and-int/lit8 p8, p7, 0x1

    const/4 v0, 0x0

    if-eqz p8, :cond_0

    .line 21
    move p1, v0

    .line 20
    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    .line 22
    move p2, v0

    .line 20
    :cond_1
    and-int/lit8 p8, p7, 0x4

    const/4 v0, 0x0

    if-eqz p8, :cond_2

    .line 23
    move p3, v0

    .line 20
    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    .line 24
    move p4, v0

    .line 20
    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    .line 25
    move p5, v0

    .line 20
    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    .line 26
    sget-object p6, Lcom/example/nirikshak/camera/TiltDirection;->NONE:Lcom/example/nirikshak/camera/TiltDirection;

    move-object p7, p6

    goto :goto_0

    .line 20
    :cond_5
    move-object p7, p6

    :goto_0
    move p6, p5

    move p5, p4

    move p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p7}, Lcom/example/nirikshak/camera/LevelSensorState;-><init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;)V

    .line 27
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/camera/LevelSensorState;FFZZZLcom/example/nirikshak/camera/TiltDirection;ILjava/lang/Object;)Lcom/example/nirikshak/camera/LevelSensorState;
    .locals 0

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget p1, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget p2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget-boolean p3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget-boolean p4, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget-boolean p5, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-object p6, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    :cond_5
    move p7, p5

    move-object p8, p6

    move p5, p3

    move p6, p4

    move p3, p1

    move p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lcom/example/nirikshak/camera/LevelSensorState;->copy(FFZZZLcom/example/nirikshak/camera/TiltDirection;)Lcom/example/nirikshak/camera/LevelSensorState;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()F
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    return v0
.end method

.method public final component2()F
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    return v0
.end method

.method public final component3()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    return v0
.end method

.method public final component4()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    return v0
.end method

.method public final component5()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    return v0
.end method

.method public final component6()Lcom/example/nirikshak/camera/TiltDirection;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    return-object v0
.end method

.method public final copy(FFZZZLcom/example/nirikshak/camera/TiltDirection;)Lcom/example/nirikshak/camera/LevelSensorState;
    .locals 8

    const-string v0, "tiltDirection"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/example/nirikshak/camera/LevelSensorState;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/example/nirikshak/camera/LevelSensorState;-><init>(FFZZZLcom/example/nirikshak/camera/TiltDirection;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/camera/LevelSensorState;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/camera/LevelSensorState;

    iget v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    iget v4, v1, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-eqz v3, :cond_2

    return v2

    :cond_2
    iget v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    iget v4, v1, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    invoke-static {v3, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v3

    if-eqz v3, :cond_3

    return v2

    :cond_3
    iget-boolean v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    if-eq v3, v4, :cond_4

    return v2

    :cond_4
    iget-boolean v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    if-eq v3, v4, :cond_5

    return v2

    :cond_5
    iget-boolean v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    if-eq v3, v4, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    iget-object v1, v1, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    if-eq v3, v1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getPitch()F
    .locals 1

    .line 21
    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    return v0
.end method

.method public final getRoll()F
    .locals 1

    .line 22
    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    return v0
.end method

.method public final getTiltDirection()Lcom/example/nirikshak/camera/TiltDirection;
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    invoke-static {v2}, Ljava/lang/Float;->hashCode(F)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-boolean v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-boolean v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    invoke-static {v2}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    invoke-virtual {v2}, Lcom/example/nirikshak/camera/TiltDirection;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public final isLevel()Z
    .locals 1

    .line 23
    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    return v0
.end method

.method public final isSeverelyTilted()Z
    .locals 1

    .line 24
    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    return v0
.end method

.method public final isUnstableMotion()Z
    .locals 1

    .line 25
    iget-boolean v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    iget v0, p0, Lcom/example/nirikshak/camera/LevelSensorState;->pitch:F

    iget v1, p0, Lcom/example/nirikshak/camera/LevelSensorState;->roll:F

    iget-boolean v2, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isLevel:Z

    iget-boolean v3, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isSeverelyTilted:Z

    iget-boolean v4, p0, Lcom/example/nirikshak/camera/LevelSensorState;->isUnstableMotion:Z

    iget-object v5, p0, Lcom/example/nirikshak/camera/LevelSensorState;->tiltDirection:Lcom/example/nirikshak/camera/TiltDirection;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LevelSensorState(pitch="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ", roll="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isLevel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isSeverelyTilted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", isUnstableMotion="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tiltDirection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
