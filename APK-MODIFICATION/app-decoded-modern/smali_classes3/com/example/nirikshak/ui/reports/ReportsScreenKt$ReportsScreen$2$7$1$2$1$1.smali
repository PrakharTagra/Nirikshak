.class final Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;
.super Ljava/lang/Object;
.source "ReportsScreen.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/example/nirikshak/ui/reports/ReportsScreenKt;->ReportsScreen(Ljava/lang/String;Landroidx/compose/ui/Modifier;Landroidx/compose/runtime/Composer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    k = 0x3
    mv = {
        0x2,
        0x3,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $context:Landroid/content/Context;

.field final synthetic $report:Lcom/example/nirikshak/ui/reports/OfficialReportItem;

.field final synthetic $targetUrl:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/example/nirikshak/ui/reports/OfficialReportItem;)V
    .locals 0

    iput-object p1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$targetUrl:Ljava/lang/String;

    iput-object p2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$report:Lcom/example/nirikshak/ui/reports/OfficialReportItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 309
    invoke-virtual {p0}, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 4

    .line 310
    iget-object v0, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$targetUrl:Ljava/lang/String;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Lkotlin/text/StringsKt;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 311
    sget-object v0, Lcom/example/nirikshak/utils/PdfDownloadManager;->INSTANCE:Lcom/example/nirikshak/utils/PdfDownloadManager;

    iget-object v1, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$targetUrl:Ljava/lang/String;

    iget-object v3, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$report:Lcom/example/nirikshak/ui/reports/OfficialReportItem;

    invoke-virtual {v3}, Lcom/example/nirikshak/ui/reports/OfficialReportItem;->getFileName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/example/nirikshak/utils/PdfDownloadManager;->openInBrowser(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/example/nirikshak/ui/reports/ReportsScreenKt$ReportsScreen$2$7$1$2$1$1;->$context:Landroid/content/Context;

    const-string v1, "PDF not available for this report"

    check-cast v1, Ljava/lang/CharSequence;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 315
    :goto_0
    return-void
.end method
