Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 657523C6DC4
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:51:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E7E9E3C8764
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 11:51:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EBB93C65F7
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:51:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9FE1A200AC9
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 11:51:28 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08B1421F66;
 Tue, 13 Jul 2021 09:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626169888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SPrtzV24hbROFRoCdpc2WtFPQLnZpabBCJemKcwZNKU=;
 b=RnNX+lkvacvNmWQo6d3oUQ4G5d88JAQ2FBXJBgC8C/wkfDQWdK5TMN2w5perp3r3b/jSnG
 SY4+HIj5amL1TU5y0pfPEag7GooXSmExGlsnyFmj8xWLhoWnQCh+o15nnWs4wIs2IBavxH
 iQiSd8UJMjmdrsQh/tG7uzGLpr3aRKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626169888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SPrtzV24hbROFRoCdpc2WtFPQLnZpabBCJemKcwZNKU=;
 b=sQaAFGvEYXEBHzykyKJ+dO8URYB9dDzoxxf/efD2ElmDLWHI5HIHYTzVpbL1K0S+/ZoVYD
 QpzjbEYkd47RNgBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD8AD13AE2;
 Tue, 13 Jul 2021 09:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oplPNR9i7WD7WgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 13 Jul 2021 09:51:27 +0000
Date: Tue, 13 Jul 2021 11:25:54 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YO1cIhIKgEPrApUC@yuki>
References: <YOx1pir0UuBNM+4w@pevik>
 <CAASaF6zS0kPHk6vSvANA1KzuOCtJHskLmOE_DE1n4b5AhMUPkg@mail.gmail.com>
 <YO1VaOB8nnMh6FT1@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO1VaOB8nnMh6FT1@pevik>
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Thanks for a hint. Indeed WIFSIGNALED(0xff) returns 1, thus tst_strstatus()
> returns signaled(status).
> 
> musl defines WIFSIGNALED() as:
> 
> #define WIFSIGNALED(s) (((s)&0xffff)-1U < 0xffu)
> 
> which returns 1.
> 
> Glibc defines __WIFSIGNALED() as:
> 
> #define __WIFSIGNALED(status) \
>   (((signed char) (((status) & 0x7f) + 1) >> 1) > 0)
> 
> which returns 0.
> 
> I wonder if it's a musl bug which we should report or {0x100, "invalid status
> 0xff"} test case is glibc specific and we should guard it with #ifdef __GLIBC__.

The process exit values are defined in the kernel ABI so I would say
that there shouldn't be any differencies between how these are handled
inside different libc implementation. That being said the musl version
is incorrect only for invalid values that will probably not happen in
practice. Glibc is simply more defensive in parsing and rejects invalid
conditions.

WIFSIGNALED() is supposed to return 1 only if process was killed by a
signal, which means that the upper byte of the status is ignored and the
lower byte has to look like:

7 6 5 4 3 2 1 0
x . . . . . . .
  ^
^ Termination signal
|
Core dumped flag

Also this value can't be set tio 0x7f since that means "stopped by
signal".

This is exaclty what glibc does since it masks the termination signal
number with 0x7f then adds 1, which would overlfow to 0x80 if the value
was 0x7f initially and end up being negative. The bitshift is there to
erase the +1 in a case we started with 0.

The musl libc returns 1 if the lower byte is non-zero and the upper byte
is zero, which depends on the fact that the upper byte is unused and
filled in zeroes when the process was killed by a signal and non-zero in
all other cases where the lower byte is non-zero. As long as we get only
valid status from wait() this is going to work fine.

To be honest I like the defensive parsing from libc more than the musl
variant but I'm not 100% sure if this is something that should be added
to musl as well.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
