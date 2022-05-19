Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF0152D1ED
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 13:59:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6120A3CAACF
	for <lists+linux-ltp@lfdr.de>; Thu, 19 May 2022 13:59:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E50F83C0894
 for <ltp@lists.linux.it>; Thu, 19 May 2022 13:59:26 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6FD992000D3
 for <ltp@lists.linux.it>; Thu, 19 May 2022 13:59:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9953D21B7C;
 Thu, 19 May 2022 11:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1652961565; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rgYwYQ1Y7YS41Fnzs+nwjuRNENh6355jWyYC9TorDM=;
 b=WVSHp6Z4qBI8BSNRedYQOgdoLUVUEgIiy8i7pn5q5AO0lF/647f7B44lBTAjshuoReFUF9
 /An4fyGfkNUBPn+1J6dEEOJc9Ryql4pf+1MZOSyWWKtSTlwG2AERvNyrLUvMqDVXtm37Cv
 feFnGB5+38i4Zw5lx/ifEUzGMW6Kur4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1652961565;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7rgYwYQ1Y7YS41Fnzs+nwjuRNENh6355jWyYC9TorDM=;
 b=a2TjQhUGWSFqktlBeZ9Cbh0Pf/HCYHJvy734f8rinljdfslODrKvXok58VEpm3zxH1/DR4
 95PPyS8FOX5a22DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81D5B13456;
 Thu, 19 May 2022 11:59:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pe/VHR0xhmL4eAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 19 May 2022 11:59:25 +0000
Date: Thu, 19 May 2022 14:01:37 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YoYxoXe5lIwuvZbP@yuki>
References: <CAEemH2fHsa+JECK5dW64-coQBwdGR3W9W+jKex8zRmKzfLX1=w@mail.gmail.com>
 <Yn5prUjpZEUjoxbL@yuki> <875ym5di8f.fsf@suse.de>
 <YoN/W4wbow2fyOut@yuki>
 <CAEemH2cazgjqj4C1nuqPcRCC0dZoxwi-yiJymRgJxr0woXXFWw@mail.gmail.com>
 <CAEemH2dYwMczBhFj28yc9xDu0VBg50orjeQBK2s13-8BspK=WQ@mail.gmail.com>
 <YoYIVaJJDzryYNeg@yuki>
 <CAEemH2c50gr-G91_4nbdaDkCeGivCg3OQcYN4O0HTzyP2nf_jw@mail.gmail.com>
 <YoYbm487vwfD8Wne@yuki>
 <CAEemH2cRhznzW+mVZwSeWk_p9REvwd76t0H2mwJBQS_M7jn4CA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cRhznzW+mVZwSeWk_p9REvwd76t0H2mwJBQS_M7jn4CA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 22/29] fuzzy_sync: Convert to runtime
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
Cc: LTP List <ltp@lists.linux.it>, automated-testing@lists.yoctoproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> No need. You can push with this new patch adding,
> then I will kick start release testing for the whole LTP
> from our side.

Great, please do so.

Andrea is going to send small fix to the aiodio tests that should be
merged as well, otherwise these may fail rarely.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
