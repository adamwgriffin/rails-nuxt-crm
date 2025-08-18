<script setup lang="ts">
import { ref } from "vue";
import { useRouter } from "vue-router";

const config = useRuntimeConfig();
const router = useRouter();

const firstName = ref();
const middleName = ref();
const lastName = ref();
const birthday = ref();
const notes = ref();

const submitting = ref(false);
const submitError = ref("");

async function updateContact() {
  submitting.value = true;
  submitError.value = "";
  try {
    await $fetch(`${config.public.apiBase}/contacts`, {
      method: "POST",
      body: {
        first_name: firstName.value,
        middle_name: middleName.value,
        last_name: lastName.value,
        birthday: birthday.value,
        notes: notes.value
      }
    });
    router.push("/contacts");
  } catch (e) {
    console.error(e);
    submitError.value = "Failed to create contact";
  } finally {
    submitting.value = false;
  }
}
</script>

<template>
  <main>
    <div>
      <h1 class="text-2xl font-bold pb-4">Create Contact</h1>
      <form class="space-y-4 max-w-md" @submit.prevent="updateContact">
        <div>
          <label class="block font-medium mb-1">First Name</label>
          <input
            v-model="firstName"
            type="text"
            class="w-full px-3 py-2 border rounded focus:outline-none focus:ring focus:border-blue-300"
          />
        </div>
        <div>
          <label class="block font-medium mb-1">Middle Name</label>
          <input
            v-model="middleName"
            type="text"
            class="w-full px-3 py-2 border rounded focus:outline-none focus:ring focus:border-blue-300"
          />
        </div>
        <div>
          <label class="block font-medium mb-1">Last Name</label>
          <input
            v-model="lastName"
            type="text"
            class="w-full px-3 py-2 border rounded focus:outline-none focus:ring focus:border-blue-300"
          />
        </div>
        <div>
          <label class="block font-medium mb-1">Birthday</label>
          <input
            v-model="birthday"
            type="date"
            class="w-full px-3 py-2 border rounded focus:outline-none focus:ring focus:border-blue-300"
          />
        </div>
        <div>
          <label class="block font-medium mb-1">Notes</label>
          <textarea
            v-model="notes"
            class="w-full px-3 py-2 border rounded focus:outline-none focus:ring focus:border-blue-300"
          />
        </div>
        <div v-if="submitError" class="text-red-600">{{ submitError }}</div>
        <button
          type="submit"
          class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
          :disabled="submitting"
        >
          {{ submitting ? "Saving..." : "Save" }}
        </button>
      </form>
    </div>
    <div class="pt-6">
      <router-link to="/contacts" class="text-blue-600 hover:underline">
        cancel
      </router-link>
    </div>
  </main>
</template>
