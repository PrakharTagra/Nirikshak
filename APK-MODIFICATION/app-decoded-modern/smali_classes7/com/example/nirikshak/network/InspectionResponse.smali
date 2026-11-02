.class public final Lcom/example/nirikshak/network/InspectionResponse;
.super Ljava/lang/Object;
.source "ComplianceApiService.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0015\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B?\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u0012\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003JC\u0010\u0019\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u00072\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001J\u0014\u0010\u001a\u001a\u00020\u00032\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u001c\u001a\u00020\u001dH\u00d6\u0081\u0004J\n\u0010\u001e\u001a\u00020\u0007H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011R\u0013\u0010\u0008\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0011R\u0013\u0010\t\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0011\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/example/nirikshak/network/InspectionResponse;",
        "",
        "success",
        "",
        "data",
        "Lcom/example/nirikshak/network/ComplianceReportData;",
        "error",
        "",
        "message",
        "detail",
        "<init>",
        "(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V",
        "getSuccess",
        "()Z",
        "getData",
        "()Lcom/example/nirikshak/network/ComplianceReportData;",
        "getError",
        "()Ljava/lang/String;",
        "getMessage",
        "getDetail",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
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
.field private final data:Lcom/example/nirikshak/network/ComplianceReportData;

.field private final detail:Ljava/lang/String;

.field private final error:Ljava/lang/String;

.field private final message:Ljava/lang/String;

.field private final success:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/example/nirikshak/network/InspectionResponse;->$stable:I

    return-void
.end method

.method public constructor <init>(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "success"    # Z
    .param p2, "data"    # Lcom/example/nirikshak/network/ComplianceReportData;
    .param p3, "error"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "detail"    # Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-boolean p1, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    .line 20
    iput-object p2, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    .line 21
    iput-object p3, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    .line 22
    iput-object p4, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    .line 23
    iput-object p5, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public synthetic constructor <init>(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 18
    and-int/lit8 p7, p6, 0x2

    const/4 v0, 0x0

    if-eqz p7, :cond_0

    .line 20
    move-object p2, v0

    .line 18
    :cond_0
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_1

    .line 21
    move-object p3, v0

    .line 18
    :cond_1
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_2

    .line 22
    move-object p4, v0

    .line 18
    :cond_2
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_3

    .line 23
    move-object p6, v0

    goto :goto_0

    .line 18
    :cond_3
    move-object p6, p5

    :goto_0
    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p6}, Lcom/example/nirikshak/network/InspectionResponse;-><init>(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/network/InspectionResponse;ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/example/nirikshak/network/InspectionResponse;
    .locals 0

    and-int/lit8 p7, p6, 0x1

    if-eqz p7, :cond_0

    iget-boolean p1, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    :cond_0
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    :cond_1
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_2

    iget-object p3, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    :cond_2
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_3

    iget-object p4, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    :cond_3
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_4

    iget-object p5, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    :cond_4
    move-object p6, p4

    move-object p7, p5

    move-object p4, p2

    move-object p5, p3

    move-object p2, p0

    move p3, p1

    invoke-virtual/range {p2 .. p7}, Lcom/example/nirikshak/network/InspectionResponse;->copy(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/example/nirikshak/network/InspectionResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    return v0
.end method

.method public final component2()Lcom/example/nirikshak/network/ComplianceReportData;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/example/nirikshak/network/InspectionResponse;
    .locals 6

    new-instance v0, Lcom/example/nirikshak/network/InspectionResponse;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/example/nirikshak/network/InspectionResponse;-><init>(ZLcom/example/nirikshak/network/ComplianceReportData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/network/InspectionResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/network/InspectionResponse;

    iget-boolean v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    iget-object v4, v1, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    iget-object v1, v1, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final getData()Lcom/example/nirikshak/network/ComplianceReportData;
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    return-object v0
.end method

.method public final getDetail()Ljava/lang/String;
    .locals 1

    .line 23
    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    return-object v0
.end method

.method public final getError()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    return-object v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 1

    .line 22
    iget-object v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final getSuccess()Z
    .locals 1

    .line 19
    iget-boolean v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    iget-boolean v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v2}, Lcom/example/nirikshak/network/ComplianceReportData;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    iget-boolean v0, p0, Lcom/example/nirikshak/network/InspectionResponse;->success:Z

    iget-object v1, p0, Lcom/example/nirikshak/network/InspectionResponse;->data:Lcom/example/nirikshak/network/ComplianceReportData;

    iget-object v2, p0, Lcom/example/nirikshak/network/InspectionResponse;->error:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/network/InspectionResponse;->message:Ljava/lang/String;

    iget-object v4, p0, Lcom/example/nirikshak/network/InspectionResponse;->detail:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "InspectionResponse(success="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", data="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", error="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", detail="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
