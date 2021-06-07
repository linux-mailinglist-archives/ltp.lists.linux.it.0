Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CD39DE26
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:55:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 66C6F3C7B4A
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 15:55:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 904863C4DBE
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:55:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2C8CE1000B08
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 15:55:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7499621AA0;
 Mon,  7 Jun 2021 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623074145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IsQXW8fRTZNbekPdTeCNoRVHwQCdVQEA2CMKtSQ2sdY=;
 b=iF3Aqyus0nsAJdDIjI7pgtm+UzjUbAZ/eksVIOR30I2PMa6VgKuYvAyZUMyP0t++zhp74p
 DlyuzjTuyeP/suxem1e9v8TQ1AtOhukFp2J7SLB53Mwo4WVvVKmH4kO7b6Ufy1KixZm2h2
 fCzBAwAx1+Ml9PYpIOp3nQlv4Kt4iYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623074145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IsQXW8fRTZNbekPdTeCNoRVHwQCdVQEA2CMKtSQ2sdY=;
 b=cEsurXoYOB82Dhtp2KZNzJxAqLuXBn7VXvWH+//xngdsqOl756CAx8Y4d9FC2WUSlJRoVL
 qkVxBAxm4SOxhNBw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 57B79118DD;
 Mon,  7 Jun 2021 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623074145; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IsQXW8fRTZNbekPdTeCNoRVHwQCdVQEA2CMKtSQ2sdY=;
 b=iF3Aqyus0nsAJdDIjI7pgtm+UzjUbAZ/eksVIOR30I2PMa6VgKuYvAyZUMyP0t++zhp74p
 DlyuzjTuyeP/suxem1e9v8TQ1AtOhukFp2J7SLB53Mwo4WVvVKmH4kO7b6Ufy1KixZm2h2
 fCzBAwAx1+Ml9PYpIOp3nQlv4Kt4iYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623074145;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IsQXW8fRTZNbekPdTeCNoRVHwQCdVQEA2CMKtSQ2sdY=;
 b=cEsurXoYOB82Dhtp2KZNzJxAqLuXBn7VXvWH+//xngdsqOl756CAx8Y4d9FC2WUSlJRoVL
 qkVxBAxm4SOxhNBw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id PJzyE2ElvmCGMgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Mon, 07 Jun 2021 13:55:45 +0000
Date: Mon, 7 Jun 2021 15:29:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YL4fUslxI4IIG5Am@yuki>
References: <20210506050047.935-1-zhaogongyi@huawei.com>
 <YJV4MtK/5NvpIXbU@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJV4MtK/5NvpIXbU@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4 v2] syscalls/fcntl: Replace TINFO with TPASS
 or TFAIL
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
> not sure if change to use goto satisfied Cyril's requirement:
> 
> we should rather skip the test in the main instead
> as it was done in the original code as:
> 
> 	if (NO_NFS)
> 		run_test(...);
> 	else
> 		tst_resm(TCONF, "Skipping mandatory locking on NFS");

Yes I still think that the code looks better if we skip the test in the
main here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
