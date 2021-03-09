class SortTests {
    constructor(table) {
        table.addEventListener('click', this.sortRowsByTitle.bind(this))
    }

    sortRowsByTitle() {
        const table = document.querySelector('table')

        // NodeList
        // https://developer.mozilla.org/ru/docs/Web/API/NodeList
        const sortedRows = Array.from(table.rows).slice(1)

        if (document.querySelector('.octicon-arrow-up').classList.contains('hide')) {
            sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? 1 : -1)
            document.querySelector('.octicon-arrow-up').classList.remove('hide')
            document.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows.sort((rowA, rowB) => rowA.cells[0].innerHTML > rowB.cells[0].innerHTML ? -1 : 1)
            document.querySelector('.octicon-arrow-up').classList.add('hide')
            document.querySelector('.octicon-arrow-down').classList.remove('hide')
        }
        table.tBodies[0].append(...sortedRows)
    }


}
