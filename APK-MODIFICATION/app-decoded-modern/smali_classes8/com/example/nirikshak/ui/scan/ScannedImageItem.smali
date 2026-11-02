.class public final Lcom/example/nirikshak/ui/scan/ScannedImageItem;
.super Ljava/lang/Object;
.source "ScanScreen.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0019\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0008\u0087\u0008\u0018\u00002\u00020\u0001BW\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u0012\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u0005\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u0005\u0012\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\t\u0010\u001e\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\u001f\u001a\u00020\u0005H\u00c6\u0003J\t\u0010 \u001a\u00020\u0005H\u00c6\u0003J\u000b\u0010!\u001a\u0004\u0018\u00010\u0008H\u00c6\u0003J\u000b\u0010\"\u001a\u0004\u0018\u00010\nH\u00c6\u0003J\t\u0010#\u001a\u00020\u0005H\u00c6\u0003J\t\u0010$\u001a\u00020\u0005H\u00c6\u0003J\u000b\u0010%\u001a\u0004\u0018\u00010\u000eH\u00c6\u0003J_\u0010&\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u00052\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00082\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u00052\u0008\u0008\u0002\u0010\u000c\u001a\u00020\u00052\n\u0008\u0002\u0010\r\u001a\u0004\u0018\u00010\u000eH\u00c6\u0001J\u0014\u0010\'\u001a\u00020(2\u0008\u0010)\u001a\u0004\u0018\u00010\u0001H\u00d6\u0083\u0004J\n\u0010*\u001a\u00020\u0003H\u00d6\u0081\u0004J\n\u0010+\u001a\u00020\u0005H\u00d6\u0081\u0004R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0014R\u0013\u0010\u0007\u001a\u0004\u0018\u00010\u0008\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0013\u0010\t\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019R\u0011\u0010\u000b\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u0014R\u0011\u0010\u000c\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u0014R\u0013\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001d\u00a8\u0006,"
    }
    d2 = {
        "Lcom/example/nirikshak/ui/scan/ScannedImageItem;",
        "",
        "id",
        "",
        "title",
        "",
        "source",
        "bitmap",
        "Landroid/graphics/Bitmap;",
        "imageUri",
        "Landroid/net/Uri;",
        "resolution",
        "complianceBadge",
        "dimensions",
        "Lcom/example/nirikshak/camera/PackageDimensions;",
        "<init>",
        "(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)V",
        "getId",
        "()I",
        "getTitle",
        "()Ljava/lang/String;",
        "getSource",
        "getBitmap",
        "()Landroid/graphics/Bitmap;",
        "getImageUri",
        "()Landroid/net/Uri;",
        "getResolution",
        "getComplianceBadge",
        "getDimensions",
        "()Lcom/example/nirikshak/camera/PackageDimensions;",
        "component1",
        "component2",
        "component3",
        "component4",
        "component5",
        "component6",
        "component7",
        "component8",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
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
.field private final bitmap:Landroid/graphics/Bitmap;

.field private final complianceBadge:Ljava/lang/String;

.field private final dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

.field private final id:I

.field private final imageUri:Landroid/net/Uri;

.field private final resolution:Ljava/lang/String;

.field private final source:Ljava/lang/String;

.field private final title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    sput v0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->$stable:I

    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/String;
    .param p4, "bitmap"    # Landroid/graphics/Bitmap;
    .param p5, "imageUri"    # Landroid/net/Uri;
    .param p6, "resolution"    # Ljava/lang/String;
    .param p7, "complianceBadge"    # Ljava/lang/String;
    .param p8, "dimensions"    # Lcom/example/nirikshak/camera/PackageDimensions;

    const-string v0, "title"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "resolution"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "complianceBadge"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput p1, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    .line 96
    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    .line 97
    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    .line 98
    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    .line 99
    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    .line 100
    iput-object p6, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    .line 101
    iput-object p7, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    .line 102
    iput-object p8, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    .line 94
    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 1

    .line 94
    and-int/lit8 p10, p9, 0x8

    const/4 v0, 0x0

    if-eqz p10, :cond_0

    .line 98
    move-object p4, v0

    .line 94
    :cond_0
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_1

    .line 99
    move-object p5, v0

    .line 94
    :cond_1
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_2

    .line 100
    const-string p6, ""

    .line 94
    :cond_2
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_3

    .line 101
    const-string p7, "FULL FRAME UNCLIPPED"

    .line 94
    :cond_3
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_4

    .line 102
    move-object p9, v0

    goto :goto_0

    .line 94
    :cond_4
    move-object p9, p8

    :goto_0
    move-object p8, p7

    move-object p7, p6

    move-object p6, p5

    move-object p5, p4

    move-object p4, p3

    move-object p3, p2

    move p2, p1

    move-object p1, p0

    invoke-direct/range {p1 .. p9}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)V

    .line 103
    return-void
.end method

.method public static synthetic copy$default(Lcom/example/nirikshak/ui/scan/ScannedImageItem;ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;ILjava/lang/Object;)Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .locals 0

    and-int/lit8 p10, p9, 0x1

    if-eqz p10, :cond_0

    iget p1, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    :cond_0
    and-int/lit8 p10, p9, 0x2

    if-eqz p10, :cond_1

    iget-object p2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    :cond_1
    and-int/lit8 p10, p9, 0x4

    if-eqz p10, :cond_2

    iget-object p3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    :cond_2
    and-int/lit8 p10, p9, 0x8

    if-eqz p10, :cond_3

    iget-object p4, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    :cond_3
    and-int/lit8 p10, p9, 0x10

    if-eqz p10, :cond_4

    iget-object p5, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    :cond_4
    and-int/lit8 p10, p9, 0x20

    if-eqz p10, :cond_5

    iget-object p6, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    :cond_5
    and-int/lit8 p10, p9, 0x40

    if-eqz p10, :cond_6

    iget-object p7, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    :cond_6
    and-int/lit16 p9, p9, 0x80

    if-eqz p9, :cond_7

    iget-object p8, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    :cond_7
    move-object p9, p7

    move-object p10, p8

    move-object p7, p5

    move-object p8, p6

    move-object p5, p3

    move-object p6, p4

    move p3, p1

    move-object p4, p2

    move-object p2, p0

    invoke-virtual/range {p2 .. p10}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->copy(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()I
    .locals 1

    iget v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    return v0
.end method

.method public final component2()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    return-object v0
.end method

.method public final component3()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    return-object v0
.end method

.method public final component4()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public final component5()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public final component6()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    return-object v0
.end method

.method public final component7()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    return-object v0
.end method

.method public final component8()Lcom/example/nirikshak/camera/PackageDimensions;
    .locals 1

    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    return-object v0
.end method

.method public final copy(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)Lcom/example/nirikshak/ui/scan/ScannedImageItem;
    .locals 10

    const-string v0, "title"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "resolution"

    move-object/from16 v7, p6

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "complianceBadge"

    move-object/from16 v8, p7

    invoke-static {v8, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object/from16 v9, p8

    invoke-direct/range {v1 .. v9}, Lcom/example/nirikshak/ui/scan/ScannedImageItem;-><init>(ILjava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Lcom/example/nirikshak/camera/PackageDimensions;)V

    return-object v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    move-object v1, p1

    check-cast v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    iget v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    iget v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    if-eq v3, v4, :cond_2

    return v2

    :cond_2
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    return v2

    :cond_3
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    return v2

    :cond_4
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    return v2

    :cond_5
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    return v2

    :cond_6
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    return v2

    :cond_7
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    iget-object v4, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    return v2

    :cond_8
    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    iget-object v1, v1, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return v2

    :cond_9
    return v0
.end method

.method public final getBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public final getComplianceBadge()Ljava/lang/String;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    return-object v0
.end method

.method public final getDimensions()Lcom/example/nirikshak/camera/PackageDimensions;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    return-object v0
.end method

.method public final getId()I
    .locals 1

    .line 95
    iget v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    return v0
.end method

.method public final getImageUri()Landroid/net/Uri;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public final getResolution()Ljava/lang/String;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    return-object v0
.end method

.method public final getSource()Ljava/lang/String;
    .locals 1

    .line 97
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    return-object v0
.end method

.method public final getTitle()Ljava/lang/String;
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    iget v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    invoke-static {v0}, Ljava/lang/Integer;->hashCode(I)I

    move-result v0

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    const/4 v3, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->hashCode()I

    move-result v2

    :goto_0
    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    if-nez v2, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v1, v2

    mul-int/lit8 v0, v1, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    invoke-virtual {v2}, Lcom/example/nirikshak/camera/PackageDimensions;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v1, v3

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 10

    iget v0, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->id:I

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->title:Ljava/lang/String;

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->source:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->bitmap:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->imageUri:Landroid/net/Uri;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->resolution:Ljava/lang/String;

    iget-object v6, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->complianceBadge:Ljava/lang/String;

    iget-object v7, p0, Lcom/example/nirikshak/ui/scan/ScannedImageItem;->dimensions:Lcom/example/nirikshak/camera/PackageDimensions;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ScannedImageItem(id="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v8, ", title="

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", bitmap="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imageUri="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", resolution="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", complianceBadge="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dimensions="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
