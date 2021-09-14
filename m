Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA040ACEE
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 13:59:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F05543C8A0E
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Sep 2021 13:59:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 142993C1D7E
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 13:59:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 10E841A01232
 for <ltp@lists.linux.it>; Tue, 14 Sep 2021 13:59:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 075A921F76;
 Tue, 14 Sep 2021 11:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631620756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPUcY5x7iHK7McWV2hWTyIf6gwruCKWbl/OzBrwdH2Y=;
 b=Bj/12vnD+SLaUIulGDygRTyFYLUBZVzkMqFUUqhgzxq03OtlG0SRHnVL/K60dM1DSQBBBs
 R8XLwU68/kn7V/7O3s2vBAEtTOhR/wpQ04w2sNAE/P4sYQ8qE2rblL5LIJpOqL24irjhdl
 TCIBkoH7oP9KBnLgoxQK5n5roOayYWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631620756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kPUcY5x7iHK7McWV2hWTyIf6gwruCKWbl/OzBrwdH2Y=;
 b=GnX2KIa38VBNfZh6MN0K9LSOPCVBX+ka6d6LpgSPzFQ0TwZtBox8TFPnSRufBemdw5ixsV
 GhCbapCNk1jY96AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E339C13342;
 Tue, 14 Sep 2021 11:59:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iDaBN5OOQGEnGwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 14 Sep 2021 11:59:15 +0000
Date: Tue, 14 Sep 2021 13:59:36 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <YUCOqP9ObE+CxQCQ@yuki>
References: <20210913144454.22992-1-mdoucha@suse.cz>
 <20210913144454.22992-2-mdoucha@suse.cz>
 <3a764f27-b453-0aab-4938-7b7b34496885@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3a764f27-b453-0aab-4938-7b7b34496885@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] syscalls/setresuid01: Convert to new API
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
> Oops, I've accidentally copy-pasted the wrong SPDX header to all three
> setresuid tests. Patch 1 is correct as is but patches 2-4 should have
> GPL-2.0-or-later instead. Please update it before merge.

I've fixed that and also removed useless comments from the test
structure in setresgid03.c and pushed the patchset, thanks!

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
