<template>
  <div id="app">
    <Header></Header>
    <NavBar></NavBar>
    <router-view/>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import NavBar from './components/NavBar.vue'

export default {
  name: 'app',
  components: {Header, NavBar}
}
</script>

<style>
body{
  margin: 0px;
  padding: 0px;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
