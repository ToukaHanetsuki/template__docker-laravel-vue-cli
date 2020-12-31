<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png">
    <h2>Request for Laravel Server</h2>
    <h3>/api/ping</h3>
    <h3>Response: {{apiText}}</h3>
    <HelloWorld msg="Welcome to Your Vue.js + TypeScript App"/>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator';
import HelloWorld from '@/components/HelloWorld.vue'; // @ is an alias to /src
import axios from 'axios'

@Component({
  components: {
    HelloWorld,
  },
})
export default class Home extends Vue {
  apiText: string | null = null

  async initialize() {
    const resp = await axios.get('/api/ping')
    if (resp.status === 200) {
      this.apiText = resp.data.message
    }
  }

  created() {
    this.initialize()
  }
}
</script>
