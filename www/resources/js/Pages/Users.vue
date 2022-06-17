<template>
  <Layout>
    <h1 class="text-3xl my-6">Users</h1>
    <div style="margin-top: 1500px">
      <p>The current time ist {{ time }}</p>

      <Link href="/users" class="text-blue-500" preserve-scroll>Refresh</Link>
    </div>
  </Layout>
</template>

<script>
import Layout from "../Shared/Layout";
import { Link } from "@inertiajs/inertia-vue3";

export default {
  components: { Layout, Link },

  props: {
    time: String,
  },
};
</script>