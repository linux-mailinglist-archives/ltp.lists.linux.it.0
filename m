Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D7A66DBF
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Mar 2025 09:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1742285742; h=date : to :
 message-id : references : mime-version : in-reply-to : subject :
 list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=TJxk+u4uOdsjdA57W9sbkVPi+EF8zmG62TJKrTzjv4I=;
 b=pfcvM+1r63gXdpdRA8Av0oSL4YKbRHNRy7ZjKzrFO3pouugAs1dd5UH83vTgwkyZkb0Wm
 ZQMO06irO00BAXCDX3cshi2zEWy9PeBdgNus7YtJJ1VVgSuJKVpJ/lHvMK8/3k823VseVfW
 6mqDQobzx2w4fijZ0of/i0q8LuAUayY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6BAEA3CABA8
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Mar 2025 09:15:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EC2883C0636
 for <ltp@lists.linux.it>; Tue, 18 Mar 2025 09:15:39 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org;
 receiver=lists.linux.it)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D90DC6002FF
 for <ltp@lists.linux.it>; Tue, 18 Mar 2025 09:15:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55E1A5C3803;
 Tue, 18 Mar 2025 08:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437FBC4CEF7;
 Tue, 18 Mar 2025 08:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742285735;
 bh=GOH2xhBMFEGxfM//+pfgHfqRcH9vIbAtgCXTwxoE1Ho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7iH4LeN+716af4PfUJBivMp2JUJYhen3EN0YQl2FGbyklx2tQQ2YFcrUPPhf5Mtm
 dSGhh+YQ0IefTEwBuLWM3HwoegS3SJd7n2uJEDYWuF3vyjUCQ20UAluQBiERAx02Gz
 pYg7xGldrQMQoR7D+Or3umeWBNlKRpgYh8VfQP6lzRZ2mIu5dWklhKW/91d/6QuAMI
 ImOnVNQpZmEdLLX7eBvBA2ohVkItfGeoapQf2WYO7CcqmQRyTimERLwvYA1giFPQZ6
 e+HKFbcwu5pxjuylOEmtE646RTeT+wZhKk+i3f9yESb18fCDVGUc0+5Y5nCfLj66yw
 D2S5huFjlb1bA==
Date: Tue, 18 Mar 2025 01:15:33 -0700
To: Oliver Sang <oliver.sang@intel.com>, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Message-ID: <Z9krpfrKjnFs6mfE@bombadil.infradead.org>
References: <202503101536.27099c77-lkp@intel.com>
 <20250311-testphasen-behelfen-09b950bbecbf@brauner>
 <Z9kEdPLNT8SOyOQT@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9kEdPLNT8SOyOQT@xsang-OptiPlex-9020>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Daniel Gomez <da.gomez@samsung.com>,
 Christian Brauner <brauner@kernel.org>, lkp@intel.com,
 John Garry <john.g.garry@oracle.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.de>, oe-lkp@lists.linux.dev, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Mar 18, 2025 at 01:28:20PM +0800, Oliver Sang wrote:
> hi, Christian Brauner,
> 
> On Tue, Mar 11, 2025 at 01:10:43PM +0100, Christian Brauner wrote:
> > On Mon, Mar 10, 2025 at 03:43:49PM +0800, kernel test robot wrote:
> > > 
> > > 
> > > Hello,
> > > 
> > > kernel test robot noticed "BUG:sleeping_function_called_from_invalid_context_at_mm/util.c" on:
> > > 
> > > commit: 3c20917120ce61f2a123ca0810293872f4c6b5a4 ("block/bdev: enable large folio support for large logical block sizes")
> > > https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> > 
> > Is this also already fixed by:
> > 
> > commit a64e5a596067 ("bdev: add back PAGE_SIZE block size validation for sb_set_blocksize()")
> > 
> > ?
> 
> sorry for late.
> 
> commit a64e5a596067 cannot fix the issue. one dmesg is attached FYI.
> 
> we also tried to check linux-next/master tip, but neither below one can boot
> successfully in our env which we need further check.
> 
> da920b7df70177 (tag: next-20250314, linux-next/master) Add linux-next specific files for 20250314
> 
> e94bd4ec45ac1 (tag: next-20250317, linux-next/master) Add linux-next specific files for 20250317
> 
> so we are not sure the status of latest linux-next/master.
> 
> if you want us to check other commit or other patches, please let us know. thanks!

I cannot reproduce the issue by running the LTP test manually in a loop
for a long time:

export LTP_RUNTIME_MUL=2

while true; do \
	./testcases/kernel/syscalls/close_range/close_range01; done

What's the failure rate of just running the test alone above?
Does it always fail on this system? Is this a deterministic failure
or does it have a lower failure rate?

I also can't see how the patch ("("block/bdev: enable large folio
support for large logical block sizes") would trigger this.

You could try this patch but ...

https://lore.kernel.org/all/20250312050028.1784117-1-mcgrof@kernel.org/

we decided this is not right and not needed, and if we have a buggy
block driver we can address that.

I just can't see how this LTP test actually doing anything funky with block
devices at all.

The associated sleeping while atomic warning is triggered during
compaction though:

[  218.143642][  T299] Architecture:                         x86_64
[  218.143659][  T299] 
[  218.427851][   T51] BUG: sleeping function called from invalid context at mm/util.c:901
[  218.435981][   T51] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 51, name: kcompactd0
[  218.444773][   T51] preempt_count: 1, expected: 0
[  218.449601][   T51] RCU nest depth: 0, expected: 0
[  218.454476][   T51] CPU: 2 UID: 0 PID: 51 Comm: kcompactd0 Tainted: G S                 6.14.0-rc1-00006-g3c20917120ce #1
[  218.454486][   T51] Tainted: [S]=CPU_OUT_OF_SPEC
[  218.454488][   T51] Hardware name: Hewlett-Packard HP Pro 3340 MT/17A1, BIOS 8.07 01/24/2013
[  218.454492][   T51] Call Trace:
[  218.454495][   T51]  <TASK>
[  218.454498][   T51]  dump_stack_lvl+0x4f/0x70
[  218.454508][   T51]  __might_resched+0x2c6/0x450
[  218.454517][   T51]  folio_mc_copy+0xca/0x1f0
[  218.454525][   T51]  ? _raw_spin_lock+0x81/0xe0
[  218.454532][   T51]  __migrate_folio+0x11a/0x2d0
[  218.454541][   T51]  __buffer_migrate_folio+0x558/0x660
[  218.454548][   T51]  move_to_new_folio+0xf5/0x410
[  218.454555][   T51]  migrate_folio_move+0x211/0x770
[  218.454562][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454572][   T51]  ? __pfx_migrate_folio_move+0x10/0x10
[  218.454578][   T51]  ? compaction_alloc_noprof+0x441/0x720
[  218.454587][   T51]  ? __pfx_compaction_alloc+0x10/0x10
[  218.454594][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454601][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454607][   T51]  ? migrate_folio_unmap+0x329/0x890
[  218.454614][   T51]  migrate_pages_batch+0xddf/0x1810
[  218.454621][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454631][   T51]  ? __pfx_migrate_pages_batch+0x10/0x10
[  218.454638][   T51]  ? cgroup_rstat_updated+0xf1/0x860
[  218.454648][   T51]  migrate_pages_sync+0x10c/0x8e0
[  218.454656][   T51]  ? __pfx_compaction_alloc+0x10/0x10
[  218.454662][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454669][   T51]  ? lru_gen_del_folio+0x383/0x820
[  218.454677][   T51]  ? __pfx_migrate_pages_sync+0x10/0x10
[  218.454683][   T51]  ? set_pfnblock_flags_mask+0x179/0x220
[  218.454691][   T51]  ? __pfx_lru_gen_del_folio+0x10/0x10
[  218.454699][   T51]  ? __pfx_compaction_alloc+0x10/0x10
[  218.454705][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454713][   T51]  migrate_pages+0x846/0xe30
[  218.454720][   T51]  ? __pfx_compaction_alloc+0x10/0x10
[  218.454726][   T51]  ? __pfx_compaction_free+0x10/0x10
[  218.454733][   T51]  ? __pfx_buffer_migrate_folio_norefs+0x10/0x10
[  218.454740][   T51]  ? __pfx_migrate_pages+0x10/0x10
[  218.454748][   T51]  ? isolate_migratepages+0x32d/0xbd0
[  218.454757][   T51]  compact_zone+0x9e1/0x1680
[  218.454767][   T51]  ? __pfx_compact_zone+0x10/0x10
[  218.454774][   T51]  ? _raw_spin_lock_irqsave+0x87/0xe0
[  218.454780][   T51]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  218.454788][   T51]  compact_node+0x159/0x250
[  218.454795][   T51]  ? __pfx_compact_node+0x10/0x10
[  218.454807][   T51]  ? __pfx_extfrag_for_order+0x10/0x10
[  218.454814][   T51]  ? __pfx_mutex_unlock+0x10/0x10
[  218.454822][   T51]  ? finish_wait+0xd1/0x280
[  218.454831][   T51]  kcompactd+0x582/0x960
[  218.454839][   T51]  ? __pfx_kcompactd+0x10/0x10
[  218.454846][   T51]  ? _raw_spin_lock_irqsave+0x87/0xe0
[  218.454852][   T51]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  218.454858][   T51]  ? __pfx_autoremove_wake_function+0x10/0x10
[  218.454867][   T51]  ? __kthread_parkme+0xba/0x1e0
[  218.454874][   T51]  ? __pfx_kcompactd+0x10/0x10
[  218.454880][   T51]  kthread+0x3a1/0x770
[  218.454887][   T51]  ? __pfx_kthread+0x10/0x10
[  218.454895][   T51]  ? __pfx_kthread+0x10/0x10
[  218.454902][   T51]  ret_from_fork+0x30/0x70
[  218.454910][   T51]  ? __pfx_kthread+0x10/0x10
[  218.454915][   T51]  ret_from_fork_asm+0x1a/0x30
[  218.454924][   T51]  </TASK>

So the only thing I can think of the patch which the patch can do is
push more large folios to be used and so compaction can be a secondary
effect which managed to trigger another mm issue. I know there was a
recent migration fix but I can't see the relationship at all either.

  Luis

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
