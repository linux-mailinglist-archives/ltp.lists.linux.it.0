Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFA937C2C5
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:16:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E612D3C7963
	for <lists+linux-ltp@lfdr.de>; Wed, 12 May 2021 17:16:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 71BE83C1D63
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:16:17 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0ED3600E2F
 for <ltp@lists.linux.it>; Wed, 12 May 2021 17:16:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36009B11D
 for <ltp@lists.linux.it>; Wed, 12 May 2021 15:16:16 +0000 (UTC)
Date: Wed, 12 May 2021 17:16:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJvxPmk1YRzErjEZ@pevik>
References: <20210512135458.12444-1-chrubis@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512135458.12444-1-chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [COMMITTED] [PATCH] Revert "docparse: Fix heading levels"
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

Hi Cyril,

> This reverts commit 04a7608fe4f7fe2c267216d8b90acf019bdea824.

> Fixes build with asciidoc that otherwise failed with:

> ...
> asciidoc: ERROR: filters.txt: line 4: only book doctypes can contain level 0 sections
> ...
> asciidoc: ERROR: all-tests.txt: line 4: only book doctypes can contain level 0 sections

> Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
> Acked-by: Petr Vorel <pvorel@suse.cz>

I'm sorry for breaking the build, thanks for fixing it!
That was actually the reason why I used shifted level, but I didn't remember.
Thus I'll send a patch today for enhanced docparse testing.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
