.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroidx/activity/compose/ManagedActivityResultLauncher;

.field public final synthetic f$4:Landroidx/activity/compose/ManagedActivityResultLauncher;

.field public final synthetic f$5:Landroidx/compose/runtime/MutableState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/activity/compose/ManagedActivityResultLauncher;Landroidx/activity/compose/ManagedActivityResultLauncher;Landroidx/compose/runtime/MutableState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iput p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$1:I

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$3:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iput-object p5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$4:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iput-object p6, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$5:Landroidx/compose/runtime/MutableState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$1:I

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$3:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iget-object v4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$4:Landroidx/activity/compose/ManagedActivityResultLauncher;

    iget-object v5, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda62;->f$5:Landroidx/compose/runtime/MutableState;

    move-object v6, p1

    check-cast v6, Landroidx/compose/foundation/layout/ColumnScope;

    move-object v7, p2

    check-cast v7, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static/range {v0 .. v8}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->$r8$lambda$MMHPQ6bzmj3_cc3GQQntliaBoPc(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/activity/compose/ManagedActivityResultLauncher;Landroidx/activity/compose/ManagedActivityResultLauncher;Landroidx/compose/runtime/MutableState;Landroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
