<script setup lang="ts">
const { data: contacts, error, pending } = await useContacts();
</script>

<template>
  <main>
    <h1 class="text-2xl font-bold pb-4">Contacts</h1>
    <div v-if="pending">Loading...</div>
    <div v-else-if="error">Error: {{ error.message }}</div>
    <ul v-else>
      <li v-for="contact in contacts" :key="contact.id">
        {{ contact.firstName }} {{ contact.lastName }}
      </li>
    </ul>
  </main>
</template>
