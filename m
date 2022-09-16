Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1EF5BADD6
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 15:09:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42CCD3CAC7D
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Sep 2022 15:09:44 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B98493CACA3
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 15:09:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D192E201DA6
 for <ltp@lists.linux.it>; Fri, 16 Sep 2022 15:09:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 369C61FBA0;
 Fri, 16 Sep 2022 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663333778;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cPYsCCfpxB5/Jz7ArOiMefBXMMcnhnYmyTcJpqlDls=;
 b=lIQbnBurajzJ1vwTnYcd/NDZBVFkSZ7KKxKD4E7RD5rbEpEXs37W7bh7bw84B7EinKXmbM
 MYegHlThqhzFTPbiMvZciDaMW4OwVgerSGbgZrag0ipdaWsx5uY4Zcs1Li9jy9c886U5z7
 NTFJcfw+Z9ndxDj7K0bNefnIVGayfmA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663333778;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4cPYsCCfpxB5/Jz7ArOiMefBXMMcnhnYmyTcJpqlDls=;
 b=4CJngMMCIPXAZkEVGXe+/t8SyPyhNyTs0XJjXNDsQ+63MyDsLThOpp2TKAQ/TwblmEpj21
 Iw+zNOpymoLLbRDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D4A021346B;
 Fri, 16 Sep 2022 13:09:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t/8GMJF1JGNrOQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 16 Sep 2022 13:09:37 +0000
Date: Fri, 16 Sep 2022 15:09:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YyR1j825ty3gIz/s@pevik>
References: <20220915093639.2261-1-pvorel@suse.cz>
 <20220915093639.2261-6-pvorel@suse.cz> <YyRv8WmjRKLQrAw3@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyRv8WmjRKLQrAw3@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v6 5/8] tst_test.sh: Add $TST_ALL_FILESYSTEMS
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

> Hi!
> > +	if [ "$TST_ALL_FILESYSTEMS" != 1 ]; then
> > +		if ! tst_supported_fs -s "$TST_SKIP_FILESYSTEMS" $TST_FS_TYPE > /dev/null; then

> Whatever the API ends up I guess that we should check the support and
> mkfs here as well in order to TCONF early before we create a device and
> attempt to format/mount it.
I was worried to add mkfs.foo dependency unless there is a requirement for it
(i.e. TST_NEEDS_DEVICE=1). Do you really want to add this dependency for *all*
tests? (I'd prefer no, i.e. to keep here check only for test not being skipped,
because check for mkfs.foo is in tst_mkfs which does the job, thus not only we'd
add an extra unneeded dependency but also duplicity in the check).

But if you want it, i.e. if we require mkfs.$TST_FS_TYPE (unless tmpfs of
course, which is handled properly) here, then we don't need to separate checks
for mkfs.foo and skip list in testcases/lib/tst_supported_fs.c.

Kind regards,
Petr

> Otherwise:

> Reviewed-by: Cyril Hrubis <chrubis@suse.cz>

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
