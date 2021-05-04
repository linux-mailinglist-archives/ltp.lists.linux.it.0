Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38A372CE0
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7CDD13C58B3
	for <lists+linux-ltp@lfdr.de>; Tue,  4 May 2021 17:22:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5120C3C57D7
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:22:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id B60F714010EE
 for <ltp@lists.linux.it>; Tue,  4 May 2021 17:22:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 151CBB169;
 Tue,  4 May 2021 15:22:48 +0000 (UTC)
Date: Tue, 4 May 2021 16:57:41 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YJFg5eIaVhUKO4ax@yuki>
References: <20210504125729.18781-1-pvorel@suse.cz> <YJFH4vLeaXnc8mzN@yuki>
 <YJFd6x+P7lFhLfXm@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJFd6x+P7lFhLfXm@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
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
> > Also does this even escape newlines? If you write "\n" in C it's stored
> > in memory as [0x0a, 0x00], no actual \ are stored in the string. What
> > the '\\' case does it to escape literal backslash i.e. "\\" which is
> > stored as [0x5c, 0x00].
> Well, due first handling '\\' any text written as \n will be kept as \n
> (obviously anything starting with \ will be handled the same, e.g. \t, \r, \b, \f).
> We'd like to interpret \n at least for .options (unless we transform them
> to array of arrays as you suggested). But I'm not sure if we want to do
> everywhere, e.g. in doc there might be \n which we want to keep, thus I'd prefer
> to interpret only tabs ('\t' => "\\t") and the rest escape via escaping '\\'
> (already in the patch).
>
> I don't think there is real new line character in our JSON (unlike tab, which
> was put there into CAN tests and needed to be reverted). If yes, I think we'd
> prefer to interpret it instead escaping it (as well as form feed and carriage return).
> Unless any of these is ascii before 0x20 (which will be handled by last change
> you're suggested.

Ah, I got confused here as well, we parse the C code and we do not
replace the \n with the actual ascii value in the docparse code so it
ends up verbatim in the strings in memory and then it's translated into
the JSON files.

This is even more complicated than I originally thought since there are
several types of strings from a different parts of the C code, i.e. the
expected values depens on context.

If we parse a C comment '"' is a valid character and does not need to be escaped,
while in the middle of C string it has to be encoded as "\"".

We have to think of all different cases here, I will have a closer look tomorrow.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
