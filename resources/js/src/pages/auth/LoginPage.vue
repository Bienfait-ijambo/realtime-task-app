<script lang="ts" setup>
import { useVuelidate } from "@vuelidate/core";
import { required, email } from "@vuelidate/validators";
import { loginInput, useLoginUser } from "./actions/login";

const rules = {
    email: { required, email }, // Matches state.firstName
    password: { required }, // Matches state.lastName
};

const v$ = useVuelidate(rules, loginInput);
const { loading, login } = useLoginUser();
async function submitLogin() {
    const result = await v$.value.$validate();

    if (!result) return;

    await login();
    v$.value.$reset()

}
</script>
<template>
    <div class="row">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h2 align="center">Login</h2>
                        <br />
                        <br />
                     
                        <form @submit.prevent="submitLogin">
                            <div class="form-group">
                                <Error
                                    label="E-mail"
                                    :errors="v$.email.$errors"
                                >
                                    <BaseInput v-model="loginInput.email" />
                                </Error>
                            </div>
                            <div class="form-group">
                                <Error
                                    label="Password"
                                    :errors="v$.password.$errors"
                                >
                                    <BaseInput
                               
                                        v-model="loginInput.password"
                                    />
                                </Error>
                            </div>
                            <br />
                            <div class="form-group">
                                <RouterLink to="/register">Create an account</RouterLink>
                            </div>
                            <div class="form-group">
           
                               <BaseBtn label="Login" :loading="loading"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</template>
