Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547CAF4B6
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 05:38:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1E7E93C20BC
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Sep 2019 05:38:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4CA093C0733
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 05:38:36 +0200 (CEST)
Received: from m15-64.126.com (m15-64.126.com [220.181.15.64])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 1D15720113A
 for <ltp@lists.linux.it>; Wed, 11 Sep 2019 05:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=/XdRC
 m+lVnv9fY5KrXeYuZDATU7s9wG67qmDiOfNHpo=; b=WMoglAoPWG7HrBjtLR33u
 JaBto9l5muowSV832TG3CZsKs5pDHtWgnZ3MVsKI9DPktwjN0kdwNUJu/wh2IoyK
 +hS+3QLMaN4m+/22qOSc4y/g90V5aYkJcWX3BN8dQriIQzrGkoIWbiwEKhFKSmrH
 /Qwfws4j4+nnVm9N26VLMw=
Received: from frequentemail$126.com ( [114.247.175.195] ) by
 ajax-webmail-wmsvr64 (Coremail) ; Wed, 11 Sep 2019 11:38:31 +0800 (CST)
X-Originating-IP: [114.247.175.195]
Date: Wed, 11 Sep 2019 11:38:31 +0800 (CST)
From: frequent <frequentemail@126.com>
To: "Cyril Hrubis" <chrubis@suse.cz>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 126com
In-Reply-To: <20190910115743.GA18210@rei.lan>
References: <424f5bc4.776d.16d1ab07134.Coremail.frequentemail@126.com>
 <20190910115743.GA18210@rei.lan>
MIME-Version: 1.0
Message-ID: <2e04c6db.3556.16d1e66ba6c.Coremail.frequentemail@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: QMqowAAnNxM3bHhdP+V1AA--.16477W
X-CM-SenderInfo: 5iuh135hqwvzxdloqiyswou0bp/1tbiwRwtHFpD8W4U+wABsE
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=DKIM_INVALID,DKIM_SIGNED,
 FREEMAIL_FROM,GB_FREEMAIL_DISPTO,MIME_BASE64_TEXT,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] buffer overflow detected ***: dup201 terminated
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Thank you for the detailed instruction, this is the my first time to submit a patch. Not familiar with the format. And thanks again.
At 2019-09-10 19:57:44, "Cyril Hrubis" <chrubis@suse.cz> wrote:
>Hi!
>> Issues related to this mail: https://github.com/linux-test-project/ltp/issues/570
>
>You can just add "fixes: #570" instead somewhere in the patch text which
>will close the issue automatically if the patch is included in the
>repository.
>
>> According to the bactrace in the issue description, we could easily find out that the problem is due to the codes in dup201.c  line 80 and 142. 
>> As metan-cuw commented, the loop at line 142 is of no use and probablely is a leftover.  So we could safely remove these codes. 
>> 
>> This patch does :
>>         1).  remove the leftover, and of course, the issue 570 will be eventually go over.
>>         2).  removed unused global variables.
>> 
>> The patch goes as:
>  ^
>This is unnecessary.
>
>And you are missing the signed-off-by line here, see:
>
>https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
>
>> diff --git a/testcases/kernel/syscalls/dup2/dup201.c b/testcases/kernel/syscalls/dup2/dup201.c
>> index 4507ac1..762ad86 100644
>> --- a/testcases/kernel/syscalls/dup2/dup201.c
>> +++ b/testcases/kernel/syscalls/dup2/dup201.c
>> @@ -75,9 +75,6 @@ int maxfd;
>>  int goodfd = 5;
>>  int badfd = -1;
>>  int mystdout = 0;
>> -int fd, fd1;
>> -int mypid;
>> -char fname[20];
>> 
>> 
>>  struct test_case_t {
>>         int *ofd;
>> @@ -86,22 +83,19 @@ struct test_case_t {
>>         void (*setupfunc) ();
>>  } TC[] = {
>>         /* First fd argument is less than 0 - EBADF */
>> -       {
>> -       &badfd, &goodfd, EBADF, NULL},
>> -           /* First fd argument is getdtablesize() - EBADF */
>> -       {
>> -       &maxfd, &goodfd, EBADF, NULL},
>> -           /* Second fd argument is less than 0 - EBADF */
>> -       {
>> -       &mystdout, &badfd, EBADF, NULL},
>> -           /* Second fd argument is getdtablesize() - EBADF */
>> -       {
>> -&mystdout, &maxfd, EBADF, NULL},};
>> +       {&badfd, &goodfd, EBADF, NULL},
>> +       /* First fd argument is getdtablesize() - EBADF */
>> +       {&maxfd, &goodfd, EBADF, NULL},
>> +       /* Second fd argument is less than 0 - EBADF */
>> +       {&mystdout, &badfd, EBADF, NULL},
>> +       /* Second fd argument is getdtablesize() - EBADF */
>> +       {&mystdout, &maxfd, EBADF, NULL},
>> +};
>> 
>> 
>>  int main(int ac, char **av)
>>  {
>>         int lc;
>> -       int i, j;
>> +       int i;
>> 
>> 
>>         tst_parse_opts(ac, av, NULL, NULL);
>> 
>> 
>> @@ -137,12 +131,6 @@ int main(int ac, char **av)
>>                                          strerror(TC[i].error));
>>                         }
>>                 }
>> -               /* cleanup things in case we are looping */
>> -               for (j = fd1; j < maxfd; j++) {
>> -                       sprintf(fname, "dup201.%d.%d", j, mypid);
>> -                       (void)close(j);
>> -                       (void)unlink(fname);
>> -               }
>>         }
>>         cleanup();
>> 
>> 
>> @@ -163,7 +151,6 @@ void setup(void)
>> 
>> 
>>         /* get some test specific values */
>>         maxfd = getdtablesize();
>> -       mypid = getpid();
>>  }
>> 
>> 
>>  /*
>> @@ -172,6 +159,5 @@ void setup(void)
>>   */
>>  void cleanup(void)
>>  {
>> -
>>         tst_rmdir();
>>  }
>
>Otherwise the patch looks good.
>
>-- 
>Cyril Hrubis
>chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
