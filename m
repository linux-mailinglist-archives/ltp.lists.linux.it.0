Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90E2468F8
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 17:01:15 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41E773C58E1
	for <lists+linux-ltp@lfdr.de>; Mon, 17 Aug 2020 17:01:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0800C3C2916
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 17:01:10 +0200 (CEST)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9ECA510005AA
 for <ltp@lists.linux.it>; Mon, 17 Aug 2020 17:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=f1M4R
 A/e0vyMyju0n+BTn4hGyiHXCqAWmYwSOqLjnS4=; b=F/0tVa2yriJ9gOPmSn2i1
 W3Qr0kcH6DjJ4EgNbYumcpAknrfl+l+YlzIVBY3RozXq4geK9ugG1dCcZ7uo/OFQ
 HLI+IKVGkTq7b/mUMHtTuA4k1JqMPGoxmcDMrIiIwpRTWceoVGJnmjNPNfXXNi5u
 6mlk6QyRxTBc4FB9ccsnUw=
Received: from [192.168.0.10] (unknown [183.210.50.2])
 by smtp13 (Coremail) with SMTP id EcCowADH1zupmzpfz2t+Dw--.27280S2;
 Mon, 17 Aug 2020 23:00:58 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20200815051312.25002-1-yangx.jy@cn.fujitsu.com>
 <20200815051312.25002-2-yangx.jy@cn.fujitsu.com>
 <20200817143309.GD8445@yuki.lan>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <3d53b40a-5c4d-71c2-34e8-80f573662b42@163.com>
Date: Mon, 17 Aug 2020 23:00:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200817143309.GD8445@yuki.lan>
Content-Language: en-US
X-CM-TRANSID: EcCowADH1zupmzpfz2t+Dw--.27280S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7urykCr1UAF1kCFy8tF43Jrb_yoW8WF4xpF
 Z0yw4qkF4DCF12qF97Zr4xGFW0kws7Gw4qqr42y3yrGw4qv3s3tanFvFyjqrs0yrZruF1U
 tw1Igr1DZr4rAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jSNtxUUUUU=
X-Originating-IP: [183.210.50.2]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiFgqDXl44M06P-AAAsp
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.6 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/sigsuspend01.c: Convert to the new
 API
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 8/17/20 10:33 PM, Cyril Hrubis wrote:
> Hi!
> Pushed with a few fixes, thanks.
>
>> +static void setup(void)
>>   {
>> +	struct sigaction sa_new;
>>   
>> +	SAFE_SIGEMPTYSET(&signalset);
>> +	SAFE_SIGEMPTYSET(&sigset1);
>> +	SAFE_SIGADDSET(&sigset1, SIGALRM);
>> +
>> +	sa_new.sa_handler = sig_handler;
>> +	SAFE_SIGACTION(SIGALRM, &sa_new, 0);
> Here you were passing random data to the sigaction() function, as the
> sa_new was created on a stack and only sa_handler was set.
>
> Which, for instance, breaks the test in a case of the -i 2 option, since
> if you were unlucky the SA_RESETHAND was set in the sa_new and the
> signal handler was uninstalled after the first signal was handled and
> the test process was killed by SIGALRM when the signal arrived for a
> second time.
>
> In short there was all kind of mess passed down the call, on strace it
> looked as:
>
> [pid 3245] rt_sigaction(SIGALRM, {sa_handler=0x557469b59c20, sa_mask=[HUP INT QUIT ILL ABRT USR1 ALRM TERM CHLD TSTP TTOU URG VTALRM PROF WINCH PWR SYS RT_1 RT_2 RT_3 RT_4 RT_6 RT_10 RT_12 RT_13 RT_14 RT_18 RT_20 RT_21 RT_22], sa_flags=SA_RESTORER|SA_ONSTACK|SA_RESTART|SA_NODEFER|SA_RESETHAND|0xe9e4e8, sa_restorer=0x7f26dc368b40}, NULL, 8) = 0
>
> So I changed it to:
>
> 	struct sigaction sa_new = {
> 		.sa_handler = sig_handler
> 	};
>
> Which will clears the rest of the structure.

Hi Cyril,

Got it, thanks a lot for the detailed explanation. :-)

Best Regards,

Xiao Yang

>
>> +	/* Block SIGALRM */
>> +	SAFE_SIGPROCMASK(SIG_SETMASK, &sigset1, NULL);
>>   }
>> +
>> +static struct tst_test test = {
>> +	.setup = setup,
>> +	.test_all = verify_sigsuspend,
>> +};


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
