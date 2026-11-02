.class public final Lcom/example/nirikshak/network/CreateReportRequest;
.super Ljava/lang/Object;
.source "ApiService.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0010\u0008\n\u0002\u0008 \n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0087\u0008\u0018\u00002\u00020\u0001B\u0083\u0001\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r\u0012\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\u000f\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\t\u0010 \u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\u000b\u0010#\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\t\u0010$\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\t\u0010&\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\'\u001a\u00020\u0003H\u00c6\u0003J\t\u0010(\u001a\u00020\u0003H\u00c6\u0003J\t\u0010)\u001a\u00020\rH\u00c6\u0003J\u000b\u0010*\u001a\u0004\u0018\u00010\u0003H\u00c6\u0003J\t\u0010+\u001a\u00020\u0003H\u00c6\u0003J\u008b\u0001\u0010,\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00032\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\u0007\u001a\u00020\u00032\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\t\u001a\u00020\u00032\u0008\u0008\u0002\u0010\n\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r2\n\u0008\u0002\u0010\u000e\u001a\u0004\u0018\u00010\u00032\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0003H\u00c6\u0001J\u0014\u0010-\u001a\u00020.2\u0008\u0010/\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u00100\u001a\u00020\rH\u00d6\u0081\u0004J\n\u00101\u001a\u00020\u0003H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013R\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0013R\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0013R\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0013R\u0011\u0010\u0007\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0013R\u0013\u0010\u0008\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0013R\u0011\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0019\u0010\u0013R\u0011\u0010\n\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0013R\u0011\u0010\u000b\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u0013R\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u0013\u0010\u000e\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001e\u0010\u0013R\u0011\u0010\u000f\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010\u0013\u00a8\u00062"
    }
    d2 = {
        "Lcom/example/nirikshak/network/CreateReportRequest;",
        "",
        "officerEmail",
        "",
        "officerId",
        "jurisdictionId",
        "reportId",
        "productName",
        "brand",
        "verdict",
        "status",
        "complianceResult",
        "imagesCount",
        "",
        "remarks",
        "fileUrl",
        "<init>",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V",
        "getOfficerEmail",
        "()Ljava/lang/String;",
        "getOfficerId",
        "getJurisdictionId",
        "getReportId",
        "getProductName",
        "getBrand",
        "getVerdict",
        "getStatus",
        "getComplianceResult",
        "getImagesCount",
        "()I",
        "getRemarks",
        "getFileUrl",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "component9",
        "component10",
        "component11",
        "component12",
        "copy",
        "equals",
        "",
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
.field private final brand:Ljava/lang/String;

.field private final complianceResult:Ljava/lang/String;

.field private final fileUrl:Ljava/lang/String;

.field private final imagesCount:I

.field private final jurisdictionId:Ljava/lang/String;

.field private final officerEmail:Ljava/lang/String;

.field private final officerId:Ljava/lang/String;

.field private final productName:Ljava/lang/String;

.field private final remarks:Ljava/lang/String;

.field private final reportId:Ljava/lang/String;

.field private final status:Ljava/lang/String;

.field private final verdict:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "officerEmail"    # Ljava/lang/String;
    .param p2, "officerId"    # Ljava/lang/String;
    .param p3, "jurisdictionId"    # Ljava/lang/String;
    .param p4, "reportId"    # Ljava/lang/String;
    .param p5, "productName"    # Ljava/lang/String;
    .param p6, "brand"    # Ljava/lang/String;
    .param p7, "verdict"    # Ljava/lang/String;
    .param p8, "status"    # Ljava/lang/String;
    .param p9, "complianceResult"    # Ljava/lang/String;
    .param p10, "imagesCount"    # I
    .param p11, "remarks"    # Ljava/lang/String;
    .param p12, "fileUrl"    # Ljava/lang/String;

    const-string v0, "officerEmail"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productName"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "verdict"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    invoke-static {p8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "complianceResult"

    invoke-static {p9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fileUrl"

    invoke-static {p12, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p1, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    .line 120
    iput-object p2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    .line 121
    iput-object p3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    .line 122
    iput-object p4, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    .line 123
    iput-object p5, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    .line 124
    iput-object p6, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    .line 125
    iput-object p7, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    .line 126
    iput-object p8, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    .line 127
    iput-object p9, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    .line 128
    iput p10, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    .line 129
    iput-object p11, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    .line 130
    iput-object p12, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 118
    and-int/lit8 p14, p13, 0x2

    const/4 v0, 0x0

    if-eqz p14, :cond_0

    .line 120
    move-object p2, v0

    .line 118
    :cond_0
    and-int/lit8 p14, p13, 0x4

    if-eqz p14, :cond_1

    .line 121
    move-object p3, v0

    .line 118
    :cond_1
    and-int/lit8 p14, p13, 0x8

    if-eqz p14, :cond_2

    .line 122
    move-object p4, v0

    .line 118
    :cond_2
    and-int/lit8 p14, p13, 0x20

    if-eqz p14, :cond_3

    .line 124
    const-string p6, "Rule 6 / Rule 9 Act"

    .line 118
    :cond_3
    and-int/lit8 p14, p13, 0x40

    if-eqz p14, :cond_4

    .line 125
    const-string p7, "PENDING"

    .line 118
    :cond_4
    and-int/lit16 p14, p13, 0x80

    if-eqz p14, :cond_5

    .line 126
    const-string p8, "pending"

    .line 118
    :cond_5
    and-int/lit16 p14, p13, 0x100

    if-eqz p14, :cond_6

    .line 127
    const-string p9, "COMPLIANT"

    .line 118
    :cond_6
    and-int/lit16 p14, p13, 0x200

    if-eqz p14, :cond_7

    .line 128
    const/4 p10, 0x1

    .line 118
    :cond_7
    and-int/lit16 p13, p13, 0x400

    if-eqz p13, :cond_8

    .line 129
    const-string p11, "Automated ComplianceEngine Metrology Audit"

    .line 118
    :cond_8
    move-object p13, p12

    move-object p12, p11

    move p11, p10

    move-object p10, p9

    move-object p9, p8

    move-object p8, p7

    move-object p7, p6

    move-object p6, p5

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move-object p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p13}, Lcom/example/nirikshak/network/CreateReportRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/network/CreateReportRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Lcom/example/nirikshak/network/CreateReportRequest;
    .locals 0

    and-int/lit8 p14, p13, 0x1

    if-eqz p14, :cond_0

    iget-object p1, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    :cond_0
    and-int/lit8 p14, p13, 0x2

    if-eqz p14, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    :cond_1
    and-int/lit8 p14, p13, 0x4

    if-eqz p14, :cond_2

    iget-object p3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    :cond_2
    and-int/lit8 p14, p13, 0x8

    if-eqz p14, :cond_3

    iget-object p4, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    :cond_3
    and-int/lit8 p14, p13, 0x10

    if-eqz p14, :cond_4

    iget-object p5, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    :cond_4
    and-int/lit8 p14, p13, 0x20

    if-eqz p14, :cond_5

    iget-object p6, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    :cond_5
    and-int/lit8 p14, p13, 0x40

    if-eqz p14, :cond_6

    iget-object p7, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    :cond_6
    and-int/lit16 p14, p13, 0x80

    if-eqz p14, :cond_7

    iget-object p8, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    :cond_7
    and-int/lit16 p14, p13, 0x100

    if-eqz p14, :cond_8

    iget-object p9, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    :cond_8
    and-int/lit16 p14, p13, 0x200

    if-eqz p14, :cond_9

    iget p10, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    :cond_9
    and-int/lit16 p14, p13, 0x400

    if-eqz p14, :cond_a

    iget-object p11, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    :cond_a
    and-int/lit16 p13, p13, 0x800

    if-eqz p13, :cond_b

    iget-object p12, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    :cond_b
    move-object p13, p11

    move-object p14, p12

    move-object p11, p9

    move p12, p10

    move-object p9, p7

    move-object p10, p8

    move-object p7, p5

    move-object p8, p6

    move-object p5, p3

    move-object p6, p4

    move-object p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p14}, Lcom/example/nirikshak/network/CreateReportRequest;->copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/example/nirikshak/network/CreateReportRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    return-object v0
.end method

.method public final component10()I
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    return v0
.end method

.method public final component11()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    return-object v0
.end method

.method public final component12()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    return-object v0
.end method

.method public final component5()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    return-object v0
.end method

.method public final component7()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    return-object v0
.end method

.method public final component8()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    return-object v0
.end method

.method public final component9()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    return-object v0
.end method

.method public final copy(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Lcom/example/nirikshak/network/CreateReportRequest;
    .locals 14

    const-string v0, "officerEmail"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "productName"

    move-object/from16 v6, p5

    invoke-static {v6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "verdict"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "status"

    move-object/from16 v9, p8

    invoke-static {v9, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "complianceResult"

    move-object/from16 v10, p9

    invoke-static {v10, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "fileUrl"

    move-object/from16 v13, p12

    invoke-static {v13, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/example/nirikshak/network/CreateReportRequest;

    move-object v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p6

    move/from16 v11, p10

    move-object/from16 v12, p11

    invoke-direct/range {v1 .. v13}, Lcom/example/nirikshak/network/CreateReportRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/network/CreateReportRequest;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/network/CreateReportRequest;

    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    return v2

    :cond_7
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    return v2

    :cond_8
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    return v2

    :cond_9
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    return v2

    :cond_a
    iget v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    iget v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    if-eq v3, v4, :cond_b

    return v2

    :cond_b
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_c

    return v2

    :cond_c
    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    iget-object v1, v1, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return v2

    :cond_d
    return v0
.end method

.method public final getBrand()Ljava/lang/String;
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    return-object v0
.end method

.method public final getComplianceResult()Ljava/lang/String;
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    return-object v0
.end method

.method public final getFileUrl()Ljava/lang/String;
    .locals 1

    .line 130
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public final getImagesCount()I
    .locals 1

    .line 128
    iget v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    return v0
.end method

.method public final getJurisdictionId()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    return-object v0
.end method

.method public final getOfficerEmail()Ljava/lang/String;
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    return-object v0
.end method

.method public final getOfficerId()Ljava/lang/String;
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    return-object v0
.end method

.method public final getProductName()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    return-object v0
.end method

.method public final getRemarks()Ljava/lang/String;
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    return-object v0
.end method

.method public final getReportId()Ljava/lang/String;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    return-object v0
.end method

.method public final getStatus()Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    return-object v0
.end method

.method public final getVerdict()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    if-nez v2, :cond_3

    move v2, v3

    goto :goto_3

    :cond_3
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_3
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    invoke-static {v2}, Ljava/lang/Integer;->hashCode(I)I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    if-nez v2, :cond_4

    goto :goto_4

    :cond_4
    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 14

    iget-object v0, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerEmail:Ljava/lang/String;

    iget-object v1, p0, Lcom/example/nirikshak/network/CreateReportRequest;->officerId:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/nirikshak/network/CreateReportRequest;->jurisdictionId:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/network/CreateReportRequest;->reportId:Ljava/lang/String;

    iget-object v4, p0, Lcom/example/nirikshak/network/CreateReportRequest;->productName:Ljava/lang/String;

    iget-object v5, p0, Lcom/example/nirikshak/network/CreateReportRequest;->brand:Ljava/lang/String;

    iget-object v6, p0, Lcom/example/nirikshak/network/CreateReportRequest;->verdict:Ljava/lang/String;

    iget-object v7, p0, Lcom/example/nirikshak/network/CreateReportRequest;->status:Ljava/lang/String;

    iget-object v8, p0, Lcom/example/nirikshak/network/CreateReportRequest;->complianceResult:Ljava/lang/String;

    iget v9, p0, Lcom/example/nirikshak/network/CreateReportRequest;->imagesCount:I

    iget-object v10, p0, Lcom/example/nirikshak/network/CreateReportRequest;->remarks:Ljava/lang/String;

    iget-object v11, p0, Lcom/example/nirikshak/network/CreateReportRequest;->fileUrl:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "CreateReportRequest(officerEmail="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v12, ", officerId="

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", jurisdictionId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", reportId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", productName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", brand="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", verdict="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", status="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", complianceResult="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imagesCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", remarks="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", fileUrl="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
