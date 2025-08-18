<script setup lang="ts">
import { useRoute } from "vue-router";

const route = useRoute();
const {
  data: contact,
  error,
  pending
} = await useFetchContactById(Number(route.params.id));

if (error.value?.statusCode === 404) {
  await navigateTo("/404", { redirectCode: 404 });
}

const formatDate = (dateString: string | undefined) => {
  if (!dateString) return;
  const date = new Date(dateString);
  return date.toLocaleDateString("en-US");
};
</script>

<template>
  <main>
    <div v-if="pending">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <div v-else-if="contact">
      <h1 class="text-2xl font-bold pb-4">
        {{ contact.firstName }} {{ contact.lastName }}
      </h1>
      <div>Birthday: {{ formatDate(contact?.birthday) }}</div>
      <div>Notes: {{ contact.notes }}</div>
    </div>
    <div v-else>Contact not found</div>
    <div class="pt-6">
      <router-link to="/contacts">back</router-link> |
      <router-link :to="`/contacts/edit/${route.params.id}`">edit</router-link>
    </div>
  </main>
</template>
