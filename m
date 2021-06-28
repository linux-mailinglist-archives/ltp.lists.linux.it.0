Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE63B6344
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:52:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E084B3C6E40
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Jun 2021 16:52:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 34CF43C03AB
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:52:47 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 4B1091400062
 for <ltp@lists.linux.it>; Mon, 28 Jun 2021 16:52:45 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A2D0C202CA;
 Mon, 28 Jun 2021 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95AO4q+OB6meD+pvA+m+RKqBaT6NlFsOvbEENFHSFDc=;
 b=HLr9wI5wRFecqLmzlBlRAovaTgiArdEBxY1zHPN34Y1Niy9R7MOSZ2RrxIyKFQ05DfRLhW
 6nu+33z05jn6LyWzqyqCtGF0XHUsEbakCNdCvFTP7rcTes19iolRI/V2YZCxGFIIQ9MbRs
 KTHLZykllvEKUFHX2dhVGkCWbZKyqTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95AO4q+OB6meD+pvA+m+RKqBaT6NlFsOvbEENFHSFDc=;
 b=tVH8q7kLxc+QLqjFvGHi8gM48TKCGvhN28LEKIYuPF5HPcUDseR+j6KfOP/ZdWxM4LRdxi
 grcGzjcPyAwpZOBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8002B11906;
 Mon, 28 Jun 2021 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624891965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95AO4q+OB6meD+pvA+m+RKqBaT6NlFsOvbEENFHSFDc=;
 b=HLr9wI5wRFecqLmzlBlRAovaTgiArdEBxY1zHPN34Y1Niy9R7MOSZ2RrxIyKFQ05DfRLhW
 6nu+33z05jn6LyWzqyqCtGF0XHUsEbakCNdCvFTP7rcTes19iolRI/V2YZCxGFIIQ9MbRs
 KTHLZykllvEKUFHX2dhVGkCWbZKyqTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624891965;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95AO4q+OB6meD+pvA+m+RKqBaT6NlFsOvbEENFHSFDc=;
 b=tVH8q7kLxc+QLqjFvGHi8gM48TKCGvhN28LEKIYuPF5HPcUDseR+j6KfOP/ZdWxM4LRdxi
 grcGzjcPyAwpZOBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 3Wl6HT3i2WApGgAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 28 Jun 2021 14:52:45 +0000
Date: Mon, 28 Jun 2021 16:52:44 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <YNniPHlHTVyiz74B@pevik>
References: <20210621113804.26179-1-rpalethorpe@suse.com>
 <20210621113804.26179-3-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621113804.26179-3-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 3/3] API: Cause GCC/Clang to blow up when TEST is
 used in the library
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

Hi Richie,

> +#if LTPLIB
> +#define TEST(SCALL) _Pragma("GCC error \"Do not use TEST macro in library\"")
> +#define TEST_VOID(SCALL) _Pragma("GCC error \"Do not use TEST_VOID macro in library\"")

It'd be nice to document "Do not use TEST() macro in library" in LTP Library API
Writing Guidelines [1].

Kind regards,
Petr

[1] https://github.com/linux-test-project/ltp/wiki/LTP-Library-API-Writing-Guidelines

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
