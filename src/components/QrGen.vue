<template>
  <section>
    <h1>simple qr</h1>

    <h2>data</h2>
    <input
      v-model="content"
      type="text"
      @change="setQrUrl"
      placeholder="https://github.com/mladenbrankovic"
      onfocus="this.placeholder = ''"
      onblur="this.placeholder = 'https://github.com/mladenbrankovic'"
    />

    <h2>size in pixels [ 100-1000 ]</h2>
    <input v-model="size" type="text" max="1000" min="100" @change="setQrUrl" @blur="fixSize" />

    <h2>background colour</h2>
    <div class="color-picker">
      <input v-model="background" type="color" @change="setQrUrl" />
      <span :style="{ background: background }"></span>
    </div>

    <h2>foreground colour</h2>
    <div class="color-picker">
      <input v-model="foreground" type="color" @change="setQrUrl" />
      <span :style="{ background: foreground }"></span>
    </div>

    <h2>
      error correction level
    </h2>
    <a
      href="https://en.wikipedia.org/wiki/QR_code#Error_correction"
      class="info"
      target="_blank"
      rel="noopener noreferrer"
      >what's that?</a
    >
    <select v-model="errorCorrection" @change="setQrUrl">
      <option value="L">low</option>
      <option value="M">medium</option>
      <option value="Q">quartile</option>
      <option value="H">high</option>
    </select>

    <a :style="{ background: background }" :href="url" class="qr">
      <qrcode-vue
        :value="content"
        :size="size > 1000 ? 1000 : size < 100 ? 100 : size"
        :level="errorCorrection"
        :background="background"
        :foreground="foreground"
      />
    </a>

    <p class="links">
      <a
        href="https://github.com/mladenbrankovic/simple-qr"
        target="_blank"
        rel="noopener noreferrer"
        >github</a
      >
    </p>
  </section>
</template>

<script>
import qrcodeVue from 'qrcode.vue';

export default {
  name: 'QrGen',
  components: {
    qrcodeVue,
  },
  data() {
    return {
      content: '',
      url: 'blob:null',
      size: 200,
      errorCorrection: 'M',
      background: '#FFFFFF',
      foreground: '#000000',
    };
  },
  mounted() {
    this.setQrUrl();
  },
  methods: {
    fixSize() {
      this.size = this.size > 1000 ? 1000 : this.size;
      this.size = this.size < 100 ? 100 : this.size;
    },
    setQrUrl() {
      document.querySelector('canvas').toBlob(data => {
        this.url = URL.createObjectURL(data);
      });
    },
  },
};
</script>

<style lang="scss" scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@600&family=Roboto:wght@300;400&family=Ubuntu+Mono&display=swap');

section {
  font-family: 'Roboto', sans-serif;
  width: 100%;
  height: 100%;
  padding: 4rem 2rem;
  display: flex;
  flex-direction: column;
  align-items: center;
}

h1 {
  font-family: 'Montserrat', 'Roboto', sans-serif;
  margin: 0 0 5rem 0;
  font-size: 3rem;

  @media (min-width: 600px) {
    font-size: 4rem;
  }
}

h2 {
  margin: 0 0 1rem 0;
  font-size: 1rem;
  font-weight: 300;
  color: gray;

  @media (min-width: 600px) {
    font-size: 1.5rem;
  }
}

input {
  width: 100%;
  min-width: 25%;
  max-width: 40rem;
  padding: 0.5rem;
  box-sizing: border-box;
  font-size: 1rem;
  font-family: 'Ubuntu Mono', monospace;
  border: 1px solid lightgray;
  border-radius: 0.3rem 1rem;
  text-align: center;
  margin-bottom: 3rem;
}

.color-picker {
  width: 15rem;
  min-width: 25%;
  max-width: 40rem;
  height: calc(1rem + 16px);
  margin-bottom: 3rem;
  position: relative;

  @media (min-width: 600px) {
    width: 25rem;
  }

  input[type='color'] {
    cursor: pointer;
    height: 100%;
    position: absolute;
    opacity: 0;
    z-index: 1;
  }

  span {
    width: 100%;
    height: 100%;
    padding: 0.5rem;
    display: block;
    position: absolute;
    border: 1px solid lightgray;
    border-radius: 0.3rem 1rem;
    box-sizing: border-box;
  }
}

.info {
  text-decoration: none;
  margin-bottom: 1rem;
}

select {
  cursor: pointer;
  width: 15rem;
  min-width: 25%;
  max-width: 40rem;
  padding: 0.5rem;
  box-sizing: border-box;
  font-family: 'Ubuntu Mono', monospace;
  font-size: 1rem;
  border: 1px solid lightgray;
  border-radius: 0.3rem 1rem;
  text-align: center;
  outline: none;

  -moz-appearance: none;
  -webkit-appearance: none;
  &::-ms-expand {
    display: none;
  }

  @media (min-width: 600px) {
    width: 25rem;
  }
}

.qr {
  margin-top: 5rem;
}

.links {
  margin-top: 5rem;
  color: gray;

  a {
    color: gray;
    text-decoration: none;

    &:hover {
      text-decoration: underline;
    }
  }
}
</style>
