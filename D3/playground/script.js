d3.selectAll('p')
	.classed('color', (dataBound, i, n) => {
		return (i % 2 === 0)
	})