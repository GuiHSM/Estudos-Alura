import React from 'react';
import style from './Botao.module.scss';

interface Props {
    children?:React.ReactNode,
    type?:"button" | "submit" | "reset" | undefined,
    onClick?:()=>void
}

function Botao({onClick, children, type}:Props){
    return(
        <button onClick={onClick} type={type} className={style.botao}>
            {children}
        </button>
    )
}
/*class Botao extends React.Component<{ 
    children:string,
    type?:"button" | "submit" | "reset" | undefined,
    onClick?:()=>void
}> {
    render() {
        const{type="button", onClick}=this.props;
        return(
            <button onClick={onClick} type={type} className={style.botao}>
                {this.props.children}
            </button>
        )
    }
}*/
export default Botao;