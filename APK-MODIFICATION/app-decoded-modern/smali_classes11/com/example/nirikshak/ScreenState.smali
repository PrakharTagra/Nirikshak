.class public final enum Lcom/example/nirikshak/ScreenState;
.super Ljava/lang/Enum;
.source "Navigation.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/example/nirikshak/ScreenState;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0008\u0006\u0008\u0086\u0081\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00000\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003j\u0002\u0008\u0004j\u0002\u0008\u0005j\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/example/nirikshak/ScreenState;",
        "",
        "<init>",
        "(Ljava/lang/String;I)V",
        "LANDING",
        "AUTH",
        "HOME",
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
.field private static final synthetic $ENTRIES:Lkotlin/enums/EnumEntries;

.field private static final synthetic $VALUES:[Lcom/example/nirikshak/ScreenState;

.field public static final enum AUTH:Lcom/example/nirikshak/ScreenState;

.field public static final enum HOME:Lcom/example/nirikshak/ScreenState;

.field public static final enum LANDING:Lcom/example/nirikshak/ScreenState;


# direct methods
.method private static final synthetic $values()[Lcom/example/nirikshak/ScreenState;
    .locals 3

    sget-object v0, Lcom/example/nirikshak/ScreenState;->LANDING:Lcom/example/nirikshak/ScreenState;

    sget-object v1, Lcom/example/nirikshak/ScreenState;->AUTH:Lcom/example/nirikshak/ScreenState;

    sget-object v2, Lcom/example/nirikshak/ScreenState;->HOME:Lcom/example/nirikshak/ScreenState;

    filled-new-array {v0, v1, v2}, [Lcom/example/nirikshak/ScreenState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 17
    new-instance v0, Lcom/example/nirikshak/ScreenState;

    const-string v1, "LANDING"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/example/nirikshak/ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/example/nirikshak/ScreenState;->LANDING:Lcom/example/nirikshak/ScreenState;

    .line 18
    new-instance v0, Lcom/example/nirikshak/ScreenState;

    const-string v1, "AUTH"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/example/nirikshak/ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/example/nirikshak/ScreenState;->AUTH:Lcom/example/nirikshak/ScreenState;

    .line 19
    new-instance v0, Lcom/example/nirikshak/ScreenState;

    const-string v1, "HOME"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/example/nirikshak/ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/example/nirikshak/ScreenState;->HOME:Lcom/example/nirikshak/ScreenState;

    invoke-static {}, Lcom/example/nirikshak/ScreenState;->$values()[Lcom/example/nirikshak/ScreenState;

    move-result-object v0

    sput-object v0, Lcom/example/nirikshak/ScreenState;->$VALUES:[Lcom/example/nirikshak/ScreenState;

    sget-object v0, Lcom/example/nirikshak/ScreenState;->$VALUES:[Lcom/example/nirikshak/ScreenState;

    check-cast v0, [Ljava/lang/Enum;

    invoke-static {v0}, Lkotlin/enums/EnumEntriesKt;->enumEntries([Ljava/lang/Enum;)Lkotlin/enums/EnumEntries;

    move-result-object v0

    sput-object v0, Lcom/example/nirikshak/ScreenState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "$enum$name"    # Ljava/lang/String;
    .param p2, "$enum$ordinal"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 16
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getEntries()Lkotlin/enums/EnumEntries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/enums/EnumEntries<",
            "Lcom/example/nirikshak/ScreenState;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/example/nirikshak/ScreenState;->$ENTRIES:Lkotlin/enums/EnumEntries;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/example/nirikshak/ScreenState;
    .locals 1

    const-class v0, Lcom/example/nirikshak/ScreenState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/example/nirikshak/ScreenState;

    return-object v0
.end method

.method public static values()[Lcom/example/nirikshak/ScreenState;
    .locals 1

    sget-object v0, Lcom/example/nirikshak/ScreenState;->$VALUES:[Lcom/example/nirikshak/ScreenState;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/example/nirikshak/ScreenState;

    return-object v0
.end method
