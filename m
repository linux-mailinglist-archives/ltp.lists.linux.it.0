Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D939A81465
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 20:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744136313; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=uVvqRn5twgAEKLR31Qn7gVjL9qqup2tJhBhoKF2OfL4=;
 b=p2prMeu6SacY3qhKhHvXfWb2BzQDisJdtnHNHNfZkn5eZV8DvijQfmpLRlHwh0DZaqcT6
 YcvOh6ySAUj/AutNTpDt6XqSeiHVFz3wKKi+J6xAG8OG0FHYuAKskVQXsjSBNIEI6dPQmpO
 Sjtet8yXSUwzGl5PsWJPI+WgMR3aWtY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BC853CB3CC
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 20:18:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D7B143CB379
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 19:06:50 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=mcgrof@kernel.org; receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 16B541400F3F
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 19:06:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 80D145C3994;
 Tue,  8 Apr 2025 17:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75D0C4CEE5;
 Tue,  8 Apr 2025 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744132007;
 bh=/3eBMgubv0Yka0P/WzdDOXB50+TOIWFo5UCsRYv5O6Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RwD72MB+BLnSoW4IRomJp7Ix0Bjzj4kV+VhvB0wuUGsxqlzuVsRsQsocnqYiQUwdt
 +31xpEKLmAjD/rDiUgNxpng4/1mhIqwM0gmMZgoBDuQdFhb3OILdr9wPBtIcwi6WGd
 KQuiv/YxK6+xoFs1un5HzHmCG5i2X2L/p/USUzcH60z1/4nmmEDKI8gCy+9KbAtjen
 o83YtH3vHx4ew7p5JAkCmQ0sQvzLVGhyDm7PA6YEc9Xi0HPweYqtgNtcB3RMcVBjd9
 cdIIlqMXA+tuhAkRqxDvAHIRZ95wXGWoDHFD66LrEThTktBuifVsVEb/82Oo8mKM4D
 GmfjnfjwmCVCQ==
Date: Tue, 8 Apr 2025 10:06:44 -0700
To: "Darrick J. Wong" <djwong@kernel.org>, David Bueso <dave@stgolabs.net>
Message-ID: <Z_VXpD-d8iC57dBc@bombadil.infradead.org>
References: <20250331074541.gK4N_A2Q@linutronix.de>
 <20250408164307.GK6266@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250408164307.GK6266@frogsfrogsfrogs>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Mailman-Approved-At: Tue, 08 Apr 2025 20:18:21 +0200
Subject: Re: [LTP] [linux-next:master] [block/bdev] 3c20917120:
 BUG:sleeping_function_called_from_invalid_context_at_mm/util.c
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
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, Dave Chinner <david@fromorbit.com>,
 linux-mm@kvack.org, David Bueso <dave@stgolabs.net>, lkp@intel.com,
 gost.dev@samsung.com, Alistair Popple <apopple@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Pankaj Raghav <p.raghav@samsung.com>,
 John Garry <john.g.garry@oracle.com>, Daniel Gomez <da.gomez@samsung.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Hannes Reinecke <hare@suse.de>,
 ltp@lists.linux.it, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, Tso Ted <tytso@mit.edu>,
 Oliver Sang <oliver.sang@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 08, 2025 at 09:43:07AM -0700, Darrick J. Wong wrote:
> Hi Luis,
> 
> I'm not sure if this is related, but I'm seeing the same "BUG: sleeping
> function called from invalid context at mm/util.c:743" message when
> running fstests on XFS.  Nothing exciting with fstests here other than
> the machine is arm64 with 64k basepages and 4k fsblock size:

How exotic :D

> MKFS_OPTIONS="-m metadir=1,autofsck=1,uquota,gquota,pquota"
> 
> --D
> 
> [18182.889554] run fstests generic/457 at 2025-04-07 23:06:25

Me and Davidlohr have some fixes brewed up now, before we post we just
want to run one more test for metrics on success rate analysis for folio
migration. Other than that, given the exotic nature of your system we'll
Cc you on preliminary patches, in case you can test to see if it also
fixes your issue. It should given your splat is on the buffer-head side
of things! See _buffer_migrate_folio() reference on the splat. Fun
puzzle for the community is figuring out *why* oh why did a large folio
end up being used on buffer-heads for your use case *without* an LBS
device (logical block size) being present, as I assume you didn't have
one, ie say a nvme or virtio block device with logical block size  >
PAGE_SIZE. The area in question would trigger on folio migration *only*
if you are migrating large buffer-head folios. We only create those if
you have an LBS device and are leveragin the block device cache or a
filesystem with buffer-heads with LBS (they don't exist yet other than
the block device cache).

Regardless, the patches we have brewed up should fix this, regardless
of the puzzle described above. We'll cc you for testing before we
post patches to address this.

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
