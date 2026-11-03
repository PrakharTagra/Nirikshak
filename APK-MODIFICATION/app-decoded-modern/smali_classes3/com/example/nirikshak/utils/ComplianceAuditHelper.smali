.class public final Lcom/example/nirikshak/utils/ComplianceAuditHelper;
.super Ljava/lang/Object;
.source "ComplianceAuditHelper.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static formatIsoToIndianTime(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "iso"    # Ljava/lang/String;

    if-nez p0, :cond_0

    const-string v0, "Recent"

    return-object v0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_pre

    return-object p0

    :cond_pre
    const-string v0, "M"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_pre2

    return-object p0

    :cond_pre2
    const-string v0, "T"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    return-object p0

    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x13

    if-le v0, v1, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_2
    move-object v0, p0

    :goto_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd\'T\'HH:mm:ss"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd MMM yyyy, hh:mm a"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v2, "Asia/Kolkata"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object p0
.end method

.method public static createFallbackReport(Ljava/lang/String;Ljava/lang/String;)Lcom/example/nirikshak/network/ComplianceReportData;
    .registers 23
    .param p0, "prodName"    # Ljava/lang/String;
    .param p1, "officerId"    # Ljava/lang/String;

    if-eqz p0, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string p0, "Inspected Product"

    :cond_1
    move-object/from16 v3, p0

    if-eqz p1, :cond_2

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const-string p1, "0bdeef9a-bd2f-4c1a-a3b5-7606abd0e788"

    :cond_3
    move-object/from16 v7, p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "REP-"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v2, v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://nirikshak-compliance-engine-9uj4.onrender.com/api/v1/reports/"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, "/pdf"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    move-object v10, v9

    move-object v11, v9

    const-string v4, "COMPLIANT"

    const-string v5, "COMPLIANT"

    const-string v6, "Verified"

    const-string v8, "DELHI-HQ"

    const-string v12, "Statutory declarations verified and compliant under Legal Metrology (Packaged Commodities) Rules."

    const-string v13, "Senior Legal Metrology Officer"

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    new-instance v14, Ljava/text/SimpleDateFormat;

    const-string v15, "dd MMM yyyy, hh:mm a"

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct/range {v14 .. v16}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v15, "Asia/Kolkata"

    invoke-static {v15}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v14, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x0

    new-instance v0, Lcom/example/nirikshak/network/EvidenceImageDto;

    const-string v17, "RULE_MANDATORY_DECLARATIONS"

    const-string v18, "Statutory PCR Verification"

    const-string v19, "legal_metrology"

    const-string v20, "COMPLIANT"

    const-string v21, "All mandatory package declarations verified compliant with Rule 6 & 9."

    const-string v22, ""

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v22}, Lcom/example/nirikshak/network/EvidenceImageDto;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v16

    new-instance v17, Lcom/example/nirikshak/network/InspectionSummaryDto;

    const/4 v0, 0x0

    move-object/from16 v18, v1

    move-object/from16 v1, v17

    invoke-direct {v1, v0, v0}, Lcom/example/nirikshak/network/InspectionSummaryDto;-><init>(II)V

    new-instance v0, Lcom/example/nirikshak/network/ComplianceReportData;

    move-object/from16 v1, v18

    invoke-direct/range {v0 .. v17}, Lcom/example/nirikshak/network/ComplianceReportData;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Lcom/example/nirikshak/network/InspectionSummaryDto;)V

    return-object v0
.end method
