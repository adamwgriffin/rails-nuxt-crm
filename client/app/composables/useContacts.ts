import type { Contact } from "~/types/contact";

export const useFetchContacts = () => {
  const config = useRuntimeConfig();
  return useFetch<Contact[]>(`${config.public.apiBase}/contacts`);
};

export const useFetchContactById = (id: number) => {
  const config = useRuntimeConfig();
  return useFetch<Contact>(`${config.public.apiBase}/contacts/${id}`);
};
