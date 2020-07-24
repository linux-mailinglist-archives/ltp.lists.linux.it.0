Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ECC22C8B0
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 17:02:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E6953C4D04
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 17:02:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id F11AE3C0886
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 17:02:13 +0200 (CEST)
Received: from m12-18.163.com (m12-18.163.com [220.181.12.18])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B2E5260562C
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 17:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=1GiuK
 msqwMXRIioXDzWNWF1rszpRXexcynrAnxEoAAU=; b=ZyZOxOvDcoD6w9YMEV3Zy
 a1P+7j8PwIvLld6BpYHC+QCL237FHPL6MuS5PMvwUNIYk1du86Eh6mPpuna7ebMu
 8bdytCsf/KtRe2tLZU7DGFxJh8qTGPfg/E8Io41qljsL5tjMIrK4UrXo74ablmRm
 Jb+MeAG9zyILactFWH02Po=
Received: from [192.168.0.103] (unknown [112.22.71.57])
 by smtp14 (Coremail) with SMTP id EsCowAAnfbHc9xpfekmzFw--.14171S2;
 Fri, 24 Jul 2020 23:01:49 +0800 (CST)
To: Cyril Hrubis <chrubis@suse.cz>, Yang Xu <xuyang2018.jy@cn.fujitsu.com>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
 <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
 <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
 <20200724132913.GH9768@yuki.lan>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <6376bcd5-0a82-c625-eaee-8684ff707f10@163.com>
Date: Fri, 24 Jul 2020 23:01:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200724132913.GH9768@yuki.lan>
X-CM-TRANSID: EsCowAAnfbHc9xpfekmzFw--.14171S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFy3XF1fuF4xtF45XF18Krg_yoW8ZF4kp3
 yxWFW3Kr4xtrWxWws7tFn0vFWUtw4DJFy5XFyftr9I9FyxAa1kZF4IvF1Y9ay7Cr4Fg342
 qw4fZryYy3WDGaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdSdgUUUUU=
X-Originating-IP: [112.22.71.57]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBRwlrhFO--r7RkwAAsP
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V3] syscalls/timer_settime01: Make sure the timer
 fires
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

HI Cyril


> Hi!
>>>> When tesing timer_settime01 on 3.10.0-1136.el7.x86_64, this case fails
>>>> whether we use any type clock.
>>>>
>>>> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
>>>> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) reported
>>>> bad values (0: 678013000): SUCCESS (0)
>>>> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
>>>> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) reported
>>>> bad values (0: 358240000): SUCCESS (0)
>>>> timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
>>>> timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
>>>
>>> Can you share the complete test log? I am not sure if only the _ALARM
>>> cocks are failing or all. You are getting values in the order of
>>> 300-700 ms, while the max value can't be greater than 50 ms. So seems
>>> like a kernel issue to me. Over that, both _ALARM type clocks weren't
>>> supported before 3.11 and looks like your kernel version is 3.10.
>> Yes, only _ALARM fails. I  only find a kernel patch (commit
>> 11ffa9d6065f344  timerfd: Add alarm timers) introduced alarm clock types
>> for timefd in kernel 3.11 and  a kernel patch (commit 9a7adcf5c6dea63d
>> timers: Posix interface for alarm-timers)  in kernel 3.1. It seems my
>> kernel version has supported this two alarm clock, but not sure why this
>> case fails.
> 
> This is on RHEL kernel that has backported the _ALARM support right? So
> this may as well be case of badly bacported patch...
Just double check. My previous word may  make you feel confused.
On RHEL7 kernel, timer_* includes ALARM supports because kernel has 
upported it since 3.1 and timers_fd doesn't introduced ALARM 
support(REHL7 doesn't backport this patch). IMO, this case doesn't 
call/use timerfd_* function. We only need timer_*  ALARM suuport to run 
this case. so it doesn't need to backport ALARM support. Or, I miss some 
thing?
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
