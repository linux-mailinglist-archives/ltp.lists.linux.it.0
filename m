Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C5536298
	for <lists+linux-ltp@lfdr.de>; Fri, 27 May 2022 14:30:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC68E3C1BB9
	for <lists+linux-ltp@lfdr.de>; Fri, 27 May 2022 14:30:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A2F293C1348
 for <ltp@lists.linux.it>; Fri, 27 May 2022 14:30:25 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BCD8C1000991
 for <ltp@lists.linux.it>; Fri, 27 May 2022 14:30:24 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EE1751F92B;
 Fri, 27 May 2022 12:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1653654623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUAlN1ReAEwmFCjsqxLenLaqeuECZBMOn/pTTJcWQwA=;
 b=OM6hGmBAS4vJGjGZMcn8suH9uyvpg6/ASGv7t50hEhwLc/z8IHQ51VXOQxI1x+f5g7A3nh
 on+Mn1OdBy4hSBmOCTiyo/tedSmTZTYsANyBNCXkk3yIR8YWhbHmQXyHEsASmXBoVV2OHr
 G2QzB54UBwmmJTT8Oga29rzyylPBTLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1653654623;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AUAlN1ReAEwmFCjsqxLenLaqeuECZBMOn/pTTJcWQwA=;
 b=mhwCxxB7JbJlo/8fd/0rR0EXCSYe5ZLXlHqPh+rFclwdCTDG5NpM25JKqQuIBnfweBY0z+
 W1JyPY6JR3oOoNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADC6B13A84;
 Fri, 27 May 2022 12:30:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0yg7F1/EkGLSKAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 27 May 2022 12:30:23 +0000
Date: Fri, 27 May 2022 14:30:20 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YpDEXHHYuGLrQQfK@pevik>
References: <20220316150429.2873-1-pvorel@suse.cz> <YjH9dDef3w7Iu3vG@pevik>
 <CAEemH2cB+k+dbS_N=S0jGs9H3ct1wBUYhuaR-+V7wRVtydVN_g@mail.gmail.com>
 <YjQ1WKtV0amHh4Aq@pevik>
 <CAEemH2e8af4Y=1vGTL36OjKy2TbuYRBwYFkf7fHT7pfjg6-87w@mail.gmail.com>
 <YmKQUzWN7DKS30r4@pevik> <YpC/BoMCMn7u6Idm@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpC/BoMCMn7u6Idm@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC][PATCH 1/1] ci: Ubuntu xenial -> bionic
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
> > NOTE: if we accept it, I need also to update doc/supported-kernel-libc-versions.txt:

> > -| Ubuntu 16.04 LTS xenial      | 4.4    | 2.23  | 5.3.1 | -
> > -| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
> > +| Debian 9 stretch (oldstable) | 4.9.30 | 2.24  | 6.3.0 | 3.8
> > +| Ubuntu 16.04 LTS xenial      | 4.15   | 2.27  | 7.3.0 | -
>                       ^
> 		  18.04 bionic?
Thanks!

> Other than that this looks good, the oldest kernel we have to support
> does not change anyways, since RHEL 7 needs 3.10 and SLES 12 LTSS needs 3.12
Good, going to merge (fixed) with your ack!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
