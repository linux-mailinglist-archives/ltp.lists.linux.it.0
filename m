Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E343BC510
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 05:28:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 421C43C8A71
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 05:28:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 675FF3C0123
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 05:28:33 +0200 (CEST)
Received: from ATCSQR.andestech.com (exmail.andestech.com [60.248.187.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 02E827CEC9D
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 05:28:30 +0200 (CEST)
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 1663RsoC095915;
 Tue, 6 Jul 2021 11:27:54 +0800 (GMT-8)
 (envelope-from ycliang@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Jul 2021
 11:27:55 +0800
Date: Tue, 6 Jul 2021 11:27:48 +0800
From: Leo Liang <ycliang@andestech.com>
To: Cyril Hrubis <chrubis@suse.cz>, Joerg Vehlow <lkml@jv-coder.de>,
 <metan@ucw.cz>, <xuyang2018.jy@fujitsu.com>
Message-ID: <20210706032748.GA16346@andestech.com>
References: <20210628033002.GA1469@andestech.com>
 <caf1bb46-5212-3c3d-f180-e722ef2cf8dd@jv-coder.de>
 <YNnJ18Q+cqb8zM5K@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNnJ18Q+cqb8zM5K@yuki>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 1663RsoC095915
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] cgroup/cgroup_regression_test: Fix umount
 failure
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
Cc: richiejp@f-m.fm, alankao@andestech.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Sorry for the late response and thanks for all the replies and suggestions.

I am running on a rather new RISC-V platform (Andes/AE350) and with 5.4.0 off-tree kernel.
The umount in cgroup_regression_test mostly failed at test_2 and test_3, 
so it would show FAIL result (mount not successfully executed) at test_3 and test_5 (test_4 shows TCONF on my platform).

On Mon, Jun 28, 2021 at 03:08:39PM +0200, Cyril Hrubis wrote:
> Hi!
> > I would like a short comment close to the syncs. When I converted 
> > cpuset_regression_test.sh, I would have removed the sync in there, if 
> > there wouldn't have been any comment.
> > Most of the time syncs are not required and just added by paranoid 
> > developers, but if there is a real reason, I think it should be stated 
> > in a comment.
>
> Sounds reasonable to me, can we please add a comment there?

Hi Cyril and Joerg,

Sounds reasonable to me as well,
will send a v2 patch with comment.

> -- 
> Cyril Hrubis
> chrubis@suse.cz


> Agree with this. Are all these sync really needed? Or just some?

Hi Petr,

I've written a script containing only the following sequence
	" mount 'cgroup mntpoint' "
	" mkdir 'under cgroup mntpoint' "
	" rmdir 'under cgroup mntpoint' "
	" umount 'cgroup mntpoint' "
	" mount 'cgroup mntpoint' "
and it could trigger the fail.

But only bumped into the umount fail when doing test_2 and test_3 in the cgroup_regression_test.

I am adding syncs in every sub-tests that execute the above sequence now.
Should them be added only at the places where umount failure did occur ?

> Kind regards,
> Petr


> IMO, Even we call sync, this umount may fail because sync ensures 
> nothing.  Why not use tst_umount?

Hi Yang,

I think this might be a timing issue and a little delay could fix this problem. (e.g. 'sleep 1')
Using 'sync' here IMHO would be more descriptive and has a semantic meaning.

Speaking of tst_umount, do you mean to convert this test to C code ?

> Best Regards
> Yang Xu

Best regards,
Leo

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
