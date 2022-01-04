Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB4E484141
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:59:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 914B83C908E
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Jan 2022 12:59:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B5A003C21C8
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:59:01 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 574856002EA
 for <ltp@lists.linux.it>; Tue,  4 Jan 2022 12:59:00 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 745CA212B9;
 Tue,  4 Jan 2022 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641297540;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gg61oQseSzP5nKtUD3IDTzoI3KQJhT7++9t4PwD5Nfs=;
 b=nssghujdSyw+r4xel11F+Hv5+sQDL59a8zj3HuOkm3/BBHsORhyCZCxJeFfgQbg9TK1yes
 6UjoCbzEgyCmcEfpQxTdL9/HxF8gtncmhi38nl7h76A4TaDpb284bF5tjobm3Fhw4/57JM
 LI3aWk4Yf+PYIZKrQ2nPSnvv1ztzZeQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641297540;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gg61oQseSzP5nKtUD3IDTzoI3KQJhT7++9t4PwD5Nfs=;
 b=5K9sy/LHmym3RNB9cR85pcTEbwoZuOR+vAz1g+O98s3A5NkBRqYrcJ9h0h6naGl4Vw3s60
 F/ta4a+AmDZXi0Bw==
Received: from g78 (unknown [10.163.24.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 2F817A3B81;
 Tue,  4 Jan 2022 11:59:00 +0000 (UTC)
References: <20220104073754.721-1-andrea.cervesato@suse.com>
 <20220104073754.721-2-andrea.cervesato@suse.com> <YdQGplLdFnsmhlSO@pevik>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Tue, 04 Jan 2022 11:49:00 +0000
In-reply-to: <YdQGplLdFnsmhlSO@pevik>
Message-ID: <87a6gbogos.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] Refactoring aio-stress.c using LTP API
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Petr,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Andrea,
>
> ...
>>  			for (i = 0; i < io->io_oper->reclen; i++) {
>>  				if (io->buf[i] != verify_buf[i]) {
>> -					fprintf(stderr, "%d:%c:%c ", i,
>> -						io->buf[i], verify_buf[i]);
>> +					ret = asprintf(&msg, "%d:%c:%c ", i, io->buf[i], verify_buf[i]);
>> +					if (ret < 0)
>> +						tst_brk(TBROK, "asprintf memory allocation error");
>> +					ptr += sprintf(ptr, msg);
> Actually, this is problematic for -Werror=format-security which we use in CI.
> Simple "%s" fixes that. It can be done before merge.
>
> ptr += sprintf(ptr, "%s", msg); 
>
> @Richie: I wonder if make check could also actually compile the code with
> extra CFLAGS from build.sh.

Compiling during make-check may confuse things; we don't want make-check
to produce build artifacts. Although I guess you could skip the later
compilation steps. Also then we could add -fanalyzer on gcc which I have
done in a test project[1]. Possibly Clang has something similar,
hhmmmm...

Probably this would require different flags on GCC and Clang. We could
also run both GCC and Clang if they are present. It's probably worth
experimenting with.

[1]: https://richiejp.com/zc-data#meson

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
