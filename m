Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9955A452E62
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 10:50:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 443AB3C87A5
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 10:50:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F081B3C0E98
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 10:50:16 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 9DC1A7F7342
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 10:50:16 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 0FB631FD47;
 Tue, 16 Nov 2021 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637056216;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xnz5I2VEwVr8tGOz6Fejpp84cf/I2ASHkFuIMmoVL8w=;
 b=gNWmbcdIE2jeC4O/dHn5B+9i2RkBp942/G5AXV/UoJoCz54RclyNr4134Jh1vBxXLoRS4g
 LIZd+EvAR3jc6CJqWE22OG/bd4me369OXrjPuUV7AOayBvOoirukliqPZpK9ck+hhkw8SR
 mNFhjcXFQV1cG/dG0cVDa1FRtWzck+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637056216;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xnz5I2VEwVr8tGOz6Fejpp84cf/I2ASHkFuIMmoVL8w=;
 b=ERJ6EZ/T0BopiW0n256ZXqnYdza0SqsXD1UOdxjCIBQxGl1CGLOJM3ywfmTFFKMK6zcixe
 3nPufEBpbToZCTCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D37FAA3B88;
 Tue, 16 Nov 2021 09:50:15 +0000 (UTC)
References: <1637049352-25731-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1637049352-25731-2-git-send-email-xuyang2018.jy@fujitsu.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Date: Tue, 16 Nov 2021 09:49:53 +0000
In-reply-to: <1637049352-25731-2-git-send-email-xuyang2018.jy@fujitsu.com>
Message-ID: <87pmr0bfag.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 2/3] syscalls/statx04: remove btrfs kernel
 version and add linux tags
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>


Yang Xu <xuyang2018.jy@fujitsu.com> writes:

> Also add docparse formatting.
>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>

Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
