Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE410004B
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 09:25:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B34C73C18B5
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Nov 2019 09:25:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 512973C149D
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 09:25:14 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AECEE2001C6
 for <ltp@lists.linux.it>; Mon, 18 Nov 2019 09:25:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1D5FAD7B;
 Mon, 18 Nov 2019 08:25:11 +0000 (UTC)
Date: Mon, 18 Nov 2019 09:25:10 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "Xu, Yang" <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191118082510.GA8415@dell5510>
References: <20191031152646.GA7078@dell5510>
 <1572612959-20577-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1572612959-20577-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191115174110.GB22234@x230>
 <791f40c927114eb8b9ce5320d8c33447@G08CNEXMBPEKD04.g08.fujitsu.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <791f40c927114eb8b9ce5320d8c33447@G08CNEXMBPEKD04.g08.fujitsu.local>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/5] syscalls/quotactl02.c: Add Q_XGETQSTATV
 test
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> > >Q_XGETQSTATV returns XFS filesystem-specific quota information in the 
> > >fs_quota_statv pointed to by addr. The qs_version field of the 
> > >structure should be filled with the version of the structure supported 
> > >by the caller (for now, only FS_QSTAT_VERSION1 is supported).
> >nit: one would think you add 1 test case. But you added 8 test cases, all of them are XFS related, but only 4 related to Q_XGETQSTATV.
> For user quota, I add 2 test cases to use Q_XGETQSTATV to get status for Q_XQUOTAOFF and Q_XQUOTAOFF . 
> Also, I add group quota for this case as quotactl01.c.  so I add 8 (2+6) test cases.  I will update group coverage in commit info. 

> Ps: I want to use Q_XGETQSTAT to test  Q_XQUOTAOFF, Q_XGETQSTATV to test Q_XQUOTAON. So it can be only 8 test cases. But Q_XGETQSTATV
> is introduced since v3.12-rc1 commit[1]. We should use a pair (on,off )to test Q_XGETQSTATV.

> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d5e3d57605e77708685e8d20a40fe86891db299
Thanks for info.

> >> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> >Reviewed-by: Petr Vorel <pvorel@suse.cz> Nice work, thanks!
> Thanks for your review.

> >>Nit: I'd just extract quotactl02.h later in the commit, where the code needs to be reused (i.e. in 0cc1dc512 ("syscalls/quotactl05: add project quota test for xfs filesystem")) or at least mention why you do it now.
> I will mention it in commit info.
OK, I'll review the rest of v3 and wait for v4.

> >> +++ b/testcases/kernel/syscalls/quotactl/quotactl02.c
> >...
> >> +#if defined(HAVE_STRUCT_FS_QUOTA_STATV)
> >> +	{QCMD(Q_XQUOTAOFF, GRPQUOTA), &qflagg, check_qoffv,
> >> +	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
> > >+	"turn off xfs quota and get xfs quota off statv for group"},

> >> -	tst_res(TPASS, "quoactl() succeeded to set and use %s to get xfs disk quota limits",
> > >-			desp);
> > >-}
> > >+	{QCMD(Q_XQUOTAON, GRPQUOTA), &qflagg, check_qonv,
> > >+	QCMD(Q_XGETQSTATV, GRPQUOTA), 1,
> > >+	"turn on xfs quota and get xfs quota on statv for group"}, #endif };
> >Hm, we don't report some TCONF: Q_XGETQSTATV not supported.
> >But that's probably not important
> This cmd was introduced since 2013,  I think we should check it. Also,  if we 
> Use a new kernel but boot with a older kernel header, HAVE_STRUCT_FS_QUOTA_STATV may be undefined.
> But in kernel, it is implemented. So I think we may define a fs_quota_statv struct in ltp, so we can detect whether Q_XGETQSTAT is implemented. 
> What do you think about it?
+1, IMHO this makes sense.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
