Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8FB3FC6A7
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:01:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 638483C9A59
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:01:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D8B743C2A67
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:01:19 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id B8E7010009CE
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:01:18 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C64E81FE79;
 Tue, 31 Aug 2021 12:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630411277;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDMVgzqxA96amc/66O+XqfGfVrv4TO2vvpyzVrB/xsc=;
 b=Y8g4ZLWlds/ETospzSE1MNkGLuZPFl8dTyHIAOt8xCyjBtUlJhlpjnQWCH5yFGPcDWpEns
 xzFKk8W4QschQC/0mIscrCeaiJguxBf8fpSOCu1O7CcHVTzwBhM4V8hxkIw/lTWPaCd5Zk
 SKrHyEyP083xqsgJy0ZZSJyu4djaTqM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630411277;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDMVgzqxA96amc/66O+XqfGfVrv4TO2vvpyzVrB/xsc=;
 b=BxkzKXvIqX6ugrwlmtAZ0Fu9cGRb7lU+HDMuRsGzeT5kEFB0Yoqz5V+N9ulN8mj8pz5ZkF
 On+X/8Z+vSKRcqBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8650513A92;
 Tue, 31 Aug 2021 12:01:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id jbNvHg0aLmHwFAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 12:01:17 +0000
Date: Tue, 31 Aug 2021 14:01:15 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YS4aC5uSPYY77L/6@pevik>
References: <878s0ikl6d.fsf@suse.de>
 <20210831114406.8527-1-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210831114406.8527-1-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] kernel/irq: Add irqbalance01
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
Cc: nhorman@gmail.com, Thomas Gleixner <tglx@linutronix.de>, anton@deadbeef.mx,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Richie,

> V2:
> * Use tst_printf
> * Fix typos
> * rm .sh from Makefile
Thanks for a quick update.

> diff --git a/testcases/kernel/irq/irqbalance01.c b/testcases/kernel/irq/irqbalance01.c
...
> +	tst_res(changed ? TPASS : TFAIL,
> +		"Heuristic: Detected %zu irq-cpu pairs have been dissallowed",
                                                         ^ disallowed
(will be fixed during merge)


Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
