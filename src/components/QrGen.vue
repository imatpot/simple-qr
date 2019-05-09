<template>
  <div class="qr-gen">
    <p>Data</p>
    <input v-model="value" class="data" type="text">
    <p>Size in pixels (100-1000)</p>
    <input v-model="size" class="size" type="number" max="1000" min="100" @blur="checkSize">
    <p>Background colour</p>
    <input v-model="background" class="color-picker" type="color">
    <p>Foreground colour</p>
    <input v-model="foreground" class="color-picker" type="color">
    <p>Error correction level</p>
    <a href="https://en.wikipedia.org/wiki/QR_code#Error_correction" target="_blank" class="info">What's that?</a>
    <select v-model="errorCorrection" class="error-correction">
      <option value="L">Low</option>
      <option value="M">Medium</option>
      <option value="Q">Quartile</option>
      <option value="H">High</option>
    </select>
    <qrcode-vue :value="value" :size="size" :level="errorCorrection" :background="background" :foreground="foreground" />
  </div>
</template>

<script>
import qrcodeVue from 'qrcode.vue';

export default {
  name: 'QrGen',
  components: {
    qrcodeVue
  },
  data() {
    return {
      value: 'https://github.com/mladenbrankovic/simple-qr',
      size: 200,
      errorCorrection: 'M',
      background: '#FFFFFF',
      foreground: '#000000'
    };
  },
  methods: {
    checkSize() {
      this.size = this.size < 100 ? 100 : this.size;
      this.size = this.size > 1000 ? 1000 : this.size;
    }
  }
};
</script>

<style lang="scss" scoped>
.qr-gen {
  text-align: center;
  width: 100%;

  .data {
    margin-bottom: 1rem;
    width: calc(100% - 16px);
    max-width: 400px;
    text-align: center;
    font-family: Consolas, "Courier New", monospace;
  }
  .size {
    margin-bottom: 1rem;
    width: 75px;
    padding: 2;
  }
  .color-picker {
    padding: 0;
    width: 81px;
  }
  .error-correction {
    text-align: center;
    margin-bottom: 5rem;
    width: 81px;
  }
  .info {
    display: block;
    margin-top: -0.9rem;
    font-size: 0.8rem;
    margin-bottom: 1rem;
    text-decoration: none;
  }
}
</style>
