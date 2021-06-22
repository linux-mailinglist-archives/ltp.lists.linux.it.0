Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFB53B0A02
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:11:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E5823C9477
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Jun 2021 18:11:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 643FA3C2307
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:11:22 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7FAAE1000A09
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 18:11:21 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 06B2721975
 for <ltp@lists.linux.it>; Tue, 22 Jun 2021 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624378281;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AXh5XZ17BIr3HIU/GKhpYLlsoG/9qFh3S69QcdKAQ8I=;
 b=fRshZ5CqUOIyCr3xn2x6qocDlU0sA3nK99aLjoNMTwGB7REyZ2AYffdzsX7qvAQSIWUH4q
 E3V32tE2NuYv89DdsIIpWqhwAGul5CPqy1CS6lzTY+Pcon0YVLbUqfpL9mcGdbR8orWze1
 +x7BwwcCPsGAXUCkYDfPAmuqkEOe3dg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624378281;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AXh5XZ17BIr3HIU/GKhpYLlsoG/9qFh3S69QcdKAQ8I=;
 b=kDWez306Kgy9a/LSJBcR0bSUzGOuz/4gOcV2H5yS+OjK9uF0+3TzX0+06LBUP7aXJRjOfT
 gI93NAauW4pdHqCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C81CDA3B92;
 Tue, 22 Jun 2021 16:11:20 +0000 (UTC)
References: <20210622154804.19946-1-mdoucha@suse.cz>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
In-reply-to: <20210622154804.19946-1-mdoucha@suse.cz>
Date: Tue, 22 Jun 2021 17:11:20 +0100
Message-ID: <871r8t6frr.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] tst_rtnetlink: pass error codes using rtnl_errno
 variable
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

Hello Martin,

Martin Doucha <mdoucha@suse.cz> writes:

> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
> ---
>  include/tst_rtnetlink.h |  2 ++
>  lib/tst_netdevice.c     | 26 +++++++++++++++-----------
>  lib/tst_rtnetlink.c     |  6 ++++--
>  3 files changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/include/tst_rtnetlink.h b/include/tst_rtnetlink.h
> index 12ec258f2..7c28f795d 100644
> --- a/include/tst_rtnetlink.h
> +++ b/include/tst_rtnetlink.h
> @@ -21,6 +21,8 @@ struct tst_rtnl_message {
>  	size_t payload_size;
>  };
>  
> +extern int rtnl_errno;

This is polluting the name space. I suppose it can be prepended
with tst_, but does the test author need to see this? Or you could even
just merge tst_netdevice and tst_rtnetlink.

Otherwise I think this approach is fine.

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
