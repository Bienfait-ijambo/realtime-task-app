<script lang="ts" setup>
import { useVuelidate } from "@vuelidate/core";
import { required, email } from "@vuelidate/validators";
import { projectStore } from "./store/projectStore";
import { useCreateOrUpdateProject } from "./actions/createProject";

const rules = {
    name: { required }, // Matches state.firstName
    startDate: { required },
    endDate: { required },

};

const v$ = useVuelidate(rules, projectStore.projectInput);
const { loading, createOrUpdate } = useCreateOrUpdateProject();
async function submitProject() {
    const result = await v$.value.$validate();

    if (!result) return;
    await createOrUpdate();
    v$.value.$reset()

}
</script>
<template>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Create Projects</h3>
                <br/>
                <br/>
                <!-- {{ projectStore.projectInput }} -->
                <form @submit.prevent="submitProject">
                    <div class="form-group">
                        <Error label="Name" :errors="v$.name.$errors">
                            <BaseInput v-model="projectStore.projectInput.name" />
                        </Error>
                    </div>
                    <div class="form-group">
                        <Error label="StartDate" :errors="v$.startDate.$errors">
                            <BaseInput type="date" v-model="projectStore.projectInput.startDate" />
                        </Error>
                    </div>
                    <br/>
                    <div class="form-group">
                        <Error label="EndDate" :errors="v$.endDate.$errors">
                            <BaseInput type="date" v-model="projectStore.projectInput.endDate" />
                        </Error>
                    </div>
                    <br/>
                    <RouterLink to="/projects">See Projects List</RouterLink>
                    <br/>

                    <div class="form-group">
                        <BaseBtn :class="projectStore.edit
                         ? 'btn btn-warning':'btn btn-primary'" 
                         :label="projectStore.edit?'Update Project':'Create Project'" 
                         :loading="loading" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
