.class public final Lcom/example/nirikshak/network/CreateReportResponse;
.super Ljava/lang/Object;
.source "ApiService.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000f\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\t\u0010\u0010\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010\u0011\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0012\u001a\u0004\u0018\u00010\u0007H\u00c6\u0003J+\u0010\u0013\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u00c6\u0001J\u0014\u0010\u0014\u001a\u00020\u00032\u0008\u0010\u0015\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u0016\u001a\u00020\u0017H\u00d6\u0081\u0004J\n\u0010\u0018\u001a\u00020\u0005H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0019"
    }
    d2 = {
        "Lcom/example/nirikshak/network/CreateReportResponse;",
        "",
        "success",
        "",
        "message",
        "",
        "report",
        "Lcom/example/nirikshak/network/InspectionReportDto;",
        "<init>",
        "(ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;)V",
        "getSuccess",
        "()Z",
        "getMessage",
        "()Ljava/lang/String;",
        "getReport",
        "()Lcom/example/nirikshak/network/InspectionReportDto;",
        "component1",
        "component2",
        "component3",
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
.field private final message:Ljava/lang/String;

.field private final report:Lcom/example/nirikshak/network/InspectionReportDto;

.field private final success:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;)V
    .locals 0
    .param p1, "success"    # Z
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "report"    # Lcom/example/nirikshak/network/InspectionReportDto;

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-boolean p1, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    .line 135
    iput-object p2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    .line 136
    iput-object p3, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    .line 133
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/network/CreateReportResponse;ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;ILjava/lang/Object;)Lcom/example/nirikshak/network/CreateReportResponse;
    .locals 0

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    iget-boolean p1, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    :cond_0
    and-int/lit8 p5, p4, 0x2

    if-eqz p5, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    :cond_1
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_2

    iget-object p3, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/example/nirikshak/network/CreateReportResponse;->copy(ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;)Lcom/example/nirikshak/network/CreateReportResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    return v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Lcom/example/nirikshak/network/InspectionReportDto;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    return-object v0
.end method

.method public final copy(ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;)Lcom/example/nirikshak/network/CreateReportResponse;
    .locals 1

    new-instance v0, Lcom/example/nirikshak/network/CreateReportResponse;

    invoke-direct {v0, p1, p2, p3}, Lcom/example/nirikshak/network/CreateReportResponse;-><init>(ZLjava/lang/String;Lcom/example/nirikshak/network/InspectionReportDto;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/network/CreateReportResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/network/CreateReportResponse;

    iget-boolean v3, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    iget-object v1, v1, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    return v2

    :cond_4
    return v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final getReport()Lcom/example/nirikshak/network/InspectionReportDto;
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    return-object v0
.end method

.method public final getSuccess()Z
    .locals 1

    .line 134
    iget-boolean v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    iget-boolean v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    invoke-virtual {v2}, Lcom/example/nirikshak/network/InspectionReportDto;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    iget-boolean v0, p0, Lcom/example/nirikshak/network/CreateReportResponse;->success:Z

    iget-object v1, p0, Lcom/example/nirikshak/network/CreateReportResponse;->message:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportResponse;->report:Lcom/example/nirikshak/network/InspectionReportDto;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CreateReportResponse(success="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ", message="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", report="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
