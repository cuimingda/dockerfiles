#!/bin/sh
echo "Creating app directory..."
mkdir -p app

echo "Entering app directory..."
cd app

echo "Creating src sub directory..."
mkdir -p src

echo "initializing with pnpm..."
pnpm init >/dev/null 2>&1

echo "installing vue"
pnpm add vue --silent

echo "installing vite and @vitejs/plugin-vue..."
pnpm add vite @vitejs/plugin-vue --save-dev --silent

echo "updating package.json..."
jq '. + {"type": "module"}' package.json >tmp.json && mv tmp.json package.json
jq '.scripts.dev = "vite --host"' package.json >tmp.json && mv tmp.json package.json

echo "creating src/App.vue"
cat <<EOF >src/App.vue
<template>
hello vue and vite
</template>
EOF

echo "creating src/main.js"
cat <<EOF >src/main.js
import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
EOF

echo "creating index.html"
cat <<EOF >index.html
<div id="app"></div>
<script type="module" src="/src/main.js"></script>
EOF

echo "creating vite.config.js"
cat <<EOF >vite.config.js
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [ vue() ]
})
EOF

echo "Done."
