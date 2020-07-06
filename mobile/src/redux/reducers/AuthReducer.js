const INITIAL_STATE={
    username: '',
    password: '',
    isadmin: false,
    isseller: false,

}

const reducer=(state=INITIAL_STATE,action)=>{
    switch(action.type){
        case 'LOGIN':
            return {...state,...action.payload}
        default:
            return state
    }
}

export default reducer;