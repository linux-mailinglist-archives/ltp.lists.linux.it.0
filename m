Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F8B444468
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:11:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA10A3C72C9
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 16:11:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5C4AA3C2FCF
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:11:41 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B2A5B60032A
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 16:11:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB7AE212C8;
 Wed,  3 Nov 2021 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635952299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4W4jNk2o5kigbU5eSTo+Hk2vXmG4/ijzI54OA+A87l8=;
 b=Ouj3OvTADixAWvwM8DeD6EDoyQREvtQuMVwctHyfN1iITBxsgg+A1xgM4gWR8buR4gJcDS
 MkvZvpj1oCGlVunnmrjWUGSGUiJIBVWbf7ZPkPHXDmnQStfGjBQY0k+VItbYu85ldaQydZ
 ccJ2WQvHkMAOT2+tKIfa9M/75oYN//4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635952299;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4W4jNk2o5kigbU5eSTo+Hk2vXmG4/ijzI54OA+A87l8=;
 b=/+E2HOao/zjAdhn2WFYP5T32gNWkBihM4My62ijL77ksZIqbQW573vLdNjw1fTXC1Xpfjz
 yOKUUQG8l4Mo/pAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C745013BAA;
 Wed,  3 Nov 2021 15:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T1XULqumgmE1LwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 03 Nov 2021 15:11:39 +0000
Date: Wed, 3 Nov 2021 16:11:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>, ltp@lists.linux.it
Message-ID: <YYKmqo3NCZi35DKB@pevik>
References: <20211103120233.20728-1-chrubis@suse.cz>
 <20211103120233.20728-8-chrubis@suse.cz> <YYKI9I05hEjiKNiE@pevik>
 <YYKLnxZL44ftguOx@yuki> <YYKMIuHDheI1PK8x@yuki>
 <YYKe0sdsN/qGRO8E@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYKe0sdsN/qGRO8E@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi Cyril,

> Changes LGTM (works locally, testing it in CI:
> https://github.com/pevik/ltp/actions/runs/1417208983
Failed :(.

Reproducible locally:
make -C "metadata" \
	-f "/home/pvorel/install/src/ltp.git/metadata/Makefile" install
make[1]: Entering directory '/home/pvorel/install/src/ltp.git/metadata'
make -C /home/pvorel/install/src/ltp.git/docparse/ -f /home/pvorel/install/src/ltp.git/docparse/Makefile install
make[2]: Entering directory '/home/pvorel/install/src/ltp.git/docparse'
install -m 00775   "/home/pvorel/install/src/ltp.git/docparse/metadata.html" /opt/ltp/metadata/metadata.html
install: cannot stat '/home/pvorel/install/src/ltp.git/docparse/metadata.html': No such file or directory
make[2]: *** [../include/mk/env_post.mk:85: /opt/ltp/metadata/metadata.html] Error 1
make[2]: Leaving directory '/home/pvorel/install/src/ltp.git/docparse'
make[1]: *** [/home/pvorel/install/src/ltp.git/metadata/Makefile:26: install] Error 2
make[1]: Leaving directory '/home/pvorel/install/src/ltp.git/metadata'
make: *** [Makefile:138: metadata-install] Error 2

Maybe I wrongly applied your patch, could you please have a look?

Kind regards,
Petr

diff --git metadata/Makefile metadata/Makefile
index f1d99b243..6c36cd210 100644
--- metadata/Makefile
+++ metadata/Makefile
@@ -6,7 +6,7 @@ top_srcdir		?= ..
 include $(top_srcdir)/include/mk/env_pre.mk
 include $(top_srcdir)/include/mk/functions.mk
 
-MAKE_TARGETS		:= ltp.json
+MAKE_TARGETS		:= ltp.json docparse
 HOST_MAKE_TARGETS	:= metaparse
 INSTALL_DIR		= metadata
 
@@ -21,11 +21,6 @@ ifeq ($(WITH_METADATA),yes)
 	$(MAKE) -C $(abs_top_builddir)/docparse/ -f $(abs_top_srcdir)/docparse/Makefile
 endif
 
-ifeq ($(WITH_METADATA),yes)
-install:
-	$(MAKE) -C $(abs_top_builddir)/docparse/ -f $(abs_top_srcdir)/docparse/Makefile install
-endif
-
 test:
 	$(MAKE) -C $(abs_srcdir)/tests/ test
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
