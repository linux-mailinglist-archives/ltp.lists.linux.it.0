Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA482BA070
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 03:30:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43CF73C643A
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 03:30:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 9CE8A3C4F89
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 03:30:50 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 728526005CC
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 03:30:49 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,354,1599494400"; d="scan'208";a="101568773"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 20 Nov 2020 10:30:46 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id A41584CE3A6C;
 Fri, 20 Nov 2020 10:30:43 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 20 Nov 2020 10:30:43 +0800
Message-ID: <5FB72A61.4010007@cn.fujitsu.com>
Date: Fri, 20 Nov 2020 10:30:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201112120505.GA15765@yuki.lan>
 <1605233273-3784-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201113151239.GB16315@yuki.lan> <5FB259B2.4040106@cn.fujitsu.com>
 <20201119153116.GA18048@yuki.lan>
In-Reply-To: <20201119153116.GA18048@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: A41584CE3A6C.AE17E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/ptrace11: Add test for tracing init
 process
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

Hi Cyril
> Hi!
>>>> +	/*
>>>> +	 * Running attach/detach more times will trigger a ESRCH error because
>>>> +	 * ptrace_check_attach function in kernel will report it if its process
>>>> +	 * stats is not __TASK_TRACED.
>>>> +	 */
>>>> +	TST_RETRY_FUNC(ptrace(PTRACE_DETACH, 1, NULL, NULL), TST_RETVAL_EQ0);
>>>
>>> Why do we have to retry the detach here?
>>
>> I add a retry here because running attach/detach serval times may make
>> init process isn't traced status . Even we have do attach action, detach
>> will get ESRCH error .
>
> Looking at the manual page it says:
>
> PTRACE_ATTACH
>
> ...
> The tracee is sent a SIGSTOP, but will not necessarily have stopped by
> the completion of this call; use waitpid(2) to wait for the tracee to
> stop.
Oh, I ignored it. Sorry.
> ...
>
> So my guess is that if we call PTRACE_ATTACH followed by the
> PTRACE_DETACH we may end up in a state where the SIGSTOP for the traced
> process haven't arrived yet and in this case we should get ESCRCH.
>
> So the correct solution is waitpid() for the traced process before we
> detach it.
Yes, using waitpid() is ok. I Will send a v4 soon.
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
