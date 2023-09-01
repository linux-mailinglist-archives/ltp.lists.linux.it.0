Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E32B790105
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 19:00:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A7CE93CE136
	for <lists+linux-ltp@lfdr.de>; Fri,  1 Sep 2023 19:00:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EFBC73CBB96
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 19:00:43 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A6D861400F28
 for <ltp@lists.linux.it>; Fri,  1 Sep 2023 19:00:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 679982183A;
 Fri,  1 Sep 2023 17:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1693587641;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plQzrLNOM0dY7tFNMziRy/aGw7JpLBOeQHRsH/DtKm0=;
 b=B5paugHj8AESSu8aRATVuBwJSgE0ThMsuXFY6BopwbIkcqe7p7Zv2QYKUe1wX3wy0fQgT/
 wvGXVADEFLrVbGbaWrbV5K89p4ZC3hJJzz7ND2CeJCI9KezaJjytrXr9ATwOwaX5Tlbtjd
 hDLRy6vu2i6A9kWhVwEU3K+oHjWExrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1693587641;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=plQzrLNOM0dY7tFNMziRy/aGw7JpLBOeQHRsH/DtKm0=;
 b=gHXbdCCPtYRsPF7uCgRcLGpJrJhK7T8eHz1nsNM9fS/b3zp+NI/JeDMyB/ossps1QM8OES
 JgG+HtqW69wlYKAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E58481358B;
 Fri,  1 Sep 2023 17:00:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DEX5L7gY8mQpKwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 01 Sep 2023 17:00:40 +0000
Date: Fri, 1 Sep 2023 19:00:38 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20230901170038.GA386230@pevik>
References: <20230901144407.364630-1-pvorel@suse.cz>
 <ac801295-9ea4-9e6b-1576-3203a7dd548e@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ac801295-9ea4-9e6b-1576-3203a7dd548e@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] clone302: Fix short size test
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

Hi Martin,

> Hi,

> On 01. 09. 23 16:44, Petr Vorel wrote:
> > Test uses sizeof(struct clone_args)-1 as invalid size. Original struct
> > size 64 was suitable (because > 64 results in EINVAL), but unrelated

> Nit: <64

Thanks! (I meant that, but fingers wrote the opposite comparator.)

> > change in 45f6916ba increased the size to 88, thus test failed to due
> > unexpected clone3() pass.

> > Depending on struct clone_args size is not good idea, let's use
> > arbitrary value 1.

> This will work, but we could also define a "minimal" struct clone_args
> (without any fields other than the required ones) and use the size of that
> (-1 of course). That would give better coverage and leave no untested gap
> between 1 and minimal struct size.

Very good idea. I'm setting this as changes requested.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
