Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CA7372B25
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:36:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F231C3C5834
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 15:36:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 9B3B93C57E0
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:36:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 159261000D39
 for <ltp@lists.linux.it>; Tue,  4 May 2021 15:36:02 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33B8FAD22;
 Tue,  4 May 2021 13:36:02 +0000 (UTC)
Date: Tue, 4 May 2021 15:10:58 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJFH4vLeaXnc8mzN@yuki>
References: <20210504125729.18781-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504125729.18781-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
Cc: ltp@lists.linux.it, Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> +static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
> +{
> +	while (padd-- > 0)
> +		fputc(' ', f);
> +
> +	fputc('"', f);
> +
> +	while (*str) {
> +		switch (*str) {
> +		case '\\':
> +			fputs("\\\\", f);
> +			break;
> +		case '"':
> +			fputs("\\\"", f);
> +			break;
> +		case '\t':
> +			fputs("\\t", f);
> +			break;
> +		default:
> +			putc(*str, f);
> +			break;
> +		}
> +		str++;
> +	}
> +
> +	fputc('"', f);
> +}

Also does this even escape newlines? If you write "\n" in C it's stored
in memory as [0x0a, 0x00], no actual \ are stored in the string. What
the '\\' case does it to escape literal backslash i.e. "\\" which is
stored as [0x5c, 0x00]. Looking at JSON specification anything that is
in ascii before 0x20 (space) is invalid character in a JSON string. I
guess that the safest to write strings would be:

	...
	default:
		if (*str >= 20)
			putc(*str, f);
	}

And we would have to add escape at least for '\n' the same way we have
for '\t' in the switch.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
