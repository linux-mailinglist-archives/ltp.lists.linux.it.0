Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 714533FBB86
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 20:13:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F5F63C9B5D
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 20:13:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 059763C2B34
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 20:13:10 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 52DD46002BC
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 20:13:09 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 577972206A;
 Mon, 30 Aug 2021 18:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630347189;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmtLGSSQd3ufBdYZYC1bVjozxlXUTUDeF0a3KF9kw/E=;
 b=19CUQ0qcDnH0QGRLEbxNa3ra77k4FYdjuYfcUiaka8sIGirKc74lnahUQaZ5DOz3FQomC8
 aygf4qRmVrrmFvTMkdBUNLa2yZcY0+Lvv6yj79bWNFGIMyrXaOBLgo+HHYmnDqmvHqHKhW
 yZ7/Qnj/UM5yPHF/vSEMKRitm7PTC1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630347189;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nmtLGSSQd3ufBdYZYC1bVjozxlXUTUDeF0a3KF9kw/E=;
 b=k7Os12ZAUUjroyqO2Y+abVT1QmOyVf+FJWVt6qehuv1fb40QCh99WfEt6bFis/VnUxxHb4
 br37bFgEd4HRS4BQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1F43313A13;
 Mon, 30 Aug 2021 18:13:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id A3N2BbUfLWEIOwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 30 Aug 2021 18:13:09 +0000
Date: Mon, 30 Aug 2021 20:13:06 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS0fsly/ryB5MUAN@pevik>
References: <20210728123412.31858-1-rpalethorpe@suse.com>
 <20210728123412.31858-3-rpalethorpe@suse.com>
 <YSjVND0kRfXGQe6g@pevik> <YSzsPWJd66G7OoO+@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSzsPWJd66G7OoO+@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/8] Add 'make check' to the build system
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
> > $ make check
> > ...
> > route-change-netlink.c:13:11: error: unable to open 'libmnl/libmnl.h'

> > <libmnl/libmnl.h> is guarded by #ifdef HAVE_LIBMNL (config.h). Maybe there is a
> > way to pass it to sparse. But that'd silently prevent to check code we want to
> > check, thus it's probably better to just require to have everything installed.

> Well if you are hacking on a test that requires libnl and you want to
> run 'make check' before submission it has to be installed anyways. So
> this is not a big problem for the intended usage...
Sure, you're right.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
