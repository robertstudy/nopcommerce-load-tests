Feature: Get random product by slug

Background:
  * def baseUrl = 'http://localhost:5000'

Scenario: Get random product by slug
    * def slugs = ['build-your-own-computer', 'digital-storm-vanquish-custom-performance-pc', 'lenovo-ideacentre', 'apple-macbook-pro', 'asus-laptop', 'samsung-premium-ultrabook', 'hp-spectre-xt-pro-ultrabook', 'hp-envy-156-inch-sleekbook', 'lenovo-thinkpad-carbon-laptop', 'adobe-photoshop', 'microsoft-windows-os', 'sound-forge-pro-recurring', 'nikon-d5500-dslr', 'nikon-d5500-dslr-black', 'nikon-d5500-dslr-red', 'leica-t-mirrorless-digital-camera', 'apple-icam', 'htc-smartphone', 'htc-one-mini-blue', 'nokia-lumia-1020', 'apple-iphone-16-128gb', 'samsung-galaxy-s24-256gb', 'beats-pill-wireless-speaker', 'universal-7-8-inch-tablet-cover', 'portable-sound-speakers', 'nike-floral-roshe-customized-running-shoes', 'adidas-consortium-campus-80s-running-shoes', 'nike-sb-zoom-stefan-janoski-medium-mint', 'nike-tailwind-loose-short-sleeve-running-shirt', 'oversized-women-t-shirt', 'custom-t-shirt', 'levis-511-jeans', 'obey-propaganda-hat', 'reversible-horseferry-check-belt', 'ray-ban-aviator-sunglasses', 'fahrenheit-451-by-ray-bradbury', 'first-prize-pies', 'pride-and-prejudice', 'elegant-gemstone-necklace-rental', 'flower-girl-bracelet', 'vintage-style-engagement-ring', '25-virtual-gift-card', '50-physical-gift-card', '100-physical-gift-card', 'night-visions', 'if-you-wait-donation', 'science-faith']
    
    * def getSlug = 
        """
        function() {
            var randomIndex = Math.floor(Math.random() * slugs.length);
            return slugs[randomIndex];
        }
        """
    
    * def slug = getSlug()

    Given url baseUrl + '/' + slug 
    When method GET
    Then status 200