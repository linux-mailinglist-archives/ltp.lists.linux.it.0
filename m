Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3417A375086
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 10:03:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 850C93C56BC
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 10:03:47 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B35B13C0CBC
 for <ltp@lists.linux.it>; Thu,  6 May 2021 10:03:44 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1C5B1600F0A
 for <ltp@lists.linux.it>; Thu,  6 May 2021 10:03:43 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CADEB159;
 Thu,  6 May 2021 08:03:43 +0000 (UTC)
Date: Thu, 6 May 2021 09:50:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJOf3tGdYHam+8Jl@pevik>
References: <20210504125729.18781-1-pvorel@suse.cz>
 <YJFH4vLeaXnc8mzN@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJFH4vLeaXnc8mzN@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/1] docparse: Escape backslash,
 tab and double quote in JSON
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

...
> Also does this even escape newlines? If you write "\n" in C it's stored
> in memory as [0x0a, 0x00], no actual \ are stored in the string. What
> the '\\' case does it to escape literal backslash i.e. "\\" which is
> stored as [0x5c, 0x00]. Looking at JSON specification anything that is
> in ascii before 0x20 (space) is invalid character in a JSON string. I
> guess that the safest to write strings would be:

> 	...
> 	default:
> 		if (*str >= 20)
> 			putc(*str, f);
> 	}
Actually, space 20 is hex, it should be 0x20 or 32.

https://tools.ietf.org/html/rfc8259#page-9
unescaped = %x20-21 / %x23-5B / %x5D-10FFFF

BTW preparing v4, it should definitely go to the release (or we need to fix
formatting of c39b29f0a ("bpf: Check truncation on 32bit div/mod by zero")).

Kind regards,
Petr

> And we would have to add escape at least for '\n' the same way we have
> for '\t' in the switch.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
