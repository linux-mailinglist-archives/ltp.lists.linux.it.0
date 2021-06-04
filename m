Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DF39B543
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 10:56:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3E0943C4F28
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 10:56:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8871F3C27F0
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 10:56:01 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id ED5C6600F6E
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 10:56:00 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 28610219F5;
 Fri,  4 Jun 2021 08:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622796960;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BEDbXouO4Y4kKMBMRqetjl8P1yOnL1M5blnZqtXXug=;
 b=M0upAgMkM4P0XYcq3b/FWiUhRVjJTn9mDSGheIOajEbbB9f/kgPZQjYVbBLpuUNGmjuY2z
 NtUVEMe3iSU2WwQcbVvkndHRH16ORffvWgdWWbAkmjL/0KnAlxl0iiYfkUwku1J6SDjWvT
 wARg9MLIgYz+OE5cdVAiHFYm4F1LKPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622796960;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BEDbXouO4Y4kKMBMRqetjl8P1yOnL1M5blnZqtXXug=;
 b=i/cT2PGUqrT+Z6w8cOqt2beD8i2nwgHUNRuGecroGlwBYeZ4SDOd+jGSwJ+lhJ7ObRyiqF
 4Bky8AH91d8RG0Dw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E39D7118DD;
 Fri,  4 Jun 2021 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622796960;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BEDbXouO4Y4kKMBMRqetjl8P1yOnL1M5blnZqtXXug=;
 b=M0upAgMkM4P0XYcq3b/FWiUhRVjJTn9mDSGheIOajEbbB9f/kgPZQjYVbBLpuUNGmjuY2z
 NtUVEMe3iSU2WwQcbVvkndHRH16ORffvWgdWWbAkmjL/0KnAlxl0iiYfkUwku1J6SDjWvT
 wARg9MLIgYz+OE5cdVAiHFYm4F1LKPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622796960;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6BEDbXouO4Y4kKMBMRqetjl8P1yOnL1M5blnZqtXXug=;
 b=i/cT2PGUqrT+Z6w8cOqt2beD8i2nwgHUNRuGecroGlwBYeZ4SDOd+jGSwJ+lhJ7ObRyiqF
 4Bky8AH91d8RG0Dw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id gz9oNZ/quWC+XwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 08:55:59 +0000
Date: Fri, 4 Jun 2021 10:55:58 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <YLnqnro1XHBiJPs2@pevik>
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <20210603154825.30165-2-rpalethorpe@suse.com>
 <YLnC05icNAshbXtr@pevik> <YLnERhx/f8evU0uQ@pevik>
 <878s3qja0y.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878s3qja0y.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/2] Add 'make checks' and clang-checks to
 build system
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
> > I guess you forget to add git add include/mk/clang-checks.mk, right?

> Argg, yes, sorry for wasting your time. This is my fault for not
> cleaning up my LTP directory.
NP, looking forward to v2.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
