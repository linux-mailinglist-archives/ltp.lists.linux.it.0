Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0205458F8D
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 14:37:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 530843C8D6D
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Nov 2021 14:37:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 334DB3C25EC
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 14:37:29 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 965E360070E
 for <ltp@lists.linux.it>; Mon, 22 Nov 2021 14:37:28 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id DF50B1FD39;
 Mon, 22 Nov 2021 13:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637588247;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7LOOToo7y1kdafhDLNvXfa9ykqRCEfbv5dMSGi1PqI=;
 b=cwDOsrn5U4REVKYg2tHu8moFg03rrK+G3O1SmxWcLhAg4EjsDFRtAy64owqAHApzKDCcb1
 mOPgLzCgZti0FxJVSl7g3sw3OkOBBFZE7ott8BLr1aiAbKNNq0pqKcMwqAIAFJAuFeSJ+n
 a7z26xFzl8X0eD/YQR1uSfYWC9JBUh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637588247;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o7LOOToo7y1kdafhDLNvXfa9ykqRCEfbv5dMSGi1PqI=;
 b=xdY9wq1cicZ4No7gnFsEXFhexFec+HOu+fWIoAIxplQJiUDNYsm9lk5kZHGxZNG+4b075F
 Z+p8mgl6YvVep2Ag==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id A6840A3B8B;
 Mon, 22 Nov 2021 13:37:27 +0000 (UTC)
References: <20211117070708.2174932-1-liwang@redhat.com>
 <77e0b8b9-5de6-73ab-0f73-e3d95bad0935@jv-coder.de> <YZZCAXWRcrsYJo9+@yuki>
 <CAEemH2ehTUoDTqa21vKDvC4vQuTPBM1j23Dqa=FFEJjcPLsvvQ@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Mon, 22 Nov 2021 13:27:00 +0000
In-reply-to: <CAEemH2ehTUoDTqa21vKDvC4vQuTPBM1j23Dqa=FFEJjcPLsvvQ@mail.gmail.com>
Message-ID: <87bl2cmhuw.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/3] lib: adding .supported_archs field in
 tst_test structure
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

Hello Li,

Li Wang <liwang@redhat.com> writes:

> Hi All,
>
> By now, should I push this patch v5, or is any else change needed?

I still don't understand how tst_arch.name is mapped to i386, i586 or
i686?

It appears that we will always get TCONF on any of these architectures
because tst_arch.name will be set to x86 and the required arch will be
i386, i586 or i686.

> (From the above discussion I feel v5 is satisfied almost all of our
> requirements.)

Otherwise, yes, I agree.

>
> -- 
> Regards,
> Li Wang


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
