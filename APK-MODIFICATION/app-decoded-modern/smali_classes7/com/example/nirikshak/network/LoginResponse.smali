.class public final Lcom/example/nirikshak/network/LoginResponse;
.super Ljava/lang/Object;
.source "ApiService.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0013\n\u0002\u0010\u0008\n\u0002\u0008\u0002\u0008\u0087\u0008\u0018\u00002\u00020\u0001B9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\u0003H\u00c6\u0003J\u000b\u0010\u0015\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0016\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0017\u001a\u0004\u0018\u00010\u0005H\u00c6\u0003J\u000b\u0010\u0018\u001a\u0004\u0018\u00010\tH\u00c6\u0003JC\u0010\u0019\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00052\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u00c6\u0001J\u0014\u0010\u001a\u001a\u00020\u00032\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010\u001c\u001a\u00020\u001dH\u00d6\u0081\u0004J\n\u0010\u001e\u001a\u00020\u0005H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000fR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0010\u0010\u000fR\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u000fR\u0013\u0010\u0008\u001a\u0004\u0018\u00010\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u001f"
    }
    d2 = {
        "Lcom/example/nirikshak/network/LoginResponse;",
        "",
        "success",
        "",
        "message",
        "",
        "otp",
        "token",
        "user",
        "Lcom/example/nirikshak/network/UserDto;",
        "<init>",
        "(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)V",
        "getSuccess",
        "()Z",
        "getMessage",
        "()Ljava/lang/String;",
        "getOtp",
        "getToken",
        "getUser",
        "()Lcom/example/nirikshak/network/UserDto;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "copy",
        "equals",
        "other",
        "hashCode",
        "",
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
.field private final message:Ljava/lang/String;

.field private final otp:Ljava/lang/String;

.field private final success:Z

.field private final token:Ljava/lang/String;

.field private final user:Lcom/example/nirikshak/network/UserDto;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)V
    .locals 0
    .param p1, "success"    # Z
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "otp"    # Ljava/lang/String;
    .param p4, "token"    # Ljava/lang/String;
    .param p5, "user"    # Lcom/example/nirikshak/network/UserDto;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-boolean p1, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    .line 39
    iput-object p2, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    .line 40
    iput-object p3, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    .line 41
    iput-object p4, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    .line 42
    iput-object p5, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    .line 37
    return-void
.end method

.method public synthetic constructor <init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 6

    .line 37
    and-int/lit8 p6, p6, 0x8

    if-eqz p6, :cond_0

    .line 41
    const/4 p4, 0x0

    move-object v4, p4

    goto :goto_0

    .line 37
    :cond_0
    move-object v4, p4

    :goto_0
    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/example/nirikshak/network/LoginResponse;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)V

    .line 43
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/network/LoginResponse;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;ILjava/lang/Object;)Lcom/example/nirikshak/network/LoginResponse;
    .locals 0

    and-int/lit8 p7, p6, 0x1

    if-eqz p7, :cond_0

    iget-boolean p1, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    :cond_0
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    :cond_1
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_2

    iget-object p3, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    :cond_2
    and-int/lit8 p7, p6, 0x8

    if-eqz p7, :cond_3

    iget-object p4, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    :cond_3
    and-int/lit8 p6, p6, 0x10

    if-eqz p6, :cond_4

    iget-object p5, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    :cond_4
    move-object p6, p4

    move-object p7, p5

    move-object p4, p2

    move-object p5, p3

    move-object p2, p0

    move p3, p1

    invoke-virtual/range {p2 .. p7}, Lcom/example/nirikshak/network/LoginResponse;->copy(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)Lcom/example/nirikshak/network/LoginResponse;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()Z
    .locals 1

    iget-boolean v0, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    return v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    return-object v0
.end method

.method public final component5()Lcom/example/nirikshak/network/UserDto;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    return-object v0
.end method

.method public final copy(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)Lcom/example/nirikshak/network/LoginResponse;
    .locals 6

    new-instance v0, Lcom/example/nirikshak/network/LoginResponse;

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/example/nirikshak/network/LoginResponse;-><init>(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/network/UserDto;)V

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/network/LoginResponse;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/network/LoginResponse;

    iget-boolean v3, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    iget-boolean v4, v1, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    iget-object v1, v1, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    return v2

    :cond_6
    return v0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    return-object v0
.end method

.method public final getOtp()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    return-object v0
.end method

.method public final getSuccess()Z
    .locals 1

    .line 38
    iget-boolean v0, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    return v0
.end method

.method public final getToken()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    return-object v0
.end method

.method public final getUser()Lcom/example/nirikshak/network/UserDto;
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    iget-boolean v0, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    if-nez v2, :cond_2

    move v2, v3

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_2
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    invoke-virtual {v2}, Lcom/example/nirikshak/network/UserDto;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    iget-boolean v0, p0, Lcom/example/nirikshak/network/LoginResponse;->success:Z

    iget-object v1, p0, Lcom/example/nirikshak/network/LoginResponse;->message:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/nirikshak/network/LoginResponse;->otp:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/network/LoginResponse;->token:Ljava/lang/String;

    iget-object v4, p0, Lcom/example/nirikshak/network/LoginResponse;->user:Lcom/example/nirikshak/network/UserDto;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LoginResponse(success="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v5, ", message="

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", otp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", user="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
