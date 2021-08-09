Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2993E45AB
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 14:35:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E26E3C71BD
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Aug 2021 14:35:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 01EDE3C59CC
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 14:35:41 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 057BD1A006F1
 for <ltp@lists.linux.it>; Mon,  9 Aug 2021 14:35:40 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 40FE121E7A;
 Mon,  9 Aug 2021 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628512540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bM9I/IHw4mSEc11D5W9AoZUMGpQ5dYecr48zfAQbErE=;
 b=n+rB4N6cDOrSFeQc12rjNLWWLERah4dhm0kSJy9sas2bH87giTBgPr7TX+Y8wwQhJVkuys
 APgjEoEMnam7l1c6P5VluOneiE0c98p7blN9SzXCs/iEvg0M4r4P5OMlYwJG8XTlsh9N5I
 tUKK2/8SFZUyXjkgVOkGaM8PGRRjn9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628512540;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bM9I/IHw4mSEc11D5W9AoZUMGpQ5dYecr48zfAQbErE=;
 b=Ui+zYBQBkDoPtlvHolbNmkRtFYCMgXKd1H0YdP5dqm8GWlYDIIrZ2h1Ya+0ChS53i2pgAw
 HqdRXhF+//+mu9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2ECBC13BAA;
 Mon,  9 Aug 2021 12:35:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SrJoCxwhEWEnEQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 09 Aug 2021 12:35:40 +0000
Date: Mon, 9 Aug 2021 14:35:50 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YREhJlJIy1tYXNKp@yuki>
References: <20210806164730.51040-1-aleksei.kodanev@bell-sw.com>
 <20210806164730.51040-15-aleksei.kodanev@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210806164730.51040-15-aleksei.kodanev@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 14/16] syscalls/sched_setscheduler03: use
 libc/sys_sched_*()
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
>  	tst_res(TINFO, "Setting init sched policy to SCHED_OTHER");
> -	if (sched_setscheduler(0, SCHED_OTHER, &param[0]) != 0)
> -		tst_res(TFAIL | TERRNO,
> -			 "ERROR sched_setscheduler: (0, SCHED_OTHER, param)");
> -
> -	if (sched_getscheduler(0) != SCHED_OTHER)
> +	TST_EXP_PASS_SILENT(tv->sched_setscheduler(0, SCHED_OTHER, &param[0]),
> +			    "sched_setscheduler(0, SCHED_OTHER, 0)");

Here as well, we shouldn't use TST_EXP_PASS* in the test setup().

Other than that:

Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
