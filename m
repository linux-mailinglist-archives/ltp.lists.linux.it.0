Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE94440B9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 12:39:08 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 281053C72A0
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 12:39:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7DA73C67E6
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 12:39:03 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id DE200600269
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 12:39:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F38072191C;
 Wed,  3 Nov 2021 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635939541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ozeDJlJiLS6w7kC+zxc2TiA7j0Db9Dhw1SzvCV+12E=;
 b=qGOFbMwoVEzs/owuC4nAC02lRslVBUY1s4NCkn4Eh+Fims9klhvr5SphJMEozbR387A1uv
 H8IuAbrzctWtdKFNv9J8nXiX7zv85kLTS2t6SCJQxAjxlQVB0l516ZgzKoJvv50D4Sai9r
 xFVG93WE5gY4iTulqVjJ22fzdNOzDZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635939542;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ozeDJlJiLS6w7kC+zxc2TiA7j0Db9Dhw1SzvCV+12E=;
 b=W3YP5R/cZ5DIiU/937a9QF71p4sK+h+lvUHhHeRc9SY1QAKYwIxfwFq08g6LJtaA/Kx50q
 AQgqGOmrV0APxIDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDA1D13DC1;
 Wed,  3 Nov 2021 11:39:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KHI+NdV0gmG/OQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 03 Nov 2021 11:39:01 +0000
Date: Wed, 3 Nov 2021 12:39:57 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YYJ1DV0+0ftuHT2U@yuki>
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-8-chrubis@suse.cz> <YYFXns53AsnQQg6w@pevik>
 <YYFZLdb91Tz9h6vN@yuki> <YYFbz0LCHPiY+MNB@pevik>
 <YYFhgS9r+TWxN0QB@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYFhgS9r+TWxN0QB@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 7/7] docparse: Split into metadata and docparse
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
> Also looking at the Makefile it may not work with out-of-tree build, so
> we may need this as well:
> 
> diff --git a/metadata/Makefile b/metadata/Makefile
> index 76a3aed94..9b88d8302 100644
> --- a/metadata/Makefile
> +++ b/metadata/Makefile
> @@ -17,10 +17,10 @@ ltp.json: metaparse
> 
>  docparse: ltp.json
>  ifeq ($(WITH_METADATA),yes)
> -       $(MAKE) -C ../docparse/
> +       $(MAKE) -C $(top_srcdir)/docparse/
>  endif
> 
>  test:
> -       $(MAKE) -C tests/ test
> +       $(MAKE) -C $(abs_srcdir)/tests/ test
> 
>  include $(top_srcdir)/include/mk/generic_leaf_target.mk

And it's more complex than this, I guess that I will fix the out-of-tree
build send send another version of the patchset.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
