Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C46771C381E
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 13:32:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A4313C5840
	for <lists+linux-ltp@lfdr.de>; Mon,  4 May 2020 13:32:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id DB8D23C0270
 for <ltp@lists.linux.it>; Mon,  4 May 2020 13:31:56 +0200 (CEST)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 442661A00EB9
 for <ltp@lists.linux.it>; Mon,  4 May 2020 13:31:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=1r14R
 bNSYIGT7BlqDsmGFd9UAx1UqAE67/Esn0Jlzwg=; b=RfbmEW4JcA28r/iHAx1Sh
 IS0TR48D4w1ZQ5tzY3QkOKzPQ9FZy/sJrXOEdkZ9KBjuDPRtLfIolNmQGVJFMxpe
 Z2yLE1uts3FZNetTHI2vhFbtuM3oXuqr9Yl16twcmI7KLFbnxJUcuNMoSxkDyC8N
 KRRlbtJWcx8bAYW1Yko0gA=
Received: from [192.168.0.10] (unknown [223.64.162.136])
 by smtp11 (Coremail) with SMTP id D8CowABnwysL_a9em7gTBQ--.5S2;
 Mon, 04 May 2020 19:31:23 +0800 (CST)
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20200430085742.1663-1-yangx.jy@cn.fujitsu.com>
 <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <e666a91d-1ffd-0f5f-131e-966ff763b14e@163.com>
Date: Mon, 4 May 2020 19:31:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200504050937.oassdcfg4x5zh4nm@vireshk-i7>
Content-Language: en-US
X-CM-TRANSID: D8CowABnwysL_a9em7gTBQ--.5S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWryxGFyUCFWfWw1DJFyxXwb_yoW5AFykpa
 n3AF1IkrWUJrZ7CanYk3W8t3W5Cw18Ar15Jrn8try8XF1Yvr9agrsYg3WrCFW5GrWUtFyI
 qFy7Jr13G34UC37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07joT5dUUUUU=
X-Originating-IP: [223.64.162.136]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0goaXlUMV3e9ZAABs9
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_KAM_HTML_FONT_INVALID autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] syscalls/pidfd_open01.c: Add check for
 close-on-exec flag
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
Cc: ltp@lists.linux.it
Content-Type: multipart/mixed; boundary="===============0686207398=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0686207398==
Content-Type: multipart/alternative;
 boundary="------------2E6BE44C04C2E04732C8DC11"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2E6BE44C04C2E04732C8DC11
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/20 1:09 PM, Viresh Kumar wrote:
> On 30-04-20, 16:57, Xiao Yang wrote:
>> pidfd_open(2) will set close-on-exec flag on the file descriptor as it
>> manpage states, so check close-on-exec flag by fcntl(2).
>>
>> Also avoid compiler warning by replacing (long) TST_RET with (int) pidfd:
>> ------------------------------------------------------
>> In file included from pidfd_open01.c:9:
>> pidfd_open01.c: In function ‘run’:
>> ../../../../include/tst_test.h:76:41: warning: format ‘%i’ expects argument of type ‘int’, but argument 5 has type ‘long int’ [-Wformat=]
>>     76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
>>        |                                         ^~~~~~~~~
>> ../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ‘tst_brk’
>>    224 |     tst_brk(TBROK | TERRNO,                          \
>>        |     ^~~~~~~
>> pidfd_open01.c:20:9: note: in expansion of macro ‘SAFE_FCNTL’
>>     20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);
> This log isn't useful as the warning started coming after your change
> only and not before.

Hi Viresh,

Thanks for your review.

Right，just add a hint why I use pidfd instead so I want to keep it.

Of course，I will mention that my change introduces the compiler warning 
in v2 patch.

>
>> ------------------------------------------------------
>>
>> Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
>> ---
>>   .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> index 93bb86687..293e93b63 100644
>> --- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> +++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
>> @@ -6,17 +6,27 @@
>>    * Basic pidfd_open() test, fetches the PID of the current process and tries to
>>    * get its file descriptor.
>>    */
>> +
>> +#include <sys/types.h>
>> +#include <unistd.h>
>> +#include <fcntl.h>
>>   #include "tst_test.h"
>>   #include "lapi/pidfd_open.h"
>>   
>>   static void run(void)
>>   {
>> -	TEST(pidfd_open(getpid(), 0));
>> +	int pidfd = 0, flag = 0;
> None of these need to be initialized.

Initialization or not initialization are both fine for me.

Do you have any strong reason to drop Initialization?

>
>> +
>> +	pidfd = pidfd_open(getpid(), 0);
>> +	if (pidfd == -1)
>> +		tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");
> This could have been written as:
>          TEST(pidfd = pidfd_open(getpid(), 0));

Why do you want to keep TEST()? I don't think it is necessary:

1) pidfd and TERRNO are enough to check return value and errno.

2) It is OK for testcase to not use TEST().

Thanks,

Xiao Yang

>
>> +
>> +	flag = SAFE_FCNTL(pidfd, F_GETFD);
>>   
>> -	if (TST_RET == -1)
>> -		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
>> +	SAFE_CLOSE(pidfd);
>>   
>> -	SAFE_CLOSE(TST_RET);
>> +	if (!(flag & FD_CLOEXEC))
>> +		tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");
>>   
>>   	tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
>>   }
>> -- 
>> 2.21.0
>>
>>

--------------2E6BE44C04C2E04732C8DC11
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 5/4/20 1:09 PM, Viresh Kumar wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200504050937.oassdcfg4x5zh4nm@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">On 30-04-20, 16:57, Xiao Yang wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">pidfd_open(2) will set close-on-exec flag on the file descriptor as it
manpage states, so check close-on-exec flag by fcntl(2).

Also avoid compiler warning by replacing (long) TST_RET with (int) pidfd:
------------------------------------------------------
In file included from pidfd_open01.c:9:
pidfd_open01.c: In function ‘run’:
../../../../include/tst_test.h:76:41: warning: format ‘%i’ expects argument of type ‘int’, but argument 5 has type ‘long int’ [-Wformat=]
   76 |   tst_brk_(__FILE__, __LINE__, (ttype), (arg_fmt), ##__VA_ARGS__);\
      |                                         ^~~~~~~~~
../../../../include/tst_safe_macros.h:224:5: note: in expansion of macro ‘tst_brk’
  224 |     tst_brk(TBROK | TERRNO,                          \
      |     ^~~~~~~
pidfd_open01.c:20:9: note: in expansion of macro ‘SAFE_FCNTL’
   20 |  flag = SAFE_FCNTL(TST_RET, F_GETFD);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This log isn't useful as the warning started coming after your change
only and not before.</pre>
    </blockquote>
    <p>Hi Viresh,</p>
    <p>Thanks for your review.</p>
    <p>Right，just add a hint why I use pidfd instead so I want to keep
      it.</p>
    <p>Of course，I will <span style="background-color: transparent;">mention
        that </span><span style="background-color: transparent;"><span
          style="background-color: transparent;">my change </span>introduces
        the compiler warning in v2 patch.</span></p>
    <blockquote type="cite"
      cite="mid:20200504050937.oassdcfg4x5zh4nm@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">------------------------------------------------------

Signed-off-by: Xiao Yang <a class="moz-txt-link-rfc2396E" href="mailto:yangx.jy@cn.fujitsu.com">&lt;yangx.jy@cn.fujitsu.com&gt;</a>
---
 .../kernel/syscalls/pidfd_open/pidfd_open01.c  | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
index 93bb86687..293e93b63 100644
--- a/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
+++ b/testcases/kernel/syscalls/pidfd_open/pidfd_open01.c
@@ -6,17 +6,27 @@
  * Basic pidfd_open() test, fetches the PID of the current process and tries to
  * get its file descriptor.
  */
+
+#include &lt;sys/types.h&gt;
+#include &lt;unistd.h&gt;
+#include &lt;fcntl.h&gt;
 #include "tst_test.h"
 #include "lapi/pidfd_open.h"
 
 static void run(void)
 {
-	TEST(pidfd_open(getpid(), 0));
+	int pidfd = 0, flag = 0;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
None of these need to be initialized.</pre>
    </blockquote>
    <p>Initialization or not initialization are both fine for me.</p>
    <p>Do you have any strong reason to drop Initialization?</p>
    <blockquote type="cite"
      cite="mid:20200504050937.oassdcfg4x5zh4nm@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	pidfd = pidfd_open(getpid(), 0);
+	if (pidfd == -1)
+		tst_brk(TFAIL | TERRNO, "pidfd_open(getpid(), 0) failed");
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This could have been written as:
        TEST(pidfd = pidfd_open(getpid(), 0));</pre>
    </blockquote>
    <p>Why do you want to keep TEST()? I don't think it is necessary:</p>
    <p>1) pidfd and TERRNO are enough to check return value and errno.</p>
    <p>2) It is OK for testcase to not use TEST().</p>
    <p>Thanks,</p>
    <p>Xiao Yang<br>
    </p>
    <blockquote type="cite"
      cite="mid:20200504050937.oassdcfg4x5zh4nm@vireshk-i7">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+	flag = SAFE_FCNTL(pidfd, F_GETFD);
 
-	if (TST_RET == -1)
-		tst_brk(TFAIL | TTERRNO, "pidfd_open(getpid(), 0) failed");
+	SAFE_CLOSE(pidfd);
 
-	SAFE_CLOSE(TST_RET);
+	if (!(flag &amp; FD_CLOEXEC))
+		tst_brk(TFAIL, "pidfd_open(getpid(), 0) didn't set close-on-exec flag");
 
 	tst_res(TPASS, "pidfd_open(getpid(), 0) passed");
 }
-- 
2.21.0


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2E6BE44C04C2E04732C8DC11--


--===============0686207398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0686207398==--

