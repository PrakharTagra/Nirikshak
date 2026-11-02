.class public final synthetic Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

.field public final synthetic f$1:I

.field public final synthetic f$2:Landroid/content/Context;

.field public final synthetic f$3:Landroidx/compose/runtime/MutableIntState;


# direct methods
.method public synthetic constructor <init>(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/compose/runtime/MutableIntState;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iput p2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$1:I

    iput-object p3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$2:Landroid/content/Context;

    iput-object p4, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$3:Landroidx/compose/runtime/MutableIntState;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$0:Landroidx/compose/runtime/snapshots/SnapshotStateList;

    iget v1, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$1:I

    iget-object v2, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$2:Landroid/content/Context;

    iget-object v3, p0, Lcom/example/nirikshak/ui/scan/ScanScreenKt$$ExternalSyntheticLambda58;->f$3:Landroidx/compose/runtime/MutableIntState;

    check-cast p1, Landroid/net/Uri;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/example/nirikshak/ui/scan/ScanScreenKt;->$r8$lambda$_d11YYS8FKDWaH_ljUqu4_WQR88(Landroidx/compose/runtime/snapshots/SnapshotStateList;ILandroid/content/Context;Landroidx/compose/runtime/MutableIntState;Landroid/net/Uri;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
