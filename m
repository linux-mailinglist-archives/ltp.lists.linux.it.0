Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ADECB361CD3
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:30:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4E0CF3C1CBE
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 11:30:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF2D63C1AB6
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:30:19 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 191CE1000796
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 11:30:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0FE74AF33;
 Fri, 16 Apr 2021 09:30:18 +0000 (UTC)
Date: Fri, 16 Apr 2021 11:19:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YHlWqG3x4Ea0EGfH@yuki>
References: <20210415063518.174631-1-xieziyao@huawei.com>
 <20210415063518.174631-2-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415063518.174631-2-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/chown: rewrite chown/chown01.c
 with the new api
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with two changes, thanks.

> diff --git a/testcases/kernel/syscalls/chown/chown01.c b/testcases/kernel/syscalls/chown/chown01.c
> index 2e42153d6..c4898c53a 100644
> --- a/testcases/kernel/syscalls/chown/chown01.c
> +++ b/testcases/kernel/syscalls/chown/chown01.c
> @@ -1,179 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of version 2 of the GNU General Public License as
> - * published by the Free Software Foundation.

Notice that the original code have been under GPL-2.0, we can't change
it to GPL-2.0-or-later unless we completely delete the test and write a
new one. So I've changed the SPDX to GPL-2.0.

> +/*\
> + * [Description]
>   *
> - * 	Cleanup:
> - * 	  Print errno log and/or timing stats if options given
> + * This is a Phase I test for the chown(2) system call. It is intended
> + * to provide a limited exposure of the system call, for now. It
> + * should/will be extended when full functional tests are written for
> + * chown(2).
>   *
> + * [Algorithm]
>   *
> - *#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#*#**/
> + * - Execute system call
> + * - Check return code, if system call failed (return=-1)
> + * -   Log the errno and Issue a FAIL message
> + * - Otherwise, Issue a PASS message
> + */

The description was way to verbose and the [Algorithm] was completely
useless and described the obvious. So I've shortened the description
before pushing.


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
