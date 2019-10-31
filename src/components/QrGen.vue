<template>
  <main>
    <h1>Simple QR</h1>
    <div class="small creator">
      by <a href="https://github.com/mladenbrankovic" target="_blank" class="link">@mladenbrankovic</a>
    </div>

    <p class="label">Data</p>
    <input v-model="value" class="input data" type="text" @change="setQrUrl">

    <p class="label">Size in pixels (100-1000)</p>
    <input v-model="size" class="input size" type="number" max="1000" min="100" @change="setQrUrl">

    <p class="label">Background colour</p>
    <input v-model="background" class="input color-picker" type="color" @change="setQrUrl">

    <p class="label">Foreground colour</p>
    <input v-model="foreground" class="input color-picker" type="color" @change="setQrUrl">

    <p>Error correction level</p>
    <a href="https://en.wikipedia.org/wiki/QR_code#Error_correction" target="_blank" class="label small link">What's that?</a>
    <select v-model="errorCorrection" class="input error-correction" @change="setQrUrl">
      <option value="L">Low</option>
      <option value="M">Medium</option>
      <option value="Q">Quartile</option>
      <option value="H">High</option>
    </select>

    <a class="display" :style="{background: background}" :href="url">
      <qrcode-vue :value="value" :size="size > 1000 ? 1000 : size < 100 ? 100 : size" :level="errorCorrection" :background="background" :foreground="foreground" />
    </a>
  </main>
</template>

<script>
import qrcodeVue from 'qrcode.vue';

export default {
  name: 'QrGen',
  components: {
    qrcodeVue
  },
  data () {
    return {
      value: 'https://github.com/mladenbrankovic/simple-qr',
      url: 'blob:null',
      size: 200,
      errorCorrection: 'M',
      background: '#FFFFFF',
      foreground: '#000000'
    };
  },
  mounted () {
    this.setQrUrl();
  },
  methods: {
    setQrUrl () {
      // The click event is faster than qrcode.vue's rendering, so we need to wait a moment until it's done
      // If we don't, then the previously rendered QR code will be set in the URL
      setTimeout(() => {
        document.querySelector('canvas').toBlob(data => {
          this.url = URL.createObjectURL(data);
        });
      }, 1);
    }
  }
};
</script>

<style lang="scss" scoped>
main {
  text-align: center;
  width: 100%;
  min-height: calc(100% - 6rem);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 1rem;
  padding: 3rem 0;

  h1 {
    font-size: 2.5rem;
    margin-bottom: 1.25rem;
  }

  .creator {
    margin-bottom: 2.5rem;
  }

  .small {
    font-size: 0.8rem;
  }

  .label {
    margin-bottom: 0.75rem;
  }

  .input {
    margin-bottom: 2rem;
  }

  .data {
    width: calc(100% - 2rem);
    max-width: 420px;
    text-align: center;
    font-family: "Consolas", "Courier New", monospace;
  }

  .size {
    width: 75px;
    padding: 2;
  }

  .color-picker {
    padding: 0;
    width: 81px;
  }

  .error-correction {
    text-align: center;
    width: 100px;
  }

  .link {
    text-decoration: none;
    margin-top: 0.5rem;
    color: #3ea6ff;

    &:hover {
      text-decoration: underline;
    }
  }

  .display {
    cursor: pointer;
    margin-top: 3rem;
    border-radius: 1rem;
    padding: 1rem;
  }
}
</style>
