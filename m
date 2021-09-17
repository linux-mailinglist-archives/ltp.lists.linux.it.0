Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 944D540F69C
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 13:16:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 47B463C884D
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Sep 2021 13:16:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 307573C1B0A
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 13:16:38 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 724D41A00F25
 for <ltp@lists.linux.it>; Fri, 17 Sep 2021 13:16:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFA0A20274;
 Fri, 17 Sep 2021 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631877397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrucSyRNV+iSRIWXvYS4We+plHhQlXfFlzMWWLD/cVc=;
 b=aZBufhiykmFpUNRnDp01cRh2h0YxooLWtYtIvM2JtAUQ9DggVxS4DBQYAkuC78aRbBq2+4
 cYhrSOq+Fcw0cZWanmZFMV6WCD7F5c8YHS9X2RC8UDvUH0fKvZIptaGW7FG+rsmiZI/o9K
 YltUuaF/dv9A5v9jXtsuVrVhCtpSq9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631877397;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JrucSyRNV+iSRIWXvYS4We+plHhQlXfFlzMWWLD/cVc=;
 b=bQTAqY7JWqZzIqOS5JEEkvckCkFCyfQYhxihJRRpFtsvhBsxOptBLFFLYcScRfDFlGY6jz
 PBmAGpHZeGv7XfBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6ED1414063;
 Fri, 17 Sep 2021 11:16:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3CsZGRV5RGF4HQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 17 Sep 2021 11:16:37 +0000
Date: Fri, 17 Sep 2021 13:16:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alex Henrie <alexh@vpitech.com>
Message-ID: <YUR5E6eFMxieUbWA@pevik>
References: <20210914161503.97495-1-alexh@vpitech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914161503.97495-1-alexh@vpitech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH ltp v3 1/2] IMA: Move check_policy_writable to
 ima_setup.sh and rename it
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
Cc: linux-integrity@vger.kernel.org, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Alex,

...
> --- a/testcases/kernel/security/integrity/ima/tests/ima_setup.sh

As it's now a generally used function I'll add a comment:

# Because we don't grep kernel config for CONFIG_IMA_WRITE_POLICY, we just try
# to write empty string (invalid), thus policy must be repeatedly checked.
# Because after first write to policy policy will be removed on systems without
# CONFIG_IMA_WRITE_POLICY.
> +require_policy_writable()
> +{
> +	local err="IMA policy already loaded and kernel not configured to enable multiple writes to it (need CONFIG_IMA_WRITE_POLICY=y)"
> +
> +	[ -f $IMA_POLICY ] || tst_brk TCONF "$err"
> +	# CONFIG_IMA_READ_POLICY
> +	echo "" 2> log > $IMA_POLICY
> +	grep -q "Device or resource busy" log && tst_brk TCONF "$err"
> +}
> +

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
