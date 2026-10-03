#!/usr/bin/env python3
"""
Generate the Nirikshak PDP Dataset & Annotation Guide PDF.
"""

from pathlib import Path
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.platypus import (
    HRFlowable,
    KeepTogether,
    PageBreak,
    Paragraph,
    SimpleDocTemplate,
    Spacer,
    Table,
    TableStyle,
)


def create_guide_pdf(output_path: str):
    doc = SimpleDocTemplate(
        output_path,
        pagesize=letter,
        rightMargin=40,
        leftMargin=40,
        topMargin=40,
        bottomMargin=40,
    )

    styles = getSampleStyleSheet()

    # Custom palette
    primary_color = colors.HexColor("#1A365D")    # Navy Blue
    secondary_color = colors.HexColor("#2B6CB0")  # Royal Blue
    accent_green = colors.HexColor("#22543D")     # Dark Forest Green
    bg_light = colors.HexColor("#F7FAFC")
    border_color = colors.HexColor("#E2E8F0")
    text_dark = colors.HexColor("#2D3748")

    # Typography Styles
    title_style = ParagraphStyle(
        "DocTitle",
        parent=styles["Heading1"],
        fontName="Helvetica-Bold",
        fontSize=20,
        leading=24,
        textColor=primary_color,
        spaceAfter=4,
    )
    subtitle_style = ParagraphStyle(
        "DocSubTitle",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=11,
        leading=15,
        textColor=secondary_color,
        spaceAfter=15,
    )
    h1_style = ParagraphStyle(
        "SectionH1",
        parent=styles["Heading2"],
        fontName="Helvetica-Bold",
        fontSize=13,
        leading=17,
        textColor=primary_color,
        spaceBefore=12,
        spaceAfter=6,
    )
    h2_style = ParagraphStyle(
        "SectionH2",
        parent=styles["Heading3"],
        fontName="Helvetica-Bold",
        fontSize=10.5,
        leading=14,
        textColor=secondary_color,
        spaceBefore=8,
        spaceAfter=4,
    )
    body_style = ParagraphStyle(
        "BodyDark",
        parent=styles["Normal"],
        fontName="Helvetica",
        fontSize=9,
        leading=13,
        textColor=text_dark,
        spaceAfter=5,
    )
    bullet_style = ParagraphStyle(
        "BulletDark",
        parent=body_style,
        leftIndent=12,
        bulletIndent=4,
        spaceAfter=3,
    )
    code_box_style = ParagraphStyle(
        "CodeBox",
        parent=body_style,
        fontName="Courier",
        fontSize=7.5,
        leading=10.5,
        textColor=colors.HexColor("#1A202C"),
    )

    story = []

    # Header / Title Block
    story.append(Paragraph("NIRIKSHAK — AI-POWERED LEGAL METROLOGY", title_style))
    story.append(Paragraph("Principal Display Panel (PDP) Dataset & Annotation Specification Guide", subtitle_style))
    story.append(HRFlowable(width="100%", thickness=1.5, color=secondary_color, spaceBefore=0, spaceAfter=12))

    # SECTION 1: How many photos are needed
    story.append(Paragraph("1. How Many Photos Do You Need?", h1_style))
    story.append(Paragraph(
        "Because we use deep transfer learning (YOLO-OBB) combined with packaging-specific data augmentations "
        "(perspective shear, glare simulation, and rotation), you do <b>not</b> need tens of thousands of photos. "
        "Here are the exact volume targets:",
        body_style,
    ))

    volume_data = [
        [
            Paragraph("<b>Dataset Tier</b>", body_style),
            Paragraph("<b>Target Image Count</b>", body_style),
            Paragraph("<b>Expected Model Accuracy</b>", body_style),
            Paragraph("<b>Suitability / Use Case</b>", body_style),
        ],
        [
            Paragraph("<b>Minimum Viable</b>", body_style),
            Paragraph("<b>150 – 250 photos</b>", body_style),
            Paragraph("82% – 88% mAP50", body_style),
            Paragraph("Fast prototype, pipeline integration testing, and local demos.", body_style),
        ],
        [
            Paragraph("<b>Recommended Target (Sweet Spot)</b>", body_style),
            Paragraph("<b>400 – 600 photos</b>", body_style),
            Paragraph("<b>94% – 98% mAP50</b>", body_style),
            Paragraph("<b>Production-grade accuracy. High reliability across diverse retail lighting.</b>", body_style),
        ],
        [
            Paragraph("<b>National / Enterprise</b>", body_style),
            Paragraph("1,200 – 2,000 photos", body_style),
            Paragraph(">98.5% mAP50", body_style),
            Paragraph("Handles extreme edge cases (torn pouches, wet bottles, extreme blur).", body_style),
        ],
    ]

    t_volume = Table(volume_data, colWidths=[110, 95, 105, 190])
    t_volume.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#EDF2F7")),
        ("TEXTCOLOR", (0, 0), (-1, 0), primary_color),
        ("GRID", (0, 0), (-1, -1), 0.5, border_color),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, bg_light]),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("TOPPADDING", (0, 0), (-1, -1), 4),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 4),
    ]))
    story.append(t_volume)
    story.append(Spacer(1, 10))

    # Recommended Product Category Mix
    story.append(Paragraph("Recommended Product Category Mix (For 500 Photos):", h2_style))
    category_data = [
        [Paragraph("<b>Packaging Category</b>", body_style), Paragraph("<b>Target Count</b>", body_style), Paragraph("<b>Real-World Product Examples</b>", body_style)],
        [Paragraph("Rigid Cartons / Boxes", body_style), Paragraph("150 photos (30%)", body_style), Paragraph("Toothpaste boxes, soap boxes, cereal, biscuits, medicines, bulbs.", body_style)],
        [Paragraph("Flexible Pouches & Packets", body_style), Paragraph("150 photos (30%)", body_style), Paragraph("Chips (Lay's/Kurkure), namkeen, detergent, milk pouches, tea/coffee.", body_style)],
        [Paragraph("Bottles & Cans (Cylindrical)", body_style), Paragraph("110 photos (22%)", body_style), Paragraph("Cold drink cans, water bottles, shampoo bottles, oil tins, syrups.", body_style)],
        [Paragraph("Tubes, Jars & Blister Packs", body_style), Paragraph("90 photos (18%)", body_style), Paragraph("Face wash tubes, skin cream jars, jam jars, battery blister packs.", body_style)],
    ]
    t_cat = Table(category_data, colWidths=[140, 100, 260])
    t_cat.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#E2E8F0")),
        ("GRID", (0, 0), (-1, -1), 0.5, border_color),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, bg_light]),
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("TOPPADDING", (0, 0), (-1, -1), 4),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 4),
    ]))
    story.append(t_cat)
    story.append(Spacer(1, 12))

    # SECTION 2: The 4 Bounding Box Classes
    story.append(Paragraph("2. The 4 Classes to Annotate (Where Do the Boxes Go?)", h1_style))
    story.append(Paragraph(
        "You do not need to label 20 granular items. To maximize detection speed and precision, "
        "the dataset uses <b>4 clear classes</b>:",
        body_style,
    ))

    class_data = [
        [
            Paragraph("<b>Class Name & ID</b>", body_style),
            Paragraph("<b>What to Box (Visual Instructions)</b>", body_style),
            Paragraph("<b>Why Nirikshak Needs It</b>", body_style),
        ],
        [
            Paragraph("<b>Class 0:<br/>pdp_front</b>", body_style),
            Paragraph("Draw one tight bounding box around the <b>entire front face</b> showing Brand Name, Product Artwork, and Net Quantity.", body_style),
            Paragraph("Mandatory under <b>Rule 2(h) & Rule 7</b>. Nirikshak calculates true surface area ($cm^2$) and Rule 8 clearance.", body_style),
        ],
        [
            Paragraph("<b>Class 1:<br/>statutory_back</b>", body_style),
            Paragraph("Draw one box around the <b>back or information panel</b> containing Manufacturer name, Ingredients, and Consumer Care.", body_style),
            Paragraph("Enforces <b>Rule 6(1)(a) & 6(1)(e)</b> (Manufacturer & customer helpline details).", body_style),
        ],
        [
            Paragraph("<b>Class 2:<br/>batch_stamp_area</b>", body_style),
            Paragraph("Draw a tight box around the <b>inkjet / laser printed batch stamp</b> (the black dot-matrix text showing MRP, Batch No, Date).", body_style),
            Paragraph("Crucial for <b>Rule 6(1)(d) & 6(1)(da)</b>. Isolates faint dot-matrix print from colorful background graphics for high-accuracy OCR.", body_style),
        ],
        [
            Paragraph("<b>Class 3:<br/>barcode_area</b>", body_style),
            Paragraph("Draw a tight box around the <b>1D EAN-13 Barcode or 2D QR code</b>.", body_style),
            Paragraph("Used as an <b>instant physical scale calibration anchor</b> ($37.29\\times 25.93$ mm) and national GS1 registry lookup.", body_style),
        ],
    ]
    t_class = Table(class_data, colWidths=[100, 210, 190])
    t_class.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), colors.HexColor("#EDF2F7")),
        ("GRID", (0, 0), (-1, -1), 0.5, border_color),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [colors.white, bg_light]),
        ("VALIGN", (0, 0), (-1, -1), "TOP"),
        ("TOPPADDING", (0, 0), (-1, -1), 4),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 4),
    ]))
    story.append(t_class)
    story.append(Spacer(1, 10))

    # Visual ASCII Blueprint
    blueprint_text = """
    +---------------------------------------------------------------+
    | FULL UNEDITED CAMERA PHOTO                                    |
    |                                                               |
    |   +-------------------------------------------------------+   |
    |   | [statutory_back] (Encloses whole information panel)   |   |
    |   |                                                       |   |
    |   |   Mfd. by: XYZ Consumer Goods India Ltd...            |   |
    |   |   Ingredients: Refined Wheat Flour, Sugar, Salt...    |   |
    |   |   Customer Care: 1800-111-222 / care@brand.in         |   |
    |   |                                                       |   |
    |   |   +------------------------+    +-----------------+   |   |
    |   |   | [batch_stamp_area]     |    | [barcode_area]  |   |   |
    |   |   | B.No: B409             |    | ||||||||||||||| |   |   |
    |   |   | MFD: 08/24             |    | 8901314010512   |   |   |
    |   |   | MRP: Rs 50.00 (Incl.)  |    |                 |   |   |
    |   |   +------------------------+    +-----------------+   |   |
    |   +-------------------------------------------------------+   |
    +---------------------------------------------------------------+
    """
    story.append(Paragraph(f"<pre>{blueprint_text}</pre>", code_box_style))

    story.append(PageBreak())

    # SECTION 3: Package-Specific Nuances
    story.append(Paragraph("3. Package-Specific Visual Guidelines", h1_style))
    story.append(Paragraph(
        "Packaging types behave differently under 3D camera projections. Follow these specific rules:",
        body_style,
    ))

    p_rules = [
        "<b>Rigid Cartons (Boxes):</b> Draw rotated rectangles (OBB) following the 4 physical corners of the displayed panel. Do not include the top or side flaps in the front box.",
        "<b>Flexible Pouches (Chips/Namkeen):</b> Pouches bulge outward. Draw the box tightly around the readable central printed graphic face, ignoring the empty flat heat-sealed crimped edges at the very top and bottom.",
        "<b>Cylindrical Bottles & Cans:</b> Because round surfaces wrap 360°, a single photo captures only ~40% of the circumference. Box the entire <i>visible horizon</i> from the left curve edge to the right curve edge.",
        "<b>Multi-Pack / Combo Packs:</b> If a package contains multiple units (e.g. 'Pack of 3 Soaps'), box the outer parent wrapper as <code>pdp_front</code>.",
    ]
    for r in p_rules:
        story.append(Paragraph(f"• {r}", bullet_style))
    story.append(Spacer(1, 8))

    # SECTION 4: Photographic Diversity & Do's and Don'ts
    story.append(Paragraph("4. Photographic Capture Do's and Don'ts", h1_style))

    story.append(Paragraph("<b>✅ DO (Best Practices):</b>", h2_style))
    dos = [
        "<b>Capture realistic handheld angles:</b> ~50% flat straight-on (0°), ~50% tilted at slight handheld angles (15°–30°).",
        "<b>Include real-world store lighting:</b> Minor flash/ambient glare on glossy metallic laminates and soft hand/phone shadows teach the model to be robust.",
        "<b>Keep the full uncropped frame:</b> Leave the table surface, supermarket shelf, or fingers holding the pack. The model must learn to isolate the product from surroundings.",
        "<b>Ensure text is readable to human eyes:</b> Letters and numbers on the batch stamp must be sharp enough for OCR downstream.",
    ]
    for d in dos:
        story.append(Paragraph(f"✔ {d}", bullet_style))

    story.append(Spacer(1, 6))
    story.append(Paragraph("<b>❌ DO NOT (Avoid These Costly Mistakes):</b>", h2_style))
    donts = [
        "<b>DO NOT pre-crop images:</b> Never pre-crop to the packaging boundary before labeling. The model must learn how to segment the boundary itself.",
        "<b>DO NOT label individual words:</b> Do not draw a box around just the word 'Maggi' or 'MRP'. The box must cover the whole <code>pdp_front</code> panel or <code>batch_stamp_area</code>.",
        "<b>DO NOT include extreme blur:</b> If you cannot distinguish '₹50' from '₹60' yourself, discard the photo.",
        "<b>DO NOT skip barcodes or stamps:</b> If an image shows a barcode or batch stamp, always label them. Unlabeled visible objects degrade training loss.",
    ]
    for d in donts:
        story.append(Paragraph(f"✖ {d}", bullet_style))

    story.append(Spacer(1, 10))

    # SECTION 5: Fast Workflow with Roboflow
    story.append(Paragraph("5. Recommended Labeling & Export Workflow", h1_style))
    steps = [
        "<b>Step 1:</b> Create a free project on <b>Roboflow (roboflow.com)</b> and set project type to <b>Oriented Bounding Box (OBB)</b>.",
        "<b>Step 2:</b> Add the 4 classes: <code>pdp_front</code>, <code>statutory_back</code>, <code>batch_stamp_area</code>, <code>barcode_area</code>.",
        "<b>Step 3:</b> Upload your 400–600 photos and label them using the rotated rectangle tool.",
        "<b>Step 4:</b> Click <b>Generate Version</b> (leave augmentations off; our Nirikshak Python training script applies custom packaging augmentations automatically).",
        "<b>Step 5:</b> Export as <b>YOLOv8 / YOLOv11 Oriented Bounding Box</b> format (ZIP download).",
        "<b>Step 6:</b> Extract the <code>images/</code> and <code>labels/</code> folders directly into: "
        "<code>ComplianceEngine/stage3_pdp/training/datasets/pdp_packaging/</code>.",
        "<b>Step 7:</b> Run training with one command: <code>python train_pdp_obb.py --epochs 50 --batch 8 --export-onnx</code>.",
    ]
    for s in steps:
        story.append(Paragraph(s, bullet_style))

    story.append(Spacer(1, 14))
    story.append(HRFlowable(width="100%", thickness=0.5, color=colors.HexColor("#CBD5E0"), spaceBefore=5, spaceAfter=8))
    story.append(Paragraph(
        "<i>Generated for Nirikshak — Smart India Hackathon (SIH) Problem Statement 26034. Legal Metrology Compliance Engine.</i>",
        ParagraphStyle("FooterNote", fontName="Helvetica-Oblique", fontSize=8, textColor=colors.gray),
    ))

    doc.build(story)
    print(f"[+] Successfully generated PDF guide at: {output_path}")


if __name__ == "__main__":
    out = Path(__file__).resolve().parent / "Nirikshak_PDP_Dataset_Annotation_Guide.pdf"
    create_guide_pdf(str(out))
