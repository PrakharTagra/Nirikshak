.class final Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "HomeScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/home/HomeScreenKt;->HomeScreen(Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
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
    value = "SMAP\nHomeScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 HomeScreen.kt\ncom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 3 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,988:1\n1#2:989\n777#3:990\n873#3,2:991\n1834#3,4:993\n1834#3,4:997\n1834#3,4:1001\n*S KotlinDebug\n*F\n+ 1 HomeScreen.kt\ncom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1\n*L\n130#1:990\n130#1:991,2\n136#1:993,4\n137#1:997,4\n138#1:1001,4\n*E\n"
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
    c = "com.example.nirikshak.ui.home.HomeScreenKt$HomeScreen$3$1"
    f = "HomeScreen.kt"
    i = {
        0x1
    }
    l = {
        0x75,
        0x7f
    }
    m = "invokeSuspend"
    n = {
        "targetLmoId"
    }
    nl = {
        0x76,
        0x80
    }
    s = {
        "L$0"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $apiService:Lcom/example/nirikshak/network/ApiService;

.field final synthetic $hasReportsData$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $pendingReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

.field final synthetic $rejectedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

.field final synthetic $totalReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

.field final synthetic $verifiedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ApiService;",
            "Landroidx/compose/runtime/MutableIntState;",
            "Landroidx/compose/runtime/MutableIntState;",
            "Landroidx/compose/runtime/MutableIntState;",
            "Landroidx/compose/runtime/MutableIntState;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iput-object p2, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$totalReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iput-object p3, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$pendingReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iput-object p4, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$rejectedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iput-object p5, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$verifiedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iput-object p6, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$hasReportsData$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p7}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 8
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

    new-instance v0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iget-object v2, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$totalReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iget-object v3, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$pendingReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iget-object v4, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$rejectedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iget-object v5, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$verifiedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    iget-object v6, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$hasReportsData$delegate:Landroidx/compose/runtime/MutableState;

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;-><init>(Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableIntState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 16
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 115
    iget v0, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->label:I

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->L$0:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .local v0, "targetLmoId":Ljava/lang/String;
    :try_start_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v6, v0

    move-object/from16 v0, p1

    goto/16 :goto_4

    .line 141
    .end local v0    # "targetLmoId":Ljava/lang/String;
    :catch_0
    move-exception v0

    goto/16 :goto_14

    .line 115
    :pswitch_1
    :try_start_1
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v0, p1

    goto :goto_1

    .line 123
    :catch_1
    move-exception v0

    goto :goto_3

    .line 115
    :pswitch_2
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 116
    nop

    .line 117
    :try_start_2
    iget-object v0, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    sget-object v5, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v5}, Lcom/example/nirikshak/network/OfficerSession;->getOfficerId()Ljava/lang/String;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v6

    if-nez v6, :cond_0

    move v6, v4

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    if-eqz v6, :cond_1

    .line 989
    const/4 v5, 0x0

    .line 117
    .local v5, "$i$a$-ifEmpty-HomeScreenKt$HomeScreen$3$1$resp$1\\1\\117\\0":I
    nop

    .end local v5    # "$i$a$-ifEmpty-HomeScreenKt$HomeScreen$3$1$resp$1\\1\\117\\0":I
    const/4 v5, 0x0

    :cond_1
    check-cast v5, Ljava/lang/String;

    move-object v6, v1

    check-cast v6, Lkotlin/coroutines/Continuation;

    iput v4, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->label:I

    invoke-interface {v0, v5, v6}, Lcom/example/nirikshak/network/ApiService;->getOfficerProfile(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_2

    .line 115
    return-object v2

    :cond_2
    :goto_1
    check-cast v0, Lretrofit2/Response;

    .line 118
    .local v0, "resp":Lretrofit2/Response;
    invoke-virtual {v0}, Lretrofit2/Response;->isSuccessful()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/example/nirikshak/network/OfficerProfileResponse;

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Lcom/example/nirikshak/network/OfficerProfileResponse;->getSuccess()Z

    move-result v5

    if-ne v5, v4, :cond_3

    move v5, v4

    goto :goto_2

    :cond_3
    const/4 v5, 0x0

    :goto_2
    if-eqz v5, :cond_4

    .line 119
    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/example/nirikshak/network/OfficerProfileResponse;

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Lcom/example/nirikshak/network/OfficerProfileResponse;->getOfficer()Lcom/example/nirikshak/network/UserDto;

    move-result-object v5

    if-eqz v5, :cond_4

    move-object v7, v5

    .local v7, "it\\2":Lcom/example/nirikshak/network/UserDto;
    const/4 v5, 0x0

    .line 120
    .local v5, "$i$a$-let-HomeScreenKt$HomeScreen$3$1$1\\2\\119\\0":I
    sget-object v6, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    const/4 v10, 0x6

    const/4 v11, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lcom/example/nirikshak/network/OfficerSession;->update$default(Lcom/example/nirikshak/network/OfficerSession;Lcom/example/nirikshak/network/UserDto;Ljava/lang/String;Landroid/content/Context;ILjava/lang/Object;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 121
    nop

    .line 119
    .end local v5    # "$i$a$-let-HomeScreenKt$HomeScreen$3$1$1\\2\\119\\0":I
    .end local v7    # "it\\2":Lcom/example/nirikshak/network/UserDto;
    nop

    .line 125
    .end local v0    # "resp":Lretrofit2/Response;
    :cond_4
    :goto_3
    nop

    .line 126

    .line 127
    :try_start_3
    sget-object v0, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v0}, Lcom/example/nirikshak/network/OfficerSession;->getMongoDbId()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_home_use_officer_id

    check-cast v0, Ljava/lang/String;

    goto :cond_home_target_ready

    :cond_home_use_officer_id
    sget-object v0, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v0}, Lcom/example/nirikshak/network/OfficerSession;->getOfficerId()Ljava/lang/String;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_home_use_fallback

    check-cast v0, Ljava/lang/String;

    goto :cond_home_target_ready

    :cond_home_use_fallback
    const-string v0, "0bdeef9a-bd2f-4c1a-a3b5-7606abd0e788"

    :cond_home_target_ready
    move-object v6, v0
    .local v6, "targetLmoId":Ljava/lang/String;
    iget-object v5, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    move-object v8, v1

    check-cast v8, Lkotlin/coroutines/Continuation;

    iput-object v6, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->L$0:Ljava/lang/Object;

    const/4 v0, 0x2

    iput v0, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->label:I

    const/4 v7, 0x0

    const/4 v9, 0x2

    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lcom/example/nirikshak/network/ApiService;->getReports$default(Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v2, :cond_5

    .line 115
    return-object v2

    :cond_5
    :goto_4
    check-cast v0, Lretrofit2/Response;

    .line 128
    .local v0, "repResp":Lretrofit2/Response;
    invoke-virtual {v0}, Lretrofit2/Response;->isSuccessful()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/nirikshak/network/ReportsResponse;

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Lcom/example/nirikshak/network/ReportsResponse;->getSuccess()Z

    move-result v2

    if-ne v2, v4, :cond_6

    move v2, v4

    goto :goto_5

    :cond_6
    const/4 v2, 0x0

    :goto_5
    if-eqz v2, :cond_1e

    .line 129
    invoke-virtual {v0}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/example/nirikshak/network/ReportsResponse;

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Lcom/example/nirikshak/network/ReportsResponse;->getReports()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_8

    :cond_7
    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 130
    .local v2, "serverList":Ljava/util/List;
    :cond_8
    move-object v5, v2

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$filter\\3":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 990
    .local v7, "$i$f$filter\\3\\130":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    check-cast v8, Ljava/util/Collection;

    .local v8, "destination\\4":Ljava/util/Collection;
    move-object v9, v5

    .local v9, "$this$filterTo\\4":Ljava/lang/Iterable;
    const/4 v10, 0x0

    .line 991
    .local v10, "$i$f$filterTo\\4\\990":I
    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_9
    :goto_6
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_e

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    invoke-interface {v8, v12}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 992
    :cond_e
    nop

    .end local v8    # "destination\\4":Ljava/util/Collection;
    .end local v9    # "$this$filterTo\\4":Ljava/lang/Iterable;
    .end local v10    # "$i$f$filterTo\\4\\990":I
    check-cast v8, Ljava/util/List;

    .line 990
    nop

    .line 130
    .end local v5    # "$this$filter\\3":Ljava/lang/Iterable;
    .end local v7    # "$i$f$filter\\3\\130":I
    nop

    .line 135
    .local v8, "list":Ljava/util/List;
    iget-object v5, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$totalReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v5, v7}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->access$HomeScreen$lambda$14(Landroidx/compose/runtime/MutableIntState;I)V

    .line 136
    iget-object v5, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$pendingReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    move-object v7, v8

    check-cast v7, Ljava/lang/Iterable;

    .local v7, "$this$count\\6":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 993
    .local v9, "$i$f$count\\6\\136":I
    instance-of v10, v7, Ljava/util/Collection;

    if-eqz v10, :cond_f

    move-object v10, v7

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_f

    const/4 v10, 0x0

    goto :goto_b

    .line 994
    :cond_f
    const/4 v10, 0x0

    .line 995
    .local v10, "count\\6":I
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_10
    :goto_8
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_13

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    .local v12, "element\\6":Ljava/lang/Object;
    move-object v13, v12

    check-cast v13, Lcom/example/nirikshak/network/InspectionReportDto;

    .local v13, "it\\7":Lcom/example/nirikshak/network/InspectionReportDto;
    const/4 v14, 0x0

    .line 136
    .local v14, "$i$a$-count-HomeScreenKt$HomeScreen$3$1$3\\7\\995\\0":I
    invoke-virtual {v13}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v15

    const-string v3, "pending"

    invoke-static {v15, v3, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_12

    invoke-virtual {v13}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v3

    const-string v15, "PENDING"

    invoke-static {v3, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_11

    goto :goto_9

    :cond_11
    const/4 v3, 0x0

    goto :goto_a

    :cond_12
    :goto_9
    move v3, v4

    .line 995
    .end local v13    # "it\\7":Lcom/example/nirikshak/network/InspectionReportDto;
    .end local v14    # "$i$a$-count-HomeScreenKt$HomeScreen$3$1$3\\7\\995\\0":I
    :goto_a
    if-eqz v3, :cond_10

    add-int/lit8 v10, v10, 0x1

    if-gez v10, :cond_10

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .end local v12    # "element\\6":Ljava/lang/Object;
    goto :goto_8

    .line 996
    :cond_13
    nop

    .line 136
    .end local v7    # "$this$count\\6":Ljava/lang/Iterable;
    .end local v9    # "$i$f$count\\6\\136":I
    .end local v10    # "count\\6":I
    :goto_b
    invoke-static {v5, v10}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->access$HomeScreen$lambda$17(Landroidx/compose/runtime/MutableIntState;I)V

    .line 137
    iget-object v3, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$rejectedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    move-object v5, v8

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$count\\8":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 997
    .local v7, "$i$f$count\\8\\137":I
    instance-of v9, v5, Ljava/util/Collection;

    if-eqz v9, :cond_14

    move-object v9, v5

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_14

    const/4 v9, 0x0

    goto :goto_f

    .line 998
    :cond_14
    const/4 v9, 0x0

    .line 999
    .local v9, "count\\8":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_15
    :goto_c
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_18

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "element\\8":Ljava/lang/Object;
    move-object v12, v11

    check-cast v12, Lcom/example/nirikshak/network/InspectionReportDto;

    .local v12, "it\\9":Lcom/example/nirikshak/network/InspectionReportDto;
    const/4 v13, 0x0

    .line 137
    .local v13, "$i$a$-count-HomeScreenKt$HomeScreen$3$1$4\\9\\999\\0":I
    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v14

    const-string v15, "rejected"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_17

    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v14

    const-string v15, "REJECTED"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_16

    goto :goto_d

    :cond_16
    const/4 v12, 0x0

    goto :goto_e

    :cond_17
    :goto_d
    move v12, v4

    .line 999
    .end local v12    # "it\\9":Lcom/example/nirikshak/network/InspectionReportDto;
    .end local v13    # "$i$a$-count-HomeScreenKt$HomeScreen$3$1$4\\9\\999\\0":I
    :goto_e
    if-eqz v12, :cond_15

    add-int/lit8 v9, v9, 0x1

    if-gez v9, :cond_15

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .end local v11    # "element\\8":Ljava/lang/Object;
    goto :goto_c

    .line 1000
    :cond_18
    nop

    .line 137
    .end local v5    # "$this$count\\8":Ljava/lang/Iterable;
    .end local v7    # "$i$f$count\\8\\137":I
    .end local v9    # "count\\8":I
    :goto_f
    invoke-static {v3, v9}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->access$HomeScreen$lambda$20(Landroidx/compose/runtime/MutableIntState;I)V

    .line 138
    iget-object v3, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$verifiedReportsCount$delegate:Landroidx/compose/runtime/MutableIntState;

    move-object v5, v8

    check-cast v5, Ljava/lang/Iterable;

    .local v5, "$this$count\\10":Ljava/lang/Iterable;
    const/4 v7, 0x0

    .line 1001
    .local v7, "$i$f$count\\10\\138":I
    instance-of v9, v5, Ljava/util/Collection;

    if-eqz v9, :cond_19

    move-object v9, v5

    check-cast v9, Ljava/util/Collection;

    invoke-interface {v9}, Ljava/util/Collection;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_19

    const/4 v9, 0x0

    goto :goto_13

    .line 1002
    :cond_19
    const/4 v9, 0x0

    .line 1003
    .local v9, "count\\10":I
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_1a
    :goto_10
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_1d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    .local v11, "element\\10":Ljava/lang/Object;
    move-object v12, v11

    check-cast v12, Lcom/example/nirikshak/network/InspectionReportDto;

    .local v12, "it\\11":Lcom/example/nirikshak/network/InspectionReportDto;
    const/4 v13, 0x0

    .line 138
    .local v13, "$i$a$-count-HomeScreenKt$HomeScreen$3$1$5\\11\\1003\\0":I
    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v14

    const-string v15, "approved"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_1c

    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v14

    const-string v15, "verified"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_1c

    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v14

    const-string v15, "APPROVED"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-nez v14, :cond_1c

    invoke-virtual {v12}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v14

    const-string v15, "VERIFIED"

    invoke-static {v14, v15, v4}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_1b

    goto :goto_11

    :cond_1b
    const/4 v12, 0x0

    goto :goto_12

    :cond_1c
    :goto_11
    move v12, v4

    .line 1003
    .end local v12    # "it\\11":Lcom/example/nirikshak/network/InspectionReportDto;
    .end local v13    # "$i$a$-count-HomeScreenKt$HomeScreen$3$1$5\\11\\1003\\0":I
    :goto_12
    if-eqz v12, :cond_1a

    add-int/lit8 v9, v9, 0x1

    if-gez v9, :cond_1a

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .end local v11    # "element\\10":Ljava/lang/Object;
    goto :goto_10

    .line 1004
    :cond_1d
    nop

    .line 138
    .end local v5    # "$this$count\\10":Ljava/lang/Iterable;
    .end local v7    # "$i$f$count\\10\\138":I
    .end local v9    # "count\\10":I
    :goto_13
    invoke-static {v3, v9}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->access$HomeScreen$lambda$23(Landroidx/compose/runtime/MutableIntState;I)V

    .line 139
    iget-object v3, v1, Lcom/example/nirikshak/ui/home/HomeScreenKt$HomeScreen$3$1;->$hasReportsData$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v3, v4}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->access$HomeScreen$lambda$26(Landroidx/compose/runtime/MutableState;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 142
    .end local v0    # "repResp":Lretrofit2/Response;
    .end local v2    # "serverList":Ljava/util/List;
    .end local v6    # "targetLmoId":Ljava/lang/String;
    .end local v8    # "list":Ljava/util/List;
    :cond_1e
    :goto_14
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
