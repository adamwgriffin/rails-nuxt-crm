import type { Ref } from "vue";
import type {
  Contact,
  ContactsRequest,
  ContactsResponse
} from "~/types/contact";

export const useFetchContacts = (pagination: Ref<ContactsRequest>) => {
  const config = useRuntimeConfig();
  return useFetch<ContactsResponse>(`${config.public.apiBase}/contacts`, {
    params: pagination
  });
};

export const useFetchContactById = (id: number) => {
  const config = useRuntimeConfig();
  return useFetch<Contact>(`${config.public.apiBase}/contacts/${id}`);
};
