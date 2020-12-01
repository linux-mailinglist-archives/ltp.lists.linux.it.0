Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBCD2CAA0B
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:46:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8C6E63C736B
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Dec 2020 18:46:30 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 989203C6389
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:46:26 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 862001A00EAF
 for <ltp@lists.linux.it>; Tue,  1 Dec 2020 18:46:25 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7A88AC2D;
 Tue,  1 Dec 2020 17:46:24 +0000 (UTC)
Date: Tue, 1 Dec 2020 18:46:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <X8aBb86Z2+SYp0sr@pevik>
References: <20201201174214.24625-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201201174214.24625-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 00/10] Introduce SAFE_FANOTIFY_MARK() macro +
 cleanup
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

Hi Amir,

> Changes v4->v5:
...
> Petr Vorel (10):
>   fanotify12: Drop incorrect hint
>   fanotify: Add helper for access permission check
>   fanotify: Add helper for event support check
>   fanotify: Add helper for FAN_REPORT_FID support on fs
>   fanotify16: Test also on FUSE
>   fanotify: Add helper for mark support check
>   fanotify: Introduce SAFE_FANOTIFY_MARK() macro
>   fanotify: Use tst_brk_ in safe_fanotify_init()
>   fanotify: Add a pedantic check for return value

>   fanotify: Cleanup <sys/fanotify.h> use
I omit v5 from this patchset [1], it should have been part of v5.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20201201174214.24625-11-pvorel@suse.cz/
[2] https://patchwork.ozlabs.org/project/ltp/list/?series=217855&state=*

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
