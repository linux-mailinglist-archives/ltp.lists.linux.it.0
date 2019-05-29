Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E532D920
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 11:33:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2650E3EA2EC
	for <lists+linux-ltp@lfdr.de>; Wed, 29 May 2019 11:33:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 6776D3EA1B6
 for <ltp@lists.linux.it>; Wed, 29 May 2019 11:33:07 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E95AD1A01142
 for <ltp@lists.linux.it>; Wed, 29 May 2019 11:33:05 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 04146AFCF
 for <ltp@lists.linux.it>; Wed, 29 May 2019 09:33:04 +0000 (UTC)
From: Christian Amann <camann@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.com; keydata=
 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
 du2mz1Q=
To: ltp@lists.linux.it
Message-ID: <7b0b763f-0b6b-fb18-7916-d25afdcb5c68@suse.com>
Date: Wed, 29 May 2019 11:33:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] TST_GET_UNUSED_PORT returns ports < 1024
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1816860241=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============1816860241==
Content-Type: multipart/alternative;
 boundary="------------CD7340F345524FEEE45578EA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CD7340F345524FEEE45578EA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksCgp3aGVuIHVzaW5nIHRoZSBUU1RfR0VUX1VOVVNFRF9QT1JUIG1hY3JvIHlvdSBzb21l
dGltZXMgZ2V0IHBvcnRzIGxvd2VyCnRoYW4gMTAyNCB3aGljaCB3b3VsZCByZXF1aXJlIGEg
dGVzdGNhc2UgdG8gaGF2ZSB0aGUKQ0FQX05FVF9CSU5EX1NFUlZJQ0UgY2FwYWJpbGl0eSAo
b3Igc2ltcGx5IHJ1biBhcyByb290KS4KCk9mIGNvdXJzZSB5b3UgY291bGQgd3JpdGUgYSB3
cmFwcGVyIGxpa2UgdGhlIGZvbGxvd2luZyB0byBhdm9pZCB0aGF0Cmlzc3VlLCBidXQgaW4g
bXkgb3BpbmlvbiBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgdGhlIG9wdGlvbiB0byBnZXQK
bm9uLXJvb3QgcG9ydHMgZGlyZWN0bHkgZnJvbSB0aGUgbGlicmFyeS4KCi8qIFdyYXBwZXIg
dG8gdG8gZ2V0IGEgbm9uLXJvb3QgcG9ydCBpZiBuZWNlc3NhcnkgKi8Kc3RhdGljIGludCBn
ZXRfcG9ydCh1aWRfdCB1aWQpCnsKwqDCoMKgwqDCoMKgwqAgc3RhdGljIGludCBjb3VudCA9
IDEwOwrCoMKgwqDCoMKgwqDCoCBpbnQgcG9ydDsKCsKgwqDCoMKgwqDCoMKgIHBvcnQgPSBU
U1RfR0VUX1VOVVNFRF9QT1JUKEFGX0lORVQsIFNPQ0tfU1RSRUFNKTsKwqDCoMKgwqDCoMKg
wqAgaWYgKHBvcnQgPCAxMDAwICYmIHVpZCAhPSAwKSB7CsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoIWNvdW50KQrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHRzdF9icmsoVEJST0ssICJDb3VsZCBub3QgZ2V0IGZpdHRpbmcg
cG9ydCIpOwrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY291bnQtLTsKwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBnZXRfcG9ydCh1aWQpOwrCoMKgwqDC
oMKgwqDCoCB9CsKgwqDCoMKgwqDCoMKgIHJldHVybiBwb3J0Owp9CgpLaW5kIHJlZ2FyZHMs
CgpDaHJpc3RpYW4KCgo=
--------------CD7340F345524FEEE45578EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,</p>
    <p>when using the TST_GET_UNUSED_PORT macro you sometimes get ports
      lower than 1024 which would require a testcase to have the
      CAP_NET_BIND_SERVICE capability (or simply run as root).</p>
    <p>Of course you could write a wrapper like the following to avoid
      that issue, but in my opinion it would be nice to have the option
      to get non-root ports directly from the library.</p>
    <p><font color="#3366ff">/* Wrapper to to get a non-root port if
        necessary */<br>
        static int get_port(uid_t uid)<br>
        {<br>
                static int count = 10;<br>
                int port;<br>
        <br>
                port = TST_GET_UNUSED_PORT(AF_INET, SOCK_STREAM);<br>
                if (port &lt; 1000 &amp;&amp; uid != 0) {<br>
                        if (!count)<br>
                                tst_brk(TBROK, "Could not get fitting
        port");<br>
                        count--;<br>
                        return get_port(uid);<br>
                }<br>
                return port;<br>
        }</font><br>
    </p>
    <p>Kind regards,</p>
    <p>Christian<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------CD7340F345524FEEE45578EA--

--===============1816860241==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1816860241==--
