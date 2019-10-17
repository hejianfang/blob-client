<template>
  <div id="app">
    <Header title="博客"
            :menus="menus"
            v-if="!isIndex">
    </header>
    <vue-particles color="#dedede"
                   class='lizi'
                   :particlesNumber="100"
                   shapeType="star" />
    <div class="main">
      <router-view />
    </div>
  </div>
</template>
<script lang="ts">
import { Component, Vue, Watch } from 'vue-property-decorator';
import { Route } from 'vue-router';
import Header from '@/components/Header.vue';
@Component({
  components: { Header },
})
export default class App extends Vue {
  private menus: object[] = [
    { name: '文章', path: '/actice' },
    { name: '项目', path: '/project' },
    { name: '归档', path: '/archive' },
    { name: '历程', path: '/timeline' },
    { name: '留言', path: '/message' },
    { name: '关于', path: '/about' },
  ];
  private isIndex: boolean = false;
  @Watch('$route')
  private routeChange(val: Route): void {
    if (val.path === '/index') {
      this.isIndex = true;
    } else {
      this.isIndex = false;
    }
  }
}
</script>
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
  .header {
    z-index: 11;
    height: 66px;
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
  }
  .main {
    pointer-events: none;
    z-index: 11;
    position: absolute;
    top: 86px;
    max-width: 80vw;
    left: 0;
    right: 0;
    margin: auto;
  }
}
</style>