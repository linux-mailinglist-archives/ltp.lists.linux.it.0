Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AE5B6AB2
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:29:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0272F3CAAF1
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:29:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BA8473CA6CB
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:29:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 24377600CF8
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:29:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5842A5C0E5;
 Tue, 13 Sep 2022 09:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663061369;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GkdvQxnQWe57+4NTooe/1Gqz4CVABQbCuKcmRUG+pK4=;
 b=gFRdk5cqIBchAbCXDBhbUw0yqZZBC56Nx5T4NfFODdVoh6PCGXkGsNSYMOR4pwNIS1EV+i
 /T5SJv+mHrZHbd6hrOezv1yfR0tP2jw7iYUL/HdNc1TQ354+v+FprfDTIY/oEmuamvL2oj
 9vX4ZyH3DWoR6C0zn6uqndK9AH4391w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663061369;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GkdvQxnQWe57+4NTooe/1Gqz4CVABQbCuKcmRUG+pK4=;
 b=TIH3zdqqD9wGtqCvptlAb4K+8HHh4xcbHy9D9FdILNd26z9Dntm/BwZ70lfzL3czSDVvA3
 jfGVeqtKNtBqFPAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 16AA113AB5;
 Tue, 13 Sep 2022 09:29:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKMjA3lNIGMCMgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Sep 2022 09:29:29 +0000
Date: Tue, 13 Sep 2022 11:29:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YyBNdpiOGeNjVFWs@pevik>
References: <20220909141840.18327-1-pvorel@suse.cz>
 <20220909141840.18327-4-pvorel@suse.cz> <Yx9Fa69/ukgEJylz@yuki>
 <Yx+WwsY6xXV8t+62@pevik> <YyA7P/eci29BIMI5@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YyA7P/eci29BIMI5@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 03/10] tst_supported_fs: Print TCONF if no
 filesystem supported
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
> > > Shouldn't we rather than this add tst_res(TCONF, "...") messages to the
> > > lib/tst_supported_fs_types.c so that we get consistent messages between
> > > C and shell?

> > Well, in v4 I add TCONF in tst_fs_is_supported_skiplist()
> > (lib/tst_supported_fs_types.c), but you asked for TST_FS_UNSUPPORTED [1].

> I guess that we misunderstand each other. I'm fine with the library
> printing messages, what I didn't like was the tst_brk() which made the
> whole program execution flow obscured.

OK, instead of this from v4:
> +	if (tst_fs_in_skiplist(fs_type, skiplist)) {
> +		tst_brk(TCONF, "%s is not supported by the test",
> +			fs_type);

I'll add in v6:
> +	if (tst_fs_in_skiplist(fs_type, skiplist)) {
> +		tst_res(TCONF, "%s is not supported by the test",
> +			fs_type);
> +		return TST_FS_UNSUPPORTED;
> +	}

I'll add tst_res(TINFO, "%s is supported by the test", fs_name);
from do_test_setup() tst_fs_is_supported_skiplist() and call
tst_fs_is_supported_skiplist() in do_test_setup().

But not sure if there can be a cleanup of duplicity of:
if (!filesystems[0])
	tst_brk(TCONF, "There are no supported filesystems")

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
