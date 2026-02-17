Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEQUBLgylGkNAgIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 10:19:52 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9C714A4E0
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 10:19:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1629E3D05E7
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Feb 2026 10:19:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 540E03C7BB7
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 10:19:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8BACC600732
 for <ltp@lists.linux.it>; Tue, 17 Feb 2026 10:19:48 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34E103E880;
 Tue, 17 Feb 2026 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771319987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls+516EBr51iQWaPSy4osjvg9smcyvqKckdbInVlZns=;
 b=KjzGzhig64i2PHsoK8jlle5k+obkfrGh3T1zhpajN64AOqRtgmsXM/8Y0ztaBfxpcb5xWh
 K3iE6ApZJU2mB+ioMm+Dy0ZidDq+JANoaCo2Jh0eOKXGl3WRmS1ohhaZpwReuwQly6wUhW
 qEtiQwlUBu+dy6QraUv/ENoiW3pMjkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771319987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls+516EBr51iQWaPSy4osjvg9smcyvqKckdbInVlZns=;
 b=eo9Ej7RJieYfY4+ZZh6qbbBO9IF3UvllE81KGzvSsLeduMIOJ6BOHRJ7ssV/LwxR9Emjon
 o9j/SqpVesO+BYAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1771319987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls+516EBr51iQWaPSy4osjvg9smcyvqKckdbInVlZns=;
 b=KjzGzhig64i2PHsoK8jlle5k+obkfrGh3T1zhpajN64AOqRtgmsXM/8Y0ztaBfxpcb5xWh
 K3iE6ApZJU2mB+ioMm+Dy0ZidDq+JANoaCo2Jh0eOKXGl3WRmS1ohhaZpwReuwQly6wUhW
 qEtiQwlUBu+dy6QraUv/ENoiW3pMjkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1771319987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ls+516EBr51iQWaPSy4osjvg9smcyvqKckdbInVlZns=;
 b=eo9Ej7RJieYfY4+ZZh6qbbBO9IF3UvllE81KGzvSsLeduMIOJ6BOHRJ7ssV/LwxR9Emjon
 o9j/SqpVesO+BYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 050A63EA65;
 Tue, 17 Feb 2026 09:19:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EoNwBbMylGlxEgAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Tue, 17 Feb 2026 09:19:47 +0000
Date: Tue, 17 Feb 2026 10:19:48 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <aZQytH7k6pVXqdsz@yuki.lan>
References: <20260205121540.329921-1-pvorel@suse.cz>
 <20260205121540.329921-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205121540.329921-2-pvorel@suse.cz>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_MISSING,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/6] doc: INSTALL: dma_thread_diotest.c: Remove
 runltp from doc
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
Cc: ltp@lists.linux.it, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[chrubis@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-]
X-Rspamd-Queue-Id: 9C9C714A4E0
X-Rspamd-Action: no action

Hi!
> Remove runltp from all doc, replace it with kirk.
> Also replace the old runltp-ng with kirk.
> 
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
>  INSTALL                                            |  4 +++-
>  doc/developers/test_case_tutorial.rst              |  6 +++---
>  doc/developers/todo.rst                            | 10 ----------
>  metadata/README.md                                 |  2 +-
>  testcases/kernel/fs/fs_readonly/test_robind.sh     |  2 +-
>  testcases/kernel/io/direct_io/dma_thread_diotest.c |  3 +--
>  testcases/kernel/security/smack/README             |  2 +-
>  testcases/network/can/filter-tests/INSTALL         |  2 +-
>  testcases/network/rpc/rpc-tirpc/README             |  2 +-
>  testscripts/Readme_ROBind                          |  4 ++--
>  10 files changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/INSTALL b/INSTALL
> index c44bb4e660..9ef929a971 100644
> --- a/INSTALL
> +++ b/INSTALL
> @@ -105,9 +105,9 @@ Quick Start
>  	$ ./configure
>  	$ make all
>  	# make install
        ^
	This should be $ (not caused by this patch but worth fixing)
> -	$ /opt/ltp/runltp
>  
>  *NOTE:
> +- For running tests use kirk [1], individual test you can run directly.
                                                    ^
					 This sentece has wrong order of words.

And also oversimplifies things, there is no mention of setting correct
PATH that needs to be done in order to run these tests.

I would just drop that and leave only the first sentence.

>  - LTP assumes the existence of the nobody, bin, and daemon users and their
>  groups.  If these IDs do not exist, certain tests will fail. The respective
>  user and group IDs should be the same, i.e. if `nobody's' user ID is 99, then
> @@ -117,6 +117,8 @@ its group ID should also be 99. The names of the groups are irrelevant.
>  DESTDIR= is also honored for install and will install into $DESTDIR/$prefix,
>  if you want to install into a chroot or a rootfs for instance.
>  
> +[1] https://github.com/linux-test-project/kirk
> +
>  Detailed Installation
>  ---------------------
>  
> diff --git a/doc/developers/test_case_tutorial.rst b/doc/developers/test_case_tutorial.rst
> index 08bd1b1519..240897e36b 100644
> --- a/doc/developers/test_case_tutorial.rst
> +++ b/doc/developers/test_case_tutorial.rst
> @@ -205,9 +205,9 @@ please do:
>  
>  This should build the test and then run it. However, even though the test is
>  in :master:`testcases/kernel/syscalls` directory it won't be automatically ran
> -as part of the syscalls test group (e.g. not run via ``kirk -r math`` or
> -``./runltp -f syscalls``). For this we need to add it to the runtest file. So
> -open :master:`runtest/syscalls` and add the lines starting with a ``+``.
> +as part of the syscalls test group (e.g. not run via ``kirk -r math``.  For
                                                                        ^
									missing
									closing
									)

Also the path to syscalls is missing after the change.

> +this we need to add it to the runtest file. So open :master:`runtest/syscalls`
> +and add the lines starting with a ``+``.
>  
>  .. code-block::

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
