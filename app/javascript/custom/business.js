function addSocialField() {
  let now = new Date().getTime() 

  let idAttributeSite = "business_socials_attributes_0_site".replace("0", now)
  let nameAttributeSite = "business[socials_attributes][0][site]".replace("0", now)
  let idAttributeUrl = "business_socials_attributes_0_url".replace("0", now)
  let nameAttributeUrl = "business[socials_attributes][0][url]".replace("0", now)
   
  let tr = document.createElement("tr")
  let td = document.createElement("td")

  let siteLabel = document.createElement("label")
  siteLabel.setAttribute("for", idAttributeSite)
  let siteLabelText = document.createTextNode("Site")
  siteLabel.appendChild(siteLabelText)
  td.appendChild(siteLabel)

  let siteInput = document.createElement("input")
  siteInput.setAttribute("type", "text")
  siteInput.setAttribute("id", idAttributeSite)
  siteInput.setAttribute("name", nameAttributeSite)
  td.appendChild(siteInput)

  let urlLabel = document.createElement("label")
  urlLabel.setAttribute("for", idAttributeUrl)
  let urlLabelText = document.createTextNode("Url")
  urlLabel.appendChild(urlLabelText)
  td.appendChild(urlLabel)

  let urlInput = document.createElement("input")
  urlInput.setAttribute("type", "text")
  urlInput.setAttribute("id", idAttributeUrl)
  urlInput.setAttribute("name", nameAttributeUrl)
  td.appendChild(urlInput)
  
  tr.appendChild(td)

  document.getElementById("social-table").appendChild(tr)
}

export default addSocialField()