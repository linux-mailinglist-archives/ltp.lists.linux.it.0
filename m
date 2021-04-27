Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E683436C5B6
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 14:03:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7F6E3C6578
	for <lists+linux-ltp@lfdr.de>; Tue, 27 Apr 2021 14:03:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 200903C1A7E
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:03:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D0DE3601227
 for <ltp@lists.linux.it>; Tue, 27 Apr 2021 14:03:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1D663B180;
 Tue, 27 Apr 2021 12:03:15 +0000 (UTC)
Date: Tue, 27 Apr 2021 14:03:13 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YIf9gU8lctnyfmhZ@pevik>
References: <20210426120107.6632-1-rpalethorpe@suse.com>
 <20210426120107.6632-2-rpalethorpe@suse.com>
 <YIfZqZ29H2AN1vqh@pevik> <YIfuSCLuEabBCfNN@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIfuSCLuEabBCfNN@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] bpf: Check truncation on 32bit div/mod by zero
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> Hi!
> > /usr/src/ltp/docparse/testinfo.pl metadata.json
> > , or ] expected while parsing array, at character offset 70801 (before "expected"",\n     "b...") at /usr/src/ltp/docparse/testinfo.pl line 423

> > Because we don't escap double quotes (among other issues previously reported,
> > e.g. tabs), it produces invalid json:

> >    "doc": [
> >      "[Description]",
> >      "",
> >      "Compare the effects of 32-bit div/mod by zero with the "expected"",
> >      "behaviour.",
> >      "",

> This should be fairly easy to fix, we just need to replace the
> data_printf() for strings in data_to_json_() with a function that would
> generate the escapes.

> Will you do that or should I prepare the patch?

Thanks for a hint, I'll prepare it.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
