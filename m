Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2276BA39D
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 00:40:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B8A463CD4F2
	for <lists+linux-ltp@lfdr.de>; Wed, 15 Mar 2023 00:40:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D5F7F3CAD34
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 00:40:05 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3780B1400043
 for <ltp@lists.linux.it>; Wed, 15 Mar 2023 00:40:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BEF851F37F;
 Tue, 14 Mar 2023 23:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1678837203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SfdvidYxU7myfLieVQZVJp4ttueACp/0ARxq4hQypE4=;
 b=guSCFlqgaWuvb4QMpQjq8C3Gn1FeCoT+OWXp5eMG6PNRajxvD98Rd83JtQk+dfzbehZcsW
 lpbIgGi68l43TVfnDU7UJkzLOfO8vDopFDhapsjVM8qMiEeNp3pjMCoZuedbAR09z3lYoS
 rOw+jvJz2WVnEhtWecvipd9bNhcFyN0=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2ADF013A1B;
 Tue, 14 Mar 2023 23:40:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0Uh9AdMFEWSVMAAAMHmgww
 (envelope-from <wegao@suse.com>); Tue, 14 Mar 2023 23:40:03 +0000
Date: Tue, 14 Mar 2023 19:40:00 -0400
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20230314234000.GA10628@localhost>
References: <20230308132335.29621-1-andrea.cervesato@suse.de>
 <20230308132335.29621-2-andrea.cervesato@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230308132335.29621-2-andrea.cervesato@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 1/3] Rewrite eventfd2_01 test using new LTP API
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
From: Wei Gao via ltp <ltp@lists.linux.it>
Reply-To: Wei Gao <wegao@suse.com>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Wed, Mar 08, 2023 at 02:23:33PM +0100, Andrea Cervesato wrote:
> From: Andrea Cervesato <andrea.cervesato@suse.com>
> 
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/syscalls/eventfd2/eventfd2.h |  18 +++
>  .../kernel/syscalls/eventfd2/eventfd2_01.c    | 148 ++++--------------
>  2 files changed, 51 insertions(+), 115 deletions(-)
>  create mode 100644 testcases/kernel/syscalls/eventfd2/eventfd2.h
> 
> diff --git a/testcases/kernel/syscalls/eventfd2/eventfd2.h b/testcases/kernel/syscalls/eventfd2/eventfd2.h
> new file mode 100644
> index 000000000..5350820b8
> --- /dev/null
> +++ b/testcases/kernel/syscalls/eventfd2/eventfd2.h
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2023 SUSE LLC Andrea Cervesato <andrea.cervesato@suse.com>
> + */
> +
> +#include "tst_test.h"
> +#include "lapi/syscalls.h"
> +
> +static inline int eventfd2(unsigned int count, unsigned int flags)
> +{
> +	int ret;
> +
> +	ret = tst_syscall(__NR_eventfd2, count, flags);
> +	if (ret == -1)
> +		tst_brk(TBROK | TERRNO, "eventfd2");
> +
> +	return ret;
> +}
Normally we need put file or store this file into some lib directory?

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
