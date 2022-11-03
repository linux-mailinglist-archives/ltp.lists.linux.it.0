Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C287A617BAA
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Nov 2022 12:37:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7200C3CADA5
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Nov 2022 12:37:04 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D16B13C70D9
 for <ltp@lists.linux.it>; Thu,  3 Nov 2022 12:37:00 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 4CE2B600C3C
 for <ltp@lists.linux.it>; Thu,  3 Nov 2022 12:36:59 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 93D001F890;
 Thu,  3 Nov 2022 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667475419;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5JB/262plXpWAW0CGGSbui+at0rQIkdcGqgn+QXhXo=;
 b=1pxLfKum/eEw7IHgD0obyixgWrtSzUihEhq+ww8zN04sljuYGkv2jCLVZzfjYDCfswpZmE
 5c1jX5CFLr5RQQMwcCiSNedDfHCS9kbrQf4zvJMuwVjEU+qn04buLMTArAJQTwqkKJQAGm
 VGRSEzcTv3T52Y/GjWtvpOYfcZYEj+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667475419;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x5JB/262plXpWAW0CGGSbui+at0rQIkdcGqgn+QXhXo=;
 b=/bJ+ZNQdmlb1cvQ3LuuvZr8lAqbmQSEdwy9gJk6JcEzvVN6XcqABMt3ikzL8BqVKtdBnIY
 9dpbocknxYOLrdCw==
Received: from UNKNOWN (unknown [10.163.28.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 9F3EB2C141;
 Thu,  3 Nov 2022 11:36:58 +0000 (UTC)
References: <20221020130843.15147-1-mdoucha@suse.cz>
 <20221020130843.15147-2-mdoucha@suse.cz> <87edum925p.fsf@suse.de>
User-agent: mu4e 1.8.11; emacs 28.1
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Martin Doucha <mdoucha@suse.cz>
Date: Thu, 03 Nov 2022 11:34:44 +0000
Organization: Linux Private Site
In-reply-to: <87edum925p.fsf@suse.de>
Message-ID: <87v8nwi819.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/3] fanotify14: Print human-readable test case
 flags
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

Hello,

Richard Palethorpe <rpalethorpe@suse.de> writes:

> Hello,
>
> Martin Doucha <mdoucha@suse.cz> writes:
>
>> It's hard to tell which test case is failing from the current fanotify14
>> output. Print test case flags to make failure analysis easier.
>>
>> Signed-off-by: Martin Doucha <mdoucha@suse.cz>
>
> I'd be happy to merge this part of the patch-set at least.
>
> Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>

Merged, thanks!

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
