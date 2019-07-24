Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68772E45
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 13:57:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFB463C1D15
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Jul 2019 13:57:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 372073C0358
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 13:57:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DD66601CBF
 for <ltp@lists.linux.it>; Wed, 24 Jul 2019 13:57:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 480C0AF55;
 Wed, 24 Jul 2019 11:57:36 +0000 (UTC)
Date: Wed, 24 Jul 2019 13:57:35 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Steve Muckle <smuckle@google.com>
Message-ID: <20190724115735.GC17426@rei.lan>
References: <20190722194439.161904-1-smuckle@google.com>
 <20190723110306.GB22630@rei.lan>
 <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1be1f0b8-170a-ac92-b86f-924e2d7f2295@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/statx01: loosen the stx_blocks check
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
Cc: kernel-team@android.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Why 128?
> 
> Was just restoring it to what it was previously.
> 
> > Can't we rather multiply the buff.stx_blksize/512 by 16?
> 
> That would work for ext4, but should this be loosened further to give 
> some headroom in case some FS preallocates more? Or is it preferable to 
> keep the test as strict as possible and loosen it when/if failures happen?

That is hard to decide. I would go for the lowest limit that works for
everybody.

Also for me ext4 allocates only one block for the file no matter what I
do, something has to be tuned differently in your setup.

Isn't it just a difference in the block size and inode size?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
