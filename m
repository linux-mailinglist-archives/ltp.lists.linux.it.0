Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E9C19F19B
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 10:31:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56F8C3C2E0E
	for <lists+linux-ltp@lfdr.de>; Mon,  6 Apr 2020 10:31:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id ABA123C0716
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 10:31:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A49606012DB
 for <ltp@lists.linux.it>; Mon,  6 Apr 2020 10:31:07 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 170B0AB7F;
 Mon,  6 Apr 2020 08:31:05 +0000 (UTC)
Date: Mon, 6 Apr 2020 10:30:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200406083055.GA1947@rei.lan>
References: <1585839990-19923-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1585839990-19923-8-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200403164416.GA11850@yuki.lan>
 <1847306e-f00c-a484-9080-8d1b7f62ce60@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1847306e-f00c-a484-9080-8d1b7f62ce60@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 07/10] syscalls/ioctl_loop05: Add
 LOOP_SET_DIRECT_IO ioctl test
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
> >> +}
> >> +
> >> +static struct tst_test test = {
> >> +	.setup = setup,
> >> +	.cleanup = cleanup,
> >> +	.test_all = verify_ioctl_loop,
> >> +	.needs_root = 1,
> >> +//	.needs_tmpdir = 1,
> > 
> > Looks like a forgotten debug measure.
> > 
> Yes, because some distribution use tmpfs in tmp directory, then this 
> case will TCONF(tmpfs doesn't supprt DIO).  I am indecisive, or I should 
>   use all_filesystem =1, so it will not report TCONF? Or, keep it?

That will just create a loop device formatted with a filesystem and
another loop device in that filesystem in most cases. I doubt that it
will even work if we are doing all of that on the top of tmpfs anyways.

-- 
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
