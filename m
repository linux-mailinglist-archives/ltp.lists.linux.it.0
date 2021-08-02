Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A53DD572
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:14:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B47C3C8A2B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:14:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 72A273C5706
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:14:39 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E11D260085E
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:14:38 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17EE11FF7A;
 Mon,  2 Aug 2021 12:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627906478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lqw0W80X31dBBQM/3sqr5mTMACZ48H6Rc6MzsUGNLuU=;
 b=QxSzN3BFQ48EOt8Sxv3pnrEomExbL4nfAlXAn7Zghcy+PxfI8mUrrYFib2DYVHdeam6E+j
 haEQbUvGWfIZkMSClrhgSzjVvm9WArmYFRF7yZNB77+0I0FG2QPTcdej95KkpxEzd86gyt
 hCpCH4tEQT1Gj5JRn+pM2L64up5gxg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627906478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lqw0W80X31dBBQM/3sqr5mTMACZ48H6Rc6MzsUGNLuU=;
 b=lgD3Jvc+D823Os8jZS30jT/46D5mVymMf+z0+zo/KFmA6MUbx2GWQXmwI7msKc9j3TbuB1
 XX4A8E4zGrfS6XDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F38AC13C68;
 Mon,  2 Aug 2021 12:14:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zhETOq3hB2HdYwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 02 Aug 2021 12:14:37 +0000
Date: Mon, 2 Aug 2021 14:14:43 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YQfhszoCgVv1mGjf@yuki>
References: <20210730133155.31284-1-chrubis@suse.cz>
 <d99456d3-c3d3-a180-7d0c-55bc3042e63c@jv-coder.de>
 <YQfZLXZznHjvlGJW@yuki> <YQfaZsdzHbPrhCV0@yuki>
 <e51c9469-73e5-69db-f5ff-c2abfd72dc95@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e51c9469-73e5-69db-f5ff-c2abfd72dc95@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> The usage of foo foo_ and foo__ does not really help in reading the code :)
> There could also be some logic errors hiding, e.g. 
> tst_acquire_loop_device should probably not default to DEV_SIZE_MB at all.
> The caller should be responsible for finding a correct size and the two 
> users of this function (tst_device [the binary] and 
> tst_acquire_device__) do pass a concrete value for size.

Actually the tst_device binary does not pass a concrete size unless the
shell code that calls it passes an optional parameter, so the fallback
to DEV_SIZE_MB if size == 0 has to stay in the double underscore
function. I will send a v2 that just replaces the second occurence of
MAX() in tst_device.c for now as it looks to me that any singificant
cleanup would require complete redesing of the interface and quite
possibly rewrite of the last 16 tests that use the old API as a
pre-requisite.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
