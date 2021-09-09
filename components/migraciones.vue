<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="900"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="red lighten-2"
          dark
          small
          v-bind="attrs"
          v-on="on"
        >
          Migraciones
        </v-btn>
      </template>

      <v-card>
        <v-card-title class="text-h5 grey lighten-2">
          Lista de migraciones
          <v-btn x-small v-on:click="updateMigras">Actualizar</v-btn>
        </v-card-title>

        <v-card-text>
          <v-row>
            <v-col cols="12" lg="4" md="4">

                <v-list dense>
                  <v-list-item-group
                    v-model="sel"
                    color="primary"
                  >
                    <v-list-item v-for="(item,index) in lista" :key="index" v-on:click="cargarTxt(item)">
                      <v-list-item-content class="pa-0 ma-0">
                        <v-list-item-title class="text pa-0 ma-0">
                          {{ item.name }}
                        </v-list-item-title>
                      </v-list-item-content>
                    </v-list-item>
                  </v-list-item-group>
                </v-list>
            </v-col>
            <v-col cols="12" lg="8" md="8">
              <template v-if="cargando">
                <span>Cargando</span>
              </template>
              <template v-else>
                <b>{{lista[sel].name}}</b>
                <div class="migra">{{ texto }}</div>
              </template>
            </v-col>
          </v-row>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="dialog = false"
          >
            Cerrar
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
const MigracionesFiles = require.context('@/migraciones/', true, /\.txt$/i, 'lazy')
export default {
  name: "migraciones",
  data: () => ({
    dialog: false,
    lista: [],
    texto: null,
    cargando: false,
    sel: 0,
  }),
  methods: {
    cargarTxt(obj) {
      this.cargando = true;
      import("@/migraciones/" + obj.name + '.txt').then(utils => {
        this.texto = utils.default;
        this.cargando = false;
      });
    },
    updateMigras() {
      this.lista = Array.from(MigracionesFiles.keys(), i => ({
        name: i.split('/').pop().split('.')[0],
        file: i
      }))
    }
  },
  created() {
    this.updateMigras()
  }
}
</script>

<style scoped>
.migra {
  white-space: break-spaces;
}
</style>
