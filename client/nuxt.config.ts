import tailwindcss from "@tailwindcss/vite";

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: "2025-07-15",
  devtools: { enabled: true },
  modules: ["@nuxt/eslint"],
  css: ["~/assets/css/main.css"],
  vite: {
    plugins: [tailwindcss()]
  },
  runtimeConfig: {
    public: {
      apiBase: "/api"
    }
  },
  // We need the proxy rule because in development Nuxt runs on a different port
  // than Rails, which causes CORS issues when the browser client makes API
  // requests to the server. There are multiple ways of handling this but using
  // routeRules appears to be the favored solution for Nuxt 4 since it is fairly
  // straightforward and works well with useFetch() and SSR on the server
  // (devProxy only works on the client).
  routeRules:
    process.env.NODE_ENV === "development"
      ? {
          "/api/**": {
            proxy: "http://localhost:4000/api/**"
          }
        }
      : {}
});
