import puppeteer from 'puppeteer-core'

import http from 'http'
import fs from 'fs'
import fetch from 'node-fetch'


async function run() {
  const browser = await puppeteer.connect({
    browserWSEndpoint: `ws://localhost:${process.env.BROWSERLESS_PORT}`
  });

  const page = await browser.newPage()

  await page._client.on('Page.downloadProgress', ({ guid, totalBytes, receivedBytes, state }) => {
    console.log(`download: ${state}`)
    if (state === "completed") {
      browser.close()
      const file = fs.createWriteStream("installer.sh");

      fetch(`http://localhost:${process.env.BROWSERLESS_PORT}/workspace`)
        .then(response => response.json())
        .then(data =>
          http.get(`http://localhost:${process.env.BROWSERLESS_PORT}${data[0].path}`, response =>
            response.pipe(file)
          )
        )

    }

  })

  console.log("starting")
  await page.goto('https://my.goanywhere.com/webclient/Login.xhtml')

  await page.type('input[name="email"]', process.env.USER)
  await page.type('input[name="secret"]', process.env.PASS)
  await (await page.$x("//button[contains(., 'Sign In')]"))[0].click()
  await page.waitForNavigation()
  await (await page.$x("//a[contains(., 'Product Downloads')]"))[0].click()
  console.log("logged in")

  await page.waitForNavigation()
  await (await page.$x("//label[contains(., 'Choose Product')]"))[1].click()
  await (await page.$x("//span[contains(., 'GoAnywhere Gateway')]"))[0].click()

  await page.waitForTimeout(500);

  await page.waitForXPath("//div[not(contains(@class, 'state-ui-disabled'))]/label[contains(., 'Choose operating system')]", { visible: true })
  await (await page.$x("//div[not(contains(@class, 'state-ui-disabled'))]/label[contains(., 'Choose operating system')]"))[0].click()

  await page.waitForXPath("//li[contains(., 'Linux 64-bit version')]", { visible: true })
  await (await page.$x("//li[contains(., 'Linux 64-bit version')]"))[0].click()

  await page.waitForXPath("//*[@id='accordionPanel']/div[contains(., 'Installation Files')]", { visible: true })

  console.log("fetching download script")
  await (await page.$x("//*[@id='accordionPanel']/div[contains(., 'Installation Files')]"))[0].click()
  await page.waitForXPath("//*[@id='accordionPanel:installTabContents']//a", { visible: true })
  await (await page.$x("//*[@id='accordionPanel:installTabContents']//a"))[0].click()
}

run()