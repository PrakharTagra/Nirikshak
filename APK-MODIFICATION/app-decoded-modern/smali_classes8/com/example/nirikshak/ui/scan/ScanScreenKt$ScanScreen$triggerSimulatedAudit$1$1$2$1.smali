.class final Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "ScanScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    value = "SMAP\nScanScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ScanScreen.kt\ncom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,2005:1\n1#2:2006\n*E\n"
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
    c = "com.example.nirikshak.ui.scan.ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1"
    f = "ScanScreen.kt"
    i = {}
    l = {
        0x106
    }
    m = "invokeSuspend"
    n = {}
    nl = {
        0x114
    }
    s = {}
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

.field final synthetic $productCommodityName$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $repId:Ljava/lang/String;

.field final synthetic $samplePdfUrl:Ljava/lang/String;

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Landroidx/compose/runtime/snapshots/SnapshotStateList;Ljava/lang/String;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ApiService;",
            "Ljava/lang/String;",
            "Landroidx/compose/runtime/snapshots/SnapshotStateList<",
            "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
            ">;",
            "Ljava/lang/String;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$repId:Ljava/lang/String;

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$samplePdfUrl:Ljava/lang/String;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

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

    new-instance v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$backendApi:Lcom/example/nirikshak/network/ApiService;

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$repId:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$images:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$samplePdfUrl:Ljava/lang/String;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->$productCommodityName$delegate:Landroidx/compose/runtime/MutableState;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;-><init>(Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Landroidx/compose/runtime/snapshots/SnapshotStateList;Ljava/lang/String;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/scan/ScanScreenKt$ScanScreen$triggerSimulatedAudit$1$1$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    return-object v0
.end method
