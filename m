Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F83FB843
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:33:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 185533C2F7B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Aug 2021 16:33:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B1B113C2AE0
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:33:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 2AE2960078F
 for <ltp@lists.linux.it>; Mon, 30 Aug 2021 16:33:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 58D3B200C4;
 Mon, 30 Aug 2021 14:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630334004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=efqH7N+cnTivve0C6Rxs6AUxjVCQgLhLZnqBccDCngw=;
 b=PH6xfr0j4ODGQjmyuNgWmzF0MpungnpH81yTQ7TOIzPGmDPLg0uZk8xKhL1FkNePOMAK8U
 GpNf66ts1VXjjv1cMXwm924mslpIN3ZMa5g9dH0pCn9Cb5icGAw/8dlRlHxC5Xnncqyk8T
 fRNua3+/3ZoMAoQzF5DlMlvRYDNDH9o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630334004;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=efqH7N+cnTivve0C6Rxs6AUxjVCQgLhLZnqBccDCngw=;
 b=7m2TrJUr/l2Jxlr2ua4evNfPszEwXPXyFE0A8NoalkQh2AZ9SOoD5r5gmipriKIs04S257
 q15aEbLaRvbT3GCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 473F113B68;
 Mon, 30 Aug 2021 14:33:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5Z45EDTsLGHWOAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 30 Aug 2021 14:33:24 +0000
Date: Mon, 30 Aug 2021 16:33:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YSzsPWJd66G7OoO+@yuki>
References: <20210728123412.31858-1-rpalethorpe@suse.com>
 <20210728123412.31858-3-rpalethorpe@suse.com>
 <YSjVND0kRfXGQe6g@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YSjVND0kRfXGQe6g@pevik>
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> $ make check
> ...
> route-change-netlink.c:13:11: error: unable to open 'libmnl/libmnl.h'
> 
> <libmnl/libmnl.h> is guarded by #ifdef HAVE_LIBMNL (config.h). Maybe there is a
> way to pass it to sparse. But that'd silently prevent to check code we want to
> check, thus it's probably better to just require to have everything installed.

Well if you are hacking on a test that requires libnl and you want to
run 'make check' before submission it has to be installed anyways. So
this is not a big problem for the intended usage...

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
