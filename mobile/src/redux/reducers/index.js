import AuthReducer from './AuthReducer'
import {combineReducers} from 'redux'

export default combineReducers({
    Auth: AuthReducer,
})