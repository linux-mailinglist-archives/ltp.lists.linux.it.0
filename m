Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A43B6705ABB
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 00:45:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 303973CDD33
	for <lists+linux-ltp@lfdr.de>; Wed, 17 May 2023 00:45:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B82DD3CA0BA
 for <ltp@lists.linux.it>; Wed, 17 May 2023 00:45:12 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 524AA10005A7
 for <ltp@lists.linux.it>; Wed, 17 May 2023 00:45:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3666322273;
 Tue, 16 May 2023 22:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1684277111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7e41j7xeGo+hibhkRM1kD0lbj2JgocFmyxwuoCRMO9o=;
 b=tyJEjpGkkgL7/dkIHBRGU5UKOobWIZHZcFSVBS5c4JxMdhFiZojj1u3ypHpBW6oZpbFVGw
 ZaMLs9zhlncYhAzSgBcdkAFYIOfnFkPjqEXNAxm5TZapRskrbUuWhFfUHyCqEHfWJUPStH
 f9KTDuRU68nIMLEp1KesGdT/LKuYH+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1684277111;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7e41j7xeGo+hibhkRM1kD0lbj2JgocFmyxwuoCRMO9o=;
 b=7DmxOWQTBCjWv22dESJGJRVOMAkv9VjUQAmeW00kkRtwXdT6y4IxF73rU+uuZxiRQS1GlL
 mArDTR/+UB2qs2CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 15DB6138F5;
 Tue, 16 May 2023 22:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E1YtBHcHZGRRPAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 16 May 2023 22:45:11 +0000
Date: Wed, 17 May 2023 02:24:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Konstantin Khorenko <khorenko@virtuozzo.com>
Message-ID: <20230517002456.GB9395@pevik>
References: <20230516165929.1343864-1-khorenko@virtuozzo.com>
 <20230516165929.1343864-2-khorenko@virtuozzo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230516165929.1343864-2-khorenko@virtuozzo.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] scsi_debug/tlibio/lio_read_buffer: Always
 return total amount of read bytes
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

> This issue behind this patch is noticed while fixing the
> lio_write_buffer().

> Here in lio_read_buffer() we have similar situation: in case of a
> partial read, we cycle, but lio_read_buffer() returns back the amount of
> bytes read during the last read() call while it's expected to return the
> whole amount of read bytes.

> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
> ---
>  lib/tlibio.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

> diff --git a/lib/tlibio.c b/lib/tlibio.c
> index 8298e2de9..604663307 100644
> --- a/lib/tlibio.c
> +++ b/lib/tlibio.c
> @@ -1112,6 +1112,8 @@ int lio_read_buffer(int fd,	/* open file descriptor */
>  		long wrd)	/* to allow future features, use zero for now */
>  {
>  	int ret = 0;		/* syscall return or used to get random method */
> +	int totally_read = 0;	/* as we cycle reads in case of partial reads, */
> +				/* we have to report up total bytes read */

Again, multiline comment would be more readable:

	/* as we cycle reads in case of partial reads,
	 * we have to report up total bytes read */
	int totally_read = 0;

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

>  	char *io_type;		/* Holds string of type of io */
>  	int listio_cmd;		/* Holds the listio/lio_listio cmd */
>  	int omethod = method;
> @@ -1323,13 +1325,14 @@ int lio_read_buffer(int fd,	/* open file descriptor */
>  						fd, size, ret);
>  					size -= ret;
>  					buffer += ret;
> +					totally_read += ret;
>  				} else {
>  					if (Debug_level > 1)
>  						printf
>  						    ("DEBUG %s/%d: read completed without error (ret %d)\n",
>  						     __FILE__, __LINE__, ret);

> -					return ret;
> +					return totally_read + ret;
>  				}
>  			}
>  			wait4sync_io(fd, 1);

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
