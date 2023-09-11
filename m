Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA779A991
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 17:23:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E0BFB3CE847
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Sep 2023 17:23:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B46643CB367
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 17:23:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id BB93D14011B6
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 17:23:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0A3221835
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694445807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVZNWNUazVHFVrzrgvnIJgXvojYlPf4pNnD4RLmDDGQ=;
 b=sIWktlAjbpNK5tY3y+pIMOJmfPZ1tDjsicIOLYp4+JlUxQWiuVjy+AcCsla/SjjHLnMtt2
 3s+UZx9CqtFnuYSmbr1FM7linMlQ5ZXMlplU+wfTwUDyTeX/Rfqina9Ut641r3GQCZ+lhz
 bpuqpHkgJWE7wQ0yojwtuY4RCvdNxPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694445807;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tVZNWNUazVHFVrzrgvnIJgXvojYlPf4pNnD4RLmDDGQ=;
 b=6EtUqTQwm/o/eLDB17P4iuKho5nDafcW4Hy45jbs54C2Ayh4TIl/kml0eqHsWTaTVdVb/k
 hmZnkOur//WucJAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A360113780
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 15:23:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 99zSJu8w/2RwZwAAMHmgww
 (envelope-from <mkittler@suse.de>)
 for <ltp@lists.linux.it>; Mon, 11 Sep 2023 15:23:27 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp <ltp@lists.linux.it>
Date: Mon, 11 Sep 2023 17:23:27 +0200
Message-ID: <5969670.lOV4Wx5bFT@linux-9lzf>
In-Reply-To: <ZP8u7Zf0GZpi5TpF@yuki>
References: <20230911120408.31921-1-mkittler@suse.de> <ZP8u7Zf0GZpi5TpF@yuki>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] Avoid messing with system tty in ioctl01.c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Am Montag, 11. September 2023, 17:14:53 CEST schrieb Cyril Hrubis:
> Hi!
> 
> > * Use `openpty()` to create a new tty
> > * Remove `-D` option
> > * Remove requirement to run as root
> > 
> > Signed-off-by: Marius Kittler <mkittler@suse.de>
> > ---
> > 
> >  runtest/syscalls                           |  2 +-
> >  testcases/kernel/syscalls/ioctl/ioctl01.c  | 25 ++++++++++------------
> >  testcases/kernel/syscalls/ioctl/test_ioctl | 23 --------------------
> >  3 files changed, 12 insertions(+), 38 deletions(-)
> > 
> > diff --git a/runtest/syscalls b/runtest/syscalls
> > index b1125dd75..f999bd74f 100644
> > --- a/runtest/syscalls
> > +++ b/runtest/syscalls
> > @@ -557,10 +557,10 @@ init_module01 init_module01
> > 
> >  init_module02 init_module02
> >  
> >  #Needs tty device.
> > 
> > -#ioctl01 ioctl01 -D /dev/tty0
> > 
> >  #ioctl02 ioctl02 -D /dev/tty0
> >  
> >  # Introducing ioctl tests for all /dev/tty* devices
> > 
> > +ioctl01      ioctl01
> > 
> >  ioctl01_02   test_ioctl
> 
> This should be renamed to ioctl02 now I suppose.
> 

Right, this should now be the only remaining test in `test_ioctl`.

> > 
> > -	if (!device)
> > -		tst_brk(TBROK, "You must specify a tty device with -D 
option");
> > +	if (openpty(&amaster, &aslave, NULL, &termios, NULL) < 0) {
> > +		tst_brk(TBROK | TERRNO, "unable to open pty");
> > +	}
> 
> It's better just to pass NULL instead of the zero filled &termios here.
> 

Makes sense.

> The rest looks good to me, if you agree I can merge the patch with the
> changes I've proposed.

Yes, go ahead.



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
