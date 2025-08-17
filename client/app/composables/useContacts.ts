import type { Contact } from "~/types/contact";

export const useContacts = () => {
  const config = useRuntimeConfig();
  return useFetch<Contact[]>(`${config.public.apiBase}/contacts`);
};
