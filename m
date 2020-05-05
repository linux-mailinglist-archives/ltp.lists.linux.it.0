Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F21C5856
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 16:13:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7A9393C57E5
	for <lists+linux-ltp@lfdr.de>; Tue,  5 May 2020 16:13:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8E2403C265B
 for <ltp@lists.linux.it>; Tue,  5 May 2020 16:13:31 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6876310007AD
 for <ltp@lists.linux.it>; Tue,  5 May 2020 16:13:31 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3B19BB112;
 Tue,  5 May 2020 14:13:33 +0000 (UTC)
Date: Tue, 5 May 2020 16:13:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200505141341.GB27810@yuki.lan>
References: <20200429141411.9051-1-chrubis@suse.cz>
 <643ba523-3421-fa27-cdc9-9c64e60647c3@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <643ba523-3421-fa27-cdc9-9c64e60647c3@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
> > The code in __loop_update_dio() uses inode->i_sb->s_bdev to get the
> > logical block size for the backing file for the loop device. If that
> > pointer is NULL, which happens to be the case for Btrfs, the checks for
> > alignment and block size are ignored and direct I/O can be turned on
> > regardless of the offset and logical block size.Since kernel comment "the above condition may be loosed in the future, 
> and direct I/O may be switched runtime at that time because most
> of requests in sane applications should be PAGE_SIZE aligned". I think 
> pass is ok, also print filesystem let user know this fs igores this 
> align is better.

I do not get what you mean here. Should we change the TPASS message to
something "LOOP_SET_DIRECT_IO succeeded, offset is ignored" or something
similar?

>    loopinfo.lo_offset = 0;
>    TST_RETRY_FUNC(ioctl(dev_fd, LOOP_SET_STATUS, &loopinfo), 
> TST_RETVAL_EQ0);
> 
> These should be moved to the beginning of test function.

I guess that we can do so, just to be extra sure, but we do zero the
loopinfo structure in lib/tst_device.c so we start with zero offset,
hence it does not matter if we reset it at the start or at the end of
the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
