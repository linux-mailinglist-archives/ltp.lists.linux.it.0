Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 793697C85D0
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 14:31:01 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 499303CD3E5
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Oct 2023 14:31:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 10D643C88A9
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 14:30:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 5AF302005E2
 for <ltp@lists.linux.it>; Fri, 13 Oct 2023 14:30:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 28BA61FDA0;
 Fri, 13 Oct 2023 12:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1697200258;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=94rcoEPtlED0dmYVqqbPdgqFY1L4ZX4AtNM0ZOzkHmo=;
 b=UW3NV/hPzv7P+cUZTjmA98os4H5LD8h9QpdCL9lK2qu34ErU9AK8SYAhqdpFZVA0A60AQq
 EhecpJGIu7RN337g8UGHQJUEDKLNSv3wA67Eri3V/rdYFlpiwXfEuh85yySj/C6XmFT09s
 AhZOIy+aw7aI4p6JV8HZr8octVYuGbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1697200258;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=94rcoEPtlED0dmYVqqbPdgqFY1L4ZX4AtNM0ZOzkHmo=;
 b=vq2KAzZXDiQ7lTeAdJyapnYrohVerzdxTeNJVZwdu0W5GNSLgeOWDuYzlpBoNz7cnbQVDD
 YnRq9A5gKRmdU1Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F279E138EF;
 Fri, 13 Oct 2023 12:30:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zwMYOoE4KWV6cwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 13 Oct 2023 12:30:57 +0000
Date: Fri, 13 Oct 2023 14:30:56 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20231013123056.GC733568@pevik>
References: <20231013074748.702214-1-pvorel@suse.cz>
 <20231013074748.702214-3-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231013074748.702214-3-pvorel@suse.cz>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.44
X-Spamd-Result: default: False [-3.44 / 50.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; NEURAL_HAM_LONG(-3.00)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCPT_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_NOT_FQDN(0.50)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.14)[68.09%]
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/4] lib: Add .modprobe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi all,

maybe .modprobe is too short name, but I'm not sure what would be better.
Maybe .modprobe_module ?

...
> +++ b/doc/C-Test-API.asciidoc
> @@ -1609,6 +1609,11 @@ first missing driver.
>  The detection is based on reading 'modules.dep' and 'modules.builtin' files
>  generated by kmod. The check is skipped on Android.

> +NULL terminated array '.modprobe' of kernel module names are tried to be loaded
> +with 'modprobe' unless they are builtin or already loaded. Test exits with
> +'TCONF' on first 'modprobe' non-zero exit. During cleanup are the modules
> +loaded by the test unloaded with 'rmmod'.

...

> +	if (tst_test->modprobe) {
> +		const char *name;
> +		int i;
> +
> +		for (i = 0; (name = tst_test->modprobe[i]); ++i) {
> +			/* only load module if not already loaded */
> +			if (!module_loaded(name) && tst_check_builtin_driver(name)) {

Also we could make it independent on modules.builtin (NixOS based problem -
missing these files). I.e. we would keep only module_loaded(), remove 
tst_check_builtin_driver(). But then we could not run rmmod / modprobe -r,
or we would have to ignore it's exit code (rmmod on builtin module) fails.

Kind regards,
Petr

> +				const char *const cmd_modprobe[] = {"modprobe", name, NULL};
> +				SAFE_CMD(cmd_modprobe, NULL, NULL);
> +				modules_loaded[i] = 1;
> +			}
> +		}
> +	}
> +

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
