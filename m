Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 374585B5740
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 11:34:47 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 995233CAAAC
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Sep 2022 11:34:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7687E3CA306
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 11:34:44 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id D1BDC600691
 for <ltp@lists.linux.it>; Mon, 12 Sep 2022 11:34:43 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BE87722938;
 Mon, 12 Sep 2022 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1662975282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQH+bUY/NVEGQjbSO59i2iZ7H0rljlYWnbyXX1ViTcE=;
 b=dt+w3+OiCWAZDtLmomtPtVubik0R+mF24VwpDR7CVgzFOOLQVt3NtxyQwIx647JlgaavNs
 umAChzQ6wifb+mtVkLScPalDcjuJIr24Z4P6CcydRBfju+ez5ozMak4IATkKAVMyYhYJZH
 mMo11C2JgXfxoxwnG7Koi99zeswVcUY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1662975282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iQH+bUY/NVEGQjbSO59i2iZ7H0rljlYWnbyXX1ViTcE=;
 b=jTrU0APgTKvzPdwO2HN3x9EPI9qmG/pUlUDwrI0LQpwAGxu72aStvRkq3REMKgg08YWUUU
 u8x8MhpQYbMlzVBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9E53C139C8;
 Mon, 12 Sep 2022 09:34:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pt2aJTL9HmO0SAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 12 Sep 2022 09:34:42 +0000
Date: Mon, 12 Sep 2022 11:36:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yx79pc7IVdLrKmw1@yuki>
References: <Yxr+EpKTnKQbKXTb@yuki>
 <CAEemH2eSJQ-_30_Y3A567oqBFSOo=1tt7LJMtPq_BodjVNsm8w@mail.gmail.com>
 <YxtUCgHYWD1bqRTe@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YxtUCgHYWD1bqRTe@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> FYI in minor fanotify cleanup I just wait to get acked TST_EXP_FD_ERRNO [1]
> It might be usable only in fanotify, but I'd keep it in tst_test_macros.h
> Sooner or later it will be usable by other tests.
> I'm also not sure about the name.

Since it's calling TST_EXP_FD() or TST_EXP_FAIL() the logical name for
it would be TST_EXP_FD_OR_FAIL()

> If you like this idea, in the future we might
> add more TST_EXP_*_ERRNO(SCALL, ERRNO, ...) macros, i.e. calling TST_EXP_FAIL or TST_EXP_PASS
> (thus name could be TST_EXP_PASS_FAIL).

Without _OR_ between PASS and FAIL the name is kind of confusing. And
it's not that much better even as TST_EXP_PASS_OR_FAIL() but I cannot
think of anything better at the moment.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
