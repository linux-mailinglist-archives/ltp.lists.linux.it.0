Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DF460B713D
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 03:52:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 87C353C210B
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Sep 2019 03:52:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 933583C20AF
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 03:52:31 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id A2D20200B67
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 03:52:28 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,522,1559491200"; d="scan'208,217";a="75680945"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Sep 2019 09:52:25 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 658C64CE14E7
 for <ltp@lists.linux.it>; Thu, 19 Sep 2019 09:52:25 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Thu, 19 Sep 2019 09:52:27 +0800
To: <ltp@lists.linux.it>
References: <1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <86a6e3a5-9f17-f7e7-d14a-d60ccdd81ff2@cn.fujitsu.com>
Date: Thu, 19 Sep 2019 09:52:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 658C64CE14E7.A0238
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] crypto/af_alg05: add comment for a regression
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
Content-Type: multipart/mixed; boundary="===============0076121801=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0076121801==
Content-Type: multipart/alternative;
	boundary="------------AEA31F241DF995D026AF4D21"

--------------AEA31F241DF995D026AF4D21
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi

This is a patch that I investigated af_alg05 crashes on 3.10.0-1062.el7.x86_64. As af_alg05 describe,
it crashes on some  architectures, such as arm and arm64. But on this kernel, it doesn't backport
commit 160544075f2 ("crypto: scatterwalk - Hide* PageSlab call to optimise away flush_dcache_page"),
so it doesn't have architectures restraint . Also this kernel doesn't support skcipher walk interface
(this interface replaces blkcipher walk and ablkcipher walk.), so this case will crash with blkcipher
walk on x86_64. as below:

IP: [<ffffffff8212d39c>] scatterwalk_done+0x4c/0x60
.....
[  176.424393] Call Trace:
[  176.425484]  [<ffffffff8213021e>] ? blkcipher_walk_done+0x21e/0x2b0
[  176.426568]  [<ffffffff8213060c>] blkcipher_walk_next+0x35c/0x3d0
[  176.427653]  [<ffffffff8213070a>] blkcipher_walk_first+0x8a/0x1a0
[  176.428742]  [<ffffffff8213083f>] blkcipher_walk_virt+0x1f/0x30
[  176.429824]  [<ffffffff8213d876>] crypto_cbc_decrypt+0x66/0x260
[  176.430892]  [<ffffffff81e7c29f>] ? gup_pud_range+0x13f/0x2a0
[  176.431968]  [<ffffffff8212f751>] async_decrypt+0x51/0x70
[  176.433007]  [<ffffffff8212f751>] ? async_decrypt+0x51/0x70
[  176.434076]  [<ffffffff82142849>] skcipher_recvmsg+0x3a9/0x400
[  176.435112]  [<ffffffff8242c6ec>] sock_aio_read.part.9+0x14c/0x170
[  176.436156]  [<ffffffff8242c731>] sock_aio_read+0x21/0x30
[  176.437189]  [<ffffffff820482d3>] do_sync_read+0x93/0xe0
[  176.438219]  [<ffffffff82048db5>] vfs_read+0x145/0x170
[  176.439260]  [<ffffffff82049bcf>] SyS_read+0x7f/0xf0
[  176.440287]  [<ffffffff8258aede>] system_call_fastpath+0x25/0x2a


Thanks
Yang Xu

> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>   testcases/kernel/crypto/af_alg05.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/testcases/kernel/crypto/af_alg05.c b/testcases/kernel/crypto/af_alg05.c
> index 419c65eab..964adffcc 100644
> --- a/testcases/kernel/crypto/af_alg05.c
> +++ b/testcases/kernel/crypto/af_alg05.c
> @@ -10,6 +10,12 @@
>    * block size, and where the destination buffer starts exactly at a page
>    * boundary.  Based on the reproducer from the commit message.  Note that this
>    * issue only reproduces on certain architectures, such as arm and arm64.
> + *
> + * On some older kernel without commit 160544075f2 ("crypto: scatterwalk - Hide
> + * PageSlab call to optimise away flush_dcache_page") , it doesn't use
> + * ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macro. It can crash on all architectures.
> + * Without skcipher walk interface, it is also a regresstion test for commit
> + * 0868def3e410("crypto: blkcipher - fix crash flushing dcache in error path").
>    */
>   
>   #include <errno.h>



--------------AEA31F241DF995D026AF4D21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi </pre>
    <div class="moz-cite-prefix">
      <pre>This is a patch that I investigated af_alg05 crashes on 3.10.0-1062.el7.x86_64. As af_alg05 describe,
it crashes on some  architectures, such as arm and arm64. But on this kernel, it doesn't backport 
commit 160544075f2 ("crypto: scatterwalk - Hide* PageSlab call to optimise away flush_dcache_page"),
so it doesn't have architectures restraint . Also this kernel doesn't support skcipher walk interface
(this interface replaces blkcipher walk and ablkcipher walk.), so this case will crash with blkcipher 
walk on x86_64. as below:</pre>
    </div>
    <div class="moz-cite-prefix">
      <pre>IP: [&lt;ffffffff8212d39c&gt;] scatterwalk_done+0x4c/0x60
.....
[  176.424393] Call Trace:
[  176.425484]  [&lt;ffffffff8213021e&gt;] ? blkcipher_walk_done+0x21e/0x2b0
[  176.426568]  [&lt;ffffffff8213060c&gt;] blkcipher_walk_next+0x35c/0x3d0
[  176.427653]  [&lt;ffffffff8213070a&gt;] blkcipher_walk_first+0x8a/0x1a0
[  176.428742]  [&lt;ffffffff8213083f&gt;] blkcipher_walk_virt+0x1f/0x30
[  176.429824]  [&lt;ffffffff8213d876&gt;] crypto_cbc_decrypt+0x66/0x260
[  176.430892]  [&lt;ffffffff81e7c29f&gt;] ? gup_pud_range+0x13f/0x2a0
[  176.431968]  [&lt;ffffffff8212f751&gt;] async_decrypt+0x51/0x70
[  176.433007]  [&lt;ffffffff8212f751&gt;] ? async_decrypt+0x51/0x70
[  176.434076]  [&lt;ffffffff82142849&gt;] skcipher_recvmsg+0x3a9/0x400
[  176.435112]  [&lt;ffffffff8242c6ec&gt;] sock_aio_read.part.9+0x14c/0x170
[  176.436156]  [&lt;ffffffff8242c731&gt;] sock_aio_read+0x21/0x30
[  176.437189]  [&lt;ffffffff820482d3&gt;] do_sync_read+0x93/0xe0
[  176.438219]  [&lt;ffffffff82048db5&gt;] vfs_read+0x145/0x170
[  176.439260]  [&lt;ffffffff82049bcf&gt;] SyS_read+0x7f/0xf0
[  176.440287]  [&lt;ffffffff8258aede&gt;] system_call_fastpath+0x25/0x2a


Thanks
Yang Xu
</pre>
    </div>
    <div class="moz-cite-prefix">
    </div>
    <blockquote type="cite"
cite="mid:1568720356-29641-1-git-send-email-xuyang2018.jy@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
---
 testcases/kernel/crypto/af_alg05.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/testcases/kernel/crypto/af_alg05.c b/testcases/kernel/crypto/af_alg05.c
index 419c65eab..964adffcc 100644
--- a/testcases/kernel/crypto/af_alg05.c
+++ b/testcases/kernel/crypto/af_alg05.c
@@ -10,6 +10,12 @@
  * block size, and where the destination buffer starts exactly at a page
  * boundary.  Based on the reproducer from the commit message.  Note that this
  * issue only reproduces on certain architectures, such as arm and arm64.
+ *
+ * On some older kernel without commit 160544075f2 ("crypto: scatterwalk - Hide
+ * PageSlab call to optimise away flush_dcache_page") , it doesn't use
+ * ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macro. It can crash on all architectures.
+ * Without skcipher walk interface, it is also a regresstion test for commit
+ * 0868def3e410("crypto: blkcipher - fix crash flushing dcache in error path").
  */
 
 #include &lt;errno.h&gt;
</pre>
    </blockquote>
  </body>
</html>

--------------AEA31F241DF995D026AF4D21--

--===============0076121801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0076121801==--
