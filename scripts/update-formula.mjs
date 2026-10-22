import { createHash } from 'node:crypto';
import { readFile, writeFile } from 'node:fs/promises';

const packageUrl = 'https://registry.npmjs.org/@datamcp%2Fagent/latest';
const formulaPath = new URL('../Formula/datamcp-agent.rb', import.meta.url);
const metadataResponse = await fetch(packageUrl);
if (!metadataResponse.ok) throw new Error(`npm metadata: HTTP ${metadataResponse.status}`);
const metadata = await metadataResponse.json();
const tarballUrl = metadata.dist?.tarball;
if (!tarballUrl?.startsWith('https://registry.npmjs.org/@datamcp/agent/-/agent-')) {
  throw new Error('Unexpected npm tarball URL');
}
const tarballResponse = await fetch(tarballUrl);
if (!tarballResponse.ok) throw new Error(`npm tarball: HTTP ${tarballResponse.status}`);
const tarball = Buffer.from(await tarballResponse.arrayBuffer());
const sha256 = createHash('sha256').update(tarball).digest('hex');
const existing = await readFile(formulaPath, 'utf8');
const updated = existing
  .replace(/^  url ".*"$/m, `  url "${tarballUrl}"`)
  .replace(/^  sha256 "[0-9a-f]{64}"$/m, `  sha256 "${sha256}"`);
if (updated === existing) {
  console.log(`Formula already matches npm latest ${metadata.version}`);
} else {
  await writeFile(formulaPath, updated);
  console.log(`Formula updated to npm latest ${metadata.version}`);
}
