Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 964B449B33C
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 12:52:43 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E34C3C932A
	for <lists+linux-ltp@lfdr.de>; Tue, 25 Jan 2022 12:52:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 517923C928A
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 12:52:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id CEECF2009BB
 for <ltp@lists.linux.it>; Tue, 25 Jan 2022 12:52:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DB291F380;
 Tue, 25 Jan 2022 11:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643111561; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyhrO0DxFmSjFC/pmghM0FylCbCl6U2Qs6V076nqAao=;
 b=cmi6KA9ttpeOrgMwUzyKgoMqoTvUeurYjD19xdxjUhfzCl2Z83/zBkVtbmJpk7Wlmy1qP/
 dBpDLQ1UvvSQKryXaS7pspVqJY4iyDjn+yXiChFSNxrnwtobn1B3/SQUhUaWXO7MPzBRTf
 lLEkjq6l0I1Ceq+e/DWxYmV892woo30=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643111561;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QyhrO0DxFmSjFC/pmghM0FylCbCl6U2Qs6V076nqAao=;
 b=Fo6Lj7HK0HO/OxWcveb27+Qr4Z52zetT3cDUztuIWGl9RfCEY+amnuS2Ms6w49fQwQVjSP
 ZQccB/FSXEEsjNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09F3B13DD1;
 Tue, 25 Jan 2022 11:52:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id spaLAYnk72HIGQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 25 Jan 2022 11:52:41 +0000
Date: Tue, 25 Jan 2022 12:54:29 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <Ye/k9bYtALTieq7B@yuki>
References: <20220124173651.652-1-rpalethorpe@suse.com>
 <20220124173651.652-2-rpalethorpe@suse.com> <Ye/kxq1oXnj5z1hd@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ye/kxq1oXnj5z1hd@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] memcontrol02: Fix anon memory comparison
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
> > All memory is being compared with the size malloc'ed instead of just
> > anon.
> > 
> > Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
> > ---
> >  testcases/kernel/controllers/memcg/memcontrol02.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/testcases/kernel/controllers/memcg/memcontrol02.c b/testcases/kernel/controllers/memcg/memcontrol02.c
> > index 411f5aea6..0d144cf2d 100644
> > --- a/testcases/kernel/controllers/memcg/memcontrol02.c
> > +++ b/testcases/kernel/controllers/memcg/memcontrol02.c
> > @@ -68,7 +68,7 @@ static void alloc_anon_50M_check(void)
> >  
> >  	TST_EXP_EXPR(anon > 0, "(memory.stat.anon=%zd) > 0", anon);
> >  	TST_EXP_EXPR(values_close(size, current, 3),
> > -		     "(size=%zd) ~= (memory.stat.anon=%zd)", size, current);
> > +		     "(size=%zd) ~= (memory.stat.anon=%zd)", size, anon);
> 
> I do not get this, we compare size and current and then print anon?
> 
> Should we just change the memory.stat.annon to memory.current instead?

Or did you forget to change the current in the values_close() to annon
as well?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
