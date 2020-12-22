Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 602042E0F17
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 20:50:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7F9083C56FC
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Dec 2020 20:50:35 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 7A9063C299A
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 20:50:34 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DC1641A0091E
 for <ltp@lists.linux.it>; Tue, 22 Dec 2020 20:50:33 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23840AFBE;
 Tue, 22 Dec 2020 19:50:33 +0000 (UTC)
Date: Tue, 22 Dec 2020 20:50:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Message-ID: <20201222195030.GA141126@pevik>
References: <20200928194730.20862-1-nramas@linux.microsoft.com>
 <20200928194730.20862-2-nramas@linux.microsoft.com>
 <X9z2+nXBdTMqHPgD@pevik>
 <0db52810-c7e2-713a-80ed-748e8bb3db74@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0db52810-c7e2-713a-80ed-748e8bb3db74@linux.microsoft.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/1] ima: Add test for selinux measurement
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
Cc: paul@paul-moore.com, stephen.smalley.work@gmail.com,
 tusharsu@linux.microsoft.com, linux-integrity@vger.kernel.org,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Lakshmi,

> On 12/18/20 10:37 AM, Petr Vorel wrote:

> Hi Petr,

> > @Lakshmi
> > TL;DR: I added some fixes in my fork, branch ima/selinux.v2.draft,
> > https://github.com/pevik/ltp/commits/ima/selinux.v2.draft

> > + added 3 additional commits, one of them as you as the author.
> > I moved some functions to testcases/lib/tst_security.sh, renamed them.
> > Can you please have a look and test? I don't have any SELinux machine.

> I'll take a look at the changes in your branch and test it with SELinux
> enabled.
Thanks!

> > @Mimi, all: any comment to this test? My changes are just LTP cleanup
> > so you can comment it on this patchset.
> > I suppose you get to this in January.

> > Some notes for my changes:

> > As files are quite similar (checks etc), I put both tests into single
> > file ima_selinux.sh.
> This should be fine.

> The reason I put the tests in different files was because I couldn't find a
> way to run the tests independently (i mean - say, run the SELinux policy
> measurement test but not the state measurement test or vice-versa).

Why do you need to run just one of them?
If you really need to separate them (e.g. to require different OS setup for
each) you could have 2 functions in single file, but run only one of them
(TST_CNT not set, which means TST_CNT=1), doing selection with getopt switch?
https://github.com/linux-test-project/ltp/wiki/Test-Writing-Guidelines#233-optional-command-line-parameters

> > > New functionality is being added to IMA to measure data provided by
> > > kernel components. With this feature, IMA policy can be set to enable
> > > measuring data provided by Linux Security Modules (LSM). Currently one
> > > such LSM namely selinux is being updated to use this functionality.
> > > This new functionality needs test automation in LTP.

> > > Add test cases which verify that the IMA subsystem correctly measures
> > > the data provided by selinux.

> > Could you please put into commit message and test kernel commit hash relevant
> > for the test. Is that 8861d0af642c646c8e148ce34c294bdef6f32f6a (merged into
> > v5.10-rc1) or there are more relevant commits?

> The IMA hook to measure kernel critical data + SELinux measurement changes
> are still being reviewed. Tushar has posted v9 of the patch set.
Thanks for info (note for myself:
https://lore.kernel.org/linux-integrity/20201212180251.9943-1-tusharsu@linux.microsoft.com/)
OK, not yet merged to mainline. It's good you send patches early (speed up the
inclusion to LTP), but we should merge them into LTP once it's at least
already in Mimi tree prepared for sending to Linus.

Feel free to Cc me in your next kernel patches (It *can* help to speedup the inclusion to LTP).

> > ...
> > > +### IMA SELinux test
> > > +
> > > +To enable IMA to measure SELinux state and policy, `ima_selinux_policy.sh`
> > > +and `ima_selinux_state.sh` require a readable IMA policy, as well as
> > > +a loaded measure policy with
> > > +`measure func=CRITICAL_DATA data_sources=selinux template=ima-buf`
> > I put this into
> > testcases/kernel/security/integrity/ima/datafiles/ima_selinux/selinux.policy
> > and mention it in docs.
> Sounds good - Thanks.

> "template=ima_buf" is no longer needed in the IMA policy rule since
> "ima_buf" is the default template for buffer measurement now. I will update
> "datafiles/ima_selinux/selinux.policy" file.

+1

...

> Thanks a lot for your help Petr. Appreciate it.
yw, thanks for your contributions.

>  -lakshmi
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
