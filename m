Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA2B736605
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jun 2023 10:25:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7FF513CE0EE
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jun 2023 10:25:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 970813CA8D7
 for <ltp@lists.linux.it>; Tue, 20 Jun 2023 10:24:54 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2161D200074
 for <ltp@lists.linux.it>; Tue, 20 Jun 2023 10:24:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF9F4218E2;
 Tue, 20 Jun 2023 08:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1687249491;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8YOnincI1GbJwwwRs/YB2pBDUiFPR5cOujPwKTe81c=;
 b=gP82e5X2YKGvSwWoLTekEzaC5tNbBM1SMUz35V4gvXtnlhtdBUCuYYBySU30/onbJNxu3b
 As7w4U5rpZXogu1Pm8fwAfU0PJl9AEDgE5uG4BgHJbl1WzBulGLiNQajNbleYSZNcWTXvn
 OjoPP260BhmNUxpTr1K1rKjNLbHi0u8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1687249491;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i8YOnincI1GbJwwwRs/YB2pBDUiFPR5cOujPwKTe81c=;
 b=VpS56FibuDwXHLpcOy3KgvRqUSomzhnsL/KrwIMEr6a2J/EaCPMRUut69SrrygaffBoY52
 x3PXlOXmJ+rOGdDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 911591346D;
 Tue, 20 Jun 2023 08:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MFX9IVNikWQTGwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 20 Jun 2023 08:24:51 +0000
Date: Tue, 20 Jun 2023 10:24:42 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230620082442.GA270877@pevik>
References: <20230607144517.24972-1-mdoucha@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607144517.24972-1-mdoucha@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/madvise11: Ignore unpoison failure under
 kernel lockdown
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

Hi Martin,

...
> -	return SAFE_OPEN(debugfs_fp, O_WRONLY);
> +	TEST(open(debugfs_fp, O_WRONLY));
> +
> +	if (TST_RET == -1 && TST_ERR == EPERM && tst_lockdown_enabled()) {
> +		tst_res(TINFO,
> +			"Cannot restore soft-offlined memory due to lockdown");
> +		return TST_RET;
> +	}
> +
> +	if (TST_RET == -1)
> +		tst_brk(TBROK | TTERRNO, "open(%s) failed", debugfs_fp);
> +	else if (TST_RET < 0)
> +		tst_brk(TBROK | TTERRNO, "Invalid open() return value");
nit: I'd print the return value as we do in safe_open():
		tst_brk(TBROK | TTERRNO, "Invalid open() return value %d", TST_RET);

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thanks for fixing this!

Kind regards,
Petr

> +
> +	return TST_RET;
>  }


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
