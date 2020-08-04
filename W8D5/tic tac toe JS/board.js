class Board{
    constructor(){
        this.grid = Array.from(new Array(3), ()=> new Array(3))
        // this.grid = new Array(3).fill(null).map(() => new Array(3).fill(null));
    }

    

    won(mark){
        if (won_horizontal(mark) || won_diagonal(mark) || won_vertical(mark)) {
            return true;
        }
        return false; 
    }
    
    won_horizontal(mark) {
        for(i = 0; i < this.grid.length; i++) {
            let row = this.grid[i]
            if (row.every(x => x === mark)) {
                return true;
            }
        }
        return false;
    }
    
    won_diagonal(mark) {
        let left = [], right = [];
        for(i = 0; i < this.grid.length; i ++) {
            left.push(grid[i][i]);
            right.push(grid[i][this.length - i - 1]);
        }

        if (left.every(ele => ele === mark) || right.every(ele => ele === mark)) {return true;}
        return false;
        
    } 
    

    won_vertical(mark) {
        let transGrid = Array.from(new Array(3), () => new Array(3));
        for(i=0;i<this.grid.length;i++){
            for (j = 0; j < this.grid.length; j++){
                transGrid[i][j] = this.grid[j][i]
            }
        }

        for (i = 0; i < transGrid.length; i++) {
            let row = transGrid[i]
            if (row.every(x => x === mark)) {
                return true;
            }
        }
        return false;
        
    }
    
    empty(pos){
        if (this.grid[pos[0][pos[1]]] === 'x' || this.grid[pos[0][pos[1]]] === 'o' ) return false
        else { return true }
    }
    
    winner(){
        if (this.won('x')) { return 'Winner is \'x\'' }
        else { return 'Winner is \'o\'' }
    }

    place_mark(pos,mark) {
        if (!this.empty(pos)) throw new Error('Not an empty position!')
        this.grid[pos[0]][pos[1]] = mark
    }

    print(){
        for(i=0;i<this.grid.length;i++){
            let row = this.grid[i]
            console.log(row.join(' '))
        }
    }

}