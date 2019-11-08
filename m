Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24494F4591
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 12:21:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5ACF73C23F9
	for <lists+linux-ltp@lfdr.de>; Fri,  8 Nov 2019 12:21:24 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 10AF03C184E
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 12:21:19 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id C47B96207EE
 for <ltp@lists.linux.it>; Fri,  8 Nov 2019 12:21:18 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.68,281,1569254400"; d="scan'208,217";a="78063961"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Nov 2019 19:21:15 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
 by cn.fujitsu.com (Postfix) with ESMTP id 0B2CB4CE1646;
 Fri,  8 Nov 2019 19:13:07 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 id 14.3.439.0; Fri, 8 Nov 2019 19:21:08 +0800
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191009121906.GA7677@rei.lan>
 <1570767798-26685-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1570767798-26685-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191107132359.GE22352@rei.lan>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <3e76d8d4-3578-07d4-d9ee-fb92fb6c5c77@cn.fujitsu.com>
Date: Fri, 8 Nov 2019 19:21:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20191107132359.GE22352@rei.lan>
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0B2CB4CE1646.AC8CC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/2] syscalls/prctl09: New timer sample test
 for PR_SET_TIMERSLACK
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
Content-Type: multipart/mixed; boundary="===============0103783122=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0103783122==
Content-Type: multipart/alternative;
	boundary="------------AFD4A9FBE935983ADFDDEC9B"

--------------AFD4A9FBE935983ADFDDEC9B
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 7bit


on 2019/11/07 21:23, Cyril Hrubis wrote:

> Hi!
>> +#include <errno.h>
>> +#include <sys/prctl.h>
>> +#include "lapi/prctl.h"
>> +#include "tst_timer_test.h"
>> +
>> +int sample_fn(int clk_id, long long usec)
>> +{
>> +	struct timespec t = tst_us_to_timespec(usec);
>> +
>> +	TEST(prctl(PR_SET_TIMERSLACK, 200000));
> This is a bit more complicated.
>
> First of all it does not make sense to set the timerslack in the sample
> function. It should be done once in the test setup.
>
> Also in the tst_timer_test.c we store the timerslack value in the
> timer_setup(), which executes the test setup() at the end of the
> function, so we would have to move the part that gets the timerslack()
> after the test setup() function so that the library includes the newly
> set timerslack in the calculation.

Ok. I will set timerslack to 200us in setup and move timer_setup after test set up so that
we can get the 200us value.

>
>> +	if (TST_RET != 0) {
>> +		tst_res(TFAIL | TTERRNO,
>> +			"prctl(), returned %li", TST_RET);
>> +		return 1;
>> +	}
>> +
>> +	tst_timer_start(clk_id);
>> +	TEST(nanosleep(&t, NULL));
>> +	tst_timer_stop();
>> +	tst_timer_sample();
>> +
>> +	if (TST_RET != 0) {
>> +		tst_res(TFAIL | TTERRNO,
>> +			"nanosleep() returned %li", TST_RET);
>> +		return 1;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct tst_test test = {
>> +	.scall = "prctl()",
>> +	.sample = sample_fn,
>> +};
>> -- 
>> 2.18.1
>>
>>
>>



--------------AFD4A9FBE935983ADFDDEC9B
Content-Type: text/html; charset="gbk"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>on 2019/11/07 21:23, Cyril Hrubis wrote:</pre>
    </div>
    <blockquote type="cite" cite="mid:20191107132359.GE22352@rei.lan">
      <pre class="moz-quote-pre" wrap="">Hi!
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#include &lt;errno.h&gt;
+#include &lt;sys/prctl.h&gt;
+#include "lapi/prctl.h"
+#include "tst_timer_test.h"
+
+int sample_fn(int clk_id, long long usec)
+{
+	struct timespec t = tst_us_to_timespec(usec);
+
+	TEST(prctl(PR_SET_TIMERSLACK, 200000));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This is a bit more complicated.

First of all it does not make sense to set the timerslack in the sample
function. It should be done once in the test setup.

Also in the tst_timer_test.c we store the timerslack value in the
timer_setup(), which executes the test setup() at the end of the
function, so we would have to move the part that gets the timerslack()
after the test setup() function so that the library includes the newly
set timerslack in the calculation.</pre>
    </blockquote>
    <pre>Ok. I will set timerslack to 200us in setup and move timer_setup after test set up so that
we can get the 200us value.
</pre>
    <blockquote type="cite" cite="mid:20191107132359.GE22352@rei.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"prctl(), returned %li", TST_RET);
+		return 1;
+	}
+
+	tst_timer_start(clk_id);
+	TEST(nanosleep(&amp;t, NULL));
+	tst_timer_stop();
+	tst_timer_sample();
+
+	if (TST_RET != 0) {
+		tst_res(TFAIL | TTERRNO,
+			"nanosleep() returned %li", TST_RET);
+		return 1;
+	}
+
+	return 0;
+}
+
+static struct tst_test test = {
+	.scall = "prctl()",
+	.sample = sample_fn,
+};
-- 
2.18.1



</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------AFD4A9FBE935983ADFDDEC9B--

--===============0103783122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0103783122==--
