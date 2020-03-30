Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 831A2197504
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:12:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 41CDC3C3143
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 09:12:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 71A673C0889
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:12:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DB1E9600A8C
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 09:12:19 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F8ADABE9;
 Mon, 30 Mar 2020 07:12:19 +0000 (UTC)
Date: Mon, 30 Mar 2020 09:12:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Message-ID: <20200330071217.GB4571@dell5510>
References: <20200327213924.18816-1-pvorel@suse.cz>
 <4ff84a77-b858-6cae-a320-cfaed3646864@163.com>
 <20200328034253.GA2720439@x230> <5E80323C.5070408@cn.fujitsu.com>
 <CAEemH2chnkojt0oc9OVodwKOj27_7aTj1nHnkk_DVoOxUP-H7A@mail.gmail.com>
 <5E81819B.5070303@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5E81819B.5070303@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xiao,

> >     # grep -A2 'needs_cmds' testcases/kernel/syscalls/add_key/add_key05.c
> >     const char *const cmd_useradd[] = {tst_needs_cmds[0], username, NULL};
> >     int rc;

> > I don't see any advantage of involving this struct in a test case, and
> > it also makes things more complicated.
> Hi Li,

> In fact, I perfer to remove .need_cmd and use tst_run_cmd with/without
> TST_RUN_CMD_CHECK_CMD directly.
> But I am not sure if it is necessary to keep .need_cmd for metadata project.
> I think we can generate json about resouce by reading struct tst_test or
> other ways.

not sure if you mean removing .needs_cmds entirely or just for
copy_file_range02.c. or some other test. I rewritten the original patchset
because Cyril suggested .needs_cmds implementation:

	"Actually I would like to avoid exposing the function to the tests and
	force people to use the .needs_cmds instead in order to have a proper
	metadata." [1]


IMHO parsing struct members is easier to get metadata than searching for
various functions to be used, so I understand Cyril's intention. Cyril explains
this on his blog posts (I've noticed [2], but it's also in [3]: "this
arrangement also helps to export the test metadata into a machine parsable
format").

Kind regards,
Petr

> Thanks,
> Xiao Yang


> > IMO, the '.needs_cmds' should do check and guarantee all the cmds exist.
> > That's a hard requirement for the test. If a situation that the commands
> > are only part of the requirement(soft), we could avoid using
> > '.needs_cmds' in the test and just calling tst_run_cmd() without passing
> > TST_RUN_CMD_CHECK_CMD flag. This satisfies most situations we have, it
> > is safe enough and choosable for people.

> > Or maybe I'm wrong here too:).

> > --
> > Regards,
> > Li Wang


Kind regards,
Petr

[1] https://lists.linux.it/pipermail/ltp/2020-March/016233.html
[2] https://people.kernel.org/metan/towards-parallel-kernel-test-runs
[3] https://people.kernel.org/metan/the-ltp-test-driver-model

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
