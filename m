Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D25A5D5A5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Mar 2025 06:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1741757866; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=upZgZbnsbstmvjRXj4hbWItqizow9+It4kBvxqVXD0w=;
 b=HQpSkgfPerFyT0BKu40dUEN5xE+MfKmit8gZm9QZ84a41o9FMC7cEoCwHmpCr7lanKR4G
 hSAWtd7N7wKLyeHolD12BrnE2dXKhu+Sv7DCQvWyxrN++4PCIPWKjDJ/7T3k4tLSBaS9HM8
 ZUBbLLV0tI7E1+EPwIX2AzprLSAyamI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BAA133CA40C
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Mar 2025 06:37:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0BD73C7314
 for <ltp@lists.linux.it>; Wed, 12 Mar 2025 06:37:33 +0100 (CET)
Authentication-Results: in-5.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org;
 receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 77F116005CB
 for <ltp@lists.linux.it>; Wed, 12 Mar 2025 06:37:31 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AE1B5C10F9;
 Wed, 12 Mar 2025 05:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8D2C4CEEB;
 Wed, 12 Mar 2025 05:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741757849;
 bh=+rIAL/oWsgOB2TGRmaZ8ZbLCHRWW5v1eoOMuTtDSZgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2RgZZ4kal9f5rieX5K/gzYBxCQRsBQ9x3wU9YyjAVsc372TlECvNMJan4jyb/0q8
 W762u1PAYQZNHJ1zgALDq5cb8S3B3G8Etp5RCu375CuqJZRseuK3NT9/eFYttXiPw+
 uA99K3zIIHGWGQyLIhm8mQDZzDuVk7h9LktEws4reqlosi/fohEkaXI0zqkH1U7Hxu
 iR5c3cC7qM2KZ/pRMx/o/Ol1yUcoyB11qUK9l3e+l/H0eMHCOVaa4TXoHxzXXdx4k1
 S9BTPZfY51iecFPax2AWY6EE5rr5/zFP0VqppVo0FIwd8d3l4jUpWSFDSVWx6nql4m
 f7hbBaVZ7KO2g==
Date: Tue, 11 Mar 2025 22:37:27 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Z9Edl05uSrNfgasu@bombadil.infradead.org>
References: <20250312050028.1784117-1-mcgrof@kernel.org>
 <20250312052155.GA11864@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250312052155.GA11864@lst.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] block: add BLK_FEAT_LBS to check for PAGE_SIZE
 limit
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
From: Luis Chamberlain via ltp <ltp@lists.linux.it>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: p.raghav@samsung.com, ritesh.list@gmail.com, brauner@kernel.org,
 lkp@intel.com, kernel@pankajraghav.com, john.g.garry@oracle.com,
 da.gomez@samsung.com, djwong@kernel.org, david@fromorbit.com,
 oe-lkp@lists.linux.dev, willy@infradead.org, linux-fsdevel@vger.kernel.org,
 linux-block@vger.kernel.org, hare@suse.de, gost.dev@samsung.com,
 kbusch@kernel.org, oliver.sang@intel.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Mar 12, 2025 at 06:21:55AM +0100, Christoph Hellwig wrote:
> On Tue, Mar 11, 2025 at 10:00:28PM -0700, Luis Chamberlain wrote:
> > We should take time to validate each block driver before enabling
> > support for larger logical block sizes, so that those that didn't
> > have support stay that way and don't need modifications.
> > 
> > Li Wang reported this as a regression on LTP via:
> > 
> > testcases/kernel/syscalls/ioctl/ioctl_loop06
> > 
> > Which uses the loopback driver to enable larger logical block sizes
> > first with LOOP_CONFIGURE and then LOOP_SET_BLOCK_SIZE. While
> > I see no reason why the loopback block driver can't support
> > larger logical block sizes than PAGE_SIZE, leave this validation
> > step as a secondary effort for each block driver.
> 
> This doesn't really make sense.  We don't want a flag that caps driver
> controlled values at a arbitrary value (and then not used it at all in
> the patch).
> 
> If you need extra per-driver validatation, do it in the driver.

Are you suggesting we just move back the PAGE_SIZE check, or to keep
the checks for the block driver limits into each driver?

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
