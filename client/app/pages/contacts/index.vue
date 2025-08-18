<script setup lang="ts">
const { data: contacts, error, pending } = await useFetchContacts();
</script>

<template>
  <main>
    <p class="pb-4">
      <router-link to="/contacts/new">Create Contact</router-link>
    </p>
    <h1 class="text-2xl font-bold pb-4">Contacts</h1>
    <div v-if="pending">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else>
      <li v-for="contact in contacts" :key="contact.id">
        <router-link :to="`/contacts/${contact.id}`">
          {{ contact.firstName }} {{ contact.lastName }}
        </router-link>
      </li>
    </ul>
  </main>
</template>
