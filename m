Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CF41459B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 11:56:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2CA9C3C78D4
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Sep 2021 11:56:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E4B6D3C7713
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 11:56:29 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 863751400C5E
 for <ltp@lists.linux.it>; Wed, 22 Sep 2021 11:56:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8ADA22297;
 Wed, 22 Sep 2021 09:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1632304588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTAfZSWEYF15U8rtzuE/UnBeUWbP8LjLJuVSbIv/sfU=;
 b=wVaoOwxHxuWBKPETIlaNb81shrDHJz2a6HqX9VvHjwX8/rXKq1luIcHfEpLOioYkSCD3b8
 EO1r5re+dXZ4oMIpB4g0jSGaPgFq7UDUR1esgMhZDvwyRE5BYxmH81ILn1yuJMSAUw+H1E
 jRFZDQYgZInJ/1/ngshaRhM8NOdIr5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1632304588;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rTAfZSWEYF15U8rtzuE/UnBeUWbP8LjLJuVSbIv/sfU=;
 b=U0vmS6yj/nPmqLKcV1Cb3TaEGv16vSrXWNVRcJWmC+/ANxbJqZO3gIQzvBPqu0si0LnxCk
 X3H9skiZrZgvw0Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A69B113D6E;
 Wed, 22 Sep 2021 09:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tRw5KMz9SmHfRAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Sep 2021 09:56:28 +0000
Date: Wed, 22 Sep 2021 11:56:59 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <YUr9676LXNi0xMs6@yuki>
References: <20210817104625.2559362-1-liwang@redhat.com>
 <20210921203349.GA2014441@maple.netwinder.org>
 <CAEemH2dMCmYDkZYxfaeJ_oQCCcHzeMgSOGVQ_wS6BwCrp0YiQw@mail.gmail.com>
 <YUrnljqYd5Hx/fi+@yuki>
 <CAEemH2dDRT-iQPH0a-Aip8OZDUpp2Z3_x4dgVBEg4tv_pyWvfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2dDRT-iQPH0a-Aip8OZDUpp2Z3_x4dgVBEg4tv_pyWvfw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] fallocate05: increase the fallocate and
 defallocate size
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > Looking at the test I do not think there is a reason to allocate more
> > than a two or four blocks for the buffer. We just need to write() to the
> > fallocated area in a loop one block at a time until it's full. I do not
> > think that it's a good idea to pass ~100MB buffer to a single write()
> > and expect it to succeed anyways.
> >
> 
> Sounds practical.
> 
> Btw, If we don't create such a larger buffer area, then we have to
> count the loop times must as equal to bufsize/blocksize. Otherwise,
> we can't guarantee the test behavior is correct.

Strangely enough we allready do exactly that for the second part of the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
