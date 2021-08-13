Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F733EB787
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 17:18:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62C413C657E
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Aug 2021 17:18:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D79333C57F9
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 17:18:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id BF0C61001127
 for <ltp@lists.linux.it>; Fri, 13 Aug 2021 17:18:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3C9122356;
 Fri, 13 Aug 2021 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628867892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZoHUjl8VbIefRt+rrWK4I3eCYdqCbvngS8+0+3gnqU=;
 b=L9v3rOWYOU6tnUeJ0DM+HTXXvdCoqrmMqvtEzLAThKHnJawmb0n0upyXHIEczBLsmQaiuC
 WMzPatDorkrAFd4b7PNMnbAmZRgcs26lFoBpD9qDxASoPmSxkMiOWjcyfwlh2XCsunnRzN
 kDkFUDXn5ASbIF9CeMG95JRbNxuDmMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628867892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CZoHUjl8VbIefRt+rrWK4I3eCYdqCbvngS8+0+3gnqU=;
 b=o63dJNC7KBbGXnbEL/H/VFw0ALIGVJ96TeKGPAnGUF3/zylvsIqtOWPBm2/0zSr0n4hJgo
 Vu92MYTrQfgYfvBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B308313B74;
 Fri, 13 Aug 2021 15:18:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aOBCKTSNFmFUagAAMHmgww
 (envelope-from <chrubis@suse.cz>); Fri, 13 Aug 2021 15:18:12 +0000
Date: Fri, 13 Aug 2021 17:18:26 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YRaNQvWy0uAnnlUU@yuki>
References: <20210806154557.19551-1-mdoucha@suse.cz> <YRZ4TmJWcL8zJgg6@yuki>
 <97c36f43-f567-f384-0c55-4282ed1cd448@suse.cz>
 <YRaBPzw2Cv1Bo1Ag@yuki>
 <482bfc93-5be1-020d-b3d9-1101a3a32d5e@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <482bfc93-5be1-020d-b3d9-1101a3a32d5e@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
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
> >> We can't pick just any group numbers. The test user (nobody) must be a
> >> member of the first group but not the other. Using nobody/nogroup is
> >> probably safe so for the second group we can just scan all existing
> >> groups and pick for example max(gid)+1.
> > 
> > I guess that simply git for nobody/nogroup + 1 should work well then.
> 
> If nobody/nogroup + 1 turns out to be root gid (or any group where root
> is an explicit member), then we may end up with false negatives in the
> last subtest.

The root GID is 0 by definition and on my machine root is a member of
bin group yet the test seems to work fine. I do not get how root having
the bin group (or nobody+1) in the list of supplementary groups will
interfere with the test.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
