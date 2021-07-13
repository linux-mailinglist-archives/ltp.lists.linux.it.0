Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D83C6CBE
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 10:57:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C621A3C8775
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 10:57:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C87063C6637
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 10:57:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3B255200AC1
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 10:57:14 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4EB041FD45;
 Tue, 13 Jul 2021 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626166634;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mazN5gYO9auWAai+953oxQynXZGIqaK8TeVjzMzmaxw=;
 b=HqC8txzW+esyiDsufh49trCbPDV3ZnBhXrGYk8Gv0o3VrShqTEFLVaTbanyEeCCDc5KzBd
 0llDbFuEfZyBCLaWuMM9xIsJtTejH1NnGEBMbidqzcwHRcnEYTDE17jr2QXmSpNl+uX+++
 S90a/xn9JZkBocNvOaqiqBLFOmLXCzE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626166634;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mazN5gYO9auWAai+953oxQynXZGIqaK8TeVjzMzmaxw=;
 b=0I6Nt/LRQlAOW6eywLKkBnGHLB14BC65PNsQMXN3p5GgutT1sUTpgX/vcoVpHnHN/7KKUi
 dfemmTKnAXmXb0Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17E3413BC9;
 Tue, 13 Jul 2021 08:57:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SBGrA2pV7WBVTQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 08:57:14 +0000
Date: Tue, 13 Jul 2021 10:57:12 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <YO1VaOB8nnMh6FT1@pevik>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
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

Hi Jan,

> On Mon, Jul 12, 2021 at 7:02 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi all,

> > I see failures of lib/newlib_tests/tst_strstatus on Alpine:

> > tst_strstatus.c:31: TPASS: exited with 1
> > tst_strstatus.c:31: TPASS: killed by SIGHUP
> > tst_strstatus.c:31: TPASS: is stopped
> > tst_strstatus.c:31: TPASS: is resumed
> > tst_strstatus.c:29: TFAIL: killed by ??? != invalid status 0xff

> > Any idea what could be wrong?


> I'd start with definition of WIFSIGNALED on that system.

> printf("%d\n", WIFSIGNALED(0xff));
> should give you 0, but it does appear to return 1 in output above.

Thanks for a hint. Indeed WIFSIGNALED(0xff) returns 1, thus tst_strstatus()
returns signaled(status).

musl defines WIFSIGNALED() as:

#define WIFSIGNALED(s) (((s)&0xffff)-1U < 0xffu)

which returns 1.

Glibc defines __WIFSIGNALED() as:

#define __WIFSIGNALED(status) \
  (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)

which returns 0.

I wonder if it's a musl bug which we should report or {0x100, "invalid status
0xff"} test case is glibc specific and we should guard it with #ifdef __GLIBC__.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
