Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E243A053A
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 22:43:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 356EC3C7B36
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jun 2021 22:43:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60F243C4CD3
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 22:43:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 9F5E514010FD
 for <ltp@lists.linux.it>; Tue,  8 Jun 2021 22:43:46 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3C7D1FD2A;
 Tue,  8 Jun 2021 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623185025;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEf+ENDyXyIVMo8I1ENhjNShthzXmRuINgEZr7xEHYw=;
 b=abpQ7fszWU0oPINOwzcWTsLiKnqJ7HyFc52j6SR4WtCHakOowoCAwTbMdl0GJXirWbRYgE
 Eo5tuhj5kJuztfDss8xStiZzysgmWBvYolZNVDrzWE6crg/4vtIpMzrGl5GQ0DM7eZfCrn
 +7cWtLKHbkSboVXQuuzI3HwYvRgn2D0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623185025;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEf+ENDyXyIVMo8I1ENhjNShthzXmRuINgEZr7xEHYw=;
 b=ugD3NmQOUc1GipnVJ2SB9mfSwD6Cqqqr44GyDqCf5DmnXWsO6rFQDd6F5jli4y03PizDrx
 pYr5D3lxHx4YuuCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 60073118DD;
 Tue,  8 Jun 2021 20:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623185025;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEf+ENDyXyIVMo8I1ENhjNShthzXmRuINgEZr7xEHYw=;
 b=abpQ7fszWU0oPINOwzcWTsLiKnqJ7HyFc52j6SR4WtCHakOowoCAwTbMdl0GJXirWbRYgE
 Eo5tuhj5kJuztfDss8xStiZzysgmWBvYolZNVDrzWE6crg/4vtIpMzrGl5GQ0DM7eZfCrn
 +7cWtLKHbkSboVXQuuzI3HwYvRgn2D0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623185025;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mEf+ENDyXyIVMo8I1ENhjNShthzXmRuINgEZr7xEHYw=;
 b=ugD3NmQOUc1GipnVJ2SB9mfSwD6Cqqqr44GyDqCf5DmnXWsO6rFQDd6F5jli4y03PizDrx
 pYr5D3lxHx4YuuCg==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id CryBFYHWv2DXUAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 08 Jun 2021 20:43:45 +0000
Date: Tue, 8 Jun 2021 22:43:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Vinay Kumar <vinay.m.engg@gmail.com>
Message-ID: <YL/Wf51Y6V5lRnkM@pevik>
References: <20210607104515.29838-1-vinay.m.engg@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607104515.29838-1-vinay.m.engg@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/7] getitimer02: Skipped EFAULT tests for libc
 variant.
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
Cc: metan@ucw.cz, rwmacleod@gmail.com, umesh.kalappa0@gmail.com,
 ltp@lists.linux.it, vinay.kumar@blackfigtech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Vinay,

> Tested EFAULT cases only for "__NR_getitimer" syscall.
Well, you added testing raw syscall via test variant.
That's IMHO the most important thing to mention.

In the text after blank line I'd mention EFAULT skipped on raw syscall.
It'd would deserve to mention why.

Also, as test it's quite simple, it'd be nice, if you first convert it to new
API and in second commit added test variants.
During rewrite you should remove #if !defined(UCLINUX) check as getitimer() is
supported on uclibc-ng.

This apply to whole patchset (some tests are already ported to new API).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
