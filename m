Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B97BD4CC
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 10:01:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA8723CD82D
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 10:01:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AC3073C896E
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 10:01:35 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id DA2441BBB450
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 10:01:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E86C61F390;
 Mon,  9 Oct 2023 08:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1696838492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUF1KM4ACkOeXrnJnbd6HRq+uHCU1XT/QZiSJs+eEcs=;
 b=RA9/j4FphVBZ8F9T9hF2bdtlzD8+FF8LbLbtUqPI3OGVUS82vgH+DDD2+eAr4wLGfC+ggu
 kGoj50SGzRyGsRr794UwYv2zi0rnoP3tAbKsYBIGzh0m9JQyjrAgjBUstKgVDk7dcIAGsF
 1x9tZDqNm9efrOFAMGxgUuMcsR9aVjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1696838492;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oUF1KM4ACkOeXrnJnbd6HRq+uHCU1XT/QZiSJs+eEcs=;
 b=CdmVbfACUX15Nrg+z2PaEGRjI4r7GA8szY3o+ke1F5jjnY//hgVTUY+Hdufhq2ksw+acdX
 vmNK5+18W/orQEAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C76DD13905;
 Mon,  9 Oct 2023 08:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oiaiLlyzI2WKMwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 09 Oct 2023 08:01:32 +0000
Date: Mon, 9 Oct 2023 10:01:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <20231009080131.GA370124@pevik>
References: <20230921054821.12855-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921054821.12855-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/mmap04: Validate mapping perms in
 /proc/self/maps
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

Hi Avinesh,

> Validating the various combinations of prot+flags arguments in mmap()
> call and parsing the /proc/self/maps file to verifying resulting mapping
> has the permission bits as requested in mmap() call.

LGTM + you fixed all Cyril's comments.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +	if (!strcmp(perms, tc->exp_perms))
> +		tst_res(TPASS, "mapping permissions in /proc matched: %s", perms);
> +	else
> +		tst_res(TFAIL, "mapping permissions in /proc mismatched,"
> +						" expected: %s, found: %s",
> +						tc->exp_perms, perms);
Very nit: I wouldn't split the string. IMHO it's better to have easier git
grepping, than follow 80 line rules. Also checkpatch does not complain on this:

	else
		tst_res(TFAIL,
			"mapping permissions in /proc mismatched, expected: %s, found: %s",
			tc->exp_perms, perms);

This can be fixed before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
