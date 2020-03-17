Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 290D1188E84
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 21:03:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 91A5F3C55CE
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Mar 2020 21:03:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id E39963C0E5E
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 21:03:33 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CB086600914
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 21:03:32 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 20735AC62
 for <ltp@lists.linux.it>; Tue, 17 Mar 2020 20:03:32 +0000 (UTC)
Date: Tue, 17 Mar 2020 21:03:30 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200317200330.GA22450@dell5510>
References: <20200317121057.13529-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317121057.13529-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] Create separate .c file for
 include/tst_net.h
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

thanks for doing this cleanup, LGTM
(just lib/tst_net.c should get SPDX licence before merging).

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Minor thoughts below.

>  #include <arpa/inet.h>
> -#include <errno.h>
>  #include <stdio.h>
> -#include <stdlib.h>
> -#include <string.h>
BTW (not related to this change) tst_net.h and tst_private.h must be included
after tst_test.h. But that's probably ok (include/tst_safe_clocks.h includes it).

...
> +++ b/include/tst_private.h
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (c) 2017-2019 Petr Vorel <pvorel@suse.cz>
> + *
> + * Internal helper functions for the shell library. Do not use directly
> + * in test programs.
> + */
> +
> +#ifndef TST_PRIVATE_H_
> +#define TST_PRIVATE_H_
This file is now just for tst_net_iface_prefix.c tst_net_ip_prefix.c and
tst_net_vars.c. And I bet that it stays like this, because most of code in lib/
is actually the API code, which is supposed to be exported. Therefore I'd chose
name specific to these 3 files, but tst_private.h is maybe better.

...
> +void tst_print_svar(const char *name, const char *val);
> +void tst_print_svar_change(const char *name, const char *val);
> +
> +int tst_get_prefix(const char *ip_str, int is_ipv6);
> +
> +#endif
> diff --git a/lib/tst_net.c b/lib/tst_net.c
> new file mode 100644
> index 000000000..b27ad3a5b
> --- /dev/null
> +++ b/lib/tst_net.c
> @@ -0,0 +1,147 @@
> +/*
> + * Copyright (c) 2017 Petr Vorel <pvorel@suse.cz>
> + *
> + * This program is free software: you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation, either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
Hm, this should be replaced by simple:
// SPDX-License-Identifier: GPL-2.0-or-later

Can be done during merge.

> +
> +#include <errno.h>
> +#include <string.h>
> +#include <stdlib.h>
> +
> +#define TST_NO_DEFAULT_MAIN
> +#include "tst_test.h"
> +#include "tst_net.h"
> +#include "tst_private.h"
> +
> +void tst_print_svar(const char *name, const char *val)
> +{
> +	if (name && val)
> +		printf("export %s=\"%s\"\n", name, val);
> +}
> +
> +void tst_print_svar_change(const char *name, const char *val)
> +{
> +	if (name && val)
> +		printf("export %s=\"${%s:-%s}\"\n", name, name, val);
> +}
I'd be happy enough to have these functions not exported (i.e. in tst_private.h
as static inline), but I believe you that today's compilers strip out unused
code :).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
