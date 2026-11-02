.class final Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "AuthScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/auth/AuthScreenKt;->AuthScreen(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
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
    c = "com.example.nirikshak.ui.auth.AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1"
    f = "AuthScreen.kt"
    i = {}
    l = {
        0xfd
    }
    m = "invokeSuspend"
    n = {}
    nl = {
        0xfe
    }
    s = {}
    v = 0x2
.end annotation


# instance fields
.field final synthetic $apiService:Lcom/example/nirikshak/network/ApiService;

.field final synthetic $email$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $emailError$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $isLoading$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $onAuthSuccess:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $password$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $passwordError$delegate:Landroidx/compose/runtime/MutableState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field label:I


# direct methods
.method constructor <init>(Lcom/example/nirikshak/network/ApiService;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/example/nirikshak/network/ApiService;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/Boolean;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/compose/runtime/MutableState<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iput-object p2, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$onAuthSuccess:Lkotlin/jvm/functions/Function0;

    iput-object p3, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$email$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p4, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$password$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p6, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$passwordError$delegate:Landroidx/compose/runtime/MutableState;

    iput-object p7, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$emailError$delegate:Landroidx/compose/runtime/MutableState;

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

    new-instance v0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;

    iget-object v1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    iget-object v2, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$onAuthSuccess:Lkotlin/jvm/functions/Function0;

    iget-object v3, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$email$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$password$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v6, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$passwordError$delegate:Landroidx/compose/runtime/MutableState;

    iget-object v7, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$emailError$delegate:Landroidx/compose/runtime/MutableState;

    move-object v8, p2

    invoke-direct/range {v0 .. v8}, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;-><init>(Lcom/example/nirikshak/network/ApiService;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Lkotlin/coroutines/Continuation;)V

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Lkotlinx/coroutines/CoroutineScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->invoke(Lkotlinx/coroutines/CoroutineScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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

    invoke-virtual {p0, p1, p2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10
    .param p1, "$result"    # Ljava/lang/Object;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 251
    iget v1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->label:I

    const/4 v2, 0x1

    const/4 v3, 0x0

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

    .line 265
    :catch_0
    move-exception v0

    goto/16 :goto_3

    .line 251
    :pswitch_1
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 252
    nop

    .line 253
    :try_start_1
    iget-object v1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$apiService:Lcom/example/nirikshak/network/ApiService;

    new-instance v4, Lcom/example/nirikshak/network/LoginRequest;

    iget-object v5, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$email$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v5}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$3(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Lkotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$password$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v6}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$6(Landroidx/compose/runtime/MutableState;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/example/nirikshak/network/LoginRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput v2, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->label:I

    invoke-interface {v1, v4, v5}, Lcom/example/nirikshak/network/ApiService;->login(Lcom/example/nirikshak/network/LoginRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 251
    return-object v0

    :cond_0
    :goto_0
    check-cast v1, Lretrofit2/Response;

    .line 254
    .local v1, "response":Lretrofit2/Response;
    iget-object v0, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v0, v3}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$20(Landroidx/compose/runtime/MutableState;Z)V

    .line 255
    invoke-virtual {v1}, Lretrofit2/Response;->isSuccessful()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {v1}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/network/LoginResponse;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/example/nirikshak/network/LoginResponse;->getSuccess()Z

    move-result v0

    if-ne v0, v2, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    if-eqz v2, :cond_4

    .line 256
    sget-object v4, Lcom/example/nirikshak/network/OfficerSession;->INSTANCE:Lcom/example/nirikshak/network/OfficerSession;

    invoke-virtual {v1}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/network/LoginResponse;

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/example/nirikshak/network/LoginResponse;->getUser()Lcom/example/nirikshak/network/UserDto;

    move-result-object v0

    move-object v5, v0

    goto :goto_2

    :cond_2
    move-object v5, v2

    :goto_2
    invoke-virtual {v1}, Lretrofit2/Response;->body()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/network/LoginResponse;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/example/nirikshak/network/LoginResponse;->getToken()Ljava/lang/String;

    move-result-object v2

    :cond_3
    move-object v6, v2

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lcom/example/nirikshak/network/OfficerSession;->update$default(Lcom/example/nirikshak/network/OfficerSession;Lcom/example/nirikshak/network/UserDto;Ljava/lang/String;Landroid/content/Context;ILjava/lang/Object;)V

    .line 257
    iget-object v0, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$onAuthSuccess:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_4

    .line 258
    :cond_4
    invoke-virtual {v1}, Lretrofit2/Response;->code()I

    move-result v0

    const/16 v2, 0x191

    if-ne v0, v2, :cond_5

    .line 259
    iget-object v0, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$passwordError$delegate:Landroidx/compose/runtime/MutableState;

    const-string v2, "Incorrect password. Please enter correct credentials."

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$16(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    goto :goto_4

    .line 260
    :cond_5
    invoke-virtual {v1}, Lretrofit2/Response;->code()I

    move-result v0

    const/16 v2, 0x194

    if-ne v0, v2, :cond_6

    .line 261
    iget-object v0, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$emailError$delegate:Landroidx/compose/runtime/MutableState;

    const-string v2, "Username / Official ID not found in database."

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$13(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    goto :goto_4

    .line 263
    :cond_6
    iget-object v0, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$passwordError$delegate:Landroidx/compose/runtime/MutableState;

    const-string v2, "Authentication failed. Please verify credentials."

    invoke-static {v0, v2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$16(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "response":Lretrofit2/Response;
    goto :goto_4

    .line 266
    .local v0, "e":Ljava/lang/Exception;
    :goto_3
    iget-object v1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$isLoading$delegate:Landroidx/compose/runtime/MutableState;

    invoke-static {v1, v3}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$20(Landroidx/compose/runtime/MutableState;Z)V

    .line 267
    iget-object v1, p0, Lcom/example/nirikshak/ui/auth/AuthScreenKt$AuthScreen$3$1$2$1$1$6$1$1;->$passwordError$delegate:Landroidx/compose/runtime/MutableState;

    const-string v2, "Cannot connect to server. Please ensure backend is running."

    invoke-static {v1, v2}, Lcom/example/nirikshak/ui/auth/AuthScreenKt;->access$AuthScreen$lambda$16(Landroidx/compose/runtime/MutableState;Ljava/lang/String;)V

    .line 269
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_4
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
