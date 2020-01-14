Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF1413A4B6
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 10:58:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8240A3C2368
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 10:58:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F152E3C0ECB
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 10:58:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 005842013F6
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 10:58:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 537C9ACAE;
 Tue, 14 Jan 2020 09:58:06 +0000 (UTC)
Date: Tue, 14 Jan 2020 10:58:04 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, Jan Stancek <jstancek@redhat.com>,
 Li Wang <liwang@redhat.com>, ltp@lists.linux.it
Message-ID: <20200114095804.GA9211@dell5510>
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
 <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
 <20200114081449.GB3468@dell5510>
 <20200114093633.GD14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114093633.GD14282@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/newmount: new test case for new mount
 API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> > > ping again ... is there anything block this patch review?
> > Here are my comments to your v3 review [1]. Some of them are now irrelevant
> > as you're fixed them in v3 (Cyril ones from v1).

> Wow, now I know why I didn't get any response for such long time. The emails
> from you and Cyril were all sent to mail list, not to/cc me. I didn't pay so
> much attention to the mail list. Sorry about that.
OK good :). I'm sorry to forget to Cc you in some of my replies (I usually pay
attention to Cc people). It's also safer to look at ML or patchwork as this
sometimes happen :).

> > So it might be just .dev_fs_flags = TST_FS_SKIP_FUSE and tiny style fixes like
> > is_mounted = 0. I wanted to fix them myself and merge, but didn't find a time.
> > Sending v4 where you fix/implement suggestions generally helps speedup merging
> > (as I already told you) :).

> I'll read your review points, and send a V4 tonight.
Thanks a lot!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
