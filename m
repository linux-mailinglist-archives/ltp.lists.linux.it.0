Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFGEC1W2c2liyAAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 18:56:37 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCA79433
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 18:56:36 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 25C7C3CB89A
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 18:56:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 28E323C3095
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 18:56:34 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 88593200919
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 18:56:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54B633383F;
 Fri, 23 Jan 2026 17:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769190992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrRxse1MvhbwSLVR6a5xInyY1h2YpWfQZABKkkdkluI=;
 b=YCc3Gy8NCaaNNuEm7RJLw+wdBYQxWcOoTv97CU484KsNKtW4tn+tCdxbxP3lRQIhjwzUZe
 nRTe3v3n4iCA1A9xZOnry0rxKpMik4mRhkEmI6PI6lg1pGpinPevPDumUuo7m62xWJQnnJ
 GhuOaqSpjKt4Xs3UCugnRAPvTT82tcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769190992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrRxse1MvhbwSLVR6a5xInyY1h2YpWfQZABKkkdkluI=;
 b=7tlOMs0Y9Vhm6oJkjacFCSkLJb7aSkHX3VB+/dyP7ztaPb5Dwk+bRcteDHy0brDla2ClTj
 dJLWayKwx3N/4eCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769190992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrRxse1MvhbwSLVR6a5xInyY1h2YpWfQZABKkkdkluI=;
 b=YCc3Gy8NCaaNNuEm7RJLw+wdBYQxWcOoTv97CU484KsNKtW4tn+tCdxbxP3lRQIhjwzUZe
 nRTe3v3n4iCA1A9xZOnry0rxKpMik4mRhkEmI6PI6lg1pGpinPevPDumUuo7m62xWJQnnJ
 GhuOaqSpjKt4Xs3UCugnRAPvTT82tcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769190992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BrRxse1MvhbwSLVR6a5xInyY1h2YpWfQZABKkkdkluI=;
 b=7tlOMs0Y9Vhm6oJkjacFCSkLJb7aSkHX3VB+/dyP7ztaPb5Dwk+bRcteDHy0brDla2ClTj
 dJLWayKwx3N/4eCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0BE0B1395E;
 Fri, 23 Jan 2026 17:56:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4wGQOk+2c2k0dgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Fri, 23 Jan 2026 17:56:31 +0000
Date: Fri, 23 Jan 2026 18:56:29 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.de>
Message-ID: <20260123175629.GA358728@pevik>
References: <20260123-fix_dio_sparse_slow-v1-1-65bd0dc0d52f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123-fix_dio_sparse_slow-v1-1-65bd0dc0d52f@suse.com>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] io: fix really slow dio_sparse on certain systems
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
Cc: Linux Test Project <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[suse.cz];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linux.it:url,suse.cz:replyto];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.852];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A5BCA79433
X-Rspamd-Action: no action

Hi Andrea,

> The reason why dio_sparse is happening to be slow on certain systems is
> that, if data buffering is slow, we run more buffered read() for one
> single dio write(). This slows down the whole test, because for each
> read() we always need to move data from kernel space to user space.

> Create a READ_BUFFER_SIZE variable inside the common.h header and use
> it to define the write buffer size.

LGTM. IMHO good for a release.

Kind regards,
Petr

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/io/ltp-aiodio/common.h     | 6 ++++--
>  testcases/kernel/io/ltp-aiodio/dio_sparse.c | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)

> diff --git a/testcases/kernel/io/ltp-aiodio/common.h b/testcases/kernel/io/ltp-aiodio/common.h
> index 9a2d2716661651adf40c635ac516cc70068c9393..d3f05a3c1e75cd4baa629cbce1872729a0d641c6 100644
> --- a/testcases/kernel/io/ltp-aiodio/common.h
> +++ b/testcases/kernel/io/ltp-aiodio/common.h
> @@ -9,6 +9,8 @@
>  #include <stdlib.h>
>  #include "tst_test.h"

> +#define READ_BUFFER_SIZE 4096
> +
>  static inline char *check_zero(char *buf, int size)
>  {
>  	char *p;
> @@ -57,7 +59,7 @@ static inline void io_append(const char *path, char pattern, int flags, size_t b

>  static inline void io_read(const char *filename, int filesize, volatile int *run_child)
>  {
> -	char buff[4096];
> +	char buff[READ_BUFFER_SIZE];
>  	int fd;
>  	int i;
>  	int r;
> @@ -102,7 +104,7 @@ exit:

>  static inline void io_read_eof(const char *filename, volatile int *run_child)
>  {
> -	char buff[4096];
> +	char buff[READ_BUFFER_SIZE];
>  	int fd;
>  	int r;

> diff --git a/testcases/kernel/io/ltp-aiodio/dio_sparse.c b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> index c87e5ab1aca7c8910f76ee87f86b561f548d4cdf..d858340bf9a707fb019e82c644da7f355ad0effd 100644
> --- a/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> +++ b/testcases/kernel/io/ltp-aiodio/dio_sparse.c
> @@ -32,7 +32,7 @@ static char *str_filesize;
>  static char *str_offset;

>  static int numchildren = 16;
> -static long long writesize = 1024;
> +static long long writesize = READ_BUFFER_SIZE;
>  static long long filesize = 100 * 1024 * 1024;
>  static long long offset = 0;
>  static long long alignment;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
