Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 992933F5C54
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 12:47:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3296C3C31F7
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 12:47:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CF7EB3C18F7
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 12:47:34 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 21AA3140110C
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 12:47:33 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19C43220C1;
 Tue, 24 Aug 2021 10:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629802053;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrJkQUO5I0LbWH0x0gsxGVX+zHMo3PoG38JYg0jCoac=;
 b=pLgHrGymu1UTG8EaGnTZDFZRsAlwM+kNQhKtaEhEoUS8PsQ33Ed05LCpy2Tb6f6EiR4vKn
 JogXVGawYV+WFBKGh5WVL9wqiIfHSQITEc1yutBYtLJTqa3ksrPWeggPYuTMEnhTKU+CsG
 YlFD5K1jFtbyP69XpgvTZh8j1qCKvx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629802053;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GrJkQUO5I0LbWH0x0gsxGVX+zHMo3PoG38JYg0jCoac=;
 b=yfv2H58mUSfmqIyokvp//xtuLX3DkaBGp3BSspfZkMToFFCDF2F8xA959OrqHvTF0xx/Ri
 XtgwsqTSgYMVaFDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D05FA137F3;
 Tue, 24 Aug 2021 10:47:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id mqqaMETOJGFHEwAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 24 Aug 2021 10:47:32 +0000
Date: Tue, 24 Aug 2021 12:47:31 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YSTOQy+uYU4iNb3n@pevik>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
 <20210812043807.3497492-2-lkml@jv-coder.de>
 <YR+Lc8aBnK6KBOnW@pevik>
 <d6443e3f-9859-82ff-7ba0-f8842cd2f437@jv-coder.de>
 <YSSRrEzZ2uSacXEM@pevik>
 <5441d7fb-3a76-0160-8f48-b9c78be875dd@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5441d7fb-3a76-0160-8f48-b9c78be875dd@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] pec: Improve reliability
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Joerg,

> > FYI, this patch breaks build:

> > make[1]: Leaving directory 'ltp.git/lib'
> > /usr/lib64/gcc/x86_64-suse-linux/11/../../../../x86_64-suse-linux/bin/ld: ../../../../lib/libltp.a(tst_checkpoint.o):ltp.git/lib/tst_checkpoint.c:36: multiple definition of `tst_futexes'; /tmp/ccITQEiq.o:ltp.git/testcases/kernel/connectors/pec/event_generator.c:168: first defined here
> > collect2: error: ld returned 1 exit status
> > make: *** [../../../../include/mk/rules.mk:37: event_generator] Error 1
> Strange that it builds on my system... The symbol is indeed duplicated and a
> leftover from experimenting.
> The declaration in event_generator.c can be removed.
> Should I post a v3?
Yes please.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
