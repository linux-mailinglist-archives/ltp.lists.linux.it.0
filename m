Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 96354B3B7B
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 15:38:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D5183C2096
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Sep 2019 15:38:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 947F33C2015
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 15:38:04 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 826BA1A0068C
 for <ltp@lists.linux.it>; Mon, 16 Sep 2019 15:37:57 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,512,1559491200"; d="scan'208,217";a="75526150"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Sep 2019 21:37:54 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 11F654CE0C9C;
 Mon, 16 Sep 2019 21:37:35 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Mon, 16 Sep 2019 21:37:54 +0800
To: <ebiggers@google.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <11cd58ab-b7f4-a311-19d9-0515cf9a1fcb@cn.fujitsu.com>
Date: Mon, 16 Sep 2019 21:37:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 11F654CE0C9C.ADC8C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] the reproducible rate of ltp testcases af_alg05
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0563753595=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0563753595==
Content-Type: multipart/alternative;
	boundary="------------EC411984FEBDCEAC5975202E"

--------------EC411984FEBDCEAC5975202E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric

    I run ltp testcases af_alg05 on 3.10.0-1062.el7.x86_64, it sometimes 100% crash . it somtimes the first one passes and the second one crash.

    100% crash(4G memory ,i5 cpu)

    the second test, this case crashes (8G memory, i5 cpu)

    It seems memory size will affect the reproducible. Is it right?
	
    I think I hit this crash, crash log as below:
[  140.006433] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
[  140.071830] BUG: unable to handle kernel paging request at fffffac945724000
[  140.071835] IP: [<ffffffffbcd2cbec>] scatterwalk_done+0x4c/0x60
[  140.071841] PGD 13f5d3067 PUD 13f5d2067 PMD 0
[  140.071844] Oops: 0000 [#1] SMP
.......
[  140.071905] RIP: 0010:[<ffffffffbcd2cbec>]  [<ffffffffbcd2cbec>] scatterwalk_done+0x4c/0x60
.....
140.071920] Call Trace:
[  140.071924]  [<ffffffffbcd2fa6e>] ? blkcipher_walk_done+0x21e/0x2b0
[  140.071927]  [<ffffffffbcd2fe5c>] blkcipher_walk_next+0x35c/0x3d0
[  140.071929]  [<ffffffffbcd2ff5a>] blkcipher_walk_first+0x8a/0x1a0
[  140.071932]  [<ffffffffbcd3008f>] blkcipher_walk_virt+0x1f/0x30
[  140.071934]  [<ffffffffbcd3d0d6>] crypto_cbc_decrypt+0x66/0x260
[  140.071937]  [<ffffffffbca7c31f>] ? gup_pud_range+0x13f/0x2a0
[  140.071940]  [<ffffffffbcd2efa1>] async_decrypt+0x51/0x70
[  140.071942]  [<ffffffffbcd2efa1>] ? async_decrypt+0x51/0x70
[  140.071944]  [<ffffffffbcd420a9>] skcipher_recvmsg+0x3a9/0x400
[  140.071947]  [<ffffffffbd02c6ec>] sock_aio_read.part.9+0x14c/0x170
[  140.071949]  [<ffffffffbd02c731>] sock_aio_read+0x21/0x30
[  140.071952]  [<ffffffffbcc47ac3>] do_sync_read+0x93/0xe0
[  140.071954]  [<ffffffffbcc485a5>] vfs_read+0x145/0x170
[  140.071956]  [<ffffffffbcc493bf>] SyS_read+0x7f/0xf0
[  140.071959]  [<ffffffffbd18be21>] ? system_call_after_swapgs+0xae/0x146
[  140.071961]  [<ffffffffbd18bede>] system_call_fastpath+0x25/0x2a
[  140.071963]  [<ffffffffbd18be21>] ? system_call_after_swapgs+0xae/0x146
[  140.071964] Code: c8 41 39 c1 41 0f 46 c1 a9 ff 0f 00 00 74 04 85 d2 75 29 85 f6 74 17 49 8b 00 83 e9 01 c1 e9 0c 48 c1 e1 06 48 83 e0 fc 48 01 c1 <48> 8b 01 85 d2 74 0a 55 48 89 e5 e8 54 fd ff ff 5d f3 c3 90 66
[  140.071992] RIP  [<ffffffffbcd2cbec>] scatterwalk_done+0x4c/0x60
[  140.071994]  RSP <ffff89261e787a90>
  
ps: Tomorrow I will use server machine to test with 16 or 32G memory.

Thanks
Yang Xu




--------------EC411984FEBDCEAC5975202E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi Eric</pre>
    <pre>   I run ltp testcases af_alg05 on 3.10.0-1062.el7.x86_64, it sometimes 100% crash . it somtimes the first one passes and the second one crash.</pre>
    <pre>   100% crash(4G memory ,i5 cpu)</pre>
    <pre>   the second test, this case crashes (8G memory, i5 cpu)
</pre>
    <pre>   It seems memory size will affect the reproducible. Is it right? 
	
   I think I hit this crash, crash log as below:
[  140.006433] alg: No test for fips(ansi_cprng) (fips_ansi_cprng)
[  140.071830] BUG: unable to handle kernel paging request at fffffac945724000
[  140.071835] IP: [&lt;ffffffffbcd2cbec&gt;] scatterwalk_done+0x4c/0x60
[  140.071841] PGD 13f5d3067 PUD 13f5d2067 PMD 0
[  140.071844] Oops: 0000 [#1] SMP
.......
[  140.071905] RIP: 0010:[&lt;ffffffffbcd2cbec&gt;]  [&lt;ffffffffbcd2cbec&gt;] scatterwalk_done+0x4c/0x60
.....
140.071920] Call Trace:
[  140.071924]  [&lt;ffffffffbcd2fa6e&gt;] ? blkcipher_walk_done+0x21e/0x2b0
[  140.071927]  [&lt;ffffffffbcd2fe5c&gt;] blkcipher_walk_next+0x35c/0x3d0
[  140.071929]  [&lt;ffffffffbcd2ff5a&gt;] blkcipher_walk_first+0x8a/0x1a0
[  140.071932]  [&lt;ffffffffbcd3008f&gt;] blkcipher_walk_virt+0x1f/0x30
[  140.071934]  [&lt;ffffffffbcd3d0d6&gt;] crypto_cbc_decrypt+0x66/0x260
[  140.071937]  [&lt;ffffffffbca7c31f&gt;] ? gup_pud_range+0x13f/0x2a0
[  140.071940]  [&lt;ffffffffbcd2efa1&gt;] async_decrypt+0x51/0x70
[  140.071942]  [&lt;ffffffffbcd2efa1&gt;] ? async_decrypt+0x51/0x70
[  140.071944]  [&lt;ffffffffbcd420a9&gt;] skcipher_recvmsg+0x3a9/0x400
[  140.071947]  [&lt;ffffffffbd02c6ec&gt;] sock_aio_read.part.9+0x14c/0x170
[  140.071949]  [&lt;ffffffffbd02c731&gt;] sock_aio_read+0x21/0x30
[  140.071952]  [&lt;ffffffffbcc47ac3&gt;] do_sync_read+0x93/0xe0
[  140.071954]  [&lt;ffffffffbcc485a5&gt;] vfs_read+0x145/0x170
[  140.071956]  [&lt;ffffffffbcc493bf&gt;] SyS_read+0x7f/0xf0
[  140.071959]  [&lt;ffffffffbd18be21&gt;] ? system_call_after_swapgs+0xae/0x146
[  140.071961]  [&lt;ffffffffbd18bede&gt;] system_call_fastpath+0x25/0x2a
[  140.071963]  [&lt;ffffffffbd18be21&gt;] ? system_call_after_swapgs+0xae/0x146
[  140.071964] Code: c8 41 39 c1 41 0f 46 c1 a9 ff 0f 00 00 74 04 85 d2 75 29 85 f6 74 17 49 8b 00 83 e9 01 c1 e9 0c 48 c1 e1 06 48 83 e0 fc 48 01 c1 &lt;48&gt; 8b 01 85 d2 74 0a 55 48 89 e5 e8 54 fd ff ff 5d f3 c3 90 66
[  140.071992] RIP  [&lt;ffffffffbcd2cbec&gt;] scatterwalk_done+0x4c/0x60
[  140.071994]  RSP &lt;ffff89261e787a90&gt;
 
ps: Tomorrow I will use server machine to test with 16 or 32G memory.
<span class="tlid-translation translation" lang="en"><span title="" class=""></span></span></pre>
    <pre>Thanks
Yang Xu
</pre>
  </body>
</html>

--------------EC411984FEBDCEAC5975202E--

--===============0563753595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0563753595==--
