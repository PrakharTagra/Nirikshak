.class public final synthetic Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function3;


# instance fields
.field public final synthetic f$0:J

.field public final synthetic f$1:Lcom/example/nirikshak/ui/home/ProfessionalCategoryItem;

.field public final synthetic f$2:J


# direct methods
.method public synthetic constructor <init>(JLcom/example/nirikshak/ui/home/ProfessionalCategoryItem;J)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$0:J

    iput-object p3, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$1:Lcom/example/nirikshak/ui/home/ProfessionalCategoryItem;

    iput-wide p4, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$2:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 0
    iget-wide v0, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$0:J

    iget-object v2, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$1:Lcom/example/nirikshak/ui/home/ProfessionalCategoryItem;

    iget-wide v3, p0, Lcom/example/nirikshak/ui/home/HomeScreenKt$$ExternalSyntheticLambda26;->f$2:J

    move-object v5, p1

    check-cast v5, Landroidx/compose/foundation/layout/ColumnScope;

    move-object v6, p2

    check-cast v6, Landroidx/compose/runtime/Composer;

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    invoke-static/range {v0 .. v7}, Lcom/example/nirikshak/ui/home/HomeScreenKt;->$r8$lambda$9uhD-YtjlBPXgCez3LFo-3ilBIk(JLcom/example/nirikshak/ui/home/ProfessionalCategoryItem;JLandroidx/compose/foundation/layout/ColumnScope;Landroidx/compose/runtime/Composer;I)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
