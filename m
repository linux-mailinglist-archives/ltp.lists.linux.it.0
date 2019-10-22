Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D27FADFDBC
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 08:37:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56C7C3C2304
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 08:37:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A40863C1865
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 08:37:41 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id EBBDF600A0D
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 08:37:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.67,326,1566835200"; d="scan'208,217";a="77307973"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Oct 2019 14:37:33 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 9DB3C4B6EC87;
 Tue, 22 Oct 2019 14:29:40 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Tue, 22 Oct 2019 14:37:38 +0800
To: Petr Vorel <pvorel@suse.cz>
References: <20190930093627.30159-1-pvorel@suse.cz>
 <f9121245-60e5-5dfe-4b17-47b38c0f5ff4@cn.fujitsu.com>
 <20191022061328.GA9267@dell5510>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <92e994a3-321f-1ef0-8b81-4262f317a461@cn.fujitsu.com>
Date: Tue, 22 Oct 2019 14:37:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191022061328.GA9267@dell5510>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 9DB3C4B6EC87.A14F1
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/copy_file_range02: skip if cross-fs
 isn't supported
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
Cc: linux-fsdevel@vger.kernel.org, ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============1282444331=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1282444331==
Content-Type: multipart/alternative;
	boundary="------------B87A09CB16F69472D583E9DF"

--------------B87A09CB16F69472D583E9DF
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


on 2019/10/22 14:14, Petr Vorel wrote:

> Hi Xu, others,
>
> [ Cc Amir and linux-fsdevel ].
>
>> on 2019/09/30 17:36, Petr Vorel wrote:
>>> copy_file_range02 was written to verify copy_file_range() v5.3 changes.
>>> Detect it via cross-filesystem copy_file_range() functionality, so that we
>>> cover also backports to stable/enterprise distro kernels (if backported,
>>> it should be with all those API fixes).
>>> Missing these API fixes is detected by errno changes introduced by
>>> This fixes errors caused by commits from v5.3-rc1:
>>> 5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
>>> 96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
>>> This check requires to put back into copy_file_range02 .mount_device = 1
>>> and .mntpoint = MNTPOINT (but .all_filesystems = 1 is obviously not needed).
>> Hi Petr
>>     Why we must put back .mount_device and .mntpoint = MNTPOINT?
>> copy_file_range02 was not only written to verify copy_file_range() v5.3 changes
>> and it also tests other errors before v5.3.
> This fix was based on Amir's suggestion [1], he states the opposite:
>
> IIUC, copy_file_range02 was written after v5.3 changes to verify that
> copy_file_range
> stays unbroken.
> As such, I would suggest that you check if kernel supports cross-fs copy, like
> copy_file_range01 does and if it doesn't, skip the test entirely.
> If some one ever backports cross-fs copy to any distro stable kernel, then one
> would better also backkport all of those API fixes, otherwise test will fail.

Hi Petr

In copy_file_range01, I split it into two tests(not cross-filesytem test and cross-filesystem test)
         {FILE_DEST_PATH,  0, "non cross-device"},
         {FILE_MNTED_PATH, 1, "cross-device"},

if kernel doesn't support cross-fs copy, the second test skips and the first still can run.

So for copy_file_range02, it should be same but not for entire test.

>
>
>> I think cross-filesystem copy_file_range is a kernel action change and then I
>> put it into copy_file_range01.c. So copy_file_range02.c doesn't test EXDEV error .
>> Also since commit v5.3-rc1 two commit, immutable file(EPERM)，swap file(ETXTBSY)，
>> overlaping range(EINVAL), max length lenght(EOVERFLOW),max file size(EFBIG) these
>> check have been add. But other errors still existed before this two commits such as:
>> copy contents to file open as readonly *    -> EBADF
>> Now, before v5.3-rc1, copy_file_range02.c  is notrun that we don't do error check.
>> It is unreasonable.
> So, do you suggest to test EBADF for all versions? Or something else?

Yes.  I think we can use cross_sup flag to decide whether test immutable file(EPERM)，swap file(ETXTBSY)，
overlaping range(EINVAL), max length lenght(EOVERFLOW),max file size(EFBIG). If  cross_sup
is equal to 1, test them. If not, don't test them as your patch do but not for all errors.

But for other errors, I think we can still test them for all versions such as pipe, char,and block dev.

>
>> ps:
>> copy_file_range newest man-pages
>> https://github.com/mkerrisk/man-pages/commit/88e75e2c56a68eaf8fcf662a63b802fdf77a4017
> Yep, Amir planned to fix it :).
>
>> Thanks
>> Yang Xu
> [1] http://lists.linux.it/pipermail/ltp/2019-September/013697.html
>
>>> + Remove few unused imports.
>>> Suggested-by: Amir Goldstein <amir73il@gmail.com>
>>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>>> ---
>>> Changes v1->v2:
>>> pass the source and destination as parameters to
>>> verify_cross_fs_copy_support(), remove bogus setup checks
>>> (Suggested by Cyril).
>>> Kind regards,
>>> Petr
>>>    .../copy_file_range/copy_file_range.h         | 23 ++++++++++++++++---
>>>    .../copy_file_range/copy_file_range01.c       | 22 ++----------------
>>>    .../copy_file_range/copy_file_range02.c       | 11 ++++++++-
>>>    3 files changed, 32 insertions(+), 24 deletions(-)
>>> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
>>> index 40d05d653..1d80ab0f7 100644
>>> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
>>> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
>>> @@ -7,9 +7,7 @@
>>>    #ifndef __COPY_FILE_RANGE_H__
>>>    #define __COPY_FILE_RANGE_H__
>>> -#include <stdbool.h>
>>> -#include <unistd.h>
>>> -#include <sys/sysmacros.h>
>>> +#include <stdio.h>
>>>    #include "lapi/syscalls.h"
>>>    #include "lapi/fs.h"
>>> @@ -62,4 +60,23 @@ static int sys_copy_file_range(int fd_in, loff_t *off_in,
>>>    	return -1;
>>>    }
>>> +static inline int verify_cross_fs_copy_support(const char *path_in, const char *path_out)
>>> +{
>>> +	int i, fd, fd_test;
>>> +
>>> +	fd = SAFE_OPEN(path_in, O_RDWR | O_CREAT, 0664);
>>> +	/* Writing page_size * 4 of data into test file */
>>> +	for (i = 0; i < (int)(getpagesize() * 4); i++)
>>> +		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
>>> +
>>> +	fd_test = SAFE_OPEN(path_out, O_RDWR | O_CREAT, 0664);
>>> +	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
>>> +
>>> +	SAFE_CLOSE(fd_test);
>>> +	remove(FILE_MNTED_PATH);
>>> +	SAFE_CLOSE(fd);
>>> +
>>> +	return TST_ERR == EXDEV ? 0 : 1;
>>> +}
>>> +
>>>    #endif /* __COPY_FILE_RANGE_H__ */
>>> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>>> index ec55e5da1..6097c85b3 100644
>>> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>>> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
>>> @@ -16,8 +16,6 @@
>>>    #define _GNU_SOURCE
>>> -#include <stdio.h>
>>> -#include <stdlib.h>
>>>    #include "tst_test.h"
>>>    #include "tst_safe_stdio.h"
>>>    #include "copy_file_range.h"
>>> @@ -179,7 +177,7 @@ static void copy_file_range_verify(unsigned int n)
>>>    	if (tc->flags && !cross_sup) {
>>>    		tst_res(TCONF,
>>> -			"copy_file_range doesn't support cross-device, skip it");
>>> +			"copy_file_range() doesn't support cross-device, skip it");
>>>    		return;
>>>    	}
>>> @@ -215,25 +213,9 @@ static void copy_file_range_verify(unsigned int n)
>>>    static void setup(void)
>>>    {
>>> -	int i, fd, fd_test;
>>> -
>>>    	syscall_info();
>>> -
>>>    	page_size = getpagesize();
>>> -	cross_sup = 1;
>>> -	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>>> -	/* Writing page_size * 4 of data into test file */
>>> -	for (i = 0; i < (int)(page_size * 4); i++)
>>> -		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
>>> -
>>> -	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
>>> -	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
>>> -	if (TST_ERR == EXDEV)
>>> -		cross_sup = 0;
>>> -
>>> -	SAFE_CLOSE(fd_test);
>>> -	remove(FILE_MNTED_PATH);
>>> -	SAFE_CLOSE(fd);
>>> +	cross_sup = verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH);
>>>    }
>>>    static void cleanup(void)
>>> diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
>>> index d6e843ee4..6e385adbd 100644
>>> --- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
>>> +++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
>>> @@ -49,6 +49,7 @@ static int fd_blkdev;
>>>    static int fd_chrdev;
>>>    static int fd_fifo;
>>>    static int fd_copy;
>>> +static int need_unlink;
>>>    static int chattr_i_nsup;
>>>    static int swap_nsup;
>>> @@ -160,7 +161,8 @@ static void cleanup(void)
>>>    		SAFE_CLOSE(fd_dup);
>>>    	if (fd_copy > 0)
>>>    		SAFE_CLOSE(fd_copy);
>>> -	SAFE_UNLINK(FILE_FIFO);
>>> +	if (need_unlink > 0)
>>> +		SAFE_UNLINK(FILE_FIFO);
>>>    }
>>>    static void setup(void)
>>> @@ -168,6 +170,10 @@ static void setup(void)
>>>    	syscall_info();
>>>    	char dev_path[1024];
>>> +	if (!verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH))
>>> +		tst_brk(TCONF,
>>> +			"copy_file_range() doesn't support cross-device, skip it");
>>> +
>>>    	if (access(FILE_DIR_PATH, F_OK) == -1)
>>>    		SAFE_MKDIR(FILE_DIR_PATH, 0777);
>>>    	/*
>>> @@ -177,6 +183,7 @@ static void setup(void)
>>>    	loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
>>>    	SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
>>> +	need_unlink = 1;
>>>    	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
>>>    	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
>>> @@ -223,6 +230,8 @@ static struct tst_test test = {
>>>    	.tcnt = ARRAY_SIZE(tcases),
>>>    	.setup = setup,
>>>    	.cleanup = cleanup,
>>> +	.mount_device = 1,
>>> +	.mntpoint = MNTPOINT,
>>>    	.needs_root = 1,
>>>    	.needs_tmpdir = 1,
>>>    	.test_variants = TEST_VARIANTS,
>
>
>



--------------B87A09CB16F69472D583E9DF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/10/22 14:14, Petr Vorel wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191022061328.GA9267@dell5510">
      <pre class="moz-quote-pre" wrap="">Hi Xu, others,

[ Cc Amir and linux-fsdevel ].

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">on 2019/09/30 17:36, Petr Vorel wrote:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">copy_file_range02 was written to verify copy_file_range() v5.3 changes.
Detect it via cross-filesystem copy_file_range() functionality, so that we
cover also backports to stable/enterprise distro kernels (if backported,
it should be with all those API fixes).
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Missing these API fixes is detected by errno changes introduced by
This fixes errors caused by commits from v5.3-rc1:
5dae222a5ff0 ("vfs: allow copy_file_range to copy across devices")
96e6e8f4a68d ("vfs: add missing checks to copy_file_range")
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">This check requires to put back into copy_file_range02 .mount_device = 1
and .mntpoint = MNTPOINT (but .all_filesystems = 1 is obviously not needed).
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Petr
   Why we must put back .mount_device and .mntpoint = MNTPOINT?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">copy_file_range02 was not only written to verify copy_file_range() v5.3 changes
and it also tests other errors before v5.3.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">This fix was based on Amir's suggestion [1], he states the opposite:

IIUC, copy_file_range02 was written after v5.3 changes to verify that
copy_file_range
stays unbroken.
As such, I would suggest that you check if kernel supports cross-fs copy, like
copy_file_range01 does and if it doesn't, skip the test entirely.
If some one ever backports cross-fs copy to any distro stable kernel, then one
would better also backkport all of those API fixes, otherwise test will fail.</pre>
    </blockquote>
    <pre>Hi Petr</pre>
    <pre>In copy_file_range01, I split it into two tests(not cross-filesytem test and cross-filesystem test)
        {FILE_DEST_PATH,  0, "non cross-device"},
        {FILE_MNTED_PATH, 1, "cross-device"},</pre>
    <pre>if kernel doesn't support cross-fs copy, the second test skips and the first still can run. </pre>
    <pre>So for copy_file_range02, it should be same but not for entire test.</pre>
    <blockquote type="cite" cite="mid:20191022061328.GA9267@dell5510">
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">I think cross-filesystem copy_file_range is a kernel action change and then I
put it into copy_file_range01.c. So copy_file_range02.c doesn't test EXDEV error .
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Also since commit v5.3-rc1 two commit, immutable file(EPERM)，swap file(ETXTBSY)，
overlaping range(EINVAL), max length lenght(EOVERFLOW),max file size(EFBIG) these
check have been add. But other errors still existed before this two commits such as:
copy contents to file open as readonly *    -&gt; EBADF
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Now, before v5.3-rc1, copy_file_range02.c  is notrun that we don't do error check.
It is unreasonable.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">So, do you suggest to test EBADF for all versions? Or something else?</pre>
    </blockquote>
    <pre>Yes.  I think we can use cross_sup flag to decide whether test immutable file(EPERM)，swap file(ETXTBSY)，
overlaping range(EINVAL), max length lenght(EOVERFLOW),max file size(EFBIG). If  cross_sup
is equal to 1, test them. If not, don't test them as your patch do but not for all errors.</pre>
    <pre>But for other errors, I think we can still test them for all versions such as pipe, char,and block dev.</pre>
    <blockquote type="cite" cite="mid:20191022061328.GA9267@dell5510">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">ps:
copy_file_range newest man-pages
<a class="moz-txt-link-freetext" href="https://github.com/mkerrisk/man-pages/commit/88e75e2c56a68eaf8fcf662a63b802fdf77a4017">https://github.com/mkerrisk/man-pages/commit/88e75e2c56a68eaf8fcf662a63b802fdf77a4017</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Yep, Amir planned to fix it :).

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Thanks
Yang Xu
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[1] <a class="moz-txt-link-freetext" href="http://lists.linux.it/pipermail/ltp/2019-September/013697.html">http://lists.linux.it/pipermail/ltp/2019-September/013697.html</a>

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+ Remove few unused imports.
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Suggested-by: Amir Goldstein <a class="moz-txt-link-rfc2396E" href="mailto:amir73il@gmail.com">&lt;amir73il@gmail.com&gt;</a>
Signed-off-by: Petr Vorel <a class="moz-txt-link-rfc2396E" href="mailto:pvorel@suse.cz">&lt;pvorel@suse.cz&gt;</a>
---
Changes v1-&gt;v2:
pass the source and destination as parameters to
verify_cross_fs_copy_support(), remove bogus setup checks
(Suggested by Cyril).
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Kind regards,
Petr
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">  .../copy_file_range/copy_file_range.h         | 23 ++++++++++++++++---
  .../copy_file_range/copy_file_range01.c       | 22 ++----------------
  .../copy_file_range/copy_file_range02.c       | 11 ++++++++-
  3 files changed, 32 insertions(+), 24 deletions(-)
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
index 40d05d653..1d80ab0f7 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range.h
@@ -7,9 +7,7 @@
  #ifndef __COPY_FILE_RANGE_H__
  #define __COPY_FILE_RANGE_H__
-#include &lt;stdbool.h&gt;
-#include &lt;unistd.h&gt;
-#include &lt;sys/sysmacros.h&gt;
+#include &lt;stdio.h&gt;
  #include "lapi/syscalls.h"
  #include "lapi/fs.h"
@@ -62,4 +60,23 @@ static int sys_copy_file_range(int fd_in, loff_t *off_in,
  	return -1;
  }
+static inline int verify_cross_fs_copy_support(const char *path_in, const char *path_out)
+{
+	int i, fd, fd_test;
+
+	fd = SAFE_OPEN(path_in, O_RDWR | O_CREAT, 0664);
+	/* Writing page_size * 4 of data into test file */
+	for (i = 0; i &lt; (int)(getpagesize() * 4); i++)
+		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
+
+	fd_test = SAFE_OPEN(path_out, O_RDWR | O_CREAT, 0664);
+	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
+
+	SAFE_CLOSE(fd_test);
+	remove(FILE_MNTED_PATH);
+	SAFE_CLOSE(fd);
+
+	return TST_ERR == EXDEV ? 0 : 1;
+}
+
  #endif /* __COPY_FILE_RANGE_H__ */
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
index ec55e5da1..6097c85b3 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range01.c
@@ -16,8 +16,6 @@
  #define _GNU_SOURCE
-#include &lt;stdio.h&gt;
-#include &lt;stdlib.h&gt;
  #include "tst_test.h"
  #include "tst_safe_stdio.h"
  #include "copy_file_range.h"
@@ -179,7 +177,7 @@ static void copy_file_range_verify(unsigned int n)
  	if (tc-&gt;flags &amp;&amp; !cross_sup) {
  		tst_res(TCONF,
-			"copy_file_range doesn't support cross-device, skip it");
+			"copy_file_range() doesn't support cross-device, skip it");
  		return;
  	}
@@ -215,25 +213,9 @@ static void copy_file_range_verify(unsigned int n)
  static void setup(void)
  {
-	int i, fd, fd_test;
-
  	syscall_info();
-
  	page_size = getpagesize();
-	cross_sup = 1;
-	fd = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
-	/* Writing page_size * 4 of data into test file */
-	for (i = 0; i &lt; (int)(page_size * 4); i++)
-		SAFE_WRITE(1, fd, CONTENT, CONTSIZE);
-
-	fd_test = SAFE_OPEN(FILE_MNTED_PATH, O_RDWR | O_CREAT, 0664);
-	TEST(sys_copy_file_range(fd, 0, fd_test, 0, CONTSIZE, 0));
-	if (TST_ERR == EXDEV)
-		cross_sup = 0;
-
-	SAFE_CLOSE(fd_test);
-	remove(FILE_MNTED_PATH);
-	SAFE_CLOSE(fd);
+	cross_sup = verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH);
  }
  static void cleanup(void)
diff --git a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
index d6e843ee4..6e385adbd 100644
--- a/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
+++ b/testcases/kernel/syscalls/copy_file_range/copy_file_range02.c
@@ -49,6 +49,7 @@ static int fd_blkdev;
  static int fd_chrdev;
  static int fd_fifo;
  static int fd_copy;
+static int need_unlink;
  static int chattr_i_nsup;
  static int swap_nsup;
@@ -160,7 +161,8 @@ static void cleanup(void)
  		SAFE_CLOSE(fd_dup);
  	if (fd_copy &gt; 0)
  		SAFE_CLOSE(fd_copy);
-	SAFE_UNLINK(FILE_FIFO);
+	if (need_unlink &gt; 0)
+		SAFE_UNLINK(FILE_FIFO);
  }
  static void setup(void)
@@ -168,6 +170,10 @@ static void setup(void)
  	syscall_info();
  	char dev_path[1024];
+	if (!verify_cross_fs_copy_support(FILE_SRC_PATH, FILE_MNTED_PATH))
+		tst_brk(TCONF,
+			"copy_file_range() doesn't support cross-device, skip it");
+
  	if (access(FILE_DIR_PATH, F_OK) == -1)
  		SAFE_MKDIR(FILE_DIR_PATH, 0777);
  	/*
@@ -177,6 +183,7 @@ static void setup(void)
  	loop_devn = tst_find_free_loopdev(dev_path, sizeof(dev_path));
  	SAFE_MKNOD(FILE_FIFO, S_IFIFO | 0777, 0);
+	need_unlink = 1;
  	fd_src    = SAFE_OPEN(FILE_SRC_PATH, O_RDWR | O_CREAT, 0664);
  	fd_dest   = SAFE_OPEN(FILE_DEST_PATH, O_RDWR | O_CREAT, 0664);
@@ -223,6 +230,8 @@ static struct tst_test test = {
  	.tcnt = ARRAY_SIZE(tcases),
  	.setup = setup,
  	.cleanup = cleanup,
+	.mount_device = 1,
+	.mntpoint = MNTPOINT,
  	.needs_root = 1,
  	.needs_tmpdir = 1,
  	.test_variants = TEST_VARIANTS,
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">



</pre>
    </blockquote>
  </body>
</html>

--------------B87A09CB16F69472D583E9DF--

--===============1282444331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1282444331==--
