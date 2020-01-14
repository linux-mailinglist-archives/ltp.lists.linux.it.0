Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7D13A29D
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 09:14:56 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 55A503C23A3
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jan 2020 09:14:56 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 25F6C3C2033
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 09:14:52 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A9F8610019D3
 for <ltp@lists.linux.it>; Tue, 14 Jan 2020 09:14:51 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E139AC50;
 Tue, 14 Jan 2020 08:14:51 +0000 (UTC)
Date: Tue, 14 Jan 2020 09:14:49 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Zorro Lang <zlang@redhat.com>, Cyril Hrubis <chrubis@suse.cz>,
 Jan Stancek <jstancek@redhat.com>, Li Wang <liwang@redhat.com>
Message-ID: <20200114081449.GB3468@dell5510>
References: <20191209160227.16125-1-zlang@redhat.com>
 <20191226072338.GH14328@dhcp-12-102.nay.redhat.com>
 <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200113153141.GA14282@dhcp-12-102.nay.redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Zorro,

> > It's been several weeks passed. Is there more review points?

> ping again ... is there anything block this patch review?
Here are my comments to your v3 review [1]. Some of them are now irrelevant
as you're fixed them in v3 (Cyril ones from v1).

So it might be just .dev_fs_flags = TST_FS_SKIP_FUSE and tiny style fixes like
is_mounted = 0. I wanted to fix them myself and merge, but didn't find a time.
Sending v4 where you fix/implement suggestions generally helps speedup merging
(as I already told you) :).

The real question is whether to merge this before release. I'd like it to be in
the release, but it depends on other maintainers opinion.
Cyril, Jan, Li? WDYT?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/patch/1206389/#2333978

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
