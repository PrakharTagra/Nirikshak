.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:Landroid/graphics/Bitmap;

.field public final synthetic f$1:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

.field public final synthetic f$2:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/Bitmap;Lcom/example/nirikshak/ui/scan/ScannedImageItem;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$0:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$1:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$2:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$0:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$1:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda28;->f$2:Lkotlin/jvm/functions/Function0;

    check-cast p1, Landroidx/compose/runtime/Composer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-static {v0, v1, v2, p1, p2}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->$r8$lambda$DAp1i3xI1_hXhkPlFCDvHpU86hM(Landroid/graphics/Bitmap;Lcom/example/nirikshak/ui/scan/ScannedImageItem;Lkotlin/jvm/functions/Function0;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
