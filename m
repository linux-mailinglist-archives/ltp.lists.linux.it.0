Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C190435EED1
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:04:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 327FE3C70FE
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Apr 2021 10:04:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 96B103C00A9
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:04:21 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 07593200B9E
 for <ltp@lists.linux.it>; Wed, 14 Apr 2021 10:04:20 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3BA59AD09;
 Wed, 14 Apr 2021 08:04:20 +0000 (UTC)
References: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B507A@dggeml531-mbx.china.huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: zhaogongyi <zhaogongyi@huawei.com>
In-reply-to: <F3D3F6AC3820BB4C9FCA340DB5C32CB4038B507A@dggeml531-mbx.china.huawei.com>
Date: Wed, 14 Apr 2021 09:04:19 +0100
Message-ID: <87im4p2sxo.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] controllers/memcg: Add testcase for
 kmem_limit_in_bytes of memory cgroup
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
Reply-To: rpalethorpe@suse.de
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

zhaogongyi <zhaogongyi@huawei.com> writes:

> Hi Richard,
>
> Thanks so much for your review!
>
>> >> > +	pid = SAFE_FORK();
>> >> > +	if (!pid) {
>> >> > +		SAFE_SETPGID(0, 0);
>> >> > +
>> >> > +		SAFE_FILE_PRINTF(KMEM_LIMIT_IN_BYTES, "%d", 0);
>> >> > +
>> >> > +		SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid()));
>> >>
>> >> After setting this we should avoid doing any work in this process
>> >> except calling fork. AFAIK there is no guarantee that some other
>> >> syscall or tasklet etc. Won't try to allocate memory and also fail.
>> >>
>> >
>> > It seems that we would not be afraid since there is no asynchronous
>> > operation in the test process.
>> 
>> IIRC one of the problems with tasklets is they can run in any process. Also,
>> in theory stdout can point to anything. So write() might allocate memory.
>> 
>> Why not do something like:
>> 
>> SAFE_FILE_PRINTF(CGROUP_PROCS, "%d", getpgid(getpid())); errno = 0;
>> fork(); exit(errno);
>> 
>> Then check that errno == ENOMEM, in the parent process?
>>
>>
>>> > +		TEST(fork());
>>> > +		if (TST_RET == -1) {
>>> > +			if (TST_ERR == ENOMEM)
>>> > +				tst_res(TPASS, "fork fail as expected");
>>> > +			else
>>> > +				tst_brk(TFAIL | TTERRNO,
>>> > +					"fork fail as unexpected");
>
> As far as my personal understanding, after setpgid, the controlled process is the sub process whose process id is pid, excluded from the parent process, and the functions tst_res or tst_brk
> Is executed in its parent process.

setpgid(0, 0) sets the process group id (pgid) to be the same as the
(pid), which creates a new process group. This probably has the effect
that the calling process will not recieve signals from the
terminal. Also it should receive SIGTTOU when calling tst_res and
tst_brk, if stdout/stderr point to a terminal with the right
configuration.

AFAICT process groups are for shells and affect where signals are
sent. Nothing else.

>
> In this case, is it no affection to this test?
>
>
> Best Regards,
> Gongyi


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
