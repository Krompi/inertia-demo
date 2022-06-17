<template>
  <section class="bg-gray-200 p-6">
    <header class="flex">
      <h1 class="font-bold text-lg">My App</h1>
      <Nav />
    </header>
  </section>

  <section class="p-6">
    <slot></slot>
  </section>
</template>

<script>
import Nav from "./Nav";

export default {
  components: { Nav },
};
</script>