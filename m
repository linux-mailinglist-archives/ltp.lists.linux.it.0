Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A24317BDA84
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 13:58:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 029953CAF74
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Oct 2023 13:58:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C1BC63C9923
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 13:58:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9B3C310000D3
 for <ltp@lists.linux.it>; Mon,  9 Oct 2023 13:58:47 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C96241F381;
 Mon,  9 Oct 2023 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1696852726;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/WfUoMi7UwejXVuGSKaXBtsbUFDod4A4q1S9lGwVkI=;
 b=z8oyh4mncKYyUvlZJ5nWEmyW5PdFvkIo4DjKC8885db/RMwkp0wGcV/mdwOHroZ4KK3hBq
 Z82BHtKGpRGukYOU0cXz1B9PV/3xoIjQU3nhv6jgMFPfVcP5/sUzvjnT0KAllxhooPTnVo
 qpeHoGEj8qHBX0jegZ1110K0S5hWTgQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1696852726;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g/WfUoMi7UwejXVuGSKaXBtsbUFDod4A4q1S9lGwVkI=;
 b=SU/3YMWYCa816Jw35JnBAtmBoxJ+dONTt5OEJQ2Tb7u0KeJIF0Kww1n9NefgbwUd20/M6W
 PzK6W/8vSAQcZiDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A53C313905;
 Mon,  9 Oct 2023 11:58:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WwJiJ/bqI2VfNAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 09 Oct 2023 11:58:46 +0000
Date: Mon, 9 Oct 2023 13:58:43 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.com>
Message-ID: <20231009115843.GA390277@pevik>
References: <20231009102405.26471-1-rpalethorpe@suse.com>
 <20231009102405.26471-2-rpalethorpe@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009102405.26471-2-rpalethorpe@suse.com>
X-Virus-Scanned: clamav-milter 1.0.1 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] ci: Check for undefined variables in all
 scripts
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

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Thank you!

Could you please before you commit also add license to the files:
# SPDX-License-Identifier: GPL-2.0-or-later

And maybe your/LTP copyright (whatever you prefer) into files you added?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
