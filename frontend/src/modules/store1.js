export default {
    mutations: {
        updateName(state, username) {
            state.userName = username;
        },
    },
    actions: {
        setName(ctx, userName) {  
            ctx.commit('updateName', userName)
        }
    },
    state: {
        userName: ""
    },
    getters: {
        getName(state) {
            return state.userName
        }
    },
}