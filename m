Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF9858AE
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:46:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 558AD3C1D1D
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Aug 2019 05:46:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 5C6D93C1826
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:46:32 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 238F5140074F
 for <ltp@lists.linux.it>; Thu,  8 Aug 2019 05:46:31 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id n190so2463064pgn.0
 for <ltp@lists.linux.it>; Wed, 07 Aug 2019 20:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pzXtPRlMum0DW21qy61NSwSMMERmj2eVuSmTIJ63eQQ=;
 b=lXBPS+B4PrcFGCY8VKGHWqGQfLbQn6mRh94CgrVmSTlcWMg1+TFfODouhyOniI895B
 PJ04kh+zKs9EZBZjCkUsYwcBEbxVVQ697cTokii1cOOajOhEn9h8WxFh+c+GLR6dLZgq
 Fb6qI75MxOUPPcUgGQoPwbvl93Rb+0MFOHC0bEq1hFdztatzTWR86BlXQFGJWdP5XGvm
 Kf86BihViVREIL7Dc3lL6TV6PCqlVJmQHczLg/sJlzNFpIStsbnedtKLzYQhTE4hBcV6
 rgjqbCpgj2fm9LdHvuKkKq2P4vXR1ItsgExK3qEYYzepoAJlghBKc5BhTHfHL61J4Ilg
 pZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pzXtPRlMum0DW21qy61NSwSMMERmj2eVuSmTIJ63eQQ=;
 b=shUilV2qX5ym9Zt8PD5x8BPfx8eE+EahlpivoUGW2woCK2IketGQMxyerzR04X3leP
 RXsPujNaTXZVUecO1+seVAbzmv7+GVeQw1JiwYh97X5U8Hb5xi207aK9bUzTcNl6Opyv
 ftE8kGe5rfWVjA0NwgmwU3iHT/cVkbBE9vGi9PS5O6mMMn9l3kfc9BeH5jD37IVrX6gJ
 kPqjAwlgdm0X6SJ03SGCOntIo/MNDoHdJBf60iebUsM+rNiBhI8R1iMfpfJ2YHAiRWP+
 f4PKZlwZcRcYE9eKGHYFjQNz9NerYdkszh2/cwlcxUtaKZe4K7HC6InbScj0imKxCfnw
 1wxg==
X-Gm-Message-State: APjAAAUupOGdhDCAnht4eFAcbxLim+zb6gF3ZcbKjw7GEDi5CPfz31ja
 fR/aRtKL61pFCVOcHOHYWj0=
X-Google-Smtp-Source: APXvYqyoeDARMatIQv2ibw2RT05rPz8mU+mmKmbD87Obsv7lm5AZQrpF6FT/bvBuydiJpmKCAwrmng==
X-Received: by 2002:a17:90a:2506:: with SMTP id
 j6mr1791042pje.129.1565235989435; 
 Wed, 07 Aug 2019 20:46:29 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id g66sm91229867pfb.44.2019.08.07.20.46.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 20:46:28 -0700 (PDT)
Date: Thu, 8 Aug 2019 11:46:21 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <20190808034621.e7pqwazdqtsed2ew@XZHOUW.usersys.redhat.com>
References: <20190730110555.GB7528@rei.lan>
 <1564569629-2358-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1564569629-2358-3-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20190805065832.ti6vpoviykfaxcj7@XZHOUW.usersys.redhat.com>
 <5D47D6B9.9090306@cn.fujitsu.com>
 <20190805102211.pvyufepn6xywi7vm@XZHOUW.usersys.redhat.com>
 <20190806162703.GA1333@dell5510>
 <20190807101742.mt6tgowsh4xw5hyt@XZHOUW.usersys.redhat.com>
 <20190807121212.GM7777@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807121212.GM7777@dread.disaster.area>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
Cc: linux-xfs@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Aug 07, 2019 at 10:12:12PM +1000, Dave Chinner wrote:
> On Wed, Aug 07, 2019 at 06:17:42PM +0800, Murphy Zhou wrote:
> > ccing linux-xfs@vger.kernel.org
> > 
> > Hi,
> > 
> > Tracked down this to be a xfs specific issue:
> > 
> > If we call copy_file_range with a large offset like this:
> > 
> > 	loff_t off = 9223372036854710270; // 2 ** 63
> > 	ret = copy_file_range(fd_in, 0, fd_out, &off, 65537, 0);
> 
> That's not 2**63:

Ya! I was looking too roughly.

> 
> $ echo $((9223372036854710270 + 65537))
> 9223372036854775807
> 
> $ echo $((2**63 - 1))
> 9223372036854775807
> 
> i.e. it's LLONG_MAX, not an overflow. XFS sets sb->s_maxbytes in
> xfs_max_file_offset to:
> 
> 	(1 << BITS_PER_LONG - 1) - 1 = 2**63 - 1 = LLONG_MAX.
> 
> So no matter how we look at it, this operation should not return
> EFBIG on XFS.
> 
> > (test programme cfrbig.c attached)
> > 
> > xfs has it done successfully, while ext4 returns EFBIG.
> 
> ext4 has a max file size of 2**32 * blocksize, so it doesn't support
> files larger than 16TB. So it will give EFBIG on this test.
> 
> /me compiles and runs the test program on his workstation:
> 
> $ ls -l foobar
> -rw------- 1 dave dave 10737418240 Apr 12 14:46 foobar
> $ ./a.out foobar bar
> ret 65537
> $ ls -l bar
> -rw-r--r-- 1 dave dave 9223372036854775807 Aug  7 22:11 bar
> $
> 
> That looks like a successful copy to me, not EINVAL or EFBIG...

Thanks Dave for the confirmation! This testcase needs some fix.

Murphy

> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
