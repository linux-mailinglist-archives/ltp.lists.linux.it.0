Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 233733AE8CF
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 14:12:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E83413C7037
	for <lists+linux-ltp@lfdr.de>; Mon, 21 Jun 2021 14:12:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 00D8A3C2310
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 14:12:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8774A60073E
 for <ltp@lists.linux.it>; Mon, 21 Jun 2021 14:12:26 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E31E621A6B;
 Mon, 21 Jun 2021 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624277545;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2STTXk0jeb+IC2O17i66sKzzxiCA5QAA4FLt59m0hQ=;
 b=cnoHCV8Ijp5ZBLC92lUnyUMRAPnsZxiVRjcKur6fBW2PsMmCcyBk0JKShAUyn91MYAx8X2
 j/Oiz+7Vli7XzOAQJsvNXdrfkuS8F9dnle+8Fo4IKseb1gOjquxFjydqwak8VZZHY5TPJY
 cOFFzYWj5wlA0oSfAKx3nlXVulUp53A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624277545;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2STTXk0jeb+IC2O17i66sKzzxiCA5QAA4FLt59m0hQ=;
 b=Pfuh8+iv4sn58btJSuBMDV0UigjGleN48/BWrGZOpuZSnazCJYIlAX8gDrOhsI1g0UBDH6
 gGuZZDDCnWKXWTDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id AAB90118DD;
 Mon, 21 Jun 2021 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1624277545;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2STTXk0jeb+IC2O17i66sKzzxiCA5QAA4FLt59m0hQ=;
 b=cnoHCV8Ijp5ZBLC92lUnyUMRAPnsZxiVRjcKur6fBW2PsMmCcyBk0JKShAUyn91MYAx8X2
 j/Oiz+7Vli7XzOAQJsvNXdrfkuS8F9dnle+8Fo4IKseb1gOjquxFjydqwak8VZZHY5TPJY
 cOFFzYWj5wlA0oSfAKx3nlXVulUp53A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1624277545;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a2STTXk0jeb+IC2O17i66sKzzxiCA5QAA4FLt59m0hQ=;
 b=Pfuh8+iv4sn58btJSuBMDV0UigjGleN48/BWrGZOpuZSnazCJYIlAX8gDrOhsI1g0UBDH6
 gGuZZDDCnWKXWTDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nc2eJymC0GAFJwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 21 Jun 2021 12:12:25 +0000
Date: Mon, 21 Jun 2021 14:12:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YNCCKN3W5RsO28pq@pevik>
References: <20210603033611.15619-1-xieziyao@huawei.com>
 <20210603033611.15619-3-xieziyao@huawei.com>
 <YMurRVXwyvKXnkjj@pevik> <YMxTQliOqBJsYZcu@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMxTQliOqBJsYZcu@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] syscalls/sendfile: Convert sendfile06 to the
 new API
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

Hi all,

> Hi!
> > > 1. Convert sendfile06 to the new API with file descriptors instead
> > > of socket descriptors.
> > I wonder if this is ok, suppose yes, but better if other check.

> In kernels before 2.6.33 out_fd had to be a socket. Kernel 2.6.33 went
> out somewhere in 2010 which should be more than old enough.
Yes, Ziyao also explained that. Thus merged.
I forgot to mention the reason at commit message, fortunately unlike me other
people aren't lazy to search in man page :).

Thanks!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
