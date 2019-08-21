Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC51F97352
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 09:27:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A3C913C1D03
	for <lists+linux-ltp@lfdr.de>; Wed, 21 Aug 2019 09:27:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id EEEAF3C1866
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 09:27:14 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E0953600BF2
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 09:27:16 +0200 (CEST)
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8677B7BDA0
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 07:27:12 +0000 (UTC)
Received: by mail-ua1-f71.google.com with SMTP id w9so82734uaj.7
 for <ltp@lists.linux.it>; Wed, 21 Aug 2019 00:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TncligTCmQqRxd75qw78SwjXjLqK7j2ByaE4gVCKPeI=;
 b=XT81BcGvTiFkT9ZrocExck05iTPfm6ZGJN+Obl3K15iQ0DhrVYnDmurIMmqqPYqamP
 O96bPHBBtZXR0ce2o29LN11wmJhQd6DGDupXv9EqyOIeIP4UC0UW9sHhfYMCbMV04d8y
 cKEpRS1Hzr1lCcIkzvKAuSJ4afqxFlq4vku8xgQMJgLmmoj8nQu+fjukjQKAMgxfZu1r
 QfC1Lg2iaICReIjMV6dOiwoDOFveTti18/8rge5BuLyXcbWkzfQ1oFnXktRoOMXxYXZ6
 m3JtLMHEfqIT1oFtIHgFKGABV5OXoIo3MPiJ4Wa3pheux64/ld0KcrGezW0PC3H8+PFl
 XLAg==
X-Gm-Message-State: APjAAAWeLKF26fCP5IeucnUDeuEmoWcaz4uhZv1sAJWiJrijWYNEJQwK
 E1LM7qa5FDOAG0zOrIqwAVKtKNI9Nq89Dwz3QNlQjJFSnGU5xJk/O96f4hz3VM4JDvzNTwomn/q
 uako7CJEOWFC118erkk8Hkm9vbjY=
X-Received: by 2002:a67:1e85:: with SMTP id
 e127mr10456765vse.124.1566372431795; 
 Wed, 21 Aug 2019 00:27:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZZkLtFL0fXhOmytuVnO9u4hxXP53uqHs+YdhQwdmJ6z0ux7EZ8NjQa6AOP85sv64aZhS4GKK68psFlUy/Yo0=
X-Received: by 2002:a67:1e85:: with SMTP id
 e127mr10456758vse.124.1566372431506; 
 Wed, 21 Aug 2019 00:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190815083630.26975-1-pvorel@suse.cz>
 <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
 <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
 <5D5BB8DC.6070900@cn.fujitsu.com>
In-Reply-To: <5D5BB8DC.6070900@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 21 Aug 2019 15:27:00 +0800
Message-ID: <CAEemH2d_CKOwE3mHEXZKi1BkMBw5dn95aMJtkrSRciH2PU6NJA@mail.gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lapi/fs.h: Replace MAX_LFS_FILESIZE constant with
 own implementation
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Aug 20, 2019 at 5:10 PM Yang Xu <xuyang2018.jy@cn.fujitsu.com> wrote:
...
> >
> > But I don't understand why to define MAX_OFF as (MAX_LEN - MIN_OFF),
> > the failure indicates that not to write at a position past the maximum
> > allowed offset. Shouldn't we give a dst_off large than
> > MAX_LFS_FILESIZE?
> Yes, we should use a dst_off large than MAX_LFS_FILESIZE because it used pos to compare
> in kernel code as below:
>
> mm/filemap.c
>   static int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
> ...
> if (unlikely(pos>= max_size))
>    return -EFBIG;
> ...
>
> I strace xfstest generic/564 code( I follow this test code to ltp), as below:
> #max_off=$((8 * 2**60 - 65536 - 1))
> #min_off=65537
> #xfs_io -f -c "pwrite -S 0x61 0 128k" file
> #touch copy
> #strace xfs_io -c "copy_range -l $min_off -s 0 -d $max_off file" copy
> ....
>   openat(AT_FDCWD, "file", O_RDONLY)      = 4
>   copy_file_range(4, [0], 3, [9223372036854710271], 65537, 0) = 65536
>   copy_file_range(4, [65536], 3, [9223372036854775807], 1, 0) = -1 EFBIG (File too large)
> ....
>
> xfsprogs used a loop to call copy_file_range, and get EFBIG when pos greater than LLONG_MAX.
>
> I think we should  use tst_max_lfs_filesize instead of (tst_max_lfs_filesize -MIN_OFF)
> and this case will pass whether xfs,btrfs and ext4.

Good job, Xu. I think you can format a new patch to fix this problem.
Because Petr's patch is used for solving the cross-compiling issue and
looks good.

@Petr Vorel Hi Petr, what do you think? any more comments?

-- 
Regards,
Li Wang

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
