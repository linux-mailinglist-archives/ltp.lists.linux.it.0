Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 565114BB6F3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Feb 2022 11:33:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 03E9D3CA0EB
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Feb 2022 11:33:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5407D3C9DE5
 for <ltp@lists.linux.it>; Fri, 18 Feb 2022 11:33:17 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DB5301402F90
 for <ltp@lists.linux.it>; Fri, 18 Feb 2022 11:33:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A9C9219A4;
 Fri, 18 Feb 2022 10:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645180396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=soDYZP0IpPPaViOgxdpmExK51zTXIsgENkFDygMNXW8=;
 b=qu9wakJpff5rCRaTVGbnHD+M7wPFqbU0bYtm83GmTFuv5Fg/m5S4p1UYXF+zW2h3KHIs39
 SFoC6RmO6D763BHbJwzSzBRPhpweDTjmsXJVFkFCHp2xVWkHQKqRktItGNcjNOuuEW5sfy
 XvVJUAUrQAgYySJ78Jpyl0JwqAY92Yg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645180396;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=soDYZP0IpPPaViOgxdpmExK51zTXIsgENkFDygMNXW8=;
 b=f0MEY/y03BIWOQAjG5s/oUg0lVW4rnY7VoZ3u7BRHOInE4dnny0RQVdJUQY52pyMldIiPm
 y1EkmkgojrQkr4CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D91113C47;
 Fri, 18 Feb 2022 10:33:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HoSVAux1D2JzDQAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 18 Feb 2022 10:33:16 +0000
Date: Fri, 18 Feb 2022 11:35:24 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <Yg92bK6ui5odktyX@yuki>
References: <20220217142730.19726-1-chrubis@suse.cz> <Yg56J2hVIMMO3cvX@pevik>
 <Yg9s2lzZmavrQCuf@yuki> <Yg91g+y5IgF0zifz@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yg91g+y5IgF0zifz@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] test_macros: TST_EXP_EXPR() add auto
 stringification
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
> > It occured to me that this is probably not the best result though, since
> > in the case of the failure it does not print the expected and actual
> > value. So maybe it would be better to add TST_EXP_EQ() macro instead. I
> > will send a patch later on.
> 
> I wonder can't we have both - print stringified parameters and also their
> values? Would it be too confusing?

Couldn't be done unless you know the types beforehand. I've send another
patch that adds TST_EXP_EQ_*() macros please have a look at that one
instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
