Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2BF7AC2D0
	for <lists+linux-ltp@lfdr.de>; Sat, 23 Sep 2023 16:42:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 94B6A3C9DD2
	for <lists+linux-ltp@lfdr.de>; Sat, 23 Sep 2023 16:42:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EF4353C9DD2
 for <ltp@lists.linux.it>; Sat, 23 Sep 2023 16:42:03 +0200 (CEST)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 517501A001B1
 for <ltp@lists.linux.it>; Sat, 23 Sep 2023 16:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9hSs/6VsEwk07R0zuYpipZH5iZqRr/xmEP3TnIMzeUU=; b=FPXisrSy8vIZJv3QSFPvG4trfL
 CO0a/FQmexgQh+/hM+05uxa5iocG4RYA0F36WnLicKqB5J4new6NvcVdjQl4tP2rPEXsIasfFXwaC
 IjJhOsrFuGepjpCrcP9EeT5lKWoDZkj9K9QyDsaLiDActNnEk3FQCVOIziROlYHXdfX2W2rOSZkh5
 hR45snuFbVLAxbs/yOwpWBUXxSc1rD0Yflz5vGonA9HNCNehtJX75Tn+nrSZ7MIVO+BOMOHdPF0Zf
 PnEU8PZWW4mC7mvRI5CbVUq9AvobUjJouRSyuSn0dWf8ae71755vXzinvjecuLauc50H/Tcdqe3Yj
 VCF2t2DA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qk3pH-007V6x-Mv; Sat, 23 Sep 2023 14:41:43 +0000
Date: Sat, 23 Sep 2023 15:41:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <ZQ75JynY8Y2DqaHD@casper.infradead.org>
References: <20230909043806.3539-1-reubenhwk@gmail.com>
 <202309191018.68ec87d7-oliver.sang@intel.com>
 <CAOQ4uxhc8q=GAuL9OPRVOr=mARDL3TExPY0Zipij1geVKknkkQ@mail.gmail.com>
 <CAD_8n+TpZF2GoE1HUeBLs0vmpSna0yR9b+hsd-VC1ZurTe41LQ@mail.gmail.com>
 <ZQ1Z_JHMPE3hrzv5@yuki>
 <CAD_8n+ShV=HJuk5v-JeYU1f+MAq1nDz9GqVmbfK9NpNThRjzSg@mail.gmail.com>
 <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjnCdAeWe3W4mp=DwgL49Vwp_FVx4S_V33A3-JLtzJb-g@mail.gmail.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] vfs: fix readahead(2) on block devices
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
Cc: mszeredi@redhat.com, brauner@kernel.org, lkp@intel.com,
 oe-lkp@lists.linux.dev, kernel test robot <oliver.sang@intel.com>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Reuben Hawkins <reubenhwk@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Sat, Sep 23, 2023 at 08:56:28AM +0300, Amir Goldstein wrote:
> We decided to deliberately try the change of behavior
> from EINVAL to ESPIPE, to align with fadvise behavior,
> so eventually the LTP test should be changed to allow both.
> 
> It was the test failure on the socket that alarmed me.
> However, if we will have to special case socket in
> readahead() after all, we may as well also special case
> pipe with it and retain the EINVAL behavior - let's see
> what your findings are and decide.

If I read it correctly, LTP is reporting that readhaead() on a socket
returned success instead of an error.  Sockets do have a_ops, right?
It's set to empty_aops in inode_init_always, I think.

It would be nice if we documented somewhere which pointers should be
checked for NULL for which cases ... it doesn't really make sense for
a socket inode to have an i_mapping since it doesn't have pagecache.
But maybe we rely on i_mapping always being set.

Irritatingly, POSIX specifies ESPIPE for pipes, but does not specify
what to do with sockets.  It's kind of a meaningless syscall for
any kind of non-seekable fd.  lseek() returns ESPIPE for sockets
as well as pipes, so I'd see this as an oversight.
https://pubs.opengroup.org/onlinepubs/9699919799/functions/posix_fadvise.html
https://pubs.opengroup.org/onlinepubs/9699919799/functions/lseek.html

Of course readahead() is a Linux-specific syscall, so we can do whatever
we want here, but I'm really tempted to just allow readahead() for
regular files and block devices.  Hmm.  Can we check FMODE_LSEEK
instead of (S_ISFILE || S_ISBLK)?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
