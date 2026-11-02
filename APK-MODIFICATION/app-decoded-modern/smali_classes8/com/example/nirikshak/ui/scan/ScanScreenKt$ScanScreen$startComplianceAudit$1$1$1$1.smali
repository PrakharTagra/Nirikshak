.class final Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "ScanScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlinx/coroutines/CoroutineScope;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Ljava/lang/Object;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nScanScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ScanScreen.kt\ncom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,2005:1\n1#2:2006\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlinx/coroutines/CoroutineScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.example.nirikshak.ui.scan.ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1"
    f = "ScanScreen.kt"
    i = {
        0x0
    }
    l = {
        0xc6
    }
    m = "invokeSuspend"
    n = {
        "aiResult"
    }
    nl = {
        0xd5
    }
    s = {
        "L$0"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $backendApi:Lcom/example/nirikshak/network/ApiService;

.field final synthetic $images:Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $officerIdVal:Ljava/lang/String;

.field final synthetic $productCommodityName$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $rep:Lcom/example/nirikshak/network/ComplianceReportData;

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ComplianceReportData;Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Landroidx/compose/runtime/snapshots/SnapshotStateList;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ComplianceReportData;",
            "Lcom/example/nirikshak/network/ApiService;",
            "Ljava/lang/String;",
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$officerIdVal:Ljava/lang/String;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p6}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$officerIdVal:Ljava/lang/String;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;-><init>(Lcom/example/nirikshak/network/ComplianceReportData;Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Landroidx/compose/runtime/snapshots/SnapshotStateList;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlinx/coroutines/CoroutineScope;",
            "Lkotlin/coroutines/Continuation<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 19
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 195
    iget v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->label:I

    packed-switch v2, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .local v0, "aiResult":Ljava/lang/String;
    :try_start_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object/from16 v2, p1

    goto/16 :goto_3

    .end local v0    # "aiResult":Ljava/lang/String;
    :pswitch_1
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 196
    nop

    .line 197
    :try_start_1
    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v2}, Lcom/example/nirikshak/network/ComplianceReportData;->getComplianceResult()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    if-nez v2, :cond_1

    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v2}, Lcom/example/nirikshak/network/ComplianceReportData;->getStatus()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    const-string v4, "NON"

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v2, v4, v3}, Lkotlin/text/StringsKt;->contains(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "NON_COMPLIANT"

    goto :goto_0

    :cond_0
    const-string v2, "COMPLIANT"

    :cond_1
    :goto_0
    move-object v13, v2

    .line 198
    .local v13, "aiResult":Ljava/lang/String;
    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    .line 199
    nop

    .line 200
    sget-object v4, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v4}, Lcom/example/nirikshak/network/OfficerSession;->getEmail()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v5

    const/4 v6, 0x0

    if-nez v5, :cond_2

    move v5, v3

    goto :goto_1

    :cond_2
    move v5, v6

    :goto_1
    if-eqz v5, :cond_5

    .line 2006
    const/4 v4, 0x0

    .line 200
    .local v4, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$1\\1\\200\\0":I
    sget-object v5, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v5}, Lcom/example/nirikshak/network/OfficerSession;->getOfficerId()Ljava/lang/String;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v7

    if-nez v7, :cond_3

    move v7, v3

    goto :goto_2

    :cond_3
    move v7, v6

    :goto_2
    if-eqz v7, :cond_4

    .line 2006
    const/4 v5, 0x0

    .line 200
    .local v5, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$1$1\\2\\200\\1":I
    const-string v7, "officer@nic.in"

    move-object v5, v7

    .end local v5    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$1$1\\2\\200\\1":I
    :cond_4
    check-cast v5, Ljava/lang/String;

    move-object v4, v5

    .end local v4    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$1\\1\\200\\0":I
    :cond_5
    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    .line 201
    move v4, v6

    iget-object v6, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$officerIdVal:Ljava/lang/String;

    .line 202
    iget-object v7, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v7}, Lcom/example/nirikshak/network/ComplianceReportData;->getJurisdictionId()Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_8

    sget-object v7, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v7}, Lcom/example/nirikshak/network/OfficerSession;->getJurisdictionId()Ljava/lang/String;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_6

    move v4, v3

    :cond_6
    if-eqz v4, :cond_7

    .line 2006
    const/4 v4, 0x0

    .line 202
    .local v4, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$2\\3\\202\\0":I
    nop

    .end local v4    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1$2\\3\\202\\0":I
    const/4 v7, 0x0

    :cond_7
    check-cast v7, Ljava/lang/String;

    .line 203
    :cond_8
    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v4}, Lcom/example/nirikshak/network/ComplianceReportData;->getReportId()Ljava/lang/String;

    move-result-object v8

    .line 204
    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v4}, Lcom/example/nirikshak/network/ComplianceReportData;->getProductName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_9

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v4}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$50(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, ".pdf"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_9
    move-object v9, v4

    .line 199
    nop

    .line 205
    const-string v11, "PENDING"

    .line 206
    const-string v12, "pending"

    .line 207
    nop

    .line 208
    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-virtual {v4}, Landroidx/compose/runtime/snapshots/SnapshotStateList;->size()I

    move-result v14

    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Awaiting Assistant Controller statutory review. AI Finding: "

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 210
    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->$rep:Lcom/example/nirikshak/network/ComplianceReportData;

    invoke-virtual {v4}, Lcom/example/nirikshak/network/ComplianceReportData;->getPdfUrl()Ljava/lang/String;

    move-result-object v16

    .line 199
    new-instance v4, Lcom/example/nirikshak/network/CreateReportRequest;

    const/4 v10, 0x0

    const/16 v17, 0x20

    const/16 v18, 0x0

    invoke-direct/range {v4 .. v18}, Lcom/example/nirikshak/network/CreateReportRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v5, v1

    check-cast v5, Lkotlin/coroutines/Continuation;

    .line 198
    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->L$0:Ljava/lang/Object;

    iput v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;->label:I

    invoke-interface {v2, v4, v5}, Lcom/example/nirikshak/network/ApiService;->createReport(Lcom/example/nirikshak/network/CreateReportRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-ne v2, v0, :cond_a

    .line 195
    return-object v0

    .line 198
    .end local v13    # "aiResult":Ljava/lang/String;
    :cond_a
    :goto_3
    goto :goto_4

    .line 213
    :catch_0
    move-exception v0

    .local v0, "<unused var>":Ljava/lang/Exception;
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_4
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
