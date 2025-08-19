export type Contact = {
  id: number;
  firstName?: string;
  middleName?: string;
  lastName?: string;
  birthday?: string;
  notes?: string;
};

export type Pagination = {
  currentPage: number;
  totalPages: number;
  totalCount: number;
};

export type ContactsRequest = {
  page: number;
  per_page?: number;
};

export type ContactsResponse = {
  contacts: Pick<Contact, "id" | "firstName" | "lastName">[];
  meta: Pagination;
};
