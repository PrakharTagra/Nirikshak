.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Landroidx/compose/ui/Modifier;

.field public final synthetic f$2:I

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(JLandroidx/compose/ui/Modifier;II)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$0:J

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$1:Landroidx/compose/ui/Modifier;

    iput p4, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$2:I

    iput p5, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$3:I

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 0
    iget-wide v0, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$0:J

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$1:Landroidx/compose/ui/Modifier;

    iget v3, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$2:I

    iget v4, p0, Lcom/example/nirikshak/ui/scan/ScanIconsKt$$ExternalSyntheticLambda7;->f$3:I

    move-object v5, p1

    check-cast v5, Landroidx/compose/runtime/Composer;

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-static/range {v0 .. v6}, Lcom/example/nirikshak/ui/scan/ScanIconsKt;->$r8$lambda$HCMLIGLDpH1gaNzgi4dncvJxKsE(JLandroidx/compose/ui/Modifier;IILandroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
