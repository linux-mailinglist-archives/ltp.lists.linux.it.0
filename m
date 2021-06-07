Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFB39D872
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:17:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 670803C7C01
	for <lists+linux-ltp@lfdr.de>; Mon,  7 Jun 2021 11:17:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 437FA3C0359
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:17:05 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 528E96000F6
 for <ltp@lists.linux.it>; Mon,  7 Jun 2021 11:17:03 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6C1FA21A82;
 Mon,  7 Jun 2021 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623057423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0A4BB4dNYN+QsgrWIxewPaBmLb0d+/lltvCJqeJ7xOw=;
 b=qRulS5RJBjq9cOM7AErGMM68fKQZOgpHLoVpjVa7QaAIO3oHIRu937C1LOQLT4NCQbEoUF
 OcZomxKh3nuKrsWTFmXmQOdFHZL7KT3GuJ+sRoh4pfJPlzOrXY2wuFpfCRXSlpjlmfLKUM
 sqX5jGwXme/kKam1cXCZzinFChTWx8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623057423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0A4BB4dNYN+QsgrWIxewPaBmLb0d+/lltvCJqeJ7xOw=;
 b=zXJuzIjioQsj/LUlnpyyboU9GGdJL143Vf+wtkiFjgo0NMug5NwU69jsNEjbQB7JVC6V3+
 gDOlyqRDpFOUm6BQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 3C72D118DD;
 Mon,  7 Jun 2021 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623057423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0A4BB4dNYN+QsgrWIxewPaBmLb0d+/lltvCJqeJ7xOw=;
 b=qRulS5RJBjq9cOM7AErGMM68fKQZOgpHLoVpjVa7QaAIO3oHIRu937C1LOQLT4NCQbEoUF
 OcZomxKh3nuKrsWTFmXmQOdFHZL7KT3GuJ+sRoh4pfJPlzOrXY2wuFpfCRXSlpjlmfLKUM
 sqX5jGwXme/kKam1cXCZzinFChTWx8A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623057423;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0A4BB4dNYN+QsgrWIxewPaBmLb0d+/lltvCJqeJ7xOw=;
 b=zXJuzIjioQsj/LUlnpyyboU9GGdJL143Vf+wtkiFjgo0NMug5NwU69jsNEjbQB7JVC6V3+
 gDOlyqRDpFOUm6BQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vsMVDQ/kvWD2CwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 07 Jun 2021 09:17:03 +0000
Date: Mon, 7 Jun 2021 11:17:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cao jin <caojin@uniontech.com>
Message-ID: <YL3kDQTPbYA1M+FJ@pevik>
References: <20210511092926.20509-1-caojin@uniontech.com>
 <YJpskTNEjIYNu2CT@yuki>
 <a75bc28f-121e-332f-197e-64e3bf15e748@uniontech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a75bc28f-121e-332f-197e-64e3bf15e748@uniontech.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runltp: Miscellaneous cleanups
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

Hi Cao jin, Cyril,

> On 5/11/21 7:37 PM, Cyril Hrubis wrote:
> > Hi!
> > The changes looks good to me but at the moment we are fairly late in the
> > release process so this will have to wait for about two weeks before it
> > could be applied.


> I am fine with that. Thanks, Cyril.
I added one more typo fix (seperate => separate) and merged.

FYI: runltp is very outdated we recommend to use runltp-ng [1].
It's not upstreamed yet, properly propagating timeout issue is the latest issue
we need to solve before upstreaming it into LTP and deprecating runltp.
We hope to make it in this release.

Kind regards,
Petr

[1] https://github.com/metan-ucw/runltp-ng/
[2] https://github.com/metan-ucw/runltp-ng/issues/31

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
