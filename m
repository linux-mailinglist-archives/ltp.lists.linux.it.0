Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2012AF3B5
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:37:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8036B3C6028
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Nov 2020 15:37:01 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DA5F83C2F19
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:36:57 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 81D4C6008C6
 for <ltp@lists.linux.it>; Wed, 11 Nov 2020 15:36:57 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7714ABD6;
 Wed, 11 Nov 2020 14:36:56 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:37:44 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <20201111143744.GA16874@yuki.lan>
References: <20201111131131.17360-1-chrubis@suse.cz> <87mtzoou23.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87mtzoou23.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_bool_expr: Add support for strings
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
Cc: ltp@lists.linux.it, automated-testing@yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Why not skip the whole switch statement if in_string and just check for
> the closing '"' instead?

I guess that we can instead do:

diff --git a/lib/tst_bool_expr.c b/lib/tst_bool_expr.c
index dd147cde3..387c38b91 100644
--- a/lib/tst_bool_expr.c
+++ b/lib/tst_bool_expr.c
@@ -81,6 +81,13 @@ static unsigned int tokenize(const char *expr, struct tst_expr_tok *last)
                        token_cnt += new_tok(&last, &expr[j], i - j);
                        j = i+1;
                break;
+               case '"':
+                       while (expr[i+1] != '"' && expr[i+1])
+                               i++;
+
+                       if (expr[i+1] == '"')
+                               i++;
+               break;
                default:
                break;
                }


Not sure if this is more readable.

> >  		break;
> >  		default:
> >  		break;
> > -- 
> > 2.26.2
> 
> It should probably be an error if tokenize exits with in_string=1?

Well my opinion is that we do not care since we will get error later on, in
case of the kernel config we would get obviously wrong variable value. But if
you think that this is important we can change the return type to int
and return -1 on tokenizer failure.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
