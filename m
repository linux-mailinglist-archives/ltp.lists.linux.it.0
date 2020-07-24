Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F3C22BD55
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 07:07:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 895ED3C4D05
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 07:07:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D6C6C3C18FA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 07:07:14 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id D11C76018D5
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 07:05:54 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,389,1589212800"; d="scan'208";a="96844052"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Jul 2020 13:07:08 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 106364CE4B10;
 Fri, 24 Jul 2020 13:07:05 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 24 Jul 2020 13:07:05 +0800
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <ede8d1c6a1ad1b23d8dca2297c740c301b329e37.1593743927.git.viresh.kumar@linaro.org>
 <47e40724c2a7a9612aca0265e493e62c69d65996.1594204153.git.viresh.kumar@linaro.org>
 <20200714142843.GA14905@yuki.lan>
 <d008820f-22d2-078d-3a62-f1fa20e6750b@cn.fujitsu.com>
 <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <f9289166-5698-e2ec-ecc8-531fbcbd60c5@cn.fujitsu.com>
Date: Fri, 24 Jul 2020 13:07:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200724033732.gwzu2zdhdziwtbtz@vireshk-mac-ubuntu>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 106364CE4B10.A07E7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=-0.3 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: ltp@lists.linux.it, Vincent Guittot <vincent.guittot@linaro.org>,
 arnd@arndb.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Virsh


> Hi,
> 
> On 23-07-20, 10:39, Yang Xu wrote:
>> When tesing timer_settime01 on 3.10.0-1136.el7.x86_64, this case fails
>> whether we use any type clock.
>>
>> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
>> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) reported
>> bad values (0: 678013000): SUCCESS (0)
>> timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
>> timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) reported
>> bad values (0: 358240000): SUCCESS (0)
>> timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
>> timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
> 
> Can you share the complete test log? I am not sure if only the _ALARM
> cocks are failing or all. You are getting values in the order of
> 300-700 ms, while the max value can't be greater than 50 ms. So seems
> like a kernel issue to me. Over that, both _ALARM type clocks weren't
> supported before 3.11 and looks like your kernel version is 3.10.
Yes, only _ALARM fails. I  only find a kernel patch (commit 
11ffa9d6065f344  timerfd: Add alarm timers) introduced alarm clock types 
for timefd in kernel 3.11 and  a kernel patch (commit 9a7adcf5c6dea63d 
timers: Posix interface for alarm-timers)  in kernel 3.1. It seems my 
kernel version has supported this two alarm clock, but not sure why this 
case fails.


  the full log as below:
tst_test.c:1247: INFO: Timeout per run is 0h 05m 00s
timer_settime01.c:89: INFO: Testing variant: syscall with old kernel spec
timer_settime01.c:100: INFO: Testing for general initialization:
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) 
reported bad values (0: 570013221): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) 
reported bad values (0: 250240851): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:100: INFO: Testing for setting old_value:
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) 
reported bad values (0: 972013941): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) 
reported bad values (0: 652241546): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:100: INFO: Testing for using periodic timer:
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) 
reported bad values (50000000: 624015649): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) 
reported bad values (50000000: 354248401): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed
timer_settime01.c:100: INFO: Testing for using absolute time:
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_MONOTONIC) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_PROCESS_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_THREAD_CPUTIME_ID) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_BOOTTIME_ALARM) 
reported bad values (0: 176017000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_BOOTTIME_ALARM) passed
timer_settime01.c:164: FAIL: timer_gettime(CLOCK_REALTIME_ALARM) 
reported bad values (0: 856247000): SUCCESS (0)
timer_settime01.c:174: PASS: timer_settime(CLOCK_REALTIME_ALARM) passed
timer_settime01.c:174: PASS: timer_settime(CLOCK_TAI) passed

> 



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
