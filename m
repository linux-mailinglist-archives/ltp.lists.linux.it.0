Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 416295E7FD6
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Sep 2022 18:31:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E7B13CADB8
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Sep 2022 18:31:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A04F3CAA78
 for <ltp@lists.linux.it>; Fri, 23 Sep 2022 18:31:30 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4534B10013BA
 for <ltp@lists.linux.it>; Fri, 23 Sep 2022 18:31:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6685F1F88D;
 Fri, 23 Sep 2022 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1663950688;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RWJ6tMlapgC+LI4PcNkjBVj0JAHRbKOk5NUdcizLo9I=;
 b=nc1MR62Q37jO2Hx3JHhYMAkTTlsYBLDjLfpYG5EwhRg7T07lhCbdVOLH2t5oIHMMEbHB0X
 CoSTt46/bf6ikrmII+Kko5viumB8BwYYik035VDVyKowN0WnYlWXauKsvNhEYCjpj0jmay
 K551PS8F5UJqBx6yQU5tvMKTl7YwyIM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1663950688;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RWJ6tMlapgC+LI4PcNkjBVj0JAHRbKOk5NUdcizLo9I=;
 b=AFxPK4prqgKP8b90Uf/BeLGNFnCud2EIqaR0YsOPoBUd619+I6P/4FtIB0MHhRQUvJqDMF
 0xz3SFD5bCx8+LDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D02613A00;
 Fri, 23 Sep 2022 16:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MxRGCWDfLWOxUwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 23 Sep 2022 16:31:28 +0000
Date: Fri, 23 Sep 2022 18:31:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <Yy3fXtq8NZEs9tl/@pevik>
References: <20220922210931.23982-1-pvorel@suse.cz>
 <20220922210931.23982-2-pvorel@suse.cz> <Yy3PVQCjVuVJjqwt@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yy3PVQCjVuVJjqwt@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3 v2] tst_supported_fs: Unify messaging
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
> > +#define err(...) ({ \
> > +	fprintf(stderr, __VA_ARGS__); \
> > +	fprintf(stderr, "\n"); \
> > +	usage(); \
> > +	return 2; })
>            ^
> This should rather be exit(2);

Thanks! I thought that just after sending that.

> It's only matter of time until someone uses that in a function outside
> of main.

> > +#define fail(...) ({ \
> > +	fprintf(stderr, __VA_ARGS__); \
> > +	fprintf(stderr, "\n"); \
> > +	return 1; })

> Here as well.

> > +#define info(...) ({ \
> > +	fprintf(stderr, __VA_ARGS__); \
> > +	fprintf(stderr, "\n"); \
> > +	return 0; })

> The naming here is a bit of strange, I wouldn't expect that function
> called info() would exit the process.

> Maybe these three should include exit in the function name such as
> info_exit(), err_exit() and fail_exit().
+1

I'll fix it in another version or fix it before merge (if all changes are
trivial).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
