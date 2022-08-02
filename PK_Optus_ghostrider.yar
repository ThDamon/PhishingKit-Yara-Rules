rule PK_Optus_ghostrider : Optus
{
    meta:
        description = "Phishing Kit impersonating Optus (webmail.optusnet.com.au)"
        licence = "GPL-3.0"
        author = "Thomas 'tAd' Damonneville"
        reference = ""
        date = "2022-07-29"
        comment = "Phishing Kit - Optus - '-|Ghost Rider|-'"

    strings:
        $zip_file = { 50 4b 03 04 }
        $spec_dir = "bots"
        $spec_dir2 = "a_data"

        $spec_file1 = "data.php"
        $spec_file2 = "Yourmail.php"
        $spec_file3 = "macpc.png"
        $spec_file4 = "headerFooter.css"
        $spec_file5 = "a.htm"

    condition:
        uint32(0) == 0x04034b50 and
        $zip_file and
        all of ($spec_dir*) and
        // check for file
        all of ($spec_file*)
}
