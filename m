Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB53FC78F
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:47:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CF5003C939E
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Aug 2021 14:47:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1B3EA3C2A5B
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:47:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 05D06200C6D
 for <ltp@lists.linux.it>; Tue, 31 Aug 2021 14:47:38 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4C86220175;
 Tue, 31 Aug 2021 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630414058;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=masSz0fK2h2fqL7FprmfmBoM7ktI/EaItHqQyuuyCic=;
 b=WO1+NWMR42ZLHDzN1Z9JPU/U8aFyh6GjUaIojk+NbStwX2yNKms9p8i/Cx6kRuWMXoLcC2
 wmI1mA/PrnxC24mwnj+OZ1DkmcISGuNfY92jBQRQEflsnEOeOZcWoQljBzd10X2U32raRO
 ieOmyJQee+zOK3Uy+T9Zk/Mkc0I+uAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630414058;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=masSz0fK2h2fqL7FprmfmBoM7ktI/EaItHqQyuuyCic=;
 b=XDrBBiE2tmr1+SRV/fW7MHMPnZfkg0N7kdWW4QUqlduYs8tYBUQkKOV9aFGQwdHt1tBSC2
 ryslkXvYEHaInaBg==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 2CE5013A9A;
 Tue, 31 Aug 2021 12:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mZeuCOokLmG+IAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 31 Aug 2021 12:47:38 +0000
Date: Tue, 31 Aug 2021 14:47:36 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YS4k6IVVdkEJxbWE@pevik>
References: <20210831090837.30245-1-pvorel@suse.cz> <YS3yOSp5U0OS+CVd@yuki>
 <YS3zmWfGvZnTlefF@pevik> <YS4g39blGm67dTxy@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YS4g39blGm67dTxy@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] utils: Remove kernbench-0.42
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > > Unlike other scripts you proposed to remove this one is used by the
> > > power_management test as a workload. Just do 'git grep kernbench'
> > Ah, I'm sorry, I made a typo when grepping. Marking it as rejected.

> > BTW I was looking into other power_management_tests_exclusive tests (the others,
> > which use ebizzy-0.3) because not only on VM but even when running them on my
> > laptop all tests TCONF: System is not a multi socket & multi core & hyper-threaded.

> Well these test should be reviewed and fixed/deleted, but we can't do
> anything about their dependencies before we decide what to do with
> them...
Sure.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
