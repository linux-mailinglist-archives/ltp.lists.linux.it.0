Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B693BF78E
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:28:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C345D3C89A7
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 11:28:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 86B2C3C2A8B
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 11:28:08 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A9BB7200BA5
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 11:28:07 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CA05620198;
 Thu,  8 Jul 2021 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625736486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XODLuEkkL4bdD+sYEC2wWg15mgl0vI7EoCTOqLIx/78=;
 b=yE2/int9YQVbDBeT/louLOQJwuqnIxmf2+vlW+uAhPxXzTD0grS5hWGcYIC0uHOfK4kNoU
 5M/jV3NFsRK8unqNPY2iGfWIRg2DY8HieGLJQREx0tTO18G8MWb6jaiLCK/seOo/c9VStA
 znMzPlBuIML7/P5YLOc/ZJpG6AFxl/c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625736486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XODLuEkkL4bdD+sYEC2wWg15mgl0vI7EoCTOqLIx/78=;
 b=GHqAyGLCEAAdskGTx6KqoTQvdnW7VyBF4hAYEZQE4R7qRCdZD6tM2UEPiWAOWz83SLGLFF
 rObgVzdVX3HfMECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B15D013B00;
 Thu,  8 Jul 2021 09:28:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ag06KibF5mBxGAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 08 Jul 2021 09:28:06 +0000
Date: Thu, 8 Jul 2021 11:02:30 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YOa/JjqdSiXLr/cz@yuki>
References: <20210707105954.18182-1-rpalethorpe@suse.com>
 <YOa8EfvOY/Po1FET@yuki> <60E6C418.2070701@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60E6C418.2070701@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] kill13,
 CVE-2018-10124: Reproduce INT_MIN negation
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>,
 Richard Palethorpe <rpalethorpe@suse.com>,
 Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Both pushed, thanks.
> >
> It seems wait403 doesn't use correct doc format.
> 
> It used the following style.
> /*
>   * [Description]

Good catch, I've missed that, will fix it ASAP.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
