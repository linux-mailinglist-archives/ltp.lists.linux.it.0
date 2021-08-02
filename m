Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0E93DDEB2
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:41:56 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 523C03C8AF8
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:41:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2035F3C6A7A
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:41:55 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A0EFD1400BE8
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:41:54 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E62CC21F7D
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627926113;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dr2yVWFUgr0DLHF8QXd0K8XUfqlYvWujIeurVG1gqbs=;
 b=bsVxXfbdaDWQ7qLuhwWSpM5LKKaUQJjZcst/Km8F29kkcbmMgMwHyW9ZhELsQwmvYMhXOf
 iFhti+rNiD5MXM7+QrdyWwkj/l2Vk5QiYq17ETMic3H6B1oM5ppvp8gRvmeICGJKXcKabX
 ZlcLH39auIMu1h3OS1YcrlfspC957+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627926113;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dr2yVWFUgr0DLHF8QXd0K8XUfqlYvWujIeurVG1gqbs=;
 b=YhbwnmWuEIb3A55dMp82+bKTkIGOn5e72QPKcxSekvAET9CID7V5DXjyryE489wE3nFsBC
 O0AI5h2DSOF8mkBw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B1C6813B47
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 17:41:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id S+JUKGEuCGFbLgAAGKfGzw
 (envelope-from <pvorel@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 02 Aug 2021 17:41:53 +0000
Date: Mon, 2 Aug 2021 19:41:52 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YQguYAumzjFFNpGb@pevik>
References: <20210716100415.27410-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210716100415.27410-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/3] netns_helper.sh: cleanup
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> Petr Vorel (3):
>   netns_helper.sh: Check for ping
>   netns_helper.sh: Check veth with TST_NEEDS_DRIVERS
>   netns_helper.sh: Formatting and style cleanup

>  .../kernel/containers/netns/netns_helper.sh   | 53 ++++++++-----------
>  1 file changed, 23 insertions(+), 30 deletions(-)

whole patchset merged

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
