Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A053EB6AD
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:27:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6E9E3C657E
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 16:27:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB2A83C30C7
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:26:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E82471A01443
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 16:26:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C34F201E3;
 Fri, 13 Aug 2021 14:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628864818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ubgL352vC3GyBZGzCnkUM802RPvfIz9H91CbRgf7ro=;
 b=ful6ECS7xPyN3O3Hhze+Mbf7DvyGCQij/zohM1tFCAh78ewWjsBTsg5nOFeSu2sM6XZ90k
 NBFDrScVc2dmA4eT31UmUyB57t7NPvKPndkvpuUppdXN4oYRCc005e9bSL2D1qKaeeqVrr
 Q7o8Nx9mwThL+MyK+1jl8KvRcitk2Dw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628864818;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0ubgL352vC3GyBZGzCnkUM802RPvfIz9H91CbRgf7ro=;
 b=NsWTHcmoe4SXoixsI2z5GnyCco+YZc7g7imymWt1027ZEdHcxx2/H8UH+sg9rcqapCDBz6
 oNqnRKJAcyN+tmCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26BC513B73;
 Fri, 13 Aug 2021 14:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zLBWCDKBFmEpWwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 13 Aug 2021 14:26:58 +0000
Date: Fri, 13 Aug 2021 16:27:11 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YRaBPzw2Cv1Bo1Ag@yuki>
References: <20210806154557.19551-1-mdoucha@suse.cz> <YRZ4TmJWcL8zJgg6@yuki>
 <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/3] syscalls/creat08: Convert to new API
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
> > Btw, it looks that this is one of the test failing on tubmbleweed, it
> > looks like the "bin" group is no longer present on the system.
> > 
> > Can't we just pick two non-zero numbers for the groupids instead of
> > trying to resolve whatever groups are supposed to be on the system?
> > 
> > We may as well add an library API to request one or two group ids to the
> > test library so that they are hardcoded only in a single place.
> > 
> > See:
> > https://progress.opensuse.org/issues/96644
> > https://openqa.opensuse.org/tests/1872454
> 
> The test passes on regular Tumbleweed, the ticket you've linked is about
> JeOS. Yes, this needs to be fixed but I'd leave it to a separate
> patchset. The rewrite isn't breaking anything that isn't already broken.
> But you can drop the CVE test patch and I'll resubmit it with the new
> patchset.

Fair enough.

> Latest Tumbleweed tests:
> https://openqa.opensuse.org/tests/1873051#step/open10/8
> https://openqa.opensuse.org/tests/1873529#step/open10/8
> 
> We can't pick just any group numbers. The test user (nobody) must be a
> member of the first group but not the other. Using nobody/nogroup is
> probably safe so for the second group we can just scan all existing
> groups and pick for example max(gid)+1.

I guess that simply git for nobody/nogroup + 1 should work well then.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
