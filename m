Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7A3086B1
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 08:50:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BD4CC3C77DB
	for <lists+linux-ltp@lfdr.de>; Fri, 29 Jan 2021 08:50:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 4B7983C2F7A
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 08:50:13 +0100 (CET)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 845F16019A8
 for <ltp@lists.linux.it>; Fri, 29 Jan 2021 08:50:09 +0100 (CET)
IronPort-SDR: DtlW5DstuGbXqb/ka7mD1M1OSDhYWNh7Vx1wILXBirn51eKCdlgK0Kl2uK6msOuNgIghSER4ir
 4j5DelnFBBBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="244469962"
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="244469962"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 23:50:03 -0800
IronPort-SDR: ZWufvdLxqWhtNoJddEVC92Qewkv4HYX+jv714KlxUzkLMnrZMpATCBqw3+l6VUPm6tnMxWzh8O
 EcMkBkkVeheQ==
X-IronPort-AV: E=Sophos;i="5.79,384,1602572400"; d="scan'208";a="389203998"
Received: from xsang-optiplex-9020.sh.intel.com (HELO xsang-OptiPlex-9020)
 ([10.239.159.140])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 23:50:00 -0800
Date: Fri, 29 Jan 2021 16:05:58 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20210129080557.GB13077@xsang-OptiPlex-9020>
References: <20210106075112.1593084-1-geert@linux-m68k.org>
 <20210126055112.GA19582@xsang-OptiPlex-9020>
 <CAMuHMdUFsRSCDJeML+0i17ig6oFr+-cz660xyhkhkfg2UtPTzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFsRSCDJeML+0i17ig6oFr+-cz660xyhkhkfg2UtPTzQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [binfmt_elf] d97e11e25d: ltp.DS000.fail
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
Cc: 0day robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 lkp@lists.01.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Jan 26, 2021 at 09:03:26AM +0100, Geert Uytterhoeven wrote:
> Hi Oliver,
> 
> On Tue, Jan 26, 2021 at 6:35 AM kernel test robot <oliver.sang@intel.com> wrote:
> > FYI, we noticed the following commit (built with gcc-9):
> >
> > commit: d97e11e25dd226c44257284f95494bb06d1ebf5a ("[PATCH v2] binfmt_elf: Fix fill_prstatus() call in fill_note_info()")
> > url: https://github.com/0day-ci/linux/commits/Geert-Uytterhoeven/binfmt_elf-Fix-fill_prstatus-call-in-fill_note_info/20210106-155236
> > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> 
> My patch (which you applied on top of v5.11-rc2) is a build fix for
> a commit that is not part of v5.11-rc2.  Hence the test run is invalid.

sorry for false report. we've fixed the problem. Thanks

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
