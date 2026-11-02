.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:Lkotlin/jvm/functions/Function0;

.field public final synthetic f$1:Landroid/graphics/Bitmap;

.field public final synthetic f$2:I

.field public final synthetic f$3:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

.field public final synthetic f$4:Lkotlin/jvm/functions/Function0;


# direct methods
.method public synthetic constructor <init>(Lkotlin/jvm/functions/Function0;Landroid/graphics/Bitmap;ILcom/example/nirikshak/ui/scan/ScannedImageItem;Lkotlin/jvm/functions/Function0;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$0:Lkotlin/jvm/functions/Function0;

    iput-object p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$1:Landroid/graphics/Bitmap;

    iput p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$2:I

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$3:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$4:Lkotlin/jvm/functions/Function0;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$0:Lkotlin/jvm/functions/Function0;

    iget-object v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$1:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$2:I

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$3:Lcom/example/nirikshak/ui/scan/ScannedImageItem;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda20;->f$4:Lkotlin/jvm/functions/Function0;

    move-object v5, p1

    check-cast v5, Landroidx/compose/foundation/layout/ColumnScope;

    move-object v6, p2

    check-cast v6, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static/range {v0 .. v7}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->$r8$lambda$X6x_7WPHTny8xLpeWzjrZJ0wPp4(Lkotlin/jvm/functions/Function0;Landroid/graphics/Bitmap;ILcom/example/nirikshak/ui/scan/ScannedImageItem;Lkotlin/jvm/functions/Function0;Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
