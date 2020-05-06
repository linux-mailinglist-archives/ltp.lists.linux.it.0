Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F551C7216
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 15:50:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3C3573C579F
	for <lists+linux-ltp@lfdr.de>; Wed,  6 May 2020 15:50:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 96F513C260A
 for <ltp@lists.linux.it>; Wed,  6 May 2020 15:50:30 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C0DFF14016F4
 for <ltp@lists.linux.it>; Wed,  6 May 2020 15:50:29 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CE1B2AE8C;
 Wed,  6 May 2020 13:50:31 +0000 (UTC)
Date: Wed, 6 May 2020 15:50:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200506135050.GB3198@yuki.lan>
References: <20200429141411.9051-1-chrubis@suse.cz>
 <643ba523-3421-fa27-cdc9-9c64e60647c3@cn.fujitsu.com>
 <20200505141341.GB27810@yuki.lan>
 <2b147323-9cc8-e2d9-5e3f-c95ed0b78e75@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b147323-9cc8-e2d9-5e3f-c95ed0b78e75@163.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/ioctl_loop05: Do not fail on success
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> >>> The code in __loop_update_dio() uses inode->i_sb->s_bdev to get the
> >>> logical block size for the backing file for the loop device. If that
> >>> pointer is NULL, which happens to be the case for Btrfs, the checks for
> >>> alignment and block size are ignored and direct I/O can be turned on
> >>> regardless of the offset and logical block size.Since kernel comment "the above condition may be loosed in the future,
> >> and direct I/O may be switched runtime at that time because most
> >> of requests in sane applications should be PAGE_SIZE aligned". I think
> >> pass is ok, also print filesystem let user know this fs igores this
> >> align is better.
> > 
> > I do not get what you mean here. Should we change the TPASS message to
> > something "LOOP_SET_DIRECT_IO succeeded, offset is ignored" or something
> > similar?
> Yes. Add a comment here is better.

I've added a longer top level comment explaining why we pass the test
with both outcomes on non-zero offset and pushed the patch.

> > 
> >>     loopinfo.lo_offset = 0;
> >>     TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo),
> >> TST_RETVAL_EQ0);
> >>
> >> These should be moved to the beginning of test function.
> > 
> > I guess that we can do so, just to be extra sure, but we do zero the
> > loopinfo structure in lib/tst_device.c so we start with zero offset,
> > hence it does not matter if we reset it at the start or at the end of
> > the test.
> When I debug this case as below(early return, ext4 filesystem):
> TEST(ioctl(dev_fd, LOOP_SET_DIRECT_IO, 1));
>          if (TST_RET == 0) {
>                  tst_res(TFAIL, "LOOP_SET_DIRECT_IO succeeded 
> unexpectedly");
>                  SAFE_IOCTL(dev_fd, LOOP_SET_DIRECT_IO, 0);
>          }
> 	return;
> this case will broke when using i parameter,
> ioctl_loop05.c:50: BROK: ioctl(3,LOOP_SET_DIRECT_IO,...) failed: EINVAL (22)
> 
> It seems the last test affected the next test, so I think we should use 
> goto instead of return. Also including two typo, updata->update, need->needs

Let's keep the git history clean and fix that in a subsequent patch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
