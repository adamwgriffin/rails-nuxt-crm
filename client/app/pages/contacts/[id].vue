<script setup lang="ts">
import { useRoute } from "vue-router";

const config = useRuntimeConfig();
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

const deleteContact = async () => {
  if (!contact.value) return;

  const confirmed = confirm(
    `Are you sure you want to delete ${contact.value.firstName} ${contact.value.lastName}?`
  );

  if (confirmed) {
    try {
      await $fetch(`${config.public.apiBase}/contacts/${contact.value.id}`, {
        method: "DELETE"
      });

      await navigateTo("/contacts");
    } catch (e) {
      console.error("Failed to delete contact:", e);
      alert("Failed to delete contact. Please try again.");
    }
  }
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
      <div class="pt-6">
        <button
          :disabled="!contact"
          class="text-red-600 hover:text-red-800 underline cursor-pointer"
          @click="deleteContact"
        >
          delete
        </button> 
        💥
      </div>
    </div>
    <div v-else>Contact not found</div>
    <div class="pt-6">
      <router-link to="/contacts">back</router-link> |
      <router-link :to="`/contacts/edit/${route.params.id}`">edit</router-link>
    </div>
  </main>
</template>
