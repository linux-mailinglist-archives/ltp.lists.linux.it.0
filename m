Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3445E165B4C
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:18:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DB5903C2244
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Feb 2020 11:18:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id AB4DC3C2231
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:18:13 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 13F92601DC2
 for <ltp@lists.linux.it>; Thu, 20 Feb 2020 11:18:12 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BF2FB2DC;
 Thu, 20 Feb 2020 10:18:12 +0000 (UTC)
Date: Thu, 20 Feb 2020 11:18:11 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200220101811.GA11142@rei>
References: <20200220095908.14980-1-chrubis@suse.cz>
 <c2168ced-4634-a7d4-7112-ac8e2ceba830@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2168ced-4634-a7d4-7112-ac8e2ceba830@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/fgetxattr02: Use loop instead of RAM disk
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
> > which makes this test fail with ENXIO when we attempt to open the block
> > device in the test setup.
> > 
> > LTP depends on heavily on loop device driver already so it makes sense
> > to switch over to a loop device backed block device instead.
> > 
> > Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >   testcases/kernel/syscalls/fgetxattr/fgetxattr02.c | 7 ++++---
> >   1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
> > index 02e81810a..82fb676be 100644
> > --- a/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
> > +++ b/testcases/kernel/syscalls/fgetxattr/fgetxattr02.c
> > @@ -210,7 +210,8 @@ static void setup(void)
> >   	size_t i = 0;
> >   	struct sockaddr_un sun;
> >   
> > -	dev_t dev = makedev(1, 3);
> > +	dev_t chr_dev = makedev(1, 3);
> > +	dev_t blk_dev = makedev(7, 3);
>   Can we use tst_find_free_loopdev to avoid a fixed loop dev like 
> copy_file_range02.c?

I do not think that it matters here, we are not actually touching the
block device here, we just need to be able to open the block device so
that we can add an attribute to the file we have created. I does not
matter if it's used or not.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
