Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FFD63D11F
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 09:52:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43F763CC4FD
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Nov 2022 09:52:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 759E03C9008
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 09:52:24 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id E6CF41400DA3
 for <ltp@lists.linux.it>; Wed, 30 Nov 2022 09:52:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DB2CB21AF3;
 Wed, 30 Nov 2022 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1669798342;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1KQuT+myEteW8+g7H/RbNFju0Sq6iJMoQwm1W21b1U=;
 b=ngm3ZjzqCOed2Tu96GlsJd6/UsRMUtT/enm/Sd3dquZyVWuVR18pBpWGITkIfUDkfQ3bfY
 ksfF5nhtb5FA1g6ySBnLsCtqlNor44VuK9nUnCJP+9qRlxta2e1SOyHzoepQU22vlmtiPL
 04+eqXSNZ9W6wvW3MRXPk2Pc6jjmEvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1669798342;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q1KQuT+myEteW8+g7H/RbNFju0Sq6iJMoQwm1W21b1U=;
 b=Oq8cz98eDWY6W5Ki7EnZxoeiqw2zuS6lXiLzVuAMzxVMKm9qpLVkFSquTflsG33bDyilmE
 xw2UjzqmDK1aYaCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 921051331F;
 Wed, 30 Nov 2022 08:52:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EpvXIMYZh2MTTgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 30 Nov 2022 08:52:22 +0000
Date: Wed, 30 Nov 2022 09:52:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Avinesh Kumar <akumar@suse.de>
Message-ID: <Y4cZxK/SqTtpQb07@pevik>
References: <87r0xmt3ts.fsf@suse.de>
 <20221130070500.28664-1-akumar@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130070500.28664-1-akumar@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] statvfs01: Convert to new LTP API
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

Hi Avinesh,

> Removed the TINFO statements,
> Added a validation of statvfs.f_namemax field by trying to create
> files of valid and invalid length names.
Very nice rewrite, thanks for adding this veryfication.
It'd be nice to update this in docparse description.

> +
> +/*\
> + * [Description]
> + *
> + * Verify that statvfs() executes successfully for all
> + * available filesystems.
e.g.:
Verify that statvfs() executes successfully for all
available filesystems. Verify statvfs.f_namemax field
by trying to create files of valid and invalid length names.

I can merge it with this change.

Reviewed-by: Petr Vorel <pvorel@suse.cz>

...
> +static struct tst_test test = {
> +	.test_all = run,
> +	.setup = setup,
> +	.needs_root = 1,
> +	.mount_device = 1,
> +	.mntpoint = MNT_POINT,
> +	.all_filesystems = 1,
> +	.skip_filesystems = (const char *const[]) {
> +		"vfat",
> +		"exfat",
I was looking what's wrong with vfat and exfat.
statvfs.f_namemax returns 1530, which is obviously too long, thus valid_fname
obviously returns ENAMETOOLONG (36). Tested on 6.1.0-rc6-1.g4c01546-default.
I wonder why, isn't that a bug?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
