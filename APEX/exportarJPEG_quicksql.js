/**
 * Author: @moreaux_louis
 * Ref: https://twitter.com/moreaux_louis/status/1805224948950024389/photo/1
 */
QuickSQL.diagram.paper.toJPEG(function ( data ){
    let fileUrl = window.URL.createObjectURL(joint.util.dataUriToBlob(data)),
    anchorElement = document.createElement('a')

    anchorElement.href = fileUrl
    anchorElement.download = +'diagram.jpg'
    anchorElement.style.display = 'none'

    document.body.appendChild(anchorElement)

    anchorElement.click()
    anchorElement.remove()

    window.URL.revokeObjectURL(fileUrl)
}, {
    padding: 10,
    quality: 1
});

// Opcion directa desde el navegador
QuickSQL.diagram.exportAsSVG();