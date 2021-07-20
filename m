Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 474C83CFA2B
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:11:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 195073C81A5
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 15:11:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 626663C0F6A
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:11:26 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9536F1400DEB
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 15:11:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB9601FE2F;
 Tue, 20 Jul 2021 13:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626786684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FumPXTU36pVaYYYWDMbFKreF+o/6CBaQqzs4+bwLuUc=;
 b=bEQUFrx5yZXLFIyCG4LWj9OlwT+CPEAHrS9+0lFjrGMeKAs5tmUQD7Nzg5OVMXldQlHSAi
 4EZa6i+o7AYb12HiTsGKLiDCwAGi0FZ5B3dTun/ooihGmjXnBlE0hcuZkRfVZ2mF6YoltC
 bEfXaQFFkKeBsUdbZ0S6i6o9XpIh4LU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626786684;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FumPXTU36pVaYYYWDMbFKreF+o/6CBaQqzs4+bwLuUc=;
 b=+YZXzuDnDl6iIFb9p0LRe4Ud+O40zemCh9dIiODDcW++lKpfbzaB58orqYIZDK7hV/PNvt
 lAPxEaZgtiwRecAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A294213D68;
 Tue, 20 Jul 2021 13:11:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MZNdJnzL9mDTdAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Jul 2021 13:11:24 +0000
Date: Tue, 20 Jul 2021 14:45:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YPbFhOEjYr9nOryX@yuki>
References: <20210720103941.9767-1-mdoucha@suse.cz>
 <20210720103941.9767-3-mdoucha@suse.cz> <YPa7bSB8pNPrBDn8@yuki>
 <e6033278-8e27-eed5-5f36-1dd09e68bf5a@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6033278-8e27-eed5-5f36-1dd09e68bf5a@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] Add lockdown checks to init_module* and
 finit_module* tests
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
> > I'm slightly afraid that the order of checks may change over the time
> > and we will get EPERM in all these cases, but maybe I'm just overly
> > cautious. Other than this the code looks good.
> 
> I don't think we need to worry about that. With root privileges, the
> EPERM error is returned when a kernel module does not have a valid
> signature. How would something that is not even a valid kernel module in
> the first place fail that check?
>
> The only subtests that actually try to load a valid kernel module are
> null-param, invalid-param and module-exists. All three of them now
> handle lockdown correctly.

Right, we have to be able to read the signature in order to produce
EPERM and the same for the init_module() there has to be a pointer to
a module data that kernel can check the signature from.

Patch pushed, thanks.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
