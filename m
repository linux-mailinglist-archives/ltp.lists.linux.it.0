Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 44274375BD0
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 21:35:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F08803C56F2
	for <lists+linux-ltp@lfdr.de>; Thu,  6 May 2021 21:35:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CFD2B3C56D5
 for <ltp@lists.linux.it>; Thu,  6 May 2021 21:35:03 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4356F100127D
 for <ltp@lists.linux.it>; Thu,  6 May 2021 21:35:03 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74C88AE89;
 Thu,  6 May 2021 19:35:02 +0000 (UTC)
Date: Thu, 6 May 2021 21:35:01 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YJRE5TQQfezcPeKr@pevik>
References: <20210506132745.16973-1-pvorel@suse.cz>
 <YJQAukLCEqSX1X/9@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJQAukLCEqSX1X/9@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/1] docparse: Handle special characters in JSON
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

Looking at your code, I'm not sure if it's needed.

> > +static inline void data_fprintf_esc(FILE *f, unsigned int padd, const char *str)
> > +{
> > +	while (padd-- > 0)
> > +		fputc(' ', f);
> > +
> > +	fputc('"', f);

> 	int was_backslash = 0;

> > +	while (*str) {
> > +		switch (*str) {
> > +		case '\\':
> > +		break;
> > +		case '"':
> > +			fputs("\\\"", f);
> 			was_backslash = 0;
> > +			break;
> > +		case '\t':
> > +			fputs("        ", f);
> > +			break;
> > +		default:
> > +			/* RFC 8259 specify  chars before 0x20 as invalid */
> > +			if (*str >= 0x20)
> > +				putc(*str, f);
> > +			else
> > +				fprintf(stderr, "%s:%d %s(): invalid character for JSON: %x\n",
> > +						__FILE__, __LINE__, __func__, *str);
> > +			break;
> > +		}

> 		if (was_backslash)
> 			fputs("\\\\", f);

> 		was_backslash = (*str == '\\');
> > +		str++;
> > +	}
> > +
> > +	fputc('"', f);
> > +}

> This should avoid "unescaping" an escaped double quote. We deffer
> printing the backslash until we know the character after it and we make
> sure that we do not excape backslash before ".

> Consider what would happen if someone did put a "\"text\"" into options
> strings, the original code would escape the backslashes and we would end
> up with "\\"text"\\" which would break parser again.

> This way we can at least avoid parsing errors until we fix the problem
> one level down in the parser where we have the context required for a
> proper fix.

It looks to me it it works exactly the same with and w/a was_backslash.

Trying to escape \" will results in first escape \ (=> \\), then " (=> \")

Example C code:

/*\
 * [Description]
 * "expected" \\ behaviour "\"text\""
 */

static struct tst_test test = {
	.options = (struct tst_option[]) {
		{"a:", &can_dev_name, "\"text \\ \""},
		{}
	},
};

results from both original code and your with was_backslash are valid JSON,
but was_backslash add extra backslashes.

result from original code:

  "testfile": {
   "options": [
     [
      "a:",
      "can_dev_name",
      "\\\"text \\\\ \\\""
     ]
    ],
   "doc": [
     "[Description]",
     "\"expected\" \\\\ behaviour \"\\\"text\\\"\""
    ],
   "fname": "testfile.c"
  }

result from was_backslash:
  "testfile": {
   "options": [
     [
      "a:",
      "can_dev_name",
      "\\\"text \\\\\\ \\\\\""
     ]
    ],
   "doc": [
     "[Description]",
     "\"expected\" \\\\\\ \\behaviour \"\\\"text\\\"\""
    ],
   "fname": "testfile.c"
  }

What am I missing?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
