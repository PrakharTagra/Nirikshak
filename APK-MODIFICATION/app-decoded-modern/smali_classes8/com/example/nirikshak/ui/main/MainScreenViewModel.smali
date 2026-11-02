.class public final Lcom/example/nirikshak/ui/main/MainScreenViewModel;
.super Landroidx/lifecycle/ViewModel;
.source "MainScreenViewModel.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nMainScreenViewModel.kt\nKotlin\n*S Kotlin\n*F\n+ 1 MainScreenViewModel.kt\ncom/example/nirikshak/ui/main/MainScreenViewModel\n+ 2 Transform.kt\nkotlinx/coroutines/flow/FlowKt__TransformKt\n+ 3 Emitters.kt\nkotlinx/coroutines/flow/FlowKt__EmittersKt\n+ 4 SafeCollector.common.kt\nkotlinx/coroutines/flow/internal/SafeCollector_commonKt\n*L\n1#1,28:1\n49#2:29\n51#2:33\n46#3:30\n51#3:32\n105#4:31\n*S KotlinDebug\n*F\n+ 1 MainScreenViewModel.kt\ncom/example/nirikshak/ui/main/MainScreenViewModel\n*L\n16#1:29\n16#1:33\n16#1:30\n16#1:32\n16#1:31\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005R\u0017\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/example/nirikshak/ui/main/MainScreenViewModel;",
        "Landroidx/lifecycle/ViewModel;",
        "dataRepository",
        "Lcom/example/nirikshak/data/DataRepository;",
        "<init>",
        "(Lcom/example/nirikshak/data/DataRepository;)V",
        "uiState",
        "Lkotlinx/coroutines/flow/StateFlow;",
        "Lcom/example/nirikshak/ui/main/MainScreenUiState;",
        "getUiState",
        "()Lkotlinx/coroutines/flow/StateFlow;",
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
.field private final uiState:Lkotlinx/coroutines/flow/StateFlow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlinx/coroutines/flow/StateFlow<",
            "Lcom/example/nirikshak/ui/main/MainScreenUiState;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/example/nirikshak/ui/main/MainScreenViewModel;->$stable:I

    return-void
.end method

.method public constructor <init>(Lcom/example/nirikshak/data/DataRepository;)V
    .locals 9
    .param p1, "dataRepository"    # Lcom/example/nirikshak/data/DataRepository;

    const-string v0, "dataRepository"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 13
    invoke-direct {p0}, Landroidx/lifecycle/ViewModel;-><init>()V

    .line 18
    nop

    .line 15
    invoke-interface {p1}, Lcom/example/nirikshak/data/DataRepository;->getData()Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    .line 16
    nop

    .local v0, "$this$map\\1":Lkotlinx/coroutines/flow/Flow;
    const/4 v1, 0x0

    .line 29
    .local v1, "$i$f$map\\1\\16":I
    move-object v2, v0

    .local v2, "$this$unsafeTransform\\2":Lkotlinx/coroutines/flow/Flow;
    const/4 v3, 0x0

    .line 30
    .local v3, "$i$f$unsafeTransform\\2\\29":I
    const/4 v4, 0x0

    .line 31
    .local v4, "$i$f$unsafeFlow\\3\\30":I
    new-instance v5, Lcom/example/nirikshak/ui/main/MainScreenViewModel$special$$inlined$map$1;

    invoke-direct {v5, v2}, Lcom/example/nirikshak/ui/main/MainScreenViewModel$special$$inlined$map$1;-><init>(Lkotlinx/coroutines/flow/Flow;)V

    check-cast v5, Lkotlinx/coroutines/flow/Flow;

    .line 32
    .end local v4    # "$i$f$unsafeFlow\\3\\30":I
    nop

    .line 33
    .end local v2    # "$this$unsafeTransform\\2":Lkotlinx/coroutines/flow/Flow;
    .end local v3    # "$i$f$unsafeTransform\\2\\29":I
    nop

    .line 17
    .end local v0    # "$this$map\\1":Lkotlinx/coroutines/flow/Flow;
    .end local v1    # "$i$f$map\\1\\16":I
    new-instance v0, Lcom/example/nirikshak/ui/main/MainScreenViewModel$uiState$4;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/example/nirikshak/ui/main/MainScreenViewModel$uiState$4;-><init>(Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/jvm/functions/Function3;

    invoke-static {v5, v0}, Lkotlinx/coroutines/flow/FlowKt;->catch(Lkotlinx/coroutines/flow/Flow;Lkotlin/jvm/functions/Function3;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    .line 18
    move-object v1, p0

    check-cast v1, Landroidx/lifecycle/ViewModel;

    invoke-static {v1}, Landroidx/lifecycle/ViewModelKt;->getViewModelScope(Landroidx/lifecycle/ViewModel;)Lkotlinx/coroutines/CoroutineScope;

    move-result-object v1

    sget-object v2, Lkotlinx/coroutines/flow/SharingStarted;->Companion:Lkotlinx/coroutines/flow/SharingStarted$Companion;

    const/4 v7, 0x2

    const/4 v8, 0x0

    const-wide/16 v3, 0x1388

    const-wide/16 v5, 0x0

    invoke-static/range {v2 .. v8}, Lkotlinx/coroutines/flow/SharingStarted$Companion;->WhileSubscribed$default(Lkotlinx/coroutines/flow/SharingStarted$Companion;JJILjava/lang/Object;)Lkotlinx/coroutines/flow/SharingStarted;

    move-result-object v2

    sget-object v3, Lcom/example/nirikshak/ui/main/MainScreenUiState$Loading;->INSTANCE:Lcom/example/nirikshak/ui/main/MainScreenUiState$Loading;

    invoke-static {v0, v1, v2, v3}, Lkotlinx/coroutines/flow/FlowKt;->stateIn(Lkotlinx/coroutines/flow/Flow;Lkotlinx/coroutines/CoroutineScope;Lkotlinx/coroutines/flow/SharingStarted;Ljava/lang/Object;)Lkotlinx/coroutines/flow/StateFlow;

    move-result-object v0

    iput-object v0, p0, Lcom/example/nirikshak/ui/main/MainScreenViewModel;->uiState:Lkotlinx/coroutines/flow/StateFlow;

    .line 13
    return-void
.end method


# virtual methods
.method public final getUiState()Lkotlinx/coroutines/flow/StateFlow;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/StateFlow<",
            "Lcom/example/nirikshak/ui/main/MainScreenUiState;",
            ">;"
        }
    .end annotation

    .line 14
    iget-object v0, p0, Lcom/example/nirikshak/ui/main/MainScreenViewModel;->uiState:Lkotlinx/coroutines/flow/StateFlow;

    return-object v0
.end method
