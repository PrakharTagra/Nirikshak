.class public final Lcom/example/nirikshak/camera/QualityCheckResult;
.super Ljava/lang/Object;
.source "ImageQualityNormalizer.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0017\u0008\u0087\u0008\u0018\u00002\u00020\u0001B7\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\t\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\t\u0010\u0017\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u0018\u001a\u00020\u0005H\u00c6\u0003J\t\u0010\u0019\u001a\u00020\u0007H\u00c6\u0003J\t\u0010\u001a\u001a\u00020\u0007H\u00c6\u0003J\t\u0010\u001b\u001a\u00020\u0007H\u00c6\u0003J\t\u0010\u001c\u001a\u00020\u000bH\u00c6\u0003JE\u0010\u001d\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u00072\u0008\u0008\u0002\u0010\t\u001a\u00020\u00072\u0008\u0008\u0002\u0010\n\u001a\u00020\u000bH\u00c6\u0001J\u0014\u0010\u001e\u001a\u00020\u00032\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010 \u001a\u00020\u0007H\u00d6\u0081\u0004J\n\u0010!\u001a\u00020\u000bH\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0011\u0010\u0008\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0012R\u0011\u0010\t\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0012R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\""
    }
    d2 = {
        "Lcom/example/nirikshak/camera/QualityCheckResult;",
        "",
        "isValid",
        "",
        "normalizedFile",
        "Ljava/io/File;",
        "width",
        "",
        "height",
        "longestDimension",
        "message",
        "",
        "<init>",
        "(ZLjava/io/File;IIILjava/lang/String;)V",
        "()Z",
        "getNormalizedFile",
        "()Ljava/io/File;",
        "getWidth",
        "()I",
        "getHeight",
        "getLongestDimension",
        "getMessage",
        "()Ljava/lang/String;",
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
        "toString",
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
.field private final height:I

.field private final isValid:Z

.field private final longestDimension:I

.field private final message:Ljava/lang/String;

.field private final normalizedFile:Ljava/io/File;

.field private final width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/example/nirikshak/camera/QualityCheckResult;->$stable:I

    return-void
.end method

.method public constructor <init>(ZLjava/io/File;IIILjava/lang/String;)V
    .locals 1
    .param p1, "isValid"    # Z
    .param p2, "normalizedFile"    # Ljava/io/File;
    .param p3, "width"    # I
    .param p4, "height"    # I
    .param p5, "longestDimension"    # I
    .param p6, "message"    # Ljava/lang/String;

    const-string v0, "normalizedFile"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "message"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-boolean p1, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    .line 16
    iput-object p2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    .line 17
    iput p3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    .line 18
    iput p4, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    .line 19
    iput p5, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    .line 20
    iput-object p6, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    .line 14
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/camera/QualityCheckResult;ZLjava/io/File;IIILjava/lang/String;ILjava/lang/Object;)Lcom/example/nirikshak/camera/QualityCheckResult;
    .locals 0

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    iget-boolean p1, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    iget p3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    iget p4, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    iget p5, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    iget-object p6, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    :cond_5
    move p7, p5

    move-object p8, p6

    move p5, p3

    move p6, p4

    move p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p8}, Lcom/example/nirikshak/camera/QualityCheckResult;->copy(ZLjava/io/File;IIILjava/lang/String;)Lcom/example/nirikshak/camera/QualityCheckResult;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    return v0
.end method

.method public final component2()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    return-object v0
.end method

.method public final component3()I
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    return v0
.end method

.method public final component4()I
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    return v0
.end method

.method public final component5()I
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    return v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(ZLjava/io/File;IIILjava/lang/String;)Lcom/example/nirikshak/camera/QualityCheckResult;
    .locals 8

    const-string v0, "normalizedFile"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "message"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/example/nirikshak/camera/QualityCheckResult;

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/example/nirikshak/camera/QualityCheckResult;-><init>(ZLjava/io/File;IIILjava/lang/String;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/camera/QualityCheckResult;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/camera/QualityCheckResult;

    iget-boolean v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    iget-object v4, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    iget v4, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    if-eq v3, v4, :cond_4

    return v2

    :cond_4
    iget v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    iget v4, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    if-eq v3, v4, :cond_5

    return v2

    :cond_5
    iget v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    iget v4, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    if-eq v3, v4, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    iget-object v1, v1, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    return v2

    :cond_7
    return v0
.end method

.method public final getHeight()I
    .locals 1

    .line 18
    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    return v0
.end method

.method public final getLongestDimension()I
    .locals 1

    .line 19
    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    return v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final getNormalizedFile()Ljava/io/File;
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    return-object v0
.end method

.method public final getWidth()I
    .locals 1

    .line 17
    iget v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    return v0
.end method

.method public hashCode()I
    .locals 3

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public final isValid()Z
    .locals 1

    .line 15
    iget-boolean v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    iget-boolean v0, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->isValid:Z

    iget-object v1, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->normalizedFile:Ljava/io/File;

    iget v2, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->width:I

    iget v3, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->height:I

    iget v4, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->longestDimension:I

    iget-object v5, p0, Lcom/example/nirikshak/camera/QualityCheckResult;->message:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "QualityCheckResult(isValid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v6, ", normalizedFile="

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", width="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", height="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", longestDimension="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
