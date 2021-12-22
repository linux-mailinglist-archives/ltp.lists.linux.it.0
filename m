Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9D47D369
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 15:12:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E62E83C925A
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Dec 2021 15:12:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B28253C02F7
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 15:12:42 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 160C510004B9
 for <ltp@lists.linux.it>; Wed, 22 Dec 2021 15:12:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 413BE1F384;
 Wed, 22 Dec 2021 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640182361;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMKNEiOE9Ch5kdW2trlzvS2gEzbdt3i/mH4V6pdWuOI=;
 b=kiaDrWOk/yKVeHXO5Qwr+zOoF4D4MjPFK/tNAE/Hy8tCl+/bF8AnNEu0SMBVd1dXZWOkEy
 ia+OOjXmbKz+IeLYW3jybGpd+5rAI5wrNvBhlXYVShcZTYyurnzYRcoaJ8DtKpVqTH6emC
 eMXh8lvbz2czlXiU2DWiImeV9gSBpac=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640182361;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vMKNEiOE9Ch5kdW2trlzvS2gEzbdt3i/mH4V6pdWuOI=;
 b=uSfQgf2DwxsQOjzJl21ZNODTIrNtJqAFbj3Im/R/uAAVjVQ/m2GPQeomP0rrDi23iuoCmT
 Gwv4agLeQllV8HAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00B7413D2F;
 Wed, 22 Dec 2021 14:12:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8qkpOVgyw2FPYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 22 Dec 2021 14:12:40 +0000
Date: Wed, 22 Dec 2021 15:12:39 +0100
From: Petr Vorel <pvorel@suse.cz>
To: "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Message-ID: <YcMyV/jZQWAC3nv8@pevik>
References: <1639983142-2247-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1639983142-2247-4-git-send-email-xuyang2018.jy@fujitsu.com>
 <YcBfuCPg1ENZHvud@pevik> <61C1397A.1070904@fujitsu.com>
 <YcGTMcan0r2NOcR9@pevik> <61C2F10F.9000901@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61C2F10F.9000901@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 4/4] zram/zram01.sh: replacing data stored in
 this disk with allocated for this disk
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> Hi Petr

> Thanks for your review, I have pushed this patchset.
> Also adding some debuginfo in zram03.c like you do in zram_lib.sh.
+1

> ps: I have sent a patchset in kernel selftest to update zram case a week 
> ago, but doesn't get any reponse...
> https://patchwork.kernel.org/project/linux-kselftest/list/?series=595877

Great thanks!
patchwork is temporarily down (502 Bad Gateway), thus posting lore link:
https://lore.kernel.org/linux-kselftest/1639562171-4434-1-git-send-email-xuyang2018.jy@fujitsu.com/#b

Although it's meant to be for kernel developers I might find a time to have a
look.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
