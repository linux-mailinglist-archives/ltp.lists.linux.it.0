Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A01452F29
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 11:32:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDB533C8763
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Nov 2021 11:32:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D831A3C7CBA
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 11:32:28 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 61F191A00258
 for <ltp@lists.linux.it>; Tue, 16 Nov 2021 11:32:28 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A8303218E1;
 Tue, 16 Nov 2021 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637058747;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRZq2cXGsHc7xwSh1c2gvMwRNN+THEhlqaG8A5UTzTw=;
 b=t1oABs09dJrG/WiojuEAzlEJUbDKN9iPgFvLo7Ug3lH4GLK3HhLa8fsTHqt+N9lQWIJaLx
 gU3zijBlPyMNepNjSbM6L8vAK9GPMMKHbFEn5IJXmrIlXlgmJUQek8I7V32pvRI2bHYghf
 HrLrI/f/NQy80Fkp2WHsuZdHcYND0fo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637058747;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hRZq2cXGsHc7xwSh1c2gvMwRNN+THEhlqaG8A5UTzTw=;
 b=7YOKy1nz7pX/igI6O8opgKE1oUz8x/m32Ai0/SSYmqP4QE25CEcOWY/pbnzoBQvaoOPtiJ
 3G9+EWpsmxwZxEBg==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 67A16A3B8C;
 Tue, 16 Nov 2021 10:32:27 +0000 (UTC)
References: <20211109130910.1583233-1-liwang@redhat.com>
 <YYqdxmnJi5je9DvV@yuki>
 <CAEemH2fJHN5i0W9poB6H2JWXUNRBjriXp21VG4x8r5n4oMvhbw@mail.gmail.com>
User-agent: mu4e 1.6.9; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
Date: Tue, 16 Nov 2021 10:30:29 +0000
In-reply-to: <CAEemH2fJHN5i0W9poB6H2JWXUNRBjriXp21VG4x8r5n4oMvhbw@mail.gmail.com>
Message-ID: <878rxobdc5.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/3] lib: adding .supported_archs field in
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

>  
>  > +#ifndef TST_ARCH_H__
>  > +#define TST_ARCH_H__
>  > +
>  > +enum tst_arch_type {
>  > +     TST_UNKNOWN,
>  > +     TST_I386,
>
>  I would still probably name this TST_X86, Linux does not support i386
>  anymore, the remaining 32bit distributions usually require at least i586
>  or i686...
>
> Sure, If go with that TST_X86, we just need to do modifications based on
> V4 like below, right? What else am I missing here?

Cyril made another comment about static keyword usage on patch 2. Could
you please roll a V5?

-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
