Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31F496269
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 16:55:27 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A74313C96F6
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Jan 2022 16:55:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3093C3C0DEA
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 16:55:24 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 0DA15200D5C
 for <ltp@lists.linux.it>; Fri, 21 Jan 2022 16:55:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 35A7021985;
 Fri, 21 Jan 2022 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1642780523;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoeHklEdyI0sEOCbUjCLnKomehWvPKprrCitqVIx2cs=;
 b=Sth6xI5HSkTyUPj6SAl7gG92R9hfOxS+oPrrdtp3/euMH2e44JoJpVoIhv176PDS7NPXUS
 9NIZn8wodNC90ows7flDd2FSP8sdavHco6gd6RgqNeYJr5zKykK2nH668flb3Qat+bMD0X
 8fixJFHPRlg6QcWhD2MTx2/NwqJmEY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1642780523;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SoeHklEdyI0sEOCbUjCLnKomehWvPKprrCitqVIx2cs=;
 b=ICXMS8V86N0wdgvxv0tmd1AYE3gskAAQdR5iR5Jsa/f+bSEraG2DkGY3jjMXdTcgJP5g+d
 MSTPeBCIAsuk5SCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C974F13A1E;
 Fri, 21 Jan 2022 15:55:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0SajLmrX6mEyEwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 21 Jan 2022 15:55:22 +0000
Date: Fri, 21 Jan 2022 16:55:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Sagi Nakash <saginakash@gmail.com>
Message-ID: <YerXaAm7cDPRwR4T@pevik>
References: <20211127121609.26837-1-saginakash@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211127121609.26837-1-saginakash@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] ltp-pan: Report failure if testcases failed
 to run
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
Cc: Martin Doucha <martin.doucha@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Reviewed-by: Petr Vorel <pvorel@suse.cz>

@all: Do we want to include this one in the release?

Kind regards,
Petr

> In case a test fails to run in run_child() for some reason (signaled via
> SIGTERM/SIGTOP, execve() failure, etc.), runltp still reports success:
> "INFO: ltp-pan reported all tests PASS".

> Failed tests are reported via check_pids(), by checking their exit
> status, yet it doesn't catch tests which weren't able to run at all.

> exit_stat holds the exit status code: 0 in case of success in all tests,
> otherwise, the number of failed tests.

> Fix this by increasing exit_stat also when a test fails to run.

> Signed-off-by: Sagi Nakash <saginakash@gmail.com>
> ---
>  pan/ltp-pan.c | 2 ++
>  1 file changed, 2 insertions(+)

> diff --git a/pan/ltp-pan.c b/pan/ltp-pan.c
> index 0bdb51477..eff9a867d 100644
> --- a/pan/ltp-pan.c
> +++ b/pan/ltp-pan.c
> @@ -551,6 +551,8 @@ int main(int argc, char **argv)
>  				++num_active;
>  			if ((cpid != -1 || sequential) && starts > 0)
>  				--starts;
> +			if (cpid == -1 && track_exit_stats)
> +				exit_stat++;

>  			if (sequential)
>  				if (++c >= coll->cnt)

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
