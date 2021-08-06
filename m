Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7213E22F8
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:40:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 957B03C7AF7
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 07:40:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B2B443C1A29
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:40:37 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 100526006D6
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 07:40:36 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3CCB61FE97;
 Fri,  6 Aug 2021 05:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628228436;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8vs98QDAYcZBMpLn1H0gNpZNzFyEHGg5F+t/vMyiUH4=;
 b=bkSwRBFjqyyQbyA2fF1xn6zA2eXhcbqVnnjDTdUbQwF+k2dsiURUgM4sNRFjvDY+wGoEtP
 +5IKfVgb5bsCH7S7BFouXIwFZaOu83Y5FTvq7MQGbNwrp4CCUow/JRIXrtLPmXNLgQCT7/
 qB0ZRGI+lqmUp4AT69/OV0KxImX7+LM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628228436;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8vs98QDAYcZBMpLn1H0gNpZNzFyEHGg5F+t/vMyiUH4=;
 b=sTb8852tqPyNtcIh4mOWe54cpbTRjamkqC60q3BHvmeCqb87fvwvqCPRT/p3xJ9FoYazpS
 Sh3oEsHVaORyreBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 141EE13963;
 Fri,  6 Aug 2021 05:40:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id miIkA1TLDGESeAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Fri, 06 Aug 2021 05:40:36 +0000
Date: Fri, 6 Aug 2021 07:40:33 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YQzLUUKbLcoJjRVb@pevik>
References: <20210806025659.1962902-1-liwang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806025659.1962902-1-liwang@redhat.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] setsockopt08: includes netinet/in.h
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

Hi Li,

> We have to put netinet/in.h on the top to get rid of conflict
> of glibc and kernel headers for old unbuntu.

>   -----------
>   /usr/include/linux/in.h:28:3: error: redeclaration of enumerator 'IPPROTO_IP'
>         IPPROTO_IP = 0,  /* Dummy protocol for TCP  */
>    ^
>   /usr/include/netinet/in.h:42:5: note: previous definition of 'IPPROTO_IP' was here
>        IPPROTO_IP = 0,    /* Dummy protocol for TCP.  */
>   ...
>   -----------

> See: https://www.mail-archive.com/netdev@vger.kernel.org/msg132711.html

Thanks for fixing it, it's not a first time we got hit by this.
I wonder where <linux/in.h> is included. It's not directly in setsockopt08.c,
it must be in our lapi header. But it's not in tst_safe_net.h, not in
safe_net_fn.h nor in tst_net.h and both actually include <netinet/in.h>, thus it must be
before. But there is only tst_test.h.

I'm asking because it'd be better to add <netinet/in.h> into header before
<linux/in.h>.

Kind regards,
Petr

> Fixes: ebf3a4fbd39a (Add setsockopt08, CVE-2021-22555)
> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>  testcases/kernel/syscalls/setsockopt/setsockopt08.c | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/testcases/kernel/syscalls/setsockopt/setsockopt08.c b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> index f758dcbdc..f7052f27b 100644
> --- a/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> +++ b/testcases/kernel/syscalls/setsockopt/setsockopt08.c
> @@ -79,6 +79,8 @@
>   *  - sizeof(struct xt_entry_target) = 32
>   */

> +#include <netinet/in.h>
> +
>  #include "tst_test.h"
>  #include "tst_safe_net.h"
>  #include "lapi/ip_tables.h"

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
