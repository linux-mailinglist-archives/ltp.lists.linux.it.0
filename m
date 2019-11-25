Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 164D2108B7E
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 11:18:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CEAD3C22C8
	for <lists+linux-ltp@lfdr.de>; Mon, 25 Nov 2019 11:18:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 61F433C185C
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 11:18:06 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 7152A10000EA
 for <ltp@lists.linux.it>; Mon, 25 Nov 2019 11:18:04 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,241,1571673600"; d="scan'208,217";a="79042403"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 25 Nov 2019 18:18:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6D0314CE1C01;
 Mon, 25 Nov 2019 18:09:39 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Mon, 25 Nov 2019 18:18:03 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>, <chrubis@suse.cz>
References: <20191115163517.GB25964@rei.lan>
 <1574044495-2813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <71e855bf-62c8-5ee1-e8d2-6753459571f7@cn.fujitsu.com>
Message-ID: <95fbd060-cffb-db2a-65b0-da9f9a5d4213@cn.fujitsu.com>
Date: Mon, 25 Nov 2019 18:18:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <71e855bf-62c8-5ee1-e8d2-6753459571f7@cn.fujitsu.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6D0314CE1C01.ACF0E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 1/2] lib/tst_timer_test: move test setup
 function before PR_GET_TIMERSLACK
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
Content-Type: multipart/mixed; boundary="===============1140204153=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1140204153==
Content-Type: multipart/alternative;
	boundary="------------0BB138E8201660AA8E110B38"

--------------0BB138E8201660AA8E110B38
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi

ping.

> Hi Cyril
>   I think this patch can be merged if it is ok.
> Thanks
> Yang Xu
>> Move test setup function before PR_GET_TIMERSLACK in timer setup function so
>> that the library includes the newly set timerslack in the calculation.
>>
>> Signed-off-by: Yang Xu<xuyang2018.jy@cn.fujitsu.com>
>> Reviewed-by: Cyril Hrubis<chrubis@suse.cz>
>> ---
>>   lib/tst_timer_test.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
>> index f6459e5c0..13e9deff2 100644
>> --- a/lib/tst_timer_test.c
>> +++ b/lib/tst_timer_test.c
>> @@ -340,6 +340,9 @@ static void timer_setup(void)
>>   	struct timespec t;
>>   	int ret;
>>   
>> +	if (setup)
>> +		setup();
>> +
>>   	tst_clock_getres(CLOCK_MONOTONIC, &t);
>>   
>>   	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
>> @@ -360,16 +363,11 @@ static void timer_setup(void)
>>   	tst_res(TINFO, "PR_GET_TIMERSLACK not defined, using %uus",
>>   		timerslack);
>>   #endif /* PR_GET_TIMERSLACK */
>> -
>>   	parse_timer_opts();
>>   
>>   	samples = SAFE_MALLOC(sizeof(long long) * MAX(MAX_SAMPLES, sample_cnt));
>> -
>>   	if (set_latency() < 0)
>>   		tst_res(TINFO, "Failed to set zero latency constraint: %m");
>> -
>> -	if (setup)
>> -		setup();
>>   }
>>   
>>   static void timer_cleanup(void)
>



--------------0BB138E8201660AA8E110B38
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi</pre>
    <pre>ping.
</pre>
    <blockquote type="cite"
      cite="mid:71e855bf-62c8-5ee1-e8d2-6753459571f7@cn.fujitsu.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <pre>Hi Cyril</pre>
      <pre> I think this patch can be merged if it is ok.</pre>
      <pre>Thanks
Yang Xu
</pre>
      <blockquote type="cite"
        cite="mid:1574044495-2813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com">
        <pre class="moz-quote-pre" wrap="">Move test setup function before PR_GET_TIMERSLACK in timer setup function so
that the library includes the newly set timerslack in the calculation.

Signed-off-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com" moz-do-not-send="true">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>
Reviewed-by: Cyril Hrubis <a class="moz-txt-link-rfc2396E" href="mailto:chrubis@suse.cz" moz-do-not-send="true">&lt;chrubis@suse.cz&gt;</a>
---
 lib/tst_timer_test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/tst_timer_test.c b/lib/tst_timer_test.c
index f6459e5c0..13e9deff2 100644
--- a/lib/tst_timer_test.c
+++ b/lib/tst_timer_test.c
@@ -340,6 +340,9 @@ static void timer_setup(void)
 	struct timespec t;
 	int ret;
 
+	if (setup)
+		setup();
+
 	tst_clock_getres(CLOCK_MONOTONIC, &amp;t);
 
 	tst_res(TINFO, "CLOCK_MONOTONIC resolution %lins", (long)t.tv_nsec);
@@ -360,16 +363,11 @@ static void timer_setup(void)
 	tst_res(TINFO, "PR_GET_TIMERSLACK not defined, using %uus",
 		timerslack);
 #endif /* PR_GET_TIMERSLACK */
-
 	parse_timer_opts();
 
 	samples = SAFE_MALLOC(sizeof(long long) * MAX(MAX_SAMPLES, sample_cnt));
-
 	if (set_latency() &lt; 0)
 		tst_res(TINFO, "Failed to set zero latency constraint: %m");
-
-	if (setup)
-		setup();
 }
 
 static void timer_cleanup(void)
</pre>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0BB138E8201660AA8E110B38--

--===============1140204153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1140204153==--
