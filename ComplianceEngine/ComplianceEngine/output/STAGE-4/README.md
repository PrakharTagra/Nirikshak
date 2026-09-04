STAGE-4 (the `ocr` package) has no standalone service -- it's only ever
imported as a library, by STAGE-2's `/preprocess/ocr` endpoint. So it never
writes its own product output; STAGE-2 already stores the OCR result
(mapped.json, raw_extracted_text.txt) alongside the preprocessed image it
produced. This folder is kept for symmetry / in case a standalone STAGE-4
service is added later.
