Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5C06A4607
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Feb 2023 16:26:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 560803CDE34
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Feb 2023 16:26:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C63303CB726
 for <ltp@lists.linux.it>; Mon, 27 Feb 2023 16:26:44 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E948623D356
 for <ltp@lists.linux.it>; Mon, 27 Feb 2023 16:26:43 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 34AE01FD63;
 Mon, 27 Feb 2023 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1677511603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rcw7tU8624pfigUNWmQAe8d+B9k2swsxAgftZ4HFbo=;
 b=BgaXIvFfYXAdZxzJ7eHYVlTpXQ7wZPrENvdrqHl4xgwWp+7zsmgd8LpnAYRFOfsiNZDrg5
 8Rtxxy4kYqGXj39cqTBB5JGimYyl8690/Wa1UBDl3LqcigrBxQZ9w5rKjgU9XfNB7BZU/O
 fCEfPc7dQ9zPdv4ba0mzaTYLcAXt/g8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1677511603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rcw7tU8624pfigUNWmQAe8d+B9k2swsxAgftZ4HFbo=;
 b=GIsv/e7pTZbE3OvyrXqWwVIcuPjLjaoZtYMMW35k2i/TBFPhlY33Q27r2dopn7tB3JQG3J
 uCYRO0l7IhDaRpBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BBD013A43;
 Mon, 27 Feb 2023 15:26:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lNf/BLPL/GNlJwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Mon, 27 Feb 2023 15:26:43 +0000
Date: Mon, 27 Feb 2023 16:28:05 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Wei Gao <wegao@suse.com>
Message-ID: <Y/zMBSx4p3gqRC3J@yuki>
References: <20230227144402.GA23697@localhost> <Y/zFIdiWccmVzddV@yuki>
 <20230227151709.GA12774@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227151709.GA12774@localhost>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] Question on .needs_cgroup_ctrls for cgroupv2
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
Cc: rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> So .needs_cgroup_ctrls can not used anymore for ONLY V2 case?
> Since i encounter "tst_cgroup.c:848: TCONF: V2 'memory' controller required, but it's mounted on V1" when i add ".needs_cgroup_ctrls = (const char *const []){ "memory", NULL }". 

Each controller can be mounted as V1 or as V2 but not both at the same
time. It depends on how the system is booted, the default on most
distributions is mixed V1 and V2 at the moment. If you want V2 system
you have to reboot with systemd.unified_cgroup_hierarchy=1.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
