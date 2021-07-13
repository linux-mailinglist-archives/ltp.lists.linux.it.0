Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F323C6D58
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:26:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D2E443C6756
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:26:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC7C33C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:26:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id C513A1A00A57
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:26:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0AED720075;
 Tue, 13 Jul 2021 09:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626168405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gpGKCHTHr/E8j1cdE53ZuS0G4O2vR4eJCZjdmIGJ/V8=;
 b=D/mfpddZJ68MsAisZkUuGhdqehUOpvEJYo8pRM3wkArK3e+8g7HHuOg/w1bmSrjmZaAHlR
 1B2lvRdbFM/PUMebSN2t/XP24sgG0/U6bNkeHnDla0T3a2oVCA31kTUO3rijfX7dQOFQkP
 x9qeGWDN9a0FJLk55SEWI78Amf1s1Ew=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626168405;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gpGKCHTHr/E8j1cdE53ZuS0G4O2vR4eJCZjdmIGJ/V8=;
 b=BH0fzzZmLyzEvUrO/ocED2KxU2JKO2FGsDUgTTjqRqWmX6dgeLAhuaZ5tw/PfAZFR2APTw
 xaYeY0xj2c5c+5Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAED213AE2;
 Tue, 13 Jul 2021 09:26:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hJfEK1Rc7WCvVAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 09:26:44 +0000
Date: Tue, 13 Jul 2021 11:26:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YO1cU11EEzoZIFNT@pevik>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
 <d2d298df-b432-4afb-6654-cafb7de36bbb@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2d298df-b432-4afb-6654-cafb7de36bbb@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] tst_strstatus.c fails on Alpine
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

Hi Alexey,

> On 13.07.2021 09:08, Jan Stancek wrote:


> > On Mon, Jul 12, 2021 at 7:02 PM Petr Vorel <pvorel@suse.cz <mailto:pvorel@suse.cz>> wrote:

> >     Hi all,

> >     I see failures of lib/newlib_tests/tst_strstatus on Alpine:

> >     tst_strstatus.c:31: TPASS: exited with 1
> >     tst_strstatus.c:31: TPASS: killed by SIGHUP
> >     tst_strstatus.c:31: TPASS: is stopped
> >     tst_strstatus.c:31: TPASS: is resumed
> >     tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff

> >     Any idea what could be wrong?


> > I'd start with definition of WIFSIGNALED on that system.

> > printf("%d\n", WIFSIGNALED(0xff));
> > should give you 0, but it does appear to return 1 in output above.


> musl defines it as:
> #define WIFSIGNALED(s) (((s)&0xffff)-1U < 0xffu)
> so passing 0xff trigger this.

> This difference from the glibc have appeared since the commit:
> 41c632824c08 ("fix definitions of WIFSTOPPED and WIFSIGNALED to support up to signal 127")

> May be changed 0xff to 0x1ff for invalid status...

Thanks, 0x1ff is the right value for both glibc and musl.
I'll send it as part of v4 	of my patchset "Run tests in CI".

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
