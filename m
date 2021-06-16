Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D64673A9375
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:03:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7407A3C4CBC
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 09:03:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 665E73C2DCF
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:03:32 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AE18920038B
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 09:03:31 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 11671219E0;
 Wed, 16 Jun 2021 07:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623827011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1zoJYbQ3tpVGZWVDrKyXIqflWed9FL4BGOWZ6Tccq4=;
 b=UONPS29qthPaxpE6q7yk+dYYbPsbdK2xwGnBnx8HmSMt4L/g/V1TraGCkzI2l/uj0Ol2+n
 UlHEW/nhMn87ahGB7tm5wJQB2yp1Qf+4CnpH8bE5IGS7xoHhnRQaw+q/jK3HU2iyBShGWi
 AYvEweuTU1kCdD+4V/HZaO+/OLoCj1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623827011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1zoJYbQ3tpVGZWVDrKyXIqflWed9FL4BGOWZ6Tccq4=;
 b=nn/QMQt5CGwR/5yF7Y+ammrG4kG2YvO7OpHGxzUDulAlgTX2GWYOd1to9fDjQ0abEQyuxy
 jXoCNmyOqm0tzICw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CA2C9118DD;
 Wed, 16 Jun 2021 07:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623827011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1zoJYbQ3tpVGZWVDrKyXIqflWed9FL4BGOWZ6Tccq4=;
 b=UONPS29qthPaxpE6q7yk+dYYbPsbdK2xwGnBnx8HmSMt4L/g/V1TraGCkzI2l/uj0Ol2+n
 UlHEW/nhMn87ahGB7tm5wJQB2yp1Qf+4CnpH8bE5IGS7xoHhnRQaw+q/jK3HU2iyBShGWi
 AYvEweuTU1kCdD+4V/HZaO+/OLoCj1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623827011;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z1zoJYbQ3tpVGZWVDrKyXIqflWed9FL4BGOWZ6Tccq4=;
 b=nn/QMQt5CGwR/5yF7Y+ammrG4kG2YvO7OpHGxzUDulAlgTX2GWYOd1to9fDjQ0abEQyuxy
 jXoCNmyOqm0tzICw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id V62FL0KiyWAkVwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Wed, 16 Jun 2021 07:03:30 +0000
Date: Wed, 16 Jun 2021 09:03:29 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <YMmiQfWgvqtCzOmg@pevik>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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

Hi Xu,

> +++ b/testcases/kernel/syscalls/mallinfo2/Makefile
...
> +
> +top_srcdir		?= ../../../..
> +
> +include $(top_srcdir)/include/mk/testcases.mk
> +
> +CFLAGS += -I../mallinfo
Also this needs to be
CFLAGS += -I$(abs_srcdir)/../mallinfo

otherwise out of tree builds fail:
https://github.com/pevik/ltp/actions/runs/941820122

BTW Cyril also suggested recently to drop out of tree support, because build
system dependencies are broken and fixing it would be much easier when
supporting only in tree build.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
