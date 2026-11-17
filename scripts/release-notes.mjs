// Author: t.mccall
// Created Date: 2026-11-17
// Last Revision: 2026-11-17 by t.mccall
// Called by: release.yml

import { readFileSync } from 'node:fs';

const [file, version] = process.argv.slice(2);
if (!file || !version) {
  console.error('Usage: node release-notes.mjs <whatsNew.ts> <version>');
  process.exit(2);
}

const source = readFileSync(file, 'utf8');
const literal = /'((?:[^'\\\n]|\\.)*)'|"((?:[^"\\\n]|\\.)*)"|`((?:[^`\\]|\\.)*)`/g;
const text = (m) => (m[1] ?? m[2] ?? m[3]).replace(/\\(.)/g, '$1').trim();

const entries = [];
const entry = /version:\s*('(?:[^'\\\n]|\\.)*'|"(?:[^"\\\n]|\\.)*")\s*,[\s\S]*?notes:\s*\[([\s\S]*?)\]\s*,?\s*\}/g;
for (const m of source.matchAll(entry)) {
  entries.push({
    version: m[1].slice(1, -1),
    notes: [...m[2].matchAll(literal)].map(text).filter(Boolean),
  });
}

const found = entries.find((e) => e.version === version);
if (!found || found.notes.length === 0) {
  console.error(`No release notes for Hum ${version}. Add an entry for ${version} to hum-desktop/src/whatsNew.ts in the Hum source, merge it, then run the release again.`);
  process.exit(1);
}

const previous = entries.find((e) => e.version !== version && e.notes.join('\n') === found.notes.join('\n'));
if (previous) {
  console.error(`The release notes for Hum ${version} are a copy of the notes for ${previous.version}. Write what changed in ${version}.`);
  process.exit(1);
}

console.log("## What's new\n");
for (const note of found.notes) console.log(`- ${note}`);
console.log('\nDownload the installer for your computer below. Copies of Hum that are already installed update themselves.');
