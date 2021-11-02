Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ECD442D4E
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 12:57:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F26D33C708C
	for <lists+linux-ltp@lfdr.de>; Tue,  2 Nov 2021 12:57:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1397D3C58AF
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 12:57:42 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 26D601401632
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 12:57:41 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 64ED7212C3
 for <ltp@lists.linux.it>; Tue,  2 Nov 2021 11:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635854261;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q/bSdSlhRHXYcNgKoaeok84CEpeXjgUnQOoVMT1udu4=;
 b=c1LhiaL0HrZT0ZIOAfkkfkhGA+t7S/lcjKYVtUgGmk/Uji6zsU85I5Tb6VxSYAAh5KoljV
 2woqrO4KNwiy7hLX3s2bNYa+hGWKONtAfDO0jEEzkfjZBBhOUwRVnPWBTLItjJwsrbteh0
 1TMRNjVQ2aCBNrN7laI026Oea0dCfDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635854261;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q/bSdSlhRHXYcNgKoaeok84CEpeXjgUnQOoVMT1udu4=;
 b=QxQYMkqdIKg0JKiQmoicR1MGh9XKtRPOLSyIxZApE8JXo295I8pvDhqj4Yv8+bO+/DVT3J
 sY6c8egJ+ztkKKBQ==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 35A44A3B84;
 Tue,  2 Nov 2021 11:57:41 +0000 (UTC)
References: <20211101145342.7166-1-chrubis@suse.cz>
 <20211101145342.7166-6-chrubis@suse.cz>
User-agent: mu4e 1.6.5; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Tue, 02 Nov 2021 11:52:34 +0000
In-reply-to: <20211101145342.7166-6-chrubis@suse.cz>
Message-ID: <87k0hqojm3.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 5/7] docparse: Add type normalization
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

> For now just for .test_variants.
>
> There are two reasons for this:
>
> - This code makes sure that we get right value parsed and aborts the
>   compilation if the parser got confused. This part is important since
>   if the testrunners are going to use the metadata the data in there
>   must be correct.

I can't resist saying this would likely be solved by Sparse and its
understanding of C types. However in the present context it makes
perfect sense.

>
> - And much less important it makes the resulting json nicer to read
>
> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: rpalethorpe@suse.com

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
