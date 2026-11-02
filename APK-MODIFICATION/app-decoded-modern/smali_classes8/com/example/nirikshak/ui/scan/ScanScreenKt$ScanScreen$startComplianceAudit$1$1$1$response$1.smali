.class final Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;
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
        "Lretrofit2/Response<",
        "Lcom/example/nirikshak/network/InspectionResponse;",
        ">;>;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\n\u0012\u0004\u0012\u00020\u0002\u0018\u00010\u0001*\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "Lretrofit2/Response;",
        "Lcom/example/nirikshak/network/InspectionResponse;",
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
    c = "com.example.nirikshak.ui.scan.ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1"
    f = "ScanScreen.kt"
    i = {}
    l = {
        0xaf
    }
    m = "invokeSuspend"
    n = {}
    nl = {
        0xb7
    }
    s = {}
    v = 0x2
.end annotation


# instance fields
.field final synthetic $complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

.field final synthetic $dimBody:Lokhttp3/RequestBody;

.field final synthetic $inspectedAtBody:Lokhttp3/RequestBody;

.field final synthetic $jurisdictionBody:Lokhttp3/RequestBody;

.field final synthetic $officerBody:Lokhttp3/RequestBody;

.field final synthetic $parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lokhttp3/MultipartBody$Part;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $prodBody:Lokhttp3/RequestBody;

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ComplianceApiService;Ljava/util/List;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ComplianceApiService;",
            "Ljava/util/List<",
            "Lokhttp3/MultipartBody$Part;",
            ">;",
            "Lokhttp3/RequestBody;",
            "Lokhttp3/RequestBody;",
            "Lokhttp3/RequestBody;",
            "Lokhttp3/RequestBody;",
            "Lokhttp3/RequestBody;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$parts:Ljava/util/List;

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$officerBody:Lokhttp3/RequestBody;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$jurisdictionBody:Lokhttp3/RequestBody;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$prodBody:Lokhttp3/RequestBody;

    iput-object p6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$dimBody:Lokhttp3/RequestBody;

    iput-object p7, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$inspectedAtBody:Lokhttp3/RequestBody;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p8}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 9
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

    new-instance v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$parts:Ljava/util/List;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$officerBody:Lokhttp3/RequestBody;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$jurisdictionBody:Lokhttp3/RequestBody;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$prodBody:Lokhttp3/RequestBody;

    iget-object v6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$dimBody:Lokhttp3/RequestBody;

    iget-object v7, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$inspectedAtBody:Lokhttp3/RequestBody;

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;-><init>(Lcom/example/nirikshak/network/ComplianceApiService;Ljava/util/List;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "-",
            "Lretrofit2/Response<",
            "Lcom/example/nirikshak/network/InspectionResponse;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 173
    iget v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->label:I

    packed-switch v1, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, p1

    goto :goto_0

    .line 183
    :catch_0
    move-exception v0

    goto :goto_1

    .line 173
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 174
    nop

    .line 175
    :try_start_1
    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    .line 176
    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$parts:Ljava/util/List;

    .line 177
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$officerBody:Lokhttp3/RequestBody;

    .line 178
    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$jurisdictionBody:Lokhttp3/RequestBody;

    .line 179
    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$prodBody:Lokhttp3/RequestBody;

    .line 180
    iget-object v6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$dimBody:Lokhttp3/RequestBody;

    .line 181
    iget-object v7, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->$inspectedAtBody:Lokhttp3/RequestBody;

    .line 175
    move-object v9, p0

    check-cast v9, Lkotlin/coroutines/Continuation;

    const/4 v8, 0x1

    iput v8, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;->label:I

    const/4 v8, 0x0

    const/16 v10, 0x40

    const/4 v11, 0x0

    invoke-static/range {v1 .. v11}, Lcom/example/nirikshak/network/ComplianceApiService;->inspectProduct$default(Lcom/example/nirikshak/network/ComplianceApiService;Ljava/util/List;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 173
    return-object v0

    .line 175
    :cond_0
    :goto_0
    check-cast v1, Lretrofit2/Response;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 184
    .local v0, "e":Ljava/lang/Exception;
    :goto_1
    const/4 v1, 0x0

    .line 185
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
