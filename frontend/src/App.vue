<script>
import TheNavbar from './components/TheNavbar.vue';
import TheLeftside from './components/TheLeftSide.vue';
// import Problems from './routes/Problems.vue';
// import Info from './routes/Info.vue'

export default {
  components: {TheNavbar, TheLeftside},
}

</script>

<template>
  <TheLeftside />
  <TheNavbar v-if="$route.meta.layout !== 'no-navbar'"/>
  
  <div id="main-container" class="relative ml-[220px] top-[52px] flex justify-center">
    <!-- <router-link to="/">Home</router-link> -->
    <router-view>

    </router-view>
  </div>
</template>

<style scoped>
  #main-container {
    width: calc(100% - 220px);
  }

</style>
