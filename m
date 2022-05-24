Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD66532564
	for <lists+linux-ltp@lfdr.de>; Tue, 24 May 2022 10:36:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 698FD3CAC41
	for <lists+linux-ltp@lfdr.de>; Tue, 24 May 2022 10:36:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 199A63C0775
 for <ltp@lists.linux.it>; Tue, 24 May 2022 10:36:04 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE36A60045E
 for <ltp@lists.linux.it>; Tue, 24 May 2022 10:36:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 897A921A1D;
 Tue, 24 May 2022 08:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653381362;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brV+e9mLW3BpBSiKe712xuHPnU81rIFnxD8pY9JZi08=;
 b=aUcp8ASb/GqOI+4LoVaBxxg+GRKLWVX+vT5KRugt5qqru8qdIW3zDebJDzcXtYQXSt/IQY
 wSeEveoBQgDwhoSNTLDGaRZmantE5xFxdmTxVhlTmLVANVhmU+TtT1IFau5hfjDodrNan8
 dpBSVVbZdeFf56XQyky5sGsYmIvdrV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653381362;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=brV+e9mLW3BpBSiKe712xuHPnU81rIFnxD8pY9JZi08=;
 b=cYnXjxfOwM7gVaNHVKO9wjHKztE4cf6lHmarOwn/42ePiKYa9CfvxNkrkB8DMsunhV89Sk
 Euxliv0YrTyOVMBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5523813AE3;
 Tue, 24 May 2022 08:36:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u/YcEvKYjGIEaQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 24 May 2022 08:36:02 +0000
Date: Tue, 24 May 2022 10:36:00 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YoyY8BQRAF4pDKru@pevik>
References: <20220512123816.24399-1-chrubis@suse.cz>
 <20220512123816.24399-27-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220512123816.24399-27-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 26/29] ltp-aiodio/dio_read: Convert to runtime
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> +++ b/testcases/kernel/io/ltp-aiodio/dio_read.c
> @@ -51,6 +51,9 @@ static void do_buffered_writes(int fd, char *bufptr, long long fsize, long long
>  			tst_brk(TBROK, "pwrite: wrote %lld bytes out of %lld", w, wsize);

>  		SAFE_FSYNC(fd);
> +
> +		if (!tst_remaining_runtime())
> +			return;
>  	}
>  }

> @@ -75,6 +78,11 @@ static int do_direct_reads(char *filename, char *bufptr, long long fsize, long l
>  				goto exit;
>  			}

> +			if (!tst_remaining_runtime()) {
> +				tst_res(TINFO, "Test out of runtime, exitting");
nit: s/exitting/exiting/

Kind regards,
Petr

> +				goto exit;

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
