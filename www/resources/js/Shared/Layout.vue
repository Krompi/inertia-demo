<template>
  <section class="bg-gray-200 p-6">
    <header class="flex justify-between">
      <div class="flex items-center">
        <h1 class="font-bold text-lg">My App</h1>
        <p class="text-sm ml-4">
          <!-- Welcome back, {{ $page.props.auth.user.username }} -->
          Welcome back, {{ username }}
        </p>
      </div>
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

  computed: {
    username() {
      return this.$page.props.auth.user.username
    }
  }
};
</script>