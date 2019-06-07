Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAB438454
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 08:32:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DBA83EA620
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Jun 2019 08:32:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 17B9C3EA5DD
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 08:32:40 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id B6EDA201343
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 08:32:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCD7EAECA
 for <ltp@lists.linux.it>; Fri,  7 Jun 2019 06:32:38 +0000 (UTC)
To: Cyril Hrubis <chrubis@suse.cz>
References: <20190604072228.17513-1-camann@suse.com>
 <20190606121436.GB27083@rei>
From: Christian Amann <camann@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.com; keydata=
 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
 du2mz1Q=
Message-ID: <7c7bf785-adbd-d69b-c17b-bc65c2228d11@suse.com>
Date: Fri, 7 Jun 2019 08:32:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606121436.GB27083@rei>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/acct02: add functional testcase
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
Content-Type: multipart/mixed; boundary="===============0164393581=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0164393581==
Content-Type: multipart/alternative;
 boundary="------------3EDE5C734E1FD634BD09D44F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3EDE5C734E1FD634BD09D44F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

yes, I have tested it on a system like you describe but I receive a
positive output:

tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
acct02.c:159: INFO: Verifying using 'struct acct'
acct02.c:137: INFO: Number of accounting file entries tested: 1
acct02.c:140: PASS: acct() wrote correct file contents!

There seems to be something else going wrong. I will investigate this.

Kind regards,

Christian


On 06/06/2019 14:14, Cyril Hrubis wrote:
> Hi!
> Have you tried the test on the !v3 case?
>
> I do have:
>
> CONFIG_BSD_PROCESS_ACCT=y
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
>
> And the test fails with:
>
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
> tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
> acct02.c:159: INFO: Verifying using 'struct acct'
> acct02.c:137: INFO: Number of accounting file entries tested: 0
> acct02.c:142: FAIL: acct() wrote incorrect file contents!
>
> Looks like the file is empty for me...
>

--------------3EDE5C734E1FD634BD09D44F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi,</p>
    <p>yes, I have tested it on a system like you describe but I receive
      a positive output:</p>
    <p>tst_kconfig.c:62: <font color="#33ccff">INFO:</font> Parsing
      kernel config '/proc/config.gz'<br>
      tst_test.c:1111: <font color="#33ccff">INFO:</font> Timeout per
      run is 0h 05m 00s<br>
      tst_kconfig.c:62: <font color="#33ccff">INFO:</font> Parsing
      kernel config '/proc/config.gz'<br>
      acct02.c:159: <font color="#33ccff">INFO:</font> Verifying using
      'struct acct'<br>
      acct02.c:137: <font color="#33ccff">INFO:</font> Number of
      accounting file entries tested: 1<br>
      acct02.c:140: <font color="#33cc00">PASS:</font> acct() wrote
      correct file contents!<br>
      <br>
    </p>
    <p>There seems to be something else going wrong. I will investigate
      this.</p>
    <p>Kind regards,</p>
    <p>Christian<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 06/06/2019 14:14, Cyril Hrubis
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20190606121436.GB27083@rei">
      <pre class="moz-quote-pre" wrap="">Hi!
Have you tried the test on the !v3 case?

I do have:

CONFIG_BSD_PROCESS_ACCT=y
# CONFIG_BSD_PROCESS_ACCT_V3 is not set

And the test fails with:

tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s
tst_kconfig.c:62: INFO: Parsing kernel config '/proc/config.gz'
acct02.c:159: INFO: Verifying using 'struct acct'
acct02.c:137: INFO: Number of accounting file entries tested: 0
acct02.c:142: FAIL: acct() wrote incorrect file contents!

Looks like the file is empty for me...

</pre>
    </blockquote>
  </body>
</html>

--------------3EDE5C734E1FD634BD09D44F--

--===============0164393581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0164393581==--
