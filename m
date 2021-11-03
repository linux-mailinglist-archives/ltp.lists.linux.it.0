Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFED4444B2
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:35:00 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F126F3C72C8
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:34:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7746B3C712D
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:34:55 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 2B1C21000998
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:34:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 56CA5218EE;
 Wed,  3 Nov 2021 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635953693; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ug0R4NWaOQ+1gZdENtnCAA9hZH6bA9zbxok5Gsm4DGM=;
 b=2vH/hWe8JK5uGXM3m0DC4gzmv6Sl2BHcg+EEaPW5DDoiwzog/SRnIiwkzrmwMq8AzMZ4F+
 koq3khhwv298lb6cvxy7Im9S+OqFNeguemB6c4QjbGVKPwP8U2Qk/dBzuND1UC28Ly5H2K
 qb2XLLNOmiZlipokLrbh/Z+WWqMDdL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635953693;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ug0R4NWaOQ+1gZdENtnCAA9hZH6bA9zbxok5Gsm4DGM=;
 b=ZT4P9OkJJ2pRZQe0/gY/dXUHCqvyBLFegobGnq1oEwVK3EDmtUnRiFwxwXxcOKmqUyj6fv
 JXiyERAENkqE+HDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A08113C91;
 Wed,  3 Nov 2021 15:34:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hoLxCR2sgmHjOwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 03 Nov 2021 15:34:53 +0000
Date: Wed, 3 Nov 2021 16:35:49 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYKsVYjYm0lk8cpD@yuki>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-8-chrubis@suse.cz> <YYKI9I05hEjiKNiE@pevik>
 <YYKLnxZL44ftguOx@yuki> <YYKMIuHDheI1PK8x@yuki>
 <YYKe0sdsN/qGRO8E@pevik> <YYKmqo3NCZi35DKB@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYKmqo3NCZi35DKB@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 7/7] docparse: Split into metadata and docparse
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
> > Changes LGTM (works locally, testing it in CI:
> > https://github.com/pevik/ltp/actions/runs/1417208983
> Failed :(.
> 
> Reproducible locally:
> make -C "metadata" \
> 	-f "/home/pvorel/install/src/ltp.git/metadata/Makefile" install
> make[1]: Entering directory '/home/pvorel/install/src/ltp.git/metadata'
> make -C /home/pvorel/install/src/ltp.git/docparse/ -f /home/pvorel/install/src/ltp.git/docparse/Makefile install
> make[2]: Entering directory '/home/pvorel/install/src/ltp.git/docparse'
> install -m 00775   "/home/pvorel/install/src/ltp.git/docparse/metadata.html" /opt/ltp/metadata/metadata.html
> install: cannot stat '/home/pvorel/install/src/ltp.git/docparse/metadata.html': No such file or directory
> make[2]: *** [../include/mk/env_post.mk:85: /opt/ltp/metadata/metadata.html] Error 1
> make[2]: Leaving directory '/home/pvorel/install/src/ltp.git/docparse'
> make[1]: *** [/home/pvorel/install/src/ltp.git/metadata/Makefile:26: install] Error 2
> make[1]: Leaving directory '/home/pvorel/install/src/ltp.git/metadata'
> make: *** [Makefile:138: metadata-install] Error 2
> 
> Maybe I wrongly applied your patch, could you please have a look?

As far as I can tell this just means that the html wasn't build at all,
at least that's what was shown by the CI.

> Kind regards,
> Petr
> 
> diff --git metadata/Makefile metadata/Makefile
> index f1d99b243..6c36cd210 100644
> --- metadata/Makefile
> +++ metadata/Makefile
> @@ -6,7 +6,7 @@ top_srcdir		?= ..
>  include $(top_srcdir)/include/mk/env_pre.mk
>  include $(top_srcdir)/include/mk/functions.mk
>  
> -MAKE_TARGETS		:= ltp.json
> +MAKE_TARGETS		:= ltp.json docparse
>  HOST_MAKE_TARGETS	:= metaparse
>  INSTALL_DIR		= metadata

I guess that this is the revese diff.

> @@ -21,11 +21,6 @@ ifeq ($(WITH_METADATA),yes)
>  	$(MAKE) -C $(abs_top_builddir)/docparse/ -f $(abs_top_srcdir)/docparse/Makefile
>  endif

This part is likely wrong, it should look like:

ltp.json: metaparse
        $(abs_srcdir)/parse.sh > ltp.json
ifeq ($(WITH_METADATA),yes)
        mkdir -p $(abs_top_builddir)/docparse
        $(MAKE) -C $(abs_top_builddir)/docparse/ -f $(abs_top_srcdir)/docparse/Makefile
endif

So that in the case that WITH_METADATA is set the rule has three lines
not one.

And that would explain why the html wasn't build since there was a
docparse rule but nothing refrenced it.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
