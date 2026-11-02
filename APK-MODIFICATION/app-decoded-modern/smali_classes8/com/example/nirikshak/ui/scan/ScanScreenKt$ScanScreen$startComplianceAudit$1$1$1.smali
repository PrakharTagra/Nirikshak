.class final Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "ScanScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/scan/ScanScreenKt;->ScanScreen(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
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
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nScanScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ScanScreen.kt\ncom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,2005:1\n1#2:2006\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"
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
    c = "com.example.nirikshak.ui.scan.ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1"
    f = "ScanScreen.kt"
    i = {
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2,
        0x2
    }
    l = {
        0x93,
        0xad,
        0xc3
    }
    m = "invokeSuspend"
    n = {
        "parts",
        "dimStr",
        "dimBody",
        "prodBody",
        "officerIdVal",
        "officerBody",
        "jurisdictionBody",
        "isoTimestamp",
        "inspectedAtBody",
        "parts",
        "dimStr",
        "dimBody",
        "prodBody",
        "officerIdVal",
        "officerBody",
        "jurisdictionBody",
        "isoTimestamp",
        "inspectedAtBody",
        "response",
        "rep"
    }
    nl = {
        0x97,
        0xbc,
        0xd8
    }
    s = {
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$0",
        "L$1",
        "L$2",
        "L$3",
        "L$4",
        "L$5",
        "L$6",
        "L$7",
        "L$8",
        "L$9",
        "L$10"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

.field final synthetic $auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $backendApi:Lcom/example/nirikshak/network/ApiService;

.field final synthetic $complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

.field final synthetic $complianceResultData$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/example/nirikshak/network/ComplianceReportData;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $images:Landroidx/compose/runtime/snapshots/SnapshotStateList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $isVerifying$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $packageHeight$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $packageLength$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $packageUnit$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $packageWidth$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $productCommodityName$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $showVerdictReport$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$10:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field L$9:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/compose/runtime/snapshots/SnapshotStateList;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/network/ComplianceApiService;Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableIntState;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/example/nirikshak/network/ComplianceApiService;",
            "Landroidx/compose/runtime/MutableState<",
            "Lcom/example/nirikshak/network/ComplianceReportData;",
            ">;",
            "Lcom/example/nirikshak/network/ApiService;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$context:Landroid/content/Context;

    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v4, p4

    iput-object v4, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

    move-object/from16 v5, p5

    iput-object v5, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageLength$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v7, p7

    iput-object v7, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageWidth$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v8, p8

    iput-object v8, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageHeight$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v9, p9

    iput-object v9, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageUnit$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v10, p10

    iput-object v10, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v11, p11

    iput-object v11, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    move-object/from16 v12, p12

    iput-object v12, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceResultData$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    move-object/from16 v14, p14

    iput-object v14, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$isVerifying$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v15, p15

    iput-object v15, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$showVerdictReport$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v1, 0x2

    move-object/from16 v2, p16

    invoke-direct {v0, v1, v2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 18
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

    move-object/from16 v0, p0

    new-instance v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;

    iget-object v2, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$context:Landroid/content/Context;

    iget-object v3, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget-object v4, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

    iget-object v6, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageLength$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v8, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageWidth$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v9, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageHeight$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v10, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageUnit$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v11, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v12, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    iget-object v13, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceResultData$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v14, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iget-object v15, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$isVerifying$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v16, v1

    iget-object v1, v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$showVerdictReport$delegate:Landroidx/compose/runtime/MutableState;

    move-object/from16 v17, v16

    move-object/from16 v16, v1

    move-object/from16 v1, v17

    move-object/from16 v17, p2

    invoke-direct/range {v1 .. v17}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;-><init>(Landroid/content/Context;Landroidx/compose/runtime/snapshots/SnapshotStateList;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/network/ComplianceApiService;Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    move-object/from16 v16, v1

    move-object/from16 v1, v16

    check-cast v1, Lkotlin/coroutines/Continuation;

    return-object v1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 25
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    const-string v0, "x"

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 145
    iget v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->label:I

    const/4 v4, 0x3

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v3, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$10:Ljava/lang/Object;

    check-cast v0, Lcom/example/nirikshak/network/ComplianceReportData;

    .local v0, "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$9:Ljava/lang/Object;

    check-cast v2, Lretrofit2/Response;

    .local v2, "response":Lretrofit2/Response;
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$8:Ljava/lang/Object;

    check-cast v3, Lokhttp3/RequestBody;

    .local v3, "inspectedAtBody":Lokhttp3/RequestBody;
    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$7:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    .local v4, "isoTimestamp":Ljava/lang/String;
    iget-object v7, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$6:Ljava/lang/Object;

    check-cast v7, Lokhttp3/RequestBody;

    .local v7, "jurisdictionBody":Lokhttp3/RequestBody;
    iget-object v8, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$5:Ljava/lang/Object;

    check-cast v8, Lokhttp3/RequestBody;

    .local v8, "officerBody":Lokhttp3/RequestBody;
    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$4:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    .local v9, "officerIdVal":Ljava/lang/String;
    iget-object v10, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$3:Ljava/lang/Object;

    check-cast v10, Lokhttp3/RequestBody;

    .local v10, "prodBody":Lokhttp3/RequestBody;
    iget-object v11, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$2:Ljava/lang/Object;

    check-cast v11, Lokhttp3/RequestBody;

    .local v11, "dimBody":Lokhttp3/RequestBody;
    iget-object v12, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$1:Ljava/lang/Object;

    check-cast v12, Ljava/lang/String;

    .local v12, "dimStr":Ljava/lang/String;
    iget-object v13, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v13, Ljava/util/List;

    .local v13, "parts":Ljava/util/List;
    :try_start_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_a

    .end local v0    # "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    .end local v2    # "response":Lretrofit2/Response;
    .end local v3    # "inspectedAtBody":Lokhttp3/RequestBody;
    .end local v4    # "isoTimestamp":Ljava/lang/String;
    .end local v7    # "jurisdictionBody":Lokhttp3/RequestBody;
    .end local v8    # "officerBody":Lokhttp3/RequestBody;
    .end local v9    # "officerIdVal":Ljava/lang/String;
    .end local v10    # "prodBody":Lokhttp3/RequestBody;
    .end local v11    # "dimBody":Lokhttp3/RequestBody;
    .end local v12    # "dimStr":Ljava/lang/String;
    .end local v13    # "parts":Ljava/util/List;
    :pswitch_1
    iget-object v0, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$8:Ljava/lang/Object;

    check-cast v0, Lokhttp3/RequestBody;

    .local v0, "inspectedAtBody":Lokhttp3/RequestBody;
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$7:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    .local v3, "isoTimestamp":Ljava/lang/String;
    iget-object v8, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$6:Ljava/lang/Object;

    check-cast v8, Lokhttp3/RequestBody;

    .local v8, "jurisdictionBody":Lokhttp3/RequestBody;
    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$5:Ljava/lang/Object;

    check-cast v9, Lokhttp3/RequestBody;

    .local v9, "officerBody":Lokhttp3/RequestBody;
    iget-object v10, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$4:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    .local v10, "officerIdVal":Ljava/lang/String;
    iget-object v11, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$3:Ljava/lang/Object;

    check-cast v11, Lokhttp3/RequestBody;

    .local v11, "prodBody":Lokhttp3/RequestBody;
    iget-object v12, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$2:Ljava/lang/Object;

    check-cast v12, Lokhttp3/RequestBody;

    .local v12, "dimBody":Lokhttp3/RequestBody;
    iget-object v13, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$1:Ljava/lang/Object;

    check-cast v13, Ljava/lang/String;

    .local v13, "dimStr":Ljava/lang/String;
    iget-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$0:Ljava/lang/Object;

    check-cast v14, Ljava/util/List;

    .local v14, "parts":Ljava/util/List;
    :try_start_1
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v4, p1

    move-object v7, v3

    move-object/from16 v21, v10

    move-object v10, v11

    move-object v11, v12

    move-object v12, v13

    move-object v13, v14

    move-object v3, v0

    goto/16 :goto_8

    .end local v0    # "inspectedAtBody":Lokhttp3/RequestBody;
    .end local v3    # "isoTimestamp":Ljava/lang/String;
    .end local v8    # "jurisdictionBody":Lokhttp3/RequestBody;
    .end local v9    # "officerBody":Lokhttp3/RequestBody;
    .end local v10    # "officerIdVal":Ljava/lang/String;
    .end local v11    # "prodBody":Lokhttp3/RequestBody;
    .end local v12    # "dimBody":Lokhttp3/RequestBody;
    .end local v13    # "dimStr":Ljava/lang/String;
    .end local v14    # "parts":Ljava/util/List;
    :pswitch_2
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object/from16 v3, p1

    goto :goto_0

    .line 226
    :catch_0
    move-exception v0

    goto/16 :goto_f

    .line 145
    :pswitch_3
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 146
    nop

    .line 147
    :try_start_2
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v3

    check-cast v3, Lkotlin/coroutines/CoroutineContext;

    new-instance v8, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$parts$1;

    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$context:Landroid/content/Context;

    iget-object v10, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    invoke-direct {v8, v9, v10, v7}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$parts$1;-><init>(Landroid/content/Context;Landroidx/compose/runtime/snapshots/SnapshotStateList;Lkotlin/coroutines/Continuation;)V

    check-cast v8, Lkotlin/jvm/functions/Function2;

    move-object v9, v1

    check-cast v9, Lkotlin/coroutines/Continuation;

    iput v6, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->label:I

    invoke-static {v3, v8, v9}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v2, :cond_0

    .line 145
    return-object v2

    :cond_0
    :goto_0
    check-cast v3, Ljava/util/List;

    move-object v10, v3

    .line 151
    .local v10, "parts":Ljava/util/List;
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 152
    iget-object v0, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;

    const-string v2, "Failed to process packaging images for upload. Please capture again."

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$45(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 153
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 156
    :cond_1
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

    const/4 v8, 0x2

    invoke-static {v3, v8}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$39(Landroidx/compose/runtime/MutableIntState;I)V

    .line 157
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Uploading "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, " photo(s) to ComplianceEngine..."

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$42(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 159
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageLength$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v3}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$18(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageWidth$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v3}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$21(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    move-object v0, v7

    goto :goto_3

    :cond_3
    :goto_1
    iget-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageLength$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v3}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$18(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v3

    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageWidth$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v9}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$21(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v9

    iget-object v11, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageHeight$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v11}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$24(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v11

    check-cast v11, Ljava/lang/CharSequence;

    invoke-interface {v11}, Ljava/lang/CharSequence;->length()I

    move-result v12

    if-nez v12, :cond_4

    move v12, v6

    goto :goto_2

    :cond_4
    const/4 v12, 0x0

    :goto_2
    if-eqz v12, :cond_5

    .line 2006
    const/4 v11, 0x0

    .line 159
    .local v11, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$dimStr$1\\1\\159\\0":I
    const-string v12, "0"

    move-object v11, v12

    .end local v11    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$dimStr$1\\1\\159\\0":I
    :cond_5
    iget-object v12, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$packageUnit$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v12}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$27(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 160
    .local v0, "dimStr":Ljava/lang/String;
    :goto_3
    if-eqz v0, :cond_6

    move-object v3, v0

    .line 2006
    .local v3, "it\\2":Ljava/lang/String;
    const/4 v9, 0x0

    .line 160
    .local v9, "$i$a$-let-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$dimBody$1\\2\\160\\0":I
    sget-object v11, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    invoke-virtual {v11, v3}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v11

    move-object v14, v11

    .end local v3    # "it\\2":Ljava/lang/String;
    .end local v9    # "$i$a$-let-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$dimBody$1\\2\\160\\0":I
    goto :goto_4

    :cond_6
    move-object v14, v7

    .line 161
    .local v14, "dimBody":Lokhttp3/RequestBody;
    :goto_4
    sget-object v3, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v9}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$50(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 2006
    const/4 v9, 0x0

    .line 161
    .local v9, "$i$a$-ifBlank-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$prodBody$1\\3\\161\\0":I
    const-string v11, "Packaging Sample"

    move-object v9, v11

    .end local v9    # "$i$a$-ifBlank-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$prodBody$1\\3\\161\\0":I
    :cond_7
    check-cast v9, Ljava/lang/String;

    invoke-virtual {v3, v9}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v13

    .line 162
    .local v13, "prodBody":Lokhttp3/RequestBody;
    sget-object v3, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v3}, Lcom/example/nirikshak/network/OfficerSession;->getMongoDbId()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v9

    if-nez v9, :cond_8

    move v9, v6

    goto :goto_5

    :cond_8
    const/4 v9, 0x0

    :goto_5
    if-eqz v9, :cond_b

    .line 2006
    const/4 v3, 0x0

    .line 162
    .local v3, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$officerIdVal$1\\4\\162\\0":I
    sget-object v9, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v9}, Lcom/example/nirikshak/network/OfficerSession;->getOfficerId()Ljava/lang/String;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-interface {v9}, Ljava/lang/CharSequence;->length()I

    move-result v11

    if-nez v11, :cond_9

    move v11, v6

    goto :goto_6

    :cond_9
    const/4 v11, 0x0

    :goto_6
    if-eqz v11, :cond_a

    .line 2006
    const/4 v9, 0x0

    .line 162
    .local v9, "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$officerIdVal$1$1\\5\\162\\4":I
    const-string v11, "prakhar.admin"

    move-object v9, v11

    .end local v9    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$officerIdVal$1$1\\5\\162\\4":I
    :cond_a
    check-cast v9, Ljava/lang/String;

    move-object v3, v9

    .end local v3    # "$i$a$-ifEmpty-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$officerIdVal$1\\4\\162\\0":I
    :cond_b
    check-cast v3, Ljava/lang/String;

    .line 163
    .local v3, "officerIdVal":Ljava/lang/String;
    sget-object v9, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    invoke-virtual {v9, v3}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v11

    .line 164
    .local v11, "officerBody":Lokhttp3/RequestBody;
    sget-object v9, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v9}, Lcom/example/nirikshak/network/OfficerSession;->getJurisdictionId()Ljava/lang/String;

    move-result-object v9

    check-cast v9, Ljava/lang/CharSequence;

    invoke-static {v9}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_c

    sget-object v9, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    sget-object v12, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v12}, Lcom/example/nirikshak/network/OfficerSession;->getJurisdictionId()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v9

    move-object v12, v9

    goto :goto_7

    :cond_c
    move-object v12, v7

    .line 165
    .local v12, "jurisdictionBody":Lokhttp3/RequestBody;
    :goto_7
    new-instance v9, Ljava/text/SimpleDateFormat;

    const-string v15, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v9, v15, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    move-object v7, v9

    .local v7, "$this$invokeSuspend_u24lambda_u244\\6":Ljava/text/SimpleDateFormat;
    const/4 v15, 0x0

    .line 166
    .local v15, "$i$a$-apply-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$isoTimestamp$1\\6\\165\\0":I
    const-string v16, "UTC"

    invoke-static/range {v16 .. v16}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 167
    nop

    .line 165
    .end local v7    # "$this$invokeSuspend_u24lambda_u244\\6":Ljava/text/SimpleDateFormat;
    .end local v15    # "$i$a$-apply-ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$isoTimestamp$1\\6\\165\\0":I
    nop

    .line 167
    new-instance v7, Ljava/util/Date;

    invoke-direct {v7}, Ljava/util/Date;-><init>()V

    invoke-virtual {v9, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    .line 165
    nop

    .line 168
    .local v7, "isoTimestamp":Ljava/lang/String;
    sget-object v8, Lcom/example/nirikshak/utils/ImageUploadHelper;->INSTANCE:Lcom/example/nirikshak/utils/ImageUploadHelper;

    invoke-static {v7}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v8, v7}, Lcom/example/nirikshak/utils/ImageUploadHelper;->createTextRequestBody(Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v15

    .line 170
    .local v15, "inspectedAtBody":Lokhttp3/RequestBody;
    iget-object v8, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

    invoke-static {v8, v4}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$39(Landroidx/compose/runtime/MutableIntState;I)V

    .line 171
    iget-object v8, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;

    const-string v9, "Executing OpenCV Deskewing, PaddleOCR & Groq LLM Statutory Verification..."

    invoke-static {v8, v9}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$42(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 173
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v8

    check-cast v8, Lkotlin/coroutines/CoroutineContext;

    move-object v9, v8

    new-instance v8, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;

    move-object/from16 v16, v9

    iget-object v9, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceApi:Lcom/example/nirikshak/network/ComplianceApiService;

    move-object/from16 v17, v16

    const/16 v16, 0x0

    move-object/from16 v6, v17

    const/4 v5, 0x2

    invoke-direct/range {v8 .. v16}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$response$1;-><init>(Lcom/example/nirikshak/network/ComplianceApiService;Ljava/util/List;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lokhttp3/RequestBody;Lkotlin/coroutines/Continuation;)V

    check-cast v8, Lkotlin/jvm/functions/Function2;

    move-object v9, v1

    check-cast v9, Lkotlin/coroutines/Continuation;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$0:Ljava/lang/Object;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$1:Ljava/lang/Object;

    invoke-static {v14}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$2:Ljava/lang/Object;

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$3:Ljava/lang/Object;

    iput-object v3, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$4:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$5:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$6:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$7:Ljava/lang/Object;

    invoke-static {v15}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$8:Ljava/lang/Object;

    iput v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->label:I

    invoke-static {v6, v8, v9}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v2, :cond_d

    .line 145
    return-object v2

    .line 173
    :cond_d
    move-object v8, v13

    move-object v13, v10

    move-object v10, v8

    move-object/from16 v21, v3

    move-object v9, v11

    move-object v8, v12

    move-object v11, v14

    move-object v3, v15

    move-object v12, v0

    .line 145
    .end local v0    # "dimStr":Ljava/lang/String;
    .end local v14    # "dimBody":Lokhttp3/RequestBody;
    .end local v15    # "inspectedAtBody":Lokhttp3/RequestBody;
    .local v3, "inspectedAtBody":Lokhttp3/RequestBody;
    .restart local v8    # "jurisdictionBody":Lokhttp3/RequestBody;
    .local v9, "officerBody":Lokhttp3/RequestBody;
    .local v10, "prodBody":Lokhttp3/RequestBody;
    .local v11, "dimBody":Lokhttp3/RequestBody;
    .local v12, "dimStr":Ljava/lang/String;
    .local v13, "parts":Ljava/util/List;
    .local v21, "officerIdVal":Ljava/lang/String;
    :goto_8
    check-cast v4, Lretrofit2/Response;

    .line 188
    .local v4, "response":Lretrofit2/Response;
    if-eqz v4, :cond_10

    invoke-virtual {v4}, Lretrofit2/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {v4}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/network/InspectionResponse;

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lcom/example/nirikshak/network/InspectionResponse;->getData()Lcom/example/nirikshak/network/ComplianceReportData;

    move-result-object v0

    goto :goto_9

    :cond_e
    const/4 v0, 0x0

    :goto_9
    if-eqz v0, :cond_10

    .line 189
    invoke-virtual {v4}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v0, Lcom/example/nirikshak/network/InspectionResponse;

    invoke-virtual {v0}, Lcom/example/nirikshak/network/InspectionResponse;->getData()Lcom/example/nirikshak/network/ComplianceReportData;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    move-object/from16 v0, v19

    .line 190
    .local v0, "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    iget-object v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$complianceResultData$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v5, v0}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$48(Landroidx/compose/runtime/MutableState;Lcom/example/nirikshak/network/ComplianceReportData;)V

    .line 191
    iget-object v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditProgressStep$delegate:Landroidx/compose/runtime/MutableIntState;

    const/4 v6, 0x4

    invoke-static {v5, v6}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$39(Landroidx/compose/runtime/MutableIntState;I)V

    .line 192
    iget-object v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditStageMessage$delegate:Landroidx/compose/runtime/MutableState;

    const-string v6, "Statutory report uploaded. Syncing with status \'Pending\'..."

    invoke-static {v5, v6}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$42(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 195
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getIO()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v5

    check-cast v5, Lkotlin/coroutines/CoroutineContext;

    new-instance v18, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;

    iget-object v6, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iget-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget-object v15, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    const/16 v24, 0x0

    move-object/from16 v19, v0

    move-object/from16 v20, v6

    move-object/from16 v22, v14

    move-object/from16 v23, v15

    .end local v0    # "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    .local v19, "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    invoke-direct/range {v18 .. v24}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1$1;-><init>(Lcom/example/nirikshak/network/ComplianceReportData;Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Landroidx/compose/runtime/snapshots/SnapshotStateList;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    move-object/from16 v0, v18

    check-cast v0, Lkotlin/jvm/functions/Function2;

    move-object v6, v1

    check-cast v6, Lkotlin/coroutines/Continuation;

    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$0:Ljava/lang/Object;

    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$1:Ljava/lang/Object;

    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$2:Ljava/lang/Object;

    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$3:Ljava/lang/Object;

    invoke-static/range {v21 .. v21}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$4:Ljava/lang/Object;

    invoke-static {v9}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$5:Ljava/lang/Object;

    invoke-static {v8}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$6:Ljava/lang/Object;

    invoke-static {v7}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$7:Ljava/lang/Object;

    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$8:Ljava/lang/Object;

    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$9:Ljava/lang/Object;

    invoke-static/range {v19 .. v19}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    iput-object v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->L$10:Ljava/lang/Object;

    const/4 v14, 0x3

    iput v14, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->label:I

    invoke-static {v5, v0, v6}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_f

    .line 145
    return-object v2

    .line 195
    :cond_f
    move-object v2, v4

    move-object v4, v7

    move-object v7, v8

    move-object v8, v9

    move-object/from16 v0, v19

    move-object/from16 v9, v21

    .line 216
    .end local v19    # "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    .end local v21    # "officerIdVal":Ljava/lang/String;
    .restart local v0    # "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    .restart local v2    # "response":Lretrofit2/Response;
    .local v4, "isoTimestamp":Ljava/lang/String;
    .local v7, "jurisdictionBody":Lokhttp3/RequestBody;
    .local v8, "officerBody":Lokhttp3/RequestBody;
    .local v9, "officerIdVal":Ljava/lang/String;
    :goto_a
    iget-object v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$isVerifying$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v6, 0x0

    invoke-static {v5, v6}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$10(Landroidx/compose/runtime/MutableState;Z)V

    .line 217
    iget-object v5, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$showVerdictReport$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v14, 0x1

    invoke-static {v5, v14}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$13(Landroidx/compose/runtime/MutableState;Z)V

    .end local v0    # "rep":Lcom/example/nirikshak/network/ComplianceReportData;
    goto :goto_10

    .line 188
    .end local v2    # "response":Lretrofit2/Response;
    .local v4, "response":Lretrofit2/Response;
    .local v7, "isoTimestamp":Ljava/lang/String;
    .local v8, "jurisdictionBody":Lokhttp3/RequestBody;
    .local v9, "officerBody":Lokhttp3/RequestBody;
    .restart local v21    # "officerIdVal":Ljava/lang/String;
    :cond_10
    const/4 v6, 0x0

    const/4 v14, 0x1

    .line 219
    if-eqz v4, :cond_11

    invoke-virtual {v4}, Lretrofit2/Response;->errorBody()Lokhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Lokhttp3/ResponseBody;->string()Ljava/lang/String;

    move-result-object v0

    goto :goto_b

    :cond_11
    const/4 v0, 0x0

    .line 220
    .local v0, "errorBody":Ljava/lang/String;
    :goto_b
    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;

    move-object v5, v0

    check-cast v5, Ljava/lang/CharSequence;

    if-eqz v5, :cond_13

    invoke-static {v5}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_12

    goto :goto_c

    :cond_12
    move v5, v6

    goto :goto_d

    :cond_13
    :goto_c
    move v5, v14

    :goto_d
    if-nez v5, :cond_14

    .line 221
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ComplianceEngine Error: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_e

    .line 223
    :cond_14
    const-string v5, "ComplianceEngine service (https://nirikshak-compliance-engine-9uj4.onrender.com) is currently unreachable or processing timed out."

    .line 220
    :goto_e
    invoke-static {v2, v5}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$45(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .end local v0    # "errorBody":Ljava/lang/String;
    .end local v3    # "inspectedAtBody":Lokhttp3/RequestBody;
    .end local v4    # "response":Lretrofit2/Response;
    .end local v7    # "isoTimestamp":Ljava/lang/String;
    .end local v8    # "jurisdictionBody":Lokhttp3/RequestBody;
    .end local v9    # "officerBody":Lokhttp3/RequestBody;
    .end local v10    # "prodBody":Lokhttp3/RequestBody;
    .end local v11    # "dimBody":Lokhttp3/RequestBody;
    .end local v12    # "dimStr":Ljava/lang/String;
    .end local v13    # "parts":Ljava/util/List;
    .end local v21    # "officerIdVal":Ljava/lang/String;
    goto :goto_10

    .line 227
    .local v0, "e":Ljava/lang/Exception;
    :goto_f
    iget-object v2, v1, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$startComplianceAudit$1$1$1;->$auditErrorMessage$delegate:Landroidx/compose/runtime/MutableState;

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_15

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    :cond_15
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Audit failed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->access$ScanScreen$lambda$45(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 229
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_10
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
