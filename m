Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F6232299E
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 12:46:16 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 92ABD3C60C3
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Feb 2021 12:46:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 7EB8F3C2AA4
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 12:46:12 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0910C600C74
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 12:46:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C313AE05
 for <ltp@lists.linux.it>; Tue, 23 Feb 2021 11:46:11 +0000 (UTC)
Date: Tue, 23 Feb 2021 12:46:09 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YDTrAVVmOXB98Xjt@pevik>
References: <20210222172043.24294-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222172043.24294-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for possible writev() issues with
 NULL buffer in iovec
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

Hi Martin,

> Fixes #790

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---

> This test triggers temporary write of invalid data into test file on some
> file systems on kernel 4.4.21 and older.

> Changes since v1:
> - Simplify main thread
> - Use atomic load/store when passing read limit between threads (I hope I'm
>   doing it correctly)
> - Check for too big writes just in case
> - Require at least 2 CPUs, the bugs are not reproducible on single-CPU systems

Reviewed-by: Petr Vorel <pvorel@suse.cz>

It takes some time to run due .all_filesystems, but I guess there is a reason to
test it on all available fs.

...
> diff --git a/testcases/kernel/syscalls/writev/writev03.c b/testcases/kernel/syscalls/writev/writev03.c
> new file mode 100644
> index 000000000..58d6931d2
> --- /dev/null
> +++ b/testcases/kernel/syscalls/writev/writev03.c
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2021 SUSE LLC <mdoucha@suse.cz>
> + *
> + * Check for potential issues in writev() if the first iovec entry is NULL
> + * and the next one is not present in RAM. This can result in a brief window
> + * where writev() first writes uninitialized data into the file (possibly
> + * exposing internal kernel structures) and then overwrites it with the real
> + * iovec contents later. Bugs fixed in:
Maybe this doc part should be in * [DESCRIPTION] to get into docparse.

The rest LGTM.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
