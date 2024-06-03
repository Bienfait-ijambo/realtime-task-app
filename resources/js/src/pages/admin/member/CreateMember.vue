<script lang="ts" setup>
import { useVuelidate } from "@vuelidate/core";
import { required, email } from "@vuelidate/validators";
import {  useCreateOrUpdateMember } from "./actions/createMember";
import { memberStore } from "./store/memberStore";

const rules = {
    email: { required, email }, // Matches state.firstName
    name: { required }, // Matches state.lastName
};

const v$ = useVuelidate(rules, memberStore.memberInput);
const { loading, createOrUpdate } = useCreateOrUpdateMember();
async function submitMember() {
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
                <h3>Create Members</h3>
                <br/>
                <br/>
                <!-- {{ memberStore.memberInput }} -->
                <form @submit.prevent="submitMember">
                    <div class="form-group">
                        <Error label="Name" :errors="v$.name.$errors">
                            <BaseInput v-model="memberStore.memberInput.name" />
                        </Error>
                    </div>
                    <div class="form-group">
                        <Error label="E-mail" :errors="v$.email.$errors">
                            <BaseInput v-model="memberStore.memberInput.email" />
                        </Error>
                    </div>
                    <br/>
                    <RouterLink to="/members">See Members List</RouterLink>
                    <br/>

                    <div class="form-group">
                        <BaseBtn :class="memberStore.edit
                         ? 'btn btn-warning':'btn btn-primary'" 
                         :label="memberStore.edit?'Update Member':'Create Member'" 
                         :loading="loading" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
