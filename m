Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DABF837154D
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 14:38:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2FC7B3C7CB2
	for <lists+linux-ltp@lfdr.de>; Mon,  3 May 2021 14:38:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2BB3F3C58D5
 for <ltp@lists.linux.it>; Mon,  3 May 2021 14:38:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 83A186007A9
 for <ltp@lists.linux.it>; Mon,  3 May 2021 14:38:16 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1CC9AE4B;
 Mon,  3 May 2021 12:38:15 +0000 (UTC)
Date: Mon, 3 May 2021 14:38:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YI/utqVeWrPjwqYQ@pevik>
References: <20210503085732.9637-1-pvorel@suse.cz>
 <YI/jqKdP7kRYK1qD@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YI/jqKdP7kRYK1qD@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] docparse: Escape backslash,
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

> I guess that it would be easier to write a function to print json
> string, e.g.

> static inline void data_fprintf_esc_(FILE *f, unsigned int padd, const char *str)
> {
> 	while (padd-- > 0)
> 		fputc(' ', f);

> 	fputc('"', f);

> 	while (*str) {
> 		switch (*str) {
> 		case '\\':
> 			fputs("\\\\", f);
> 		break;
> 		case '"':
> 			fputs("\\\"", f);
> 		break;
> 		case '\t':
> 			fputs("\\t", f);
> 		break;
> 		default:
> 			putc(*str, f);
> 		break;
> 		}
> 		str++;
> 	}

> 	fputc('"', f);
> }

That's indeed much better, thanks! I'll send v2 with you as author.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
