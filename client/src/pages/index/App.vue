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
    <div :class="isIndex?'main':'main main-wraps'"
         :style="{top: top}">
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
  private top: string = '0px';
  @Watch('$route')
  private routeChange(val: Route): void {
    if (val.path === '/index') {
      this.isIndex = true;
      this.top = '0px';
    } else {
      this.isIndex = false;
      this.top = '86px';
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
    max-width: 88vw;
    left: 0;
    right: 0;
    margin: auto;
    &.main-wraps {
      padding: 14px 20px;
      background-color: #fff;
      min-height: calc(100vh - 100px);
      opacity: 0.6;
      border-radius: 10px;
    }
  }
}
</style>