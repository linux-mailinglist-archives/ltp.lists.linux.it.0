Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E750B443F18
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 10:15:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B51B3C72BA
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Nov 2021 10:15:10 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E722C3C67E6
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 10:15:06 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5089A6002C6
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 10:15:06 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7832D21639
 for <ltp@lists.linux.it>; Wed,  3 Nov 2021 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635930905;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6jc68IgqnycyF2QvuSdnHXSEufC05rHiLvg83LIUXc=;
 b=iYu41SQxk5i15tBmzdVjNqEFhU0CZYDNSAnUQMKn9mmgn+G9L2wLe4ajhNJsM+S7rAmI1g
 +B7GeZ9ZjG2kt7xQkoWn+yOfqVBRSG4gJz46kwRcpxWdIK8y0C9CHDz9y6bPSIQprpLF0w
 n6XtkIfm2Q7i7/P6lndCt+BNqE0y19Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635930905;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H6jc68IgqnycyF2QvuSdnHXSEufC05rHiLvg83LIUXc=;
 b=7Xapd5Q6j4gcxKJhvBqnJLazFHElDO4Yc9s26cNsbWFZZ7rZEJDYOscvJ69gD6xAwla/6y
 KIPCXC4cDHUNg6Bg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3CA842C144;
 Wed,  3 Nov 2021 09:15:05 +0000 (UTC)
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-2-chrubis@suse.cz> <871r3yq0hm.fsf@suse.de>
 <YYEfNvjosOzWzKRJ@yuki> <YYFROnbswkA6knMN@pevik> <YYFU0K4eLWgT364K@yuki>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 03 Nov 2021 09:08:42 +0000
In-reply-to: <YYFU0K4eLWgT364K@yuki>
Message-ID: <87fssdob1j.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/7] docparse: Implement #define and #include
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

Cyril Hrubis <chrubis@suse.cz> writes:

> Hi!
>> Unless you send v3 feel free to add
>
> These two fixes are pretty minor changes, so I think that these can be
> fixed before applying.

Oh and to confirm, all patches should be marked with

git interpret-trailers --trailer 'Reviewed-by: Richard Palethorpe <rpalethorpe@suse.com>'

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
