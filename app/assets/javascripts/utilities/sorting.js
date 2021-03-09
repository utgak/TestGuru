class SortTests {
    constructor(table) {
        const control = table

        control.addEventListener('click', this.sortRowsByTitle)
    }



    sortRowsByTitle() {
        const table = document.querySelector('table')

        // NodeList
        // https://developer.mozilla.org/ru/docs/Web/API/NodeList
        const rows = table.querySelectorAll('tr')
        const sortedRows = []

        // select all table rows except the first one which is the header
        for (let i = 1; i < rows.length; i++) {
            sortedRows.push(rows[i])
        }

        if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
            sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
            this.querySelector('.octicon-arrow-up').classList.remove('hide')
            this.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1)
            this.querySelector('.octicon-arrow-up').classList.add('hide')
            this.querySelector('.octicon-arrow-down').classList.remove('hide')
        }

        table.parentNode.replaceChild(SortTests.newTable(rows, sortedRows), table)
    }

    static newTable(rows, sortedRows) {
        const sortedTable = document.createElement('table')

        sortedTable.classList.add('table')
        sortedTable.appendChild(rows[0])

        for (let i = 0; i < sortedRows.length; i++) {
            sortedTable.appendChild(sortedRows[i])
        }
        return sortedTable
    }
}