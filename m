Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F3CA812A6
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 18:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1744130608; h=date : to :
 message-id : mime-version : in-reply-to : subject : list-id :
 list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=BLegjlH8H2eCddqX/9ll24yFTyijt+KhpouTU2i+H6k=;
 b=Ml+fnDwQuf/y+pIAsXPISny1BVfwR4HbANEAYJZMWmf2i5PjjciRa+cCQpn3KxNAIf1X6
 IO2q0hq1OSct6FYkH0LIgnGzP51B8c4hnn6fU2dszzT/5EBlbl0woWoqisbSZ6qWP267To6
 ihG6NR2fIwPkFIAx4EUYuoAjOh6U7O0=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 151033CB38F
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Apr 2025 18:43:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6BE0D3CAC86
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 18:43:13 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25;
 helo=tor.source.kernel.org; envelope-from=djwong@kernel.org;
 receiver=lists.linux.it)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [IPv6:2600:3c04:e001:324:0:1991:8:25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B3E401400F3F
 for <ltp@lists.linux.it>; Tue,  8 Apr 2025 18:43:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9E77268431;
 Tue,  8 Apr 2025 16:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADC9C4CEE5;
 Tue,  8 Apr 2025 16:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744130588;
 bh=YiVE2sQZNSnsy/xycwB0nZFK93qywQx0ei4S9FjDMOQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=fDYn+zxBIYfEHmnGInySkBgaApJPm/4Sihcg1Ut2EGJCPhU6jDWMXmOP9rnEyfEU9
 N0Q52aHW1m3KbWDb5fuWU1qPJ3OLhXIIKfrhF1I2lezhTdcr9+8rR51QLQNsUmLibm
 w64RzLXOnh8Z+mMTRV441TaehiL7QSabeXrFN3xIOvoGoyZJXQ7RfooTjbB4XXiZPF
 xDNTNgc6H5x4Fo+m88xHKYJr0UHBMM293K8P/+3drnl0XBKvvSz2D7h+MMkF7azRFn
 VpicXS+XhYef9PlZcqPcNt0ld5I4iD3dcsIdRcrPU7qXQ3YYM7zTKYiDh23RUmAMfe
 TDzUTWRSLH+KA==
Date: Tue, 8 Apr 2025 09:43:07 -0700
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20250408164307.GK6266@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250331074541.gK4N_A2Q@linutronix.de>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
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
From: "Darrick J. Wong via ltp" <ltp@lists.linux.it>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
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

Hi Luis,

I'm not sure if this is related, but I'm seeing the same "BUG: sleeping
function called from invalid context at mm/util.c:743" message when
running fstests on XFS.  Nothing exciting with fstests here other than
the machine is arm64 with 64k basepages and 4k fsblock size:

MKFS_OPTIONS="-m metadir=1,autofsck=1,uquota,gquota,pquota"

--D

[18182.889554] run fstests generic/457 at 2025-04-07 23:06:25
[18182.973535] spectre-v4 mitigation disabled by command-line option
[18184.849467] XFS (sda3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18184.852941] XFS (sda3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18184.852962] XFS (sda3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18184.858065] XFS (sda3): Mounting V5 Filesystem 13d8c72d-ddac-4052-8d3c-a82c4ce0377d
[18184.900002] XFS (sda3): Ending clean mount
[18184.905990] XFS (sda3): Quotacheck needed: Please wait.
[18184.919801] XFS (sda3): Quotacheck: Done.
[18184.954170] XFS (sda3): Unmounting Filesystem 13d8c72d-ddac-4052-8d3c-a82c4ce0377d
[18186.165572] XFS (dm-4): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18186.165601] XFS (dm-4): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18186.165608] XFS (dm-4): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18186.169589] XFS (dm-4): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18187.121289] XFS (dm-4): Ending clean mount
[18187.131797] XFS (dm-4): Quotacheck needed: Please wait.
[18187.145700] XFS (dm-4): Quotacheck: Done.
[18187.393486] XFS (dm-4): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18190.592061] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18190.592083] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18190.592089] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18190.601815] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18190.744215] XFS (dm-3): Starting recovery (logdev: internal)
[18190.807553] XFS (dm-3): Ending recovery (logdev: internal)
[18190.818708] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18193.786621] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18193.788879] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18193.788882] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18193.790518] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18193.877969] XFS (dm-3): Starting recovery (logdev: internal)
[18193.917688] XFS (dm-3): Ending recovery (logdev: internal)
[18193.945675] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18196.985726] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18196.988868] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18196.988873] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18196.998845] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18197.193740] XFS (dm-3): Starting recovery (logdev: internal)
[18197.254119] XFS (dm-3): Ending recovery (logdev: internal)
[18197.280596] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18200.173003] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18200.176855] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18200.176859] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18200.185721] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18200.370893] XFS (dm-3): Starting recovery (logdev: internal)
[18200.430454] XFS (dm-3): Ending recovery (logdev: internal)
[18200.462036] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18203.311440] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18203.311454] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18203.311464] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18203.324374] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18203.437989] XFS (dm-3): Starting recovery (logdev: internal)
[18203.491993] XFS (dm-3): Ending recovery (logdev: internal)
[18203.517090] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18206.442639] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18206.444851] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18206.444854] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18206.455415] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18206.600488] XFS (dm-3): Starting recovery (logdev: internal)
[18206.642538] XFS (dm-3): Ending recovery (logdev: internal)
[18206.673822] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18209.666477] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18209.678778] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18209.678782] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18209.690805] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18209.859688] XFS (dm-3): Starting recovery (logdev: internal)
[18209.923426] XFS (dm-3): Ending recovery (logdev: internal)
[18209.947181] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18212.920991] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18212.921001] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18212.921012] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18212.925332] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18213.067578] XFS (dm-3): Starting recovery (logdev: internal)
[18213.138633] XFS (dm-3): Ending recovery (logdev: internal)
[18213.161827] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18216.154862] XFS (dm-3): EXPERIMENTAL metadata directory tree feature enabled.  Use at your own risk!
[18216.156952] XFS (dm-3): EXPERIMENTAL exchange range feature enabled.  Use at your own risk!
[18216.157070] XFS (dm-3): EXPERIMENTAL parent pointer feature enabled.  Use at your own risk!
[18216.161145] XFS (dm-3): Mounting V5 Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18216.333087] XFS (dm-3): Starting recovery (logdev: internal)
[18216.389192] XFS (dm-3): Ending recovery (logdev: internal)
[18216.410647] XFS (dm-3): Unmounting Filesystem 6ade490d-15b0-43e5-9f17-db534769c746
[18217.949035] BUG: sleeping function called from invalid context at mm/util.c:743
[18217.949047] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 35, name: kcompactd0
[18217.949056] preempt_count: 1, expected: 0
[18217.949058] RCU nest depth: 0, expected: 0
[18217.949060] Preemption disabled at:
[18217.949062] [<fffffe0080339c98>] __buffer_migrate_folio+0xb8/0x2d0
[18217.949070] CPU: 0 UID: 0 PID: 35 Comm: kcompactd0 Not tainted 6.15.0-rc1-acha #rc1 PREEMPT  92ec4d9d73adc951fe6bbe0d3f3b75d35d67fded
[18217.949074] Hardware name: QEMU KVM Virtual Machine, BIOS 1.6.6 08/22/2023
[18217.949075] Call trace:
[18217.949076]  show_stack+0x20/0x38 (C)
[18217.949080]  dump_stack_lvl+0x78/0x90
[18217.949083]  dump_stack+0x18/0x28
[18217.949084]  __might_resched+0x164/0x1d0
[18217.949086]  folio_mc_copy+0x5c/0xa0
[18217.949089]  __migrate_folio.constprop.0+0x70/0x1c8
[18217.949092]  __buffer_migrate_folio+0x2bc/0x2d0
[18217.949094]  buffer_migrate_folio_norefs+0x1c/0x30
[18217.949096]  move_to_new_folio+0x70/0x1f0
[18217.949099]  migrate_pages_batch+0x9c4/0xf20
[18217.949101]  migrate_pages+0xb74/0xde8
[18217.949103]  compact_zone+0x9ac/0xff0
[18217.949105]  compact_node+0x9c/0x1a0
[18217.949107]  kcompactd+0x38c/0x400
[18217.949108]  kthread+0x144/0x210
[18217.949110]  ret_from_fork+0x10/0x20

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
