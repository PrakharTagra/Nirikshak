.class public final synthetic Lcom/example/nirikshak/ui/reports/ReportsScreenKt$$ExternalSyntheticLambda16;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/util/List;

.field public final synthetic f$1:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Landroid/content/Context;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$$ExternalSyntheticLambda16;->f$0:Ljava/util/List;

    iput-object p2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$$ExternalSyntheticLambda16;->f$1:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$$ExternalSyntheticLambda16;->f$0:Ljava/util/List;

    iget-object v1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$$ExternalSyntheticLambda16;->f$1:Landroid/content/Context;

    check-cast p1, Landroidx/compose/foundation/lazy/LazyListScope;

    invoke-static {v0, v1, p1}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->$r8$lambda$ez-Bo2ILUSVyHeI5mzh2ZR2fDMY(Ljava/util/List;Landroid/content/Context;Landroidx/compose/foundation/lazy/LazyListScope;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
