Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D18B13914F3
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:32:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 656343C7764
	for <lists+linux-ltp@lfdr.de>; Wed, 26 May 2021 12:32:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6381F3C2AD8
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:32:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 197651401134
 for <ltp@lists.linux.it>; Wed, 26 May 2021 12:32:50 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out1.suse.de (Postfix) with ESMTP id 38B1F218C1;
 Wed, 26 May 2021 10:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622025170;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vq1xaoS7oe5rEKLaJ6F3izE+CNZSj/yavK/WodHIJKw=;
 b=BWOQRPcwKgCbMR6ZhgAkHaReK/KNtbfG7p87ORi8q4jiOrxqZFOh4uj7IZ99Wq/u0DqPrA
 X8WKHWAqLBJqXqoEUzHjaYZRSzDKilwvgybTZW2qLJFLVvunlvRXbG975osQPlKjEvkkJg
 p5C454PKqk6xJXJ6++Y2YRaeCXSgyQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622025170;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vq1xaoS7oe5rEKLaJ6F3izE+CNZSj/yavK/WodHIJKw=;
 b=vVCBiMdgyaOTl7HOCBU2Vy5JuBOSxBv71FUZgNOl0sZ5K5hlrsXGWlAh5psMv+VlmDuObZ
 p+QDTDmN6r2WBkCQ==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1D17211A98;
 Wed, 26 May 2021 10:32:50 +0000 (UTC)
Date: Wed, 26 May 2021 12:32:48 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YK4j0Pw4ECqjFWTj@pevik>
References: <20210520092449.162043-1-xieziyao@huawei.com>
 <YK0XBktEIyGkhAsT@pevik> <YK4Q1iJz0/i4ZSxc@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YK4Q1iJz0/i4ZSxc@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/2 v2] syscalls/sendfile: Convert sendfile{08,
 09} to the new API
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

> Hi!
> > By accident, I changed
> > off_t before_pos, after_pos;
> > to:
> > OFF_T before_pos, after_pos;

> > @Cyril: should it be reverted?

> There is a define in the Makefile that defines OFF_T to off64_t for
> _FILE_OFFSET_BITS=64 but that looks like a workaround for buggy libc.

> The _FILE_OFFSET_BITS=64 should, when code is compiled on 32bit
> platform, change the 32bit off_t to a 64bit off_t.
Thanks for info. I noticed Makefile myself, but didn't know the background.

> I.e. when you compile following:

> int main(void)
> {
>         printf("%zu\n", sizeof(off_t));
>         return 0;
> }

> on a 32bit (or with -m32) it should print 4
> on a 32bit with -D_FILE_OFFSET_BITS=64 it should print 8
> on a 64bit it should print 8 regardless
Yep (verified myself).

> As far as I can tell we should remove the OFF_T handling from the
> Makefile here instead.
OK, I'll send a patch which removes off64_t from Makefile and use
always off_t.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
