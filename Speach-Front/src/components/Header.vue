<template>
  <div class="header">
    <h1> {{msg}}</h1>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  data () {
    return {
      msg: 'Speach Scoring Tool'
    }
  }
}
</script>

<style scoped>

.header{

  width: 100%;
  font-size: 30px;
  background-color: #333333;
  color: #FFFFFF;
  margin: 0px;

}

h1{
  margin: 0px;
  padding: 20px;
  text-align:left;
}

</style>
