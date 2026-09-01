// Tiny static file server used ONLY for local testing of the listing
// crawler against a fixture page, so tests don't depend on live internet
// access or a real third-party product page.
import http from "node:http";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const PORT = process.env.FIXTURE_PORT || 4321;

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, "sample-product.html");
  fs.readFile(filePath, (err, content) => {
    if (err) {
      res.writeHead(500);
      res.end("Error loading fixture");
      return;
    }
    res.writeHead(200, { "Content-Type": "text/html" });
    res.end(content);
  });
});

server.listen(PORT, () => {
  console.log(`Fixture server running at http://localhost:${PORT}`);
});
