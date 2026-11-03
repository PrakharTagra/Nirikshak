.class final Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "ReportsScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->ReportsScreen(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
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
    value = "SMAP\nReportsScreen.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ReportsScreen.kt\ncom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,534:1\n777#2:535\n873#2,2:536\n1596#2:538\n1629#2,3:539\n1632#2:543\n1#3:542\n*S KotlinDebug\n*F\n+ 1 ReportsScreen.kt\ncom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1\n*L\n90#1:535\n90#1:536,2\n95#1:538\n95#1:539,3\n95#1:543\n*E\n"
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
    c = "com.example.nirikshak.ui.reports.ReportsScreenKt$ReportsScreen$1$1"
    f = "ReportsScreen.kt"
    i = {
        0x0
    }
    l = {
        0x55
    }
    m = "invokeSuspend"
    n = {
        "targetLmoId"
    }
    nl = {
        0x56
    }
    s = {
        "L$0"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $apiService:Lcom/example/nirikshak/network/ApiService;

.field final synthetic $isLoading$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $reportsList$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/util/List<",
            "Lcom/example/nirikshak/ui/reports/OfficialReportItem;",
            ">;>;"
        }
    .end annotation
.end field

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ApiService;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/util/List<",
            "Lcom/example/nirikshak/ui/reports/OfficialReportItem;",
            ">;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iput-object p2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p3, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 4
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

    new-instance v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iget-object v2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v3, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    invoke-direct {v0, v1, v2, v3, p2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;-><init>(Lcom/example/nirikshak/network/ApiService;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 36
    .param p1, "$result"    # Ljava/lang/Object;

    move-object/from16 v1, p0

    const-string v0, ".pdf"

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    .line 81
    iget v3, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->label:I

    const/4 v5, 0x1

    packed-switch v3, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v2, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->L$0:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    .local v2, "targetLmoId":Ljava/lang/String;
    :try_start_0
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v3, p1

    goto :goto_0

    .end local v2    # "targetLmoId":Ljava/lang/String;
    :pswitch_1
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 82
    iget-object v3, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v3, v5}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$6(Landroidx/compose/runtime/MutableState;Z)V

    .line 83
    nop

    .line 84
    :try_start_1
    sget-object v3, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v3}, Lcom/example/nirikshak/network/OfficerSession;->getMongoDbId()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_rep_use_officer_id

    check-cast v3, Ljava/lang/String;

    goto :cond_rep_target_ready

    :cond_rep_use_officer_id
    sget-object v3, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v3}, Lcom/example/nirikshak/network/OfficerSession;->getOfficerId()Ljava/lang/String;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_rep_use_fallback

    check-cast v3, Ljava/lang/String;

    goto :cond_rep_target_ready

    :cond_rep_use_fallback
    const-string v3, "0bdeef9a-bd2f-4c1a-a3b5-7606abd0e788"

    :cond_rep_target_ready
    move-object v7, v3
    .local v7, "targetLmoId":Ljava/lang/String;
    iget-object v6, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    move-object v9, v1

    check-cast v9, Lkotlin/coroutines/Continuation;

    iput-object v7, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->L$0:Ljava/lang/Object;

    iput v5, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->label:I

    const/4 v8, 0x0

    const/4 v10, 0x2

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Lcom/example/nirikshak/network/ApiService;->getReports$default(Lcom/example/nirikshak/network/ApiService;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v2, :cond_0

    .line 81
    return-object v2

    .line 85
    :cond_0
    move-object v2, v7

    .line 81
    .end local v7    # "targetLmoId":Ljava/lang/String;
    .restart local v2    # "targetLmoId":Ljava/lang/String;
    :goto_0
    check-cast v3, Lretrofit2/Response;

    .line 86
    .local v3, "response":Lretrofit2/Response;
    invoke-virtual {v3}, Lretrofit2/Response;->isSuccessful()Z

    move-result v6

    if-eqz v6, :cond_25

    invoke-virtual {v3}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/example/nirikshak/network/ReportsResponse;

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lcom/example/nirikshak/network/ReportsResponse;->getSuccess()Z

    move-result v6

    if-ne v6, v5, :cond_1

    move v6, v5

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    if-eqz v6, :cond_25

    .line 87
    invoke-virtual {v3}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/example/nirikshak/network/ReportsResponse;

    if-eqz v6, :cond_2

    invoke-virtual {v6}, Lcom/example/nirikshak/network/ReportsResponse;->getReports()Ljava/util/List;

    move-result-object v6

    goto :goto_2

    :cond_2
    const/4 v6, 0x0

    .line 88
    .local v6, "serverReports":Ljava/util/List;
    :goto_2
    move-object v8, v6

    check-cast v8, Ljava/util/Collection;

    if-eqz v8, :cond_4

    invoke-interface {v8}, Ljava/util/Collection;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_3

    goto :goto_3

    :cond_3
    const/4 v8, 0x0

    goto :goto_4

    :cond_4
    :goto_3
    move v8, v5

    :goto_4
    if-nez v8, :cond_24

    .line 90
    move-object v8, v6

    check-cast v8, Ljava/lang/Iterable;

    .local v8, "$this$filter\\1":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 535
    .local v9, "$i$f$filter\\1\\90":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination\\2":Ljava/util/Collection;
    move-object v11, v8

    .local v11, "$this$filterTo\\2":Ljava/lang/Iterable;
    const/4 v12, 0x0

    .line 536
    .local v12, "$i$f$filterTo\\2\\535":I
    invoke-interface {v11}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :cond_5
    :goto_5
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_a

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 537
    :cond_a
    nop

    .end local v10    # "destination\\2":Ljava/util/Collection;
    .end local v11    # "$this$filterTo\\2":Ljava/lang/Iterable;
    .end local v12    # "$i$f$filterTo\\2\\535":I
    move-object v7, v10

    check-cast v7, Ljava/util/List;

    .line 535
    nop

    .line 90
    .end local v8    # "$this$filter\\1":Ljava/lang/Iterable;
    .end local v9    # "$i$f$filter\\1\\90":I
    nop

    .line 95
    .local v7, "lmoOnlyReports":Ljava/util/List;
    move-object v8, v7

    check-cast v8, Ljava/lang/Iterable;

    .local v8, "$this$mapIndexed\\4":Ljava/lang/Iterable;
    const/4 v9, 0x0

    .line 538
    .local v9, "$i$f$mapIndexed\\4\\95":I
    new-instance v10, Ljava/util/ArrayList;

    const/16 v11, 0xa

    invoke-static {v8, v11}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v10, v12}, Ljava/util/ArrayList;-><init>(I)V

    check-cast v10, Ljava/util/Collection;

    .local v10, "destination\\5":Ljava/util/Collection;
    move-object v12, v8

    .local v12, "$this$mapIndexedTo\\5":Ljava/lang/Iterable;
    const/4 v13, 0x0

    .line 539
    .local v13, "$i$f$mapIndexedTo\\5\\538":I
    const/4 v14, 0x0

    .line 540
    .local v14, "index\\5":I
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_7
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_23

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    .line 541
    .local v16, "item\\5":Ljava/lang/Object;
    add-int/lit8 v18, v14, 0x1

    .end local v14    # "index\\5":I
    .local v18, "index\\5":I
    if-gez v14, :cond_b

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_b
    move-object/from16 v19, v16

    check-cast v19, Lcom/example/nirikshak/network/InspectionReportDto;

    .local v14, "index\\6":I
    .local v19, "r\\6":Lcom/example/nirikshak/network/InspectionReportDto;
    const/16 v20, 0x0

    .line 96
    .local v20, "$i$a$-mapIndexed-ReportsScreenKt$ReportsScreen$1$1$mapped$1\\6\\541\\0":I
    nop

    .line 97
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v21

    check-cast v21, Ljava/lang/CharSequence;

    if-eqz v21, :cond_d

    invoke-static/range {v21 .. v21}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v21
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v21, :cond_c

    goto :goto_8

    :cond_c
    const/16 v21, 0x0

    goto :goto_9

    :cond_d
    :goto_8
    move/from16 v21, v5

    :goto_9
    const-string v4, "REJECTED"

    if-nez v21, :cond_e

    :try_start_2
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getStatus()Ljava/lang/String;

    move-result-object v11

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v11, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    const-string v11, "toLowerCase(...)"

    invoke-static {v5, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    move-object/from16 v22, v2

    goto :goto_b

    .line 98
    :cond_e
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v5

    const-string v11, "APPROVED"

    move-object/from16 v22, v2

    const/4 v2, 0x1

    .end local v2    # "targetLmoId":Ljava/lang/String;
    .local v22, "targetLmoId":Ljava/lang/String;
    invoke-static {v5, v11, v2}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_11

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v5

    const-string v11, "VERIFIED"

    invoke-static {v5, v11, v2}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_f

    goto :goto_a

    .line 99
    :cond_f
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    invoke-static {v2, v4, v5}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_10

    const-string v5, "rejected"

    goto :goto_b

    .line 100
    :cond_10
    const-string v5, "pending"

    goto :goto_b

    .line 98
    :cond_11
    :goto_a
    const-string v5, "approved"

    .line 96
    :goto_b
    move-object/from16 v30, v5

    .line 102
    .local v30, "statusVal\\6":Ljava/lang/String;
    nop

    .line 103
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getComplianceResult()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_13

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_12

    goto :goto_c

    :cond_12
    const/4 v2, 0x0

    goto :goto_d

    :cond_13
    :goto_c
    const/4 v2, 0x1

    :goto_d
    if-nez v2, :cond_14

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getComplianceResult()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v31, v2

    goto :goto_10

    .line 104
    :cond_14
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getCompliance_result()Ljava/lang/String;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    if-eqz v2, :cond_16

    invoke-static {v2}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_15

    goto :goto_e

    :cond_15
    const/4 v2, 0x0

    goto :goto_f

    :cond_16
    :goto_e
    const/4 v2, 0x1

    :goto_f
    if-nez v2, :cond_17

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getCompliance_result()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v31, v2

    goto :goto_10

    .line 105
    :cond_17
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getVerdict()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    invoke-static {v2, v4, v5}, Lkotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_18

    const-string v2, "NON_COMPLIANT"

    move-object/from16 v31, v2

    goto :goto_10

    .line 106
    :cond_18
    const-string v2, "COMPLIANT"

    move-object/from16 v31, v2

    .line 102
    :goto_10
    nop

    .line 108
    .local v31, "compVal\\6":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getResolvedProductName()Ljava/lang/String;

    move-result-object v2

    .line 109
    .local v2, "prodName\\6":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getTimestamp()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_19

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getCreated_at()Ljava/lang/String;

    move-result-object v4

    :cond_19
    invoke-static {v4}, Lcom/example/nirikshak/utils/ComplianceAuditHelper;->formatIsoToIndianTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    .line 110
    .local v28, "dateVal\\6":Ljava/lang/String;
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getResolvedPdfUrl()Ljava/lang/String;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_1c

    .line 542
    const/4 v4, 0x0

    .line 110
    .local v4, "$i$a$-ifBlank-ReportsScreenKt$ReportsScreen$1$1$mapped$1$pdfLink$1\\7\\110\\6":I
    const/4 v4, 0x0

    .end local v4    # "$i$a$-ifBlank-ReportsScreenKt$ReportsScreen$1$1$mapped$1$pdfLink$1\\7\\110\\6":I
    :cond_1c
    move-object/from16 v35, v4

    check-cast v35, Ljava/lang/String;

    .line 112
    .local v35, "pdfLink\\6":Ljava/lang/String;
    new-instance v23, Lcom/example/nirikshak/ui/reports/OfficialReportItem;

    .line 113
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->get_id()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1d

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getId()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1d

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getResolvedReportId()Ljava/lang/String;

    move-result-object v4

    :cond_1d
    move-object/from16 v24, v4

    .line 114
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getResolvedReportId()Ljava/lang/String;

    move-result-object v25

    .line 115
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getReferenceNo()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1e

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getReference_no()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1e

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getResolvedReportId()Ljava/lang/String;

    move-result-object v4

    :cond_1e
    move-object/from16 v26, v4

    .line 116
    const/4 v4, 0x1

    invoke-static {v2, v0, v4}, Lkotlin/text/StringsKt;->endsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v11

    if-eqz v11, :cond_1f

    move-object/from16 v27, v2

    goto :goto_12

    :cond_1f
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v27, v11

    .line 117
    :goto_12
    nop

    .line 118
    const-string v29, "340 KB"

    .line 119
    nop

    .line 120
    nop

    .line 121
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecisionReason()Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_20

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecision_reason()Ljava/lang/String;

    move-result-object v11

    :cond_20
    move-object/from16 v32, v11

    .line 122
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecidedBy()Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_21

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecided_by()Ljava/lang/String;

    move-result-object v11

    :cond_21
    move-object/from16 v33, v11

    .line 123
    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecidedAt()Ljava/lang/String;

    move-result-object v11

    if-nez v11, :cond_22

    invoke-virtual/range {v19 .. v19}, Lcom/example/nirikshak/network/InspectionReportDto;->getDecided_at()Ljava/lang/String;

    move-result-object v11

    :cond_22
    if-eqz v11, :cond_22_fmt

    invoke-static {v11}, Lcom/example/nirikshak/utils/ComplianceAuditHelper;->formatIsoToIndianTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    :cond_22_fmt
    move-object/from16 v34, v11

    .line 124
    nop

    .line 112
    invoke-direct/range {v23 .. v35}, Lcom/example/nirikshak/ui/reports/OfficialReportItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v11, v23

    .line 125
    nop

    .line 541
    .end local v2    # "prodName\\6":Ljava/lang/String;
    .end local v14    # "index\\6":I
    .end local v19    # "r\\6":Lcom/example/nirikshak/network/InspectionReportDto;
    .end local v20    # "$i$a$-mapIndexed-ReportsScreenKt$ReportsScreen$1$1$mapped$1\\6\\541\\0":I
    .end local v28    # "dateVal\\6":Ljava/lang/String;
    .end local v30    # "statusVal\\6":Ljava/lang/String;
    .end local v31    # "compVal\\6":Ljava/lang/String;
    .end local v35    # "pdfLink\\6":Ljava/lang/String;
    invoke-interface {v10, v11}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    move v11, v5

    move/from16 v14, v18

    move-object/from16 v2, v22

    move v5, v4

    goto/16 :goto_7

    .line 543
    .end local v16    # "item\\5":Ljava/lang/Object;
    .end local v18    # "index\\5":I
    .end local v22    # "targetLmoId":Ljava/lang/String;
    .local v2, "targetLmoId":Ljava/lang/String;
    .local v14, "index\\5":I
    :cond_23
    move-object/from16 v22, v2

    .end local v2    # "targetLmoId":Ljava/lang/String;
    .end local v10    # "destination\\5":Ljava/util/Collection;
    .end local v12    # "$this$mapIndexedTo\\5":Ljava/lang/Iterable;
    .end local v13    # "$i$f$mapIndexedTo\\5\\538":I
    .end local v14    # "index\\5":I
    .restart local v22    # "targetLmoId":Ljava/lang/String;
    move-object v0, v10

    check-cast v0, Ljava/util/List;

    .line 538
    nop

    .line 95
    .end local v8    # "$this$mapIndexed\\4":Ljava/lang/Iterable;
    .end local v9    # "$i$f$mapIndexed\\4\\95":I
    nop

    .line 127
    .local v0, "mapped":Ljava/util/List;
    iget-object v2, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v2, v0}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$9(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V

    .end local v0    # "mapped":Ljava/util/List;
    .end local v7    # "lmoOnlyReports":Ljava/util/List;
    goto :goto_13

    .line 129
    .end local v22    # "targetLmoId":Ljava/lang/String;
    .restart local v2    # "targetLmoId":Ljava/lang/String;
    :cond_24
    move-object/from16 v22, v2

    .end local v2    # "targetLmoId":Ljava/lang/String;
    .restart local v22    # "targetLmoId":Ljava/lang/String;
    iget-object v0, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$9(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V

    .end local v6    # "serverReports":Ljava/util/List;
    goto :goto_13

    .line 86
    .end local v22    # "targetLmoId":Ljava/lang/String;
    .restart local v2    # "targetLmoId":Ljava/lang/String;
    :cond_25
    move-object/from16 v22, v2

    .line 132
    .end local v2    # "targetLmoId":Ljava/lang/String;
    .restart local v22    # "targetLmoId":Ljava/lang/String;
    iget-object v0, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$9(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_13

    .line 137
    .end local v3    # "response":Lretrofit2/Response;
    .end local v22    # "targetLmoId":Ljava/lang/String;
    :catchall_0
    move-exception v0

    goto :goto_14

    .line 134
    :catch_0
    move-exception v0

    .line 135
    .local v0, "<unused var>":Ljava/lang/Exception;
    :try_start_3
    iget-object v2, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$reportsList$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {}, Lkotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$9(Landroidx/compose/runtime/MutableState;Ljava/util/List;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 137
    .end local v0    # "<unused var>":Ljava/lang/Exception;
    :goto_13
    iget-object v0, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$6(Landroidx/compose/runtime/MutableState;Z)V

    .line 138
    nop

    .line 139
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 137
    :goto_14
    iget-object v2, v1, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->access$ReportsScreen$lambda$6(Landroidx/compose/runtime/MutableState;Z)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
