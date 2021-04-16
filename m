Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C158362006
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 14:43:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9874D3C2585
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Apr 2021 14:43:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2544B3C1B3C
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 14:43:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8B2791A01C81
 for <ltp@lists.linux.it>; Fri, 16 Apr 2021 14:43:28 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D95BAB0BA;
 Fri, 16 Apr 2021 12:43:27 +0000 (UTC)
Date: Fri, 16 Apr 2021 14:32:40 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <YHmD6Efvn/f6Eh+G@yuki>
References: <20210413043844.5612-1-pvorel@suse.cz> <YHhDurTlljhXAKL9@yuki>
 <YHhJdwbeUCz5sDfK@pevik> <YHhNQSCotEieKcnx@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHhNQSCotEieKcnx@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] splice02: Generate input in C
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
Cc: Martin Loviska <mloviska@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > LGTM, going to merge it with these changes (+ cleanup to_write)
> > and your Reviewed-by: tags.
> > Thanks a lot!
> 
> Maybe one more change: INT_MAX is a bit too much, it timeouts.
> I'll use 262144 as max allowed -n (the default on intel - 2x max pipe size).

I guess that the main problem here is that we write one character at a
time, which means that we spend most of the time in syscall handler code
rather than copying the data. It may work much better if we change the
code to write 512 bytes at a time. I.e. something as:

	#define BUFSIZE 512

	char buf[BUFSIZE];

	memset(buf, 'a', BUFSIZE);

	while (to_write > 0) {
		size_t size = to_write > BUFSIZE ? BUFSIZE : to_write;

		...

		to_write -= written;
	}

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
