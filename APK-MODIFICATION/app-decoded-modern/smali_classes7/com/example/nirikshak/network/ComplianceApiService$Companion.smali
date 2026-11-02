.class public final Lcom/example/nirikshak/network/ComplianceApiService$Companion;
.super Ljava/lang/Object;
.source "ComplianceApiService.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/example/nirikshak/network/ComplianceApiService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u00020\u00072\u0008\u0008\u0002\u0010\u0008\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/example/nirikshak/network/ComplianceApiService$Companion;",
        "",
        "<init>",
        "()V",
        "BASE_URL",
        "",
        "create",
        "Lcom/example/nirikshak/network/ComplianceApiService;",
        "baseUrl",
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
.field static final synthetic $$INSTANCE:Lcom/example/nirikshak/network/ComplianceApiService$Companion;

.field public static final BASE_URL:Ljava/lang/String; = "https://nirikshak-compliance-engine-9uj4.onrender.com/"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/example/nirikshak/network/ComplianceApiService$Companion;

    invoke-direct {v0}, Lcom/example/nirikshak/network/ComplianceApiService$Companion;-><init>()V

    sput-object v0, Lcom/example/nirikshak/network/ComplianceApiService$Companion;->$$INSTANCE:Lcom/example/nirikshak/network/ComplianceApiService$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic create$default(Lcom/example/nirikshak/network/ComplianceApiService$Companion;Ljava/lang/String;ILjava/lang/Object;)Lcom/example/nirikshak/network/ComplianceApiService;
    .locals 0

    .line 99
    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const-string p1, "https://nirikshak-compliance-engine-9uj4.onrender.com/"

    :cond_0
    invoke-virtual {p0, p1}, Lcom/example/nirikshak/network/ComplianceApiService$Companion;->create(Ljava/lang/String;)Lcom/example/nirikshak/network/ComplianceApiService;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final create(Ljava/lang/String;)Lcom/example/nirikshak/network/ComplianceApiService;
    .locals 6
    .param p1, "baseUrl"    # Ljava/lang/String;

    const-string v0, "baseUrl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    new-instance v0, Lokhttp3/logging/HttpLoggingInterceptor;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Lokhttp3/logging/HttpLoggingInterceptor;-><init>(Lokhttp3/logging/HttpLoggingInterceptor$Logger;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object v1, v0

    .local v1, "$this$create_u24lambda_u240\\1":Lokhttp3/logging/HttpLoggingInterceptor;
    const/4 v3, 0x0

    .line 101
    .local v3, "$i$a$-apply-ComplianceApiService$Companion$create$logging$1\\1\\100\\0":I
    sget-object v4, Lokhttp3/logging/HttpLoggingInterceptor$Level;->BODY:Lokhttp3/logging/HttpLoggingInterceptor$Level;

    invoke-virtual {v1, v4}, Lokhttp3/logging/HttpLoggingInterceptor;->level(Lokhttp3/logging/HttpLoggingInterceptor$Level;)V

    .line 102
    nop

    .line 100
    .end local v1    # "$this$create_u24lambda_u240\\1":Lokhttp3/logging/HttpLoggingInterceptor;
    .end local v3    # "$i$a$-apply-ComplianceApiService$Companion$create$logging$1\\1\\100\\0":I
    nop

    .line 104
    .local v0, "logging":Lokhttp3/logging/HttpLoggingInterceptor;
    new-instance v1, Lokhttp3/OkHttpClient$Builder;

    invoke-direct {v1}, Lokhttp3/OkHttpClient$Builder;-><init>()V

    .line 105
    move-object v3, v0

    check-cast v3, Lokhttp3/Interceptor;

    invoke-virtual {v1, v3}, Lokhttp3/OkHttpClient$Builder;->addInterceptor(Lokhttp3/Interceptor;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 106
    const-wide/16 v3, 0x3c

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v3, v4, v5}, Lokhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 107
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0xb4

    invoke-virtual {v1, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 108
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v4, v5, v3}, Lokhttp3/OkHttpClient$Builder;->writeTimeout(JLjava/util/concurrent/TimeUnit;)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 109
    invoke-virtual {v1, v2}, Lokhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lokhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 110
    invoke-virtual {v1}, Lokhttp3/OkHttpClient$Builder;->build()Lokhttp3/OkHttpClient;

    move-result-object v1

    .line 104
    nop

    .line 112
    .local v1, "okHttpClient":Lokhttp3/OkHttpClient;
    new-instance v2, Lretrofit2/Retrofit$Builder;

    invoke-direct {v2}, Lretrofit2/Retrofit$Builder;-><init>()V

    .line 113
    invoke-virtual {v2, p1}, Lretrofit2/Retrofit$Builder;->baseUrl(Ljava/lang/String;)Lretrofit2/Retrofit$Builder;

    move-result-object v2

    .line 114
    invoke-virtual {v2, v1}, Lretrofit2/Retrofit$Builder;->client(Lokhttp3/OkHttpClient;)Lretrofit2/Retrofit$Builder;

    move-result-object v2

    .line 115
    invoke-static {}, Lretrofit2/converter/gson/GsonConverterFactory;->create()Lretrofit2/converter/gson/GsonConverterFactory;

    move-result-object v3

    check-cast v3, Lretrofit2/Converter$Factory;

    invoke-virtual {v2, v3}, Lretrofit2/Retrofit$Builder;->addConverterFactory(Lretrofit2/Converter$Factory;)Lretrofit2/Retrofit$Builder;

    move-result-object v2

    .line 116
    invoke-virtual {v2}, Lretrofit2/Retrofit$Builder;->build()Lretrofit2/Retrofit;

    move-result-object v2

    .line 117
    const-class v3, Lcom/example/nirikshak/network/ComplianceApiService;

    invoke-virtual {v2, v3}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "create(...)"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lcom/example/nirikshak/network/ComplianceApiService;

    .line 112
    return-object v2
.end method
