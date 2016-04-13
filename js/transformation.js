var xslStylesheet;
var xsltProcessor = new XSLTProcessor();
var myDOM;
var xmlDoc;

function runMeteo(numItems){

  // load the xslt file, example1.xsl
  var myXMLHTTPRequest = new XMLHttpRequest();
  myXMLHTTPRequest.open("GET", "meteo.xsl", false);
  myXMLHTTPRequest.send(null);

  xslStylesheet = myXMLHTTPRequest.responseXML;
  xsltProcessor.importStylesheet(xslStylesheet);
  xsltProcessor.setParameter(null, "numTimes", numItems);



  // load the xml file, example1.xml
  myXMLHTTPRequest = new XMLHttpRequest();
  myXMLHTTPRequest.open("GET", "forecast.xml", false);
  myXMLHTTPRequest.send(null);

  xmlDoc = myXMLHTTPRequest.responseXML;

  var fragment = xsltProcessor.transformToFragment(xmlDoc, document);

  document.getElementById("container").innerHTML = "";

  myDOM = fragment;
  document.getElementById("container").appendChild(fragment);
}

$(function(){runMeteo(8)});