Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 147931975E6
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:43:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CB7F73C3149
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:43:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 835DB3C313D
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:43:17 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 9114C1A0091E
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:43:15 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.72,323,1580745600"; d="scan'208";a="87897114"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Mar 2020 15:43:14 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 5D54949DF126;
 Mon, 30 Mar 2020 15:32:57 +0800 (CST)
Received: from [10.167.220.69] (10.167.220.69) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 30 Mar 2020 15:43:12 +0800
Message-ID: <5E81A30E.2080002@cn.fujitsu.com>
Date: Mon, 30 Mar 2020 15:43:10 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.2; zh-CN;
 rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: Petr Vorel <pvorel@suse.cz>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230> <5E80323C.5070408@cn.fujitsu.com>
 <CAEemH2chnkojt0oc9OVodwKOj27_7aTj1nHnkk_DVoOxUP-H7A@mail.gmail.com>
 <5E81819B.5070303@cn.fujitsu.com> <20200330071217.GB4571@dell5510>
In-Reply-To: <20200330071217.GB4571@dell5510>
X-Originating-IP: [10.167.220.69]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 5D54949DF126.AA443
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/6] C API: .needs_cmds and SAFE_RUN_CMD()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2020/3/30 15:12, Petr Vorel wrote:
> Hi Xiao,
>
>>>      # grep -A2 'needs_cmds' testcases/kernel/syscalls/add_key/add_key05.c
>>>      const char *const cmd_useradd[] = {tst_needs_cmds[0], username, NULL};
>>>      int rc;
>
>>> I don't see any advantage of involving this struct in a test case, and
>>> it also makes things more complicated.
>> Hi Li,
>
>> In fact, I perfer to remove .need_cmd and use tst_run_cmd with/without
>> TST_RUN_CMD_CHECK_CMD directly.
>> But I am not sure if it is necessary to keep .need_cmd for metadata project.
>> I think we can generate json about resouce by reading struct tst_test or
>> other ways.
>
> not sure if you mean removing .needs_cmds entirely or just for
> copy_file_range02.c. or some other test. I rewritten the original patchset
> because Cyril suggested .needs_cmds implementation:
>
> 	"Actually I would like to avoid exposing the function to the tests and
> 	force people to use the .needs_cmds instead in order to have a proper
> 	metadata." [1]
>
>
Hi Petr,

Thanks a lot for your explanation.

I want to remove .needs_cmds entirely before but it may be helpful to 
get metadata about command.

Thanks,
Xiao Yang
> IMHO parsing struct members is easier to get metadata than searching for
> various functions to be used, so I understand Cyril's intention. Cyril explains
> this on his blog posts (I've noticed [2], but it's also in [3]: "this
> arrangement also helps to export the test metadata into a machine parsable
> format").
>
> Kind regards,
> Petr
>
>> Thanks,
>> Xiao Yang
>
>
>>> IMO, the '.needs_cmds' should do check and guarantee all the cmds exist.
>>> That's a hard requirement for the test. If a situation that the commands
>>> are only part of the requirement(soft), we could avoid using
>>> '.needs_cmds' in the test and just calling tst_run_cmd() without passing
>>> TST_RUN_CMD_CHECK_CMD flag. This satisfies most situations we have, it
>>> is safe enough and choosable for people.
>
>>> Or maybe I'm wrong here too:).
>
>>> --
>>> Regards,
>>> Li Wang
>
>
> Kind regards,
> Petr
>
> [1] https://lists.linux.it/pipermail/ltp/2020-March/016233.html
> [2] https://people.kernel.org/metan/towards-parallel-kernel-test-runs
> [3] https://people.kernel.org/metan/the-ltp-test-driver-model
>
>
> .
>




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
