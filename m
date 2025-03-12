Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F067A5D5AB
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Mar 2025 06:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1741758268; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=+iHhS/Flod2DLVeaoH0JZkBoRa/S/5oal/Me04efT0Y=;
 b=PxpG7aMFEB3zU9K9Eeb2aa054r1HvyEcWx5GX8s9oWrdVb68Wd/LsOor2cA3VlN50C7Ws
 DvKap9+/3zOlv5CKr5OZe+OH6F/uzSyvYtTxKBcl02s5nIKcn3UcBTea6S5sUI/FIQmytXu
 YG4v/K9OW7WQsp/9siQkqcrgnKwr6JQ=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0641C3CA3E6
	for <lists+linux-ltp@lfdr.de>; Wed, 12 Mar 2025 06:44:28 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4EF8D3CA344
 for <ltp@lists.linux.it>; Wed, 12 Mar 2025 06:44:14 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org;
 receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A18A60063D
 for <ltp@lists.linux.it>; Wed, 12 Mar 2025 06:44:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 811555C30B4;
 Wed, 12 Mar 2025 05:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F770C4CEE3;
 Wed, 12 Mar 2025 05:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741758251;
 bh=xZJOc5XyyMym8hnBaWHbYKIhBmxjzcDArBveIIsMQaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICeOF2epMNoffeQ3REYCIW93hpTuJ2Sj4xX0l2wWnvQWl6oEOKD8dyiYJgHNexqfH
 kwmoltpD4B4hjxY4VJ8rtKV00O5gfg+O11VC02S9n6VqlSwJZ3ATubAwqzPl11nj53
 HXIGdEQ8AjcSNSbu7dOugnu6tp8myqa/9ZexcN59FMbbG/moBfpsXLeVMQlLpSNVtC
 wp7zwmWI5h2FPeJvfvHx4rY+0mqVSqtZvMIH2KsOPhk+q8XnBbNvvOsYwJEc0dH7r2
 bCLp2GzVEZjOQaay5zOlb4RJbAmYrKmu1BTxRdHrOL/D8bi9ihKW3YgT1k1PKPKXuv
 0eKWlA7+ygwOg==
Date: Tue, 11 Mar 2025 22:44:09 -0700
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Z9EfKXH6w8C0arzb@bombadil.infradead.org>
References: <20250312050028.1784117-1-mcgrof@kernel.org>
 <20250312052155.GA11864@lst.de>
 <Z9Edl05uSrNfgasu@bombadil.infradead.org>
 <20250312054053.GA12234@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250312054053.GA12234@lst.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
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

On Wed, Mar 12, 2025 at 06:40:53AM +0100, Christoph Hellwig wrote:
> On Tue, Mar 11, 2025 at 10:37:27PM -0700, Luis Chamberlain wrote:
> > > If you need extra per-driver validatation, do it in the driver.
> > 
> > Are you suggesting we just move back the PAGE_SIZE check,
> 
> PAGE_SIZE now is a consumer (i.e. file system) limitation.  Having
> a flag in the provider (driver) does not make sense.
> 
> > or to keep
> > the checks for the block driver limits into each driver?
> 
> Most drivers probably don't have a limit other than than that implicit
> by the field width used for reporting.  So in general the driver should
> not need any checks.  The only exceptions might be for virtual drivers
> where the value comes from userspace, but even then it is a bit doubtful.

Alrighty, so silly tests just need to be updated. If a hang is reported,
we can look into it, or just add block driver checks / limitations.

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
