Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E52752B41B8
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 11:51:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9B8F3C4F4C
	for <lists+linux-ltp@lfdr.de>; Mon, 16 Nov 2020 11:51:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 236483C2419
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:51:28 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 0056B60066F
 for <ltp@lists.linux.it>; Mon, 16 Nov 2020 11:51:26 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,482,1596470400"; d="scan'208";a="101418547"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 16 Nov 2020 18:51:23 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 6B1C14CE4BC1;
 Mon, 16 Nov 2020 18:51:23 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 16 Nov 2020 18:51:24 +0800
Message-ID: <5FB259B2.4040106@cn.fujitsu.com>
Date: Mon, 16 Nov 2020 18:51:30 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Cyril Hrubis <chrubis@suse.cz>
References: <20201112120505.GA15765@yuki.lan>
 <1605233273-3784-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20201113151239.GB16315@yuki.lan>
In-Reply-To: <20201113151239.GB16315@yuki.lan>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 6B1C14CE4BC1.AE5C5
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
>> +	/*
>> +	 * Running attach/detach more times will trigger a ESRCH error because
>> +	 * ptrace_check_attach function in kernel will report it if its process
>> +	 * stats is not __TASK_TRACED.
>> +	 */
>> +	TST_RETRY_FUNC(ptrace(PTRACE_DETACH, 1, NULL, NULL), TST_RETVAL_EQ0);
>
> Why do we have to retry the detach here?

I add a retry here because running attach/detach serval times may make 
init process isn't traced status . Even we have do attach action, detach 
will get ESRCH error .

In kernel/ptrace.c code, it has the following calltrace
SYSCALL_DEFINE4(ptrace...
    =>ptrace_check_attach   //if we don't use PTRACE_ATTACH/PTRACE_SEIZE
      =>ptrace_freeze_traced

/* Ensure that nothing can wake it up, even SIGKILL */
static bool ptrace_freeze_traced(struct task_struct *task)
{
         bool ret = false;

         /* Lockless, nobody but us can set this flag */
         if (task->jobctl & JOBCTL_LISTENING)
                 return ret;
         spin_lock_irq(&task->sighand->siglock);
         if (task_is_traced(task) && !__fatal_signal_pending(task)) {
                 task->state = __TASK_TRACED;
                 ret = true;
         }
         spin_unlock_irq(&task->sighand->siglock);

         return ret;
}

ptrace_freeze_traced() may returns false when we run attach/detach 
serval times, so ptrace_check_attach returns ESRCH error .

To be honset, I don't figure out why task->stat is not task_traced 
status after attaching. I am looking into this.

Best Regards
Yang Xu
>
> Other than that the rest looks fine now.
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
