Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D1484075
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:04:14 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 662B93C9037
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:04:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8ECA93C1D3C
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:04:09 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1B4C51A00617
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:04:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 545691F398;
 Tue,  4 Jan 2022 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1641294248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TDYsTHp2dJh3e1hZLC7BQj3eBP7S+8OGb0a99TU9cgk=;
 b=D2FS9Qd2ICGJJqrmFqSrpPQ16tUK/cD6JD9GkDq+H3XkIW49DePzIBhc/x6j0g+5XExUmE
 YqTLczOo26+ALrrtKBM/4GU1HruE/0PeR847fNna3M+j1Mx8dbDZml4TkDvx5ne3n7pZ9/
 JBte1oIHDXmlqvsi5OPmgAZXTNIh2HI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1641294248;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TDYsTHp2dJh3e1hZLC7BQj3eBP7S+8OGb0a99TU9cgk=;
 b=EbgkmMuVFvImz4DsDy2vhrLKkSuxUT5PkNqdAMoVrmJ2ULs60dY3gNxNQ3msH1wormxl9T
 gou34BD1X0bVHFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EA7413ADF;
 Tue,  4 Jan 2022 11:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RsZCDqgp1GEwLwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 04 Jan 2022 11:04:08 +0000
Date: Tue, 4 Jan 2022 12:05:37 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <YdQqAcvN/X+2PUom@yuki>
References: <20220104081836.22827-1-andrea.cervesato@suse.com>
 <20220104081836.22827-2-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104081836.22827-2-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1 01/10] Prepare watchqueue testing suite build
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
> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  testcases/kernel/Makefile              |  1 +
>  testcases/kernel/watchqueue/.gitignore | 10 ++++++++++
>  testcases/kernel/watchqueue/Makefile   |  8 ++++++++
>  3 files changed, 19 insertions(+)
>  create mode 100644 testcases/kernel/watchqueue/.gitignore
>  create mode 100644 testcases/kernel/watchqueue/Makefile
> 
> diff --git a/testcases/kernel/Makefile b/testcases/kernel/Makefile
> index 4604f1f38..d44856c57 100644
> --- a/testcases/kernel/Makefile
> +++ b/testcases/kernel/Makefile
> @@ -38,6 +38,7 @@ SUBDIRS			+= connectors \
>  			   sound \
>  			   tracing \
>  			   uevents \
> +			   watchqueue \
>  
>  ifeq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
>  SUBDIRS			+= power_management
> diff --git a/testcases/kernel/watchqueue/.gitignore b/testcases/kernel/watchqueue/.gitignore
> new file mode 100644
> index 000000000..797ccc243
> --- /dev/null
> +++ b/testcases/kernel/watchqueue/.gitignore
> @@ -0,0 +1,10 @@
> +wqueue01
> +wqueue02
> +wqueue03
> +wqueue04
> +wqueue05
> +wqueue06
> +wqueue07
> +wqueue08
> +watch_test.c
> +watch_test

The two last entries does not seem to be right.

Also I guess that it's more common to add entries like that
incrementally each with the corresponding test.

> diff --git a/testcases/kernel/watchqueue/Makefile b/testcases/kernel/watchqueue/Makefile
> new file mode 100644
> index 000000000..0008b8cc4
> --- /dev/null
> +++ b/testcases/kernel/watchqueue/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +top_srcdir			?= ../../..
> +
> +LDLIBS += $(KEYUTILS_LIBS)
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -- 
> 2.34.1
> 
> 
> -- 
> Mailing list info: https://lists.linux.it/listinfo/ltp

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
