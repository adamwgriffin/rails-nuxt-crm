<script setup lang="ts">
import type { ContactsRequest } from "~/types/contact";

const pagination = ref<ContactsRequest>({ page: 1 });

const { data, error, pending } = await useFetchContacts(pagination);

const contacts = computed(() => data.value?.contacts ?? []);
const meta = computed(() => data.value?.meta);

function prevPage() {
  if (pagination.value.page > 1) pagination.value.page--;
}

function nextPage() {
  if (pagination.value.page < (meta.value?.totalPages ?? 1)) {
    pagination.value.page++;
  }
}
</script>

<template>
  <main>
    <p class="pb-4">
      <router-link to="/contacts/new">Create Contact</router-link>
    </p>
    <h1 class="text-2xl font-bold pb-4">Contacts</h1>
    <div v-if="pending">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <div v-else>
      <ul>
        <li v-for="contact in contacts" :key="contact.id">
          <router-link :to="`/contacts/${contact.id}`">
            {{ contact.firstName }} {{ contact.lastName }}
          </router-link>
        </li>
      </ul>
      <div class="flex items-center gap-2 mt-4">
        <button
          class="text-xl"
          :disabled="pagination.page === 1"
          @click="prevPage"
        >
          ←
        </button>
        <span class="text-sm"
          >Page {{ meta?.currentPage }} of {{ meta?.totalPages }}</span
        >
        <button
          class="text-xl"
          :disabled="pagination.page === meta?.totalPages"
          @click="nextPage"
        >
          →
        </button>
      </div>
    </div>
  </main>
</template>
