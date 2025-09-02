import type { CapacitorConfig } from '@capacitor/cli';

const config: CapacitorConfig = {
  appId: 'app.lovable.3fa0f331b6ad4efcaa524aae1c4ef983',
  appName: 'kidsafe-connect',
  webDir: 'dist',
  server: {
    url: 'https://3fa0f331-b6ad-4efc-aa52-4aae1c4ef983.lovableproject.com?forceHideBadge=true',
    cleartext: true
  },
  bundledWebRuntime: false
};

export default config;