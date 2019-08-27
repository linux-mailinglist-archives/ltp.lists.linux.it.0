Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B48E9E547
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:04:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 380203C1CF4
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Aug 2019 12:04:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 247AB3C1C7F
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:04:19 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 6817F600E22
 for <ltp@lists.linux.it>; Tue, 27 Aug 2019 12:04:21 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1DD75AE91;
 Tue, 27 Aug 2019 10:04:18 +0000 (UTC)
Date: Tue, 27 Aug 2019 12:04:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Murphy Zhou <jencce.kernel@gmail.com>
Message-ID: <20190827100416.GB17923@dell5510>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
 <20190806162703.GA1333@dell5510>
 <20190807101742.mt6tgowsh4xw5hyt@XZHOUW.usersys.redhat.com>
 <5D4B92EF.4090800@cn.fujitsu.com>
 <20190808035730.3kzors4trok6amtr@XZHOUW.usersys.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808035730.3kzors4trok6amtr@XZHOUW.usersys.redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v7 3/3] syscalls/copy_file_range02: increase
 coverage and remove EXDEV test
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
Cc: linux-xfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Murphy,

> On Thu, Aug 08, 2019 at 11:11:43AM +0800, Yang Xu wrote:
> > on 2019/08/07 18:17, Murphy Zhou wrote:

> > > And I have a question about LTP itself.

> > > If we run the testcase directly like:
> > > 	 ./testcases/kernel/syscalls/copy_file_range/copy_file_range02

> > > to test all_filesystems, for every filesystem, we mkfs and mount it in
> > > .mntpoint, but we do not chdir to .mntpoint. So we are running tests in 
> > > the same tmpdir, fs type of which does not change while looping
> > > all_filesystems.  Only the .mntpoint in tmpdir has different fs type in
> > > each loop.

> > > Now we are using this to test cross-device copy in copy_file_range01.c,
> > > but in copy_file_range02.c, we are not using .mntpint at all, all the
> > > tests in the all_filesystems loop are running in the same tmpdir. In other
> > > words, we are NOT testing all filesystems.

> > > Is this expected?
> >  I removed the mnted test for cross-device copy_file_range in copy_file_range02.c.
> > And I ignore the non-used mntpoint. IMO, we can directly use the FILE_MNTED to test EFBIG on all filesystems, 

> If mntpoint is not used, it makes absolutely NO sense to test all_filesystems.
Thanks for pointing this out. I was blind when reviewing this patchset.
At least this has been fixed.

> Because in the all_filesystems loop, various supported filesystems are
> created and mounted in mntpoint.

> And the copy_file_range tests happens outside of mntpoint. It just repeats
> the same test several times in the same tmpdir, fs type of which depends
> on /tmp configuration.

> When the log prints "testing ext2", it's not the truth.

> EFBIG is another issue.
Yep, we still need to think about different errnos, which depend on LTP policy
being defined [1].

> Thanks,
> Murphy

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1143438/

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
