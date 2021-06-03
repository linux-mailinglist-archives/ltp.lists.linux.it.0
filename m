Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0337239A0EF
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 14:31:17 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 054B93C5419
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 14:31:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 62FC03C2873
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:31:14 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 76E061401117
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:31:12 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92F951FD5C;
 Thu,  3 Jun 2021 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622723472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjyZAOqpEjNZEnS/HlUUjS0lgoahgyhajwhpztpW87Q=;
 b=yD+Aw6+8BHPIOYRuUYXAbjx/R/5ZXNbSXWQP+lvrjUqFZema+dE4zmAOo9PyqR28CN+mYT
 27aGoEccQwcBmisEUkHg6M5pOohd6OBvMIK3Vxayte5rMU3mJDlazfBckzePLNwE0KkGXN
 qA6PwSDR8k5EGLJZnBOFTgdZi6iIuIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622723472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjyZAOqpEjNZEnS/HlUUjS0lgoahgyhajwhpztpW87Q=;
 b=7yQV6f5xaXfyB/ZwrSNBsUbf+rXqCROEW4d0bwObpBitxCbrQ4Opv13W5mMu/GWTGMNygS
 fOd8ZHvEMiapnfBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 77601118DD;
 Thu,  3 Jun 2021 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622723472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjyZAOqpEjNZEnS/HlUUjS0lgoahgyhajwhpztpW87Q=;
 b=yD+Aw6+8BHPIOYRuUYXAbjx/R/5ZXNbSXWQP+lvrjUqFZema+dE4zmAOo9PyqR28CN+mYT
 27aGoEccQwcBmisEUkHg6M5pOohd6OBvMIK3Vxayte5rMU3mJDlazfBckzePLNwE0KkGXN
 qA6PwSDR8k5EGLJZnBOFTgdZi6iIuIg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622723472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjyZAOqpEjNZEnS/HlUUjS0lgoahgyhajwhpztpW87Q=;
 b=7yQV6f5xaXfyB/ZwrSNBsUbf+rXqCROEW4d0bwObpBitxCbrQ4Opv13W5mMu/GWTGMNygS
 fOd8ZHvEMiapnfBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id zocaHJDLuGAdGAAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Thu, 03 Jun 2021 12:31:12 +0000
Date: Thu, 3 Jun 2021 14:05:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YLjFgjJ94RuE7zRe@yuki>
References: <20210531112522.9082-1-xieziyao@huawei.com>
 <20210531112522.9082-3-xieziyao@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531112522.9082-3-xieziyao@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] syscalls/fchown: Convert fchown05 to the new
 API
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
> -	{"Change Owner/Group ids", 700, 701},
> -	{"Change Owner id only", 702, -1},
> -	{"Change Owner id only", 703, 701},
> -	{"Change Group id only", -1, 704},
> -	{"Change Group id only", 703, 705},
> -	{NULL, 0, 0}
> +	{700, 701},
> +	{702, 701},
> +	{702, 703},
> +	{704, 705}
>  };

Can we please keep the tests where we check that -1 does not change the
value and where we asert that the previously set value is still there
after the fchown call?

We may as well add a check that fchown(fd, -1, -1) is no-op.

> +	TST_EXP_PASS(FCHOWN(fd, tc[i].uid, tc[i].gid));

This produces a bit ugly output, what about adding format string and
parameters like:

	TST_EXP_PASS(FCHOWN(fd, tc[i].uid, tc[i].gid),
	             "fchwon(%i, %i, %i)", fd, tc[i].uid, tc[i].gid);

I guess I will push a similar patch that fixes this for fchown04 as well.

>  static void cleanup(void)
>  {
> -	if (fildes > 0 && close(fildes))
> -		tst_resm(TWARN | TERRNO, "close(%s) Failed", TESTFILE);
> -
> -	tst_rmdir();
> +	SAFE_CLOSE(fd);

We really have to check if the fd has been opened, since the test can
exit in any SAFE_MACRO() so this has to be:

	if (fd > 0)
		SAFE_CLOSE(fd);


Other than these this is a nice cleanup.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
