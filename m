Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 935629A5EB
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 05:10:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AD963C1D04
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Aug 2019 05:10:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 764003C17A2
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 05:10:41 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 725571401989
 for <ltp@lists.linux.it>; Fri, 23 Aug 2019 05:10:40 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id l21so4906793pgm.3
 for <ltp@lists.linux.it>; Thu, 22 Aug 2019 20:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0x7dhcc407jXrNiUWlWsOEUXvxzsupf0D8AHGXI1NrY=;
 b=e92x43V/+T1CwM+k6SN2sLbw3Ity9XnlpOhtzlh0auR0nDDZ/eL4sGuLwqVmhqyPyg
 kUaOq/jXFXu8KO6XoFqoxz0Dr4wOAA06w4kgyCTAhFUrsSfv9x4qvzTgsW7HOiOSApkE
 X0+lD1lMA8PvY6g88K+WkifJ7xpzw64c6NVVfx3n40OMDPVeFrKYHV6dFOsG0JX3nEyY
 xclxbKKqtYioM8ZQoeexUHOFbSl2cES2MZ28KBq7uTJc+yPXNnVB8lUEBanNLtJ8vtAV
 l2PqBULUFkkiui72EXD2TOIlibZz2QsXvObwzmc5f1z+QNll7QuqMPJQ94YW3Yqe1GH2
 PeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0x7dhcc407jXrNiUWlWsOEUXvxzsupf0D8AHGXI1NrY=;
 b=cd5byH2BhUmugVEYG5k1d8DV6ZPu87Sqin6ar3G5wbbN12aS12ZEDMuUQVZyrSwVgS
 SYNT1ZqWfDeEDaKDugEXEK6YEIYQs4MiR4lckZabA2QeEXJflBjoQC2+ePcjMEEcod3v
 AxaU5dPcqm+LZLZrCJp879/K0iBRRbyPWR8g4J9oBCgRngqQPYLAWp2CbOZHxHJo18Je
 CLUtVd/NwKVBJYoltGDd+8c70Sp3SvMnLZ6aGKPJlvi1lC/TDswWecGC6BGkpnGpq1tA
 V/0gpwV4yoq8zTfSHSFDO4dYXILxUIwD0grRrfnP4e4vcQLD+MpioLD4S9dCkqUug9RB
 3u2A==
X-Gm-Message-State: APjAAAWnfCuDDOSVEmbhgHVkSAa/c13z2WTBZ35fWzlnj3ZNrhosIN2f
 BI9amJaU9qg/rh+UQ2O02JU=
X-Google-Smtp-Source: APXvYqy8gvjBJ9w1UPEHm3psDekBK41DIX8EcqqH9ZleT7gg47AbAmCUAubv1Nm6sqOX9/XxMWtmFQ==
X-Received: by 2002:a63:2a41:: with SMTP id q62mr2044616pgq.444.1566529838929; 
 Thu, 22 Aug 2019 20:10:38 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id z13sm830772pjn.32.2019.08.22.20.10.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Aug 2019 20:10:37 -0700 (PDT)
Date: Fri, 23 Aug 2019 11:10:30 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20190823031030.eqv6swzsspprh5dw@XZHOUW.usersys.redhat.com>
References: <20190815083630.26975-1-pvorel@suse.cz>
 <20190816085309.fqvip4exe4mvtv2o@XZHOUW.usersys.redhat.com>
 <CAEemH2d7TYn4sZ7kkjRsPc-yBnTrN9LC+w84MAO6pDxYpfiFcw@mail.gmail.com>
 <5D5BB8DC.6070900@cn.fujitsu.com>
 <CAEemH2d_CKOwE3mHEXZKi1BkMBw5dn95aMJtkrSRciH2PU6NJA@mail.gmail.com>
 <5D5CFD75.3050506@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5D5CFD75.3050506@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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

On Wed, Aug 21, 2019 at 04:14:45PM +0800, Yang Xu wrote:
> on 2019/08/21 15:27, Li Wang wrote:
> 
> > On Tue, Aug 20, 2019 at 5:10 PM Yang Xu<xuyang2018.jy@cn.fujitsu.com>  wrote:
> > ...
> > > > But I don't understand why to define MAX_OFF as (MAX_LEN - MIN_OFF),
> > > > the failure indicates that not to write at a position past the maximum
> > > > allowed offset. Shouldn't we give a dst_off large than
> > > > MAX_LFS_FILESIZE?
> > > Yes, we should use a dst_off large than MAX_LFS_FILESIZE because it used pos to compare
> > > in kernel code as below:
> > > 
> > > mm/filemap.c
> > >    static int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
> > > ...
> > > if (unlikely(pos>= max_size))
> > >     return -EFBIG;
> > > ...
> > > 
> > > I strace xfstest generic/564 code( I follow this test code to ltp), as below:
> > > #max_off=$((8 * 2**60 - 65536 - 1))
> > > #min_off=65537
> > > #xfs_io -f -c "pwrite -S 0x61 0 128k" file
> > > #touch copy
> > > #strace xfs_io -c "copy_range -l $min_off -s 0 -d $max_off file" copy
> > > ....
> > >    openat(AT_FDCWD, "file", O_RDONLY)      = 4
> > >    copy_file_range(4, [0], 3, [9223372036854710271], 65537, 0) = 65536
> > >    copy_file_range(4, [65536], 3, [9223372036854775807], 1, 0) = -1 EFBIG (File too large)
> > > ....
> > > 
> > > xfsprogs used a loop to call copy_file_range, and get EFBIG when pos greater than LLONG_MAX.
> > > 
> > > I think we should  use tst_max_lfs_filesize instead of (tst_max_lfs_filesize -MIN_OFF)
> > > and this case will pass whether xfs,btrfs and ext4.
> > Good job, Xu. I think you can format a new patch to fix this problem.
> > Because Petr's patch is used for solving the cross-compiling issue and
> > looks good.
> Hi Li
> 
> OK. I will send a new patch to fix this problem. But copy_file_range02.c still has a problem as Murphy found,
> we set all_filesystem but use the same tmpdir instead of mntpoint.  I think we can remove all_filesystem and mountpoint.
> 
> @Murphy Zhou  Hi Murphy, would you like to send a new patch to remove useless all_filesystem or I do it in my
> new patch by adding your signed-off-by tag? What do you think about it?

You can go ahead and do it. Thank you!

M
> 
> > @Petr Vorel Hi Petr, what do you think? any more comments?
> > 
> 
> 
> 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
