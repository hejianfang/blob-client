<template>
  <div id="app">
    <vue-particles color="#dedede"
                   class='lizi'
                   :particlesNumber="100"
                   shapeType="star" />
    <div class="main">
      <router-view />
    </div>
  </div>
</template>
<style lang="less">
#app {
  .lizi {
    position: absolute;
    z-index: 10;
    height: 100vh;
    width: 100vw;
    pointer-events: auto;
    background-image: url("@{imgUrl}/timg.jpg");
    background-repeat: no-repeat;
    background-size: cover;
  }

  .main {
    pointer-events: none;
    z-index: 11;
    position: absolute;
    top: 0;
    bottom: 0;
    right: 0;
    left: 0;
    color: #fff;
    // margin: auto;
  }
}
</style>