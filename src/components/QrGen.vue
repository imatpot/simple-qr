<template>
  <div class="qr-gen">
    <p>Displayed data</p>
    <input class="data" type="text" v-model="value" id="data" disabled>
    <p>Size in pixels (100-1000)</p>
    <input class="nr" type="number" max="1000" min="100" v-model="size" @blur="checkSize()">
    <p>Background colour</p>
    <input class="col" type="color" v-model="background">
    <p>Foreground colour</p>
    <input class="col" type="color" v-model="foreground">
    <p>Error correction level</p>
    <a
      href="https://en.wikipedia.org/wiki/QR_code#Error_correction"
      target="_blank"
      class="info"
    >What's that?</a>
    <select v-model="errorCorrection" class="error">
      <option value="L">Low</option>
      <option value="M">Medium</option>
      <option value="Q">Quartile</option>
      <option value="H">High</option>
    </select>
    <qrcode-vue
      id="qr"
      :value="value"
      :size="size"
      :level="errorCorrection"
      :background="background"
      :foreground="foreground"
    ></qrcode-vue>
  </div>
</template>

<script>
/* eslint-disable */

import qrcodeVue from "qrcode.vue";
import randomString from "randomstring";

export default {
  name: "qrGen",
  data() {
    return {
      value: this.randomQrString(),
      size: 200,
      errorCorrection: "M",
      background: "#FFFFFF",
      foreground: "#000000"
    };
  },
  methods: {
    checkSize() {
      this.size = this.size < 100 ? 100 : this.size;
      this.size = this.size > 1000 ? 1000 : this.size;
    },
    randomQrString() {
      return randomString.generate({
        length: 50,
        charset: "alphanumeric"
      });
    },
    updateQr() {
      this.value = this.randomQrString();
    }
  },
  beforeMount() {
    setInterval(() => {
      this.updateQr();
    }, 2000);
  },
  components: {
    qrcodeVue
  }
};
</script>

<style lang="scss" scoped>
.data {
  margin-bottom: 1rem;
  width: 400px;
  text-align: center;
  font-family: Consolas, "Courier New", monospace;
}
.nr {
  margin-bottom: 1rem;
  width: 75px;
}
.col {
  padding: 0;
  width: 75px;
}
.error {
  text-align: center;
  margin-bottom: 5rem;
  width: 75px;
}
.info {
  display: block;
  margin-top: -0.9rem;
  font-size: 0.8rem;
  margin-bottom: 1rem;
  text-decoration: none;
}
</style>
