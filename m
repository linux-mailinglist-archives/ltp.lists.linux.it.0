Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1676E61D
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Aug 2023 13:01:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8D3193CD54C
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Aug 2023 13:01:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6B0293C8952
 for <ltp@lists.linux.it>; Thu,  3 Aug 2023 13:01:49 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6B3C01A01104
 for <ltp@lists.linux.it>; Thu,  3 Aug 2023 13:01:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1B5721999;
 Thu,  3 Aug 2023 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691060507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XHWRJaMpKcRMkNawMYZv5PqbmQ429JTtrmw1A5cvu4Q=;
 b=2XqVOzP8XZdd82bmMxGNNF1tT41/OaLjR4/Dc6E/mEci24iXOErD+H0LJW2flxnIyIKs78
 rJJfcoTjTBvu5vNnQta9FiLCx4rTbBnSQ9X7sJ5XpcEy63RyRbIW5amiyCjiEX9m8HC2Wa
 DipZlDL6JhD0/tgtld/oThZJ4+9pF0U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691060507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XHWRJaMpKcRMkNawMYZv5PqbmQ429JTtrmw1A5cvu4Q=;
 b=xMcpKhaPk9prtNKMasuvTHuWWSJ7MDnhZWupfOnvCLAvnxTb96RaJhSeQ3TSEdHSUgQlKs
 UyZcAzbzSJw3tmBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CCDE5134B0;
 Thu,  3 Aug 2023 11:01:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HQK6MBuJy2RnJAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 03 Aug 2023 11:01:47 +0000
Date: Thu, 3 Aug 2023 13:02:45 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <ZMuJVUS5S9-oIQoq@yuki>
References: <20230803015149.69906-1-iwienand@redhat.com>
 <ZMuG5iOmeLH_OhxV@yuki>
 <66019516-fc86-9fe7-1cc2-76494fa2dd32@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66019516-fc86-9fe7-1cc2-76494fa2dd32@suse.cz>
X-Virus-Scanned: clamav-milter 1.0.1 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] kernel/device-drivers/zram/zram01.sh : add a sync
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
> This is actually a kernel bug reported upstream:
> https://lore.kernel.org/linux-block/20221107191136.18048-1-pvorel@suse.cz/
> 
> Not only the test files stay in page cache, but the whole VFAT 
> superblock seems to disappear from the device as well until sync.

So I guess that we should add a message to the test pointing out to the
upstream bug if the size ends up being zero instead.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
