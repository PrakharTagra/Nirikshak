.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$4:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$5:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$6:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$7:Landroidx/compose/runtime/MutableState;

.field public final synthetic f$8:Landroidx/compose/runtime/MutableIntState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableIntState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iput p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$1:I

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$3:Landroidx/compose/runtime/MutableState;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$4:Landroidx/compose/runtime/MutableState;

    iput-object p6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$5:Landroidx/compose/runtime/MutableState;

    iput-object p7, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$6:Landroidx/compose/runtime/MutableState;

    iput-object p8, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$7:Landroidx/compose/runtime/MutableState;

    iput-object p9, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$8:Landroidx/compose/runtime/MutableIntState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$1:I

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$3:Landroidx/compose/runtime/MutableState;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$4:Landroidx/compose/runtime/MutableState;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$5:Landroidx/compose/runtime/MutableState;

    iget-object v6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$6:Landroidx/compose/runtime/MutableState;

    iget-object v7, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$7:Landroidx/compose/runtime/MutableState;

    iget-object v8, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda59;->f$8:Landroidx/compose/runtime/MutableIntState;

    move-object v9, p1

    check-cast v9, Ljava/io/File;

    move-object v10, p2

    check-cast v10, Lcom/example/nirikshak/camera/QualityCheckResult;

    move-object v11, p3

    check-cast v11, Lcom/example/nirikshak/camera/PackageDimensions;

    invoke-static/range {v0 .. v11}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->$r8$lambda$DR3dWYRlQ16_62EObVNqfzM2tFQ(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableState;Landroidx/compose/runtime/MutableIntState;Ljava/io/File;Lcom/example/nirikshak/camera/QualityCheckResult;Lcom/example/nirikshak/camera/PackageDimensions;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
