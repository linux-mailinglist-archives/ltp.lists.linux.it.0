Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 851C9397264
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:34:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 50AD33C8017
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 13:34:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C98E3C5AAF
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:34:12 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 092B810006DB
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 13:34:11 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DD941FD2E;
 Tue,  1 Jun 2021 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622547251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJta9YZxBcbTeOiM97r0kUx2b9rUuWRVGzlhrauIvQ8=;
 b=1ApwheRcRkJNbj6WH+Kyt1uShUFt/EVR/wr4NIm3/jtD1ZEVfzrDIs8DppWXUfjTCKghh+
 mb1q8SZAKlPiMZs3sedpIDoPbTSLpVC7dpXILknJZkYVsw/B3vURbrkArJlhhhU1fcGv/n
 Vtt5XCTI1tmN8SuajxTXN0XyMr9qMVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622547251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJta9YZxBcbTeOiM97r0kUx2b9rUuWRVGzlhrauIvQ8=;
 b=g7V0porDHS0+rhR+S2XcWQ54lFAPPl39q+HnYr1TiZ0FOb036ghxPFhDxCIUB084vA2ZZb
 emPx7FfyC8cC4rBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2122B118DD;
 Tue,  1 Jun 2021 11:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622547251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJta9YZxBcbTeOiM97r0kUx2b9rUuWRVGzlhrauIvQ8=;
 b=1ApwheRcRkJNbj6WH+Kyt1uShUFt/EVR/wr4NIm3/jtD1ZEVfzrDIs8DppWXUfjTCKghh+
 mb1q8SZAKlPiMZs3sedpIDoPbTSLpVC7dpXILknJZkYVsw/B3vURbrkArJlhhhU1fcGv/n
 Vtt5XCTI1tmN8SuajxTXN0XyMr9qMVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622547251;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJta9YZxBcbTeOiM97r0kUx2b9rUuWRVGzlhrauIvQ8=;
 b=g7V0porDHS0+rhR+S2XcWQ54lFAPPl39q+HnYr1TiZ0FOb036ghxPFhDxCIUB084vA2ZZb
 emPx7FfyC8cC4rBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dwezBjMbtmDCOAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Tue, 01 Jun 2021 11:34:11 +0000
Date: Tue, 1 Jun 2021 13:08:18 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <YLYVIvTBYsdE6Gzh@yuki>
References: <20210601093614.245873-1-egorenar@linux.ibm.com>
 <20210601093614.245873-2-egorenar@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601093614.245873-2-egorenar@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] tst_wallclock_restore: fix access time of
 /etc/localtime
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
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  lib/tst_wallclock.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib/tst_wallclock.c b/lib/tst_wallclock.c
> index 838dde8b3..37d3005ef 100644
> --- a/lib/tst_wallclock.c
> +++ b/lib/tst_wallclock.c
> @@ -60,6 +60,8 @@ void tst_wallclock_restore(void)
>  
>  	if (tst_clock_settime(CLOCK_REALTIME, &adjust))
>  		tst_brk(TBROK | TERRNO, "tst_clock_settime() realtime failed");
> +
> +	SAFE_TOUCH("/etc/localtime", 0, NULL);

I would prefer not to break the test here if the file is not present on
a system, there may be embedded systems where this file does not exists
and SAFE_TOUCH() will exit the test with TBROK in that case.

Also the problem is access time here, so opening and closing the file
should be enough to fix it right?

What about something as:

	int fd = open("/etc/localtime", O_RDWR);
	if (fd > 0)
		SAFE_CLOSE(fd);

That should fix the access time without breaking the test on systems
that does not have the /etc/localtime file installed.

>  }
>  
>  void tst_rtc_clock_save(const char *rtc_dev)
> -- 
> 2.31.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
