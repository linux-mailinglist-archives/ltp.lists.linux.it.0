Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 030D55B5759
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 11:45:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BC2F3CAAA6
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 11:45:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 90F013C278D
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 11:45:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 96EE71A005E5
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 11:45:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3D7EB229E0;
 Mon, 12 Sep 2022 09:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662975914;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VL8Wyco1TXiktzc7Yt0nWUP2GPRSYPAoz6bA0qq8J1Y=;
 b=LzUmsHn3gzXmQtlyr/tJgSoiwWes8TNUYxq+om13uPk20IoOJB3QYgFLot6NoIFfDKdqDn
 Wki6y/FARnqyQk7pC38lS24tKgOEjWBXXYDwtlqesUKqSVkz1/JLNtS6Pc9TPWM4EUxdJ1
 TkFrRSUDEIz93MVKnyBlTXIpDPO3kTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662975914;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VL8Wyco1TXiktzc7Yt0nWUP2GPRSYPAoz6bA0qq8J1Y=;
 b=6mumncSbMgFNDVtG2nnmEjPHDixmXbSaNIeMC4eIrbQzMt+dmqxdRKdGv2oo+lVWm1uC5i
 Pjdyu0HB/Til5ACQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 004EB139C8;
 Mon, 12 Sep 2022 09:45:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 34pDN6n/HmMWTQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 12 Sep 2022 09:45:13 +0000
Date: Mon, 12 Sep 2022 11:45:10 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Yx7/prIE4LqEOM+P@pevik>
References: <Yxr+EpKTnKQbKXTb@yuki>
 <CAEemH2eSJQ-_30_Y3A567oqBFSOo=1tt7LJMtPq_BodjVNsm8w@mail.gmail.com>
 <YxtUCgHYWD1bqRTe@pevik> <Yx79pc7IVdLrKmw1@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yx79pc7IVdLrKmw1@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] September LTP release
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > FYI in minor fanotify cleanup I just wait to get acked TST_EXP_FD_ERRNO [1]
> > It might be usable only in fanotify, but I'd keep it in tst_test_macros.h
> > Sooner or later it will be usable by other tests.
> > I'm also not sure about the name.

> Since it's calling TST_EXP_FD() or TST_EXP_FAIL() the logical name for
> it would be TST_EXP_FD_OR_FAIL()

I guess I should use TST_EXP_FD_OR_FAIL(). If anybody objects can I merge it
with your ack? Of course I can send proper v2 and wait after the release.

> > If you like this idea, in the future we might
> > add more TST_EXP_*_ERRNO(SCALL, ERRNO, ...) macros, i.e. calling TST_EXP_FAIL or TST_EXP_PASS
> > (thus name could be TST_EXP_PASS_FAIL).

> Without _OR_ between PASS and FAIL the name is kind of confusing. And
> it's not that much better even as TST_EXP_PASS_OR_FAIL() but I cannot
> think of anything better at the moment.
TST_EXP_PASS_OR_FAIL() sounds good. I'll try to add it with some tests converted
(after the release).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
