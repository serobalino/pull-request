<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="12" md="12">
      <v-autocomplete
        :items="items"
        outlined
        dense
        chips
        small-chips
        label="Autocomplete"
      />
    </v-col>
    <v-col cols="12" sm="12" md="12">
      <v-select
        :items="items"
        label="Combo"
        solo
      />
    </v-col>
    <v-col cols="12" sm="12" md="12">
      <v-footer
        color="primary lighten-1"
        padless
      >
        <v-row
          justify="center"
          no-gutters
        >
          <v-btn
            v-for="link in links"
            :key="link"
            color="white"
            text
            rounded
            class="my-2"
          >
            {{ link }}
          </v-btn>
          <v-col
            class="primary lighten-2 py-4 text-center white--text"
            cols="12"
          >
            {{ new Date().getFullYear() }} — <strong>Vuetify</strong>
          </v-col>
        </v-row>
      </v-footer>
    </v-col>
  </v-row>
</template>
<script>
export default {
  data: () => ({
    links: [
      'Home',
      'About Us',
      'Team',
      'Services',
      'Blog',
      'Contact Us',
    ],
    items: ['foo', 'bar', 'fizz', 'buzz'],
  }),
}
</script>
