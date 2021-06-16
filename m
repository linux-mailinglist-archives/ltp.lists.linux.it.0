Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5CC3A995F
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:36:23 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEA913C7219
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 13:36:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4AD0A3C3086
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:36:19 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CADDB1A01134
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 13:36:18 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1D933219C5;
 Wed, 16 Jun 2021 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqlsMuW1AOv53o0O82XvcBglTc67iTRiMNHQurDHc98=;
 b=qaELAWMXZ4PdrQMZU0dCSbOWYZbq8QcCqY2OVyHEabI67edrjsVtKdkFV2GJrhDsylTYkB
 kXrFJqgSfyO0Okm8qsctOBSFOno1bsFRKn8gkfVLPNUkMBinP6q0DtZbmpw6UHB8HlLW+S
 Dh4Y1MjGAT10a2IeynNdgTv/C2GwXM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqlsMuW1AOv53o0O82XvcBglTc67iTRiMNHQurDHc98=;
 b=DrJJfqAV8m3H4pZFcSbfq8f5ex9ndEft4vol7yfsBHVem3X9Lljx1m3qYLKFvCMjS/DLus
 qz6N9EZRDh53sQBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E043D118DD;
 Wed, 16 Jun 2021 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623843378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqlsMuW1AOv53o0O82XvcBglTc67iTRiMNHQurDHc98=;
 b=qaELAWMXZ4PdrQMZU0dCSbOWYZbq8QcCqY2OVyHEabI67edrjsVtKdkFV2GJrhDsylTYkB
 kXrFJqgSfyO0Okm8qsctOBSFOno1bsFRKn8gkfVLPNUkMBinP6q0DtZbmpw6UHB8HlLW+S
 Dh4Y1MjGAT10a2IeynNdgTv/C2GwXM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623843378;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KqlsMuW1AOv53o0O82XvcBglTc67iTRiMNHQurDHc98=;
 b=DrJJfqAV8m3H4pZFcSbfq8f5ex9ndEft4vol7yfsBHVem3X9Lljx1m3qYLKFvCMjS/DLus
 qz6N9EZRDh53sQBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id QiQ6NTHiyWAMdAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 11:36:17 +0000
Date: Wed, 16 Jun 2021 13:36:16 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Xie Ziyao <xieziyao@huawei.com>
Message-ID: <YMniMEyDjhCLcx8g@pevik>
References: <20210518064506.203781-1-xieziyao@huawei.com>
 <CAEemH2en6C3dUzspuVwNVmRiUeBQWK38bLPT7+ZwErVFQG+i-w@mail.gmail.com>
 <YKXtvaeckoJ2HJzJ@pevik>
 <730f190e-4baa-f854-2c5e-8c6b9d4267df@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <730f190e-4baa-f854-2c5e-8c6b9d4267df@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] typo: Add necessary spaces in the outputs
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Ziyao,

> Hi!

> Ping. I checked it based on the latest code. Are there any changes that need
> to be added?
Well, as I note previously on some places it'd be better to join string, e.g.
testcases/kernel/syscalls/setsid/setsid01.c
testcases/open_posix_testsuite/conformance/interfaces/sched_setparam/2-1.c
testcases/kernel/syscalls/sysinfo/sysinfo02.c

The reason is that string on single line is easier to grep.
That's why checkpatch.pl from kernel relaxed max line from 80 to 100
(good at least for string).

But I'm ok to merge it without.

Kind regards,
Petr

> Kind Regards,
> Ziyao

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
