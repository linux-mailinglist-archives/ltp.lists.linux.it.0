Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B33FDCDC
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:19:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 307233C99A9
	for <lists+linux-ltp@lfdr.de>; Wed,  1 Sep 2021 15:19:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6077D3C222D
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:19:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E207B600D2C
 for <ltp@lists.linux.it>; Wed,  1 Sep 2021 15:19:47 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F1B01FF08;
 Wed,  1 Sep 2021 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630502387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPx1Zg5iqsw9M8EqjX1XQKyFysemvtJrBK1KGGtQKk4=;
 b=1qAm193cMyONehWrgrF8p8XYinOS7nN+nRVI+GxCWhfBN2rIOnHv2T7QpeXf5nixJxcpDc
 cHZ6SRz1SXD03xiAb9XY0zrT+gIlbs1CMCgnTme4V/ir71CUsH1Apn3DsmoSpEwdg8i6ao
 prDTq7k40t5fSfyJNH8XJbnCBts7TxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630502387;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPx1Zg5iqsw9M8EqjX1XQKyFysemvtJrBK1KGGtQKk4=;
 b=6qqHWO++jq8dnRUFEnAH8VAPRl/iKpNzPdilp+w2wGvcaRPvFkR6xg3w8nvXTH8sMFdCfM
 p8ozinUPpeFZOoCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F121413AD1;
 Wed,  1 Sep 2021 13:19:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cQWHOPJ9L2EtWwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Wed, 01 Sep 2021 13:19:46 +0000
Date: Wed, 1 Sep 2021 15:19:45 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Dai Shili <daisl.fnst@fujitsu.com>
Message-ID: <YS998a/fPdH5aZh8@pevik>
References: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1629294657-28375-1-git-send-email-daisl.fnst@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/pread01: Convert to new API
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

Hi Dai,

LGTM, few notes below, I can fix everything before merge.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

> Signed-off-by: Dai Shili <daisl.fnst@fujitsu.com>
> ---
>  testcases/kernel/syscalls/pwrite/pwrite01.c | 336 +++++-----------------------
>  1 file changed, 57 insertions(+), 279 deletions(-)

> diff --git a/testcases/kernel/syscalls/pwrite/pwrite01.c b/testcases/kernel/syscalls/pwrite/pwrite01.c
> index 937160a..83b0bdf 100644
> --- a/testcases/kernel/syscalls/pwrite/pwrite01.c
> +++ b/testcases/kernel/syscalls/pwrite/pwrite01.c
> @@ -1,86 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> + * Copyright (c) International Business Machines  Corp., 2001
As you haven't added your license, I'll add LTP project license.
> + * 07/2001 Ported by Wayne Boyer
>   */

...
> +/*\
> + * [Description]
>   *
> - * Test Description:
>   *  Verify the functionality of pwrite() by writing known data using pwrite()
>   *  to the file at various specified offsets and later read from the file from
>   *  various specified offsets, comparing the data written aganist the data
typo: aganist -> against. Going to fix it before merge.
>   *  read using read().

...
> -#define _XOPEN_SOURCE 500
>  #define TEMPFILE	"pwrite_file"
>  #define K1              1024
>  #define K2              (K1 * 2)
> @@ -88,249 +25,90 @@
>  #define K4              (K1 * 4)
>  #define NBUFS           4

You kept using kilobyte constants. IMHO it'd be more readable just to use numeric (1024, 2048, 3072, 4096), but
let's keep it.


> -char *TCID = "pwrite01";
> -int TST_TOTAL = 1;
> -int fildes;			/* file descriptor for tempfile */
> -char *write_buf[NBUFS];		/* buffer to hold data to be written */
> +static int fildes;
> +char *write_buf[NBUFS];
> +char *read_buf[NBUFS];
write_buf and read_buf should also be static.

...
> +static void verify_pwrite(void)
>  {
> +	SAFE_PWRITE(1, fildes, write_buf[0], K1, 0);
> +	l_seek(fildes, 0, SEEK_CUR, 0);
> +	l_seek(fildes, K1 / 2, SEEK_SET, K1 / 2);

> -	tst_sig(NOFORK, DEF_HANDLER, cleanup);
> +	SAFE_PWRITE(1, fildes, write_buf[2], K1, K2);
> +	l_seek(fildes, 0, SEEK_CUR, K1 / 2);
> +	l_seek(fildes, K3, SEEK_SET, K3);

> -	TEST_PAUSE;
> +	SAFE_WRITE(1, fildes, write_buf[3], K1);
> +	l_seek(fildes, 0, SEEK_CUR, K4);

> -	/* Allocate/Initialize the write buffer with known data */
> -	init_buffers();
> +	SAFE_PWRITE(1, fildes, write_buf[1], K1, K1);

> -	tst_tmpdir();
> +	check_file_contents();

> -	/* Creat a temporary file used for mapping */
> -	if ((fildes = open(TEMPFILE, O_RDWR | O_CREAT, 0666)) < 0) {
> -		tst_brkm(TBROK, cleanup, "open() on %s Failed, errno=%d : %s",
> -			 TEMPFILE, errno, strerror(errno));
> -	}
> +	l_seek(fildes, 0, SEEK_SET, 0);
your code:
static void verify_pread(void)
{
	SAFE_PREAD(1, fildes, read_buf[2], K1, K2);

	l_seek(fildes, 0, SEEK_CUR, K4);

	l_seek(fildes, 0, SEEK_SET, 0);

	SAFE_PREAD(1, fildes, read_buf[3], K1, K3);

	l_seek(fildes, 0, SEEK_CUR, 0);

	SAFE_READ(1, fildes, read_buf[0], K1);

	l_seek(fildes, 0, SEEK_CUR, K1);

	SAFE_PREAD(1, fildes, read_buf[1], K1, K1);

	l_seek(fildes, 0, SEEK_CUR, K1);

	compare_bufers();

	l_seek(fildes, K4, SEEK_SET, K4);
}

nit: having blank line after each line?

how about something like:

static void verify_pread(void)
{
	SAFE_PREAD(1, fildes, read_buf[2], K1, K2);
	l_seek(fildes, 0, SEEK_CUR, K4);
	l_seek(fildes, 0, SEEK_SET, 0);

	SAFE_PREAD(1, fildes, read_buf[3], K1, K3);
	l_seek(fildes, 0, SEEK_CUR, 0);

	SAFE_READ(1, fildes, read_buf[0], K1);
	l_seek(fildes, 0, SEEK_CUR, K1);

	SAFE_PREAD(1, fildes, read_buf[1], K1, K1);
	l_seek(fildes, 0, SEEK_CUR, K1);

	compare_bufers();

	l_seek(fildes, K4, SEEK_SET, K4);
}

The rest LGTM.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
