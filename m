Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8AA6A925D
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Mar 2023 09:25:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D8773CB9C6
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Mar 2023 09:25:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A4043CAC12
 for <ltp@lists.linux.it>; Fri,  3 Mar 2023 09:25:43 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6EC421400C42
 for <ltp@lists.linux.it>; Fri,  3 Mar 2023 09:25:42 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B69062298D;
 Fri,  3 Mar 2023 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1677831941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0O6bjbTvNVR+55VFT9Q/3iU6zj14iLqIVvMHXkl+kA=;
 b=ztZVETxMB9ms+f7OzCyqHvXkMy3aGyqrds4/g4f256ZICbW5EBSKKAzPu0lYfjdqBzxNfN
 f3a+GvolBPyDiovQjZnpkSlsg/hdSkBr/gppfksv++niGkYkNg94oJ8Vzq37ZtjgnMlwOC
 d2JWZGF54iSKktd62ulqODKuU8xTQ70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1677831941;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X0O6bjbTvNVR+55VFT9Q/3iU6zj14iLqIVvMHXkl+kA=;
 b=1sH1RWAcJ/pbojEqQBnJOA6bC1r2AbMU2odsJROLCZehxYG3jYcXn1mTu+HHy8dnwPhI6K
 TNdSteUBkPyWq4Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F8B2139D3;
 Fri,  3 Mar 2023 08:25:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1rz3FwWvAWQnSgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 03 Mar 2023 08:25:41 +0000
Date: Fri, 3 Mar 2023 10:16:03 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <20230303091603.GC4255@pevik>
References: <20230301152818.4427-1-andrea.cervesato@suse.com>
 <20230301152818.4427-5-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301152818.4427-5-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 4/6] Refactor mqns_04 using new LTP API
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Andrea,

+++ b/testcases/kernel/containers/mqns/mqns_04.c
...
> +	tst_res(TINFO, "Try to create %s from parent", mqueue2);

> -	mkdir(DEV_MQUEUE2, 0755);
> +	TST_EXP_FAIL(creat(mqueue2, 0755), EACCES);
OK, you created MQNAME2 (asked by Richie in v4).

> +	if (!TST_PASS)
> +		tst_atomic_inc(mq_freed2);

> -	tst_resm(TINFO, "Checking mqueue filesystem lifetime");
> +	SAFE_UMOUNT(devdir);
> +}

I suppose it does not make sense to spawn plain process as it's done in
mqns_03.c, right?
Maybe it'd be worth to mention clone and unshare modes in [Description].

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
