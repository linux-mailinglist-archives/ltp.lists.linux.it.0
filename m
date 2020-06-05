Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4751EF0EF
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 07:40:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 579D93C2F87
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Jun 2020 07:40:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1A4333C223E
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 07:40:09 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 7EA2F200C9F
 for <ltp@lists.linux.it>; Fri,  5 Jun 2020 07:40:07 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,474,1583164800"; d="scan'208,217";a="93883997"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 05 Jun 2020 13:40:05 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 2C08950A9975;
 Fri,  5 Jun 2020 13:40:00 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Jun 2020 13:39:57 +0800
To: Jan Stancek <jstancek@redhat.com>, <ltp@lists.linux.it>
References: <588f29555a93919a5ea47e5cf786eca6a08f85f1.1591185180.git.jstancek@redhat.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3d927f64-438c-f52e-93c4-969a0d2d7c02@cn.fujitsu.com>
Date: Fri, 5 Jun 2020 13:39:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <588f29555a93919a5ea47e5cf786eca6a08f85f1.1591185180.git.jstancek@redhat.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 2C08950A9975.AB40B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/mknod07: whiteout creation no longer
 requires privileges
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
Content-Type: multipart/mixed; boundary="===============1329814665=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1329814665==
Content-Type: multipart/alternative;
	boundary="------------CCE4039162587BD546BDD9CC"

--------------CCE4039162587BD546BDD9CC
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan

Acked.
Also Theses mknod/mknodat cases should convert into new api.

Best Regards
Yang Xu

> Since commit a3c751a50fe6 ("vfs: allow unprivileged whiteout creation"),
> privileges are no longer required to create whiteout (0,0) char device.
>
> Use /dev/null instead for EPERM test.
>
> Signed-off-by: Jan Stancek <jstancek@redhat.com>
> ---
>   testcases/kernel/syscalls/mknod/mknod07.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/testcases/kernel/syscalls/mknod/mknod07.c b/testcases/kernel/syscalls/mknod/mknod07.c
> index 69cff02d95d1..829199061532 100644
> --- a/testcases/kernel/syscalls/mknod/mknod07.c
> +++ b/testcases/kernel/syscalls/mknod/mknod07.c
> @@ -43,6 +43,7 @@
>   #include <sys/types.h>
>   #include <sys/stat.h>
>   #include <sys/mount.h>
> +#include <sys/sysmacros.h>
>   
>   #include "test.h"
>   #include "safe_macros.h"
> @@ -69,13 +70,14 @@ static struct test_case_t {
>   	char *pathname;
>   	int mode;
>   	int exp_errno;
> +	int major, minor;
>   } test_cases[] = {
> -	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES },
> -	{ "testdir_1/tnode_2", FIFO_MODE, EACCES },
> -	{ "tnode_3", CHR_MODE, EPERM },
> -	{ "tnode_4", BLK_MODE, EPERM },
> -	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS },
> -	{ elooppathname, FIFO_MODE, ELOOP },
> +	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES, 0, 0 },
> +	{ "testdir_1/tnode_2", FIFO_MODE, EACCES, 0, 0 },
> +	{ "tnode_3", CHR_MODE, EPERM, 1, 3 },
> +	{ "tnode_4", BLK_MODE, EPERM, 0, 0 },
> +	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS, 0, 0 },
> +	{ elooppathname, FIFO_MODE, ELOOP, 0, 0 },
>   };
>   
>   char *TCID = "mknod07";
> @@ -149,7 +151,8 @@ static void setup(void)
>   
>   static void mknod_verify(const struct test_case_t *test_case)
>   {
> -	TEST(mknod(test_case->pathname, test_case->mode, 0));
> +	TEST(mknod(test_case->pathname, test_case->mode,
> +		makedev(test_case->major, test_case->minor)));
>   
>   	if (TEST_RETURN != -1) {
>   		tst_resm(TFAIL, "mknod succeeded unexpectedly");



--------------CCE4039162587BD546BDD9CC
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Hi Jan
</pre>
    <div class="moz-cite-prefix">
      <pre>Acked.
Also Theses mknod/mknodat cases should convert into new api.

Best Regards
Yang Xu
</pre>
    </div>
    <blockquote type="cite"
cite="mid:588f29555a93919a5ea47e5cf786eca6a08f85f1.1591185180.git.jstancek@redhat.com">
      <pre class="moz-quote-pre" wrap="">Since commit a3c751a50fe6 ("vfs: allow unprivileged whiteout creation"),
privileges are no longer required to create whiteout (0,0) char device.

Use /dev/null instead for EPERM test.

Signed-off-by: Jan Stancek <a class="moz-txt-link-rfc2396E" href="mailto:jstancek@redhat.com">&lt;jstancek@redhat.com&gt;</a>
---
 testcases/kernel/syscalls/mknod/mknod07.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/mknod/mknod07.c b/testcases/kernel/syscalls/mknod/mknod07.c
index 69cff02d95d1..829199061532 100644
--- a/testcases/kernel/syscalls/mknod/mknod07.c
+++ b/testcases/kernel/syscalls/mknod/mknod07.c
@@ -43,6 +43,7 @@
 #include &lt;sys/types.h&gt;
 #include &lt;sys/stat.h&gt;
 #include &lt;sys/mount.h&gt;
+#include &lt;sys/sysmacros.h&gt;
 
 #include "test.h"
 #include "safe_macros.h"
@@ -69,13 +70,14 @@ static struct test_case_t {
 	char *pathname;
 	int mode;
 	int exp_errno;
+	int major, minor;
 } test_cases[] = {
-	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES },
-	{ "testdir_1/tnode_2", FIFO_MODE, EACCES },
-	{ "tnode_3", CHR_MODE, EPERM },
-	{ "tnode_4", BLK_MODE, EPERM },
-	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS },
-	{ elooppathname, FIFO_MODE, ELOOP },
+	{ "testdir_1/tnode_1", SOCKET_MODE, EACCES, 0, 0 },
+	{ "testdir_1/tnode_2", FIFO_MODE, EACCES, 0, 0 },
+	{ "tnode_3", CHR_MODE, EPERM, 1, 3 },
+	{ "tnode_4", BLK_MODE, EPERM, 0, 0 },
+	{ "mntpoint/tnode_5", SOCKET_MODE, EROFS, 0, 0 },
+	{ elooppathname, FIFO_MODE, ELOOP, 0, 0 },
 };
 
 char *TCID = "mknod07";
@@ -149,7 +151,8 @@ static void setup(void)
 
 static void mknod_verify(const struct test_case_t *test_case)
 {
-	TEST(mknod(test_case-&gt;pathname, test_case-&gt;mode, 0));
+	TEST(mknod(test_case-&gt;pathname, test_case-&gt;mode,
+		makedev(test_case-&gt;major, test_case-&gt;minor)));
 
 	if (TEST_RETURN != -1) {
 		tst_resm(TFAIL, "mknod succeeded unexpectedly");
</pre>
    </blockquote>
  </body>
</html>

--------------CCE4039162587BD546BDD9CC--

--===============1329814665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1329814665==--
