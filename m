Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E139F3D00D4
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 19:48:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A6D543C9812
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Jul 2021 19:48:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A18603C6387
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 19:48:46 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 069B61A0093C
 for <ltp@lists.linux.it>; Tue, 20 Jul 2021 19:48:45 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1EF77224C4;
 Tue, 20 Jul 2021 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626803325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7hhrjdi1RgPQbeK1efqXDnnYGSsH8xVTp1PjLNEiDI=;
 b=TIcYjMy7GeKxkq2SvJc2pma0sO7QEVRd3i832wiNcsTlB4BVg4NC0B8P2nV8nEnnSdrQx3
 BwqcFk5vv84adzkXDTXWeRpmWro/waDvPCT7I1AFFsfJJ2ZxhtSJyeI9pToym0tjCujMxN
 xYM0D1WSApQ4XUjjyccQN6Tt9FYV6Js=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626803325;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m7hhrjdi1RgPQbeK1efqXDnnYGSsH8xVTp1PjLNEiDI=;
 b=sQOrO+BP93Y6Pz6vgQrrIEtOJHHxetAG2RGu+7RviLsSA4sePBPuwPJV/XCxL04wRDeYP4
 4WmhoWR9vVfC2cDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0362813D76;
 Tue, 20 Jul 2021 17:48:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XFxOAH0M92BrVgAAMHmgww
 (envelope-from <chrubis@suse.cz>); Tue, 20 Jul 2021 17:48:44 +0000
Date: Tue, 20 Jul 2021 19:23:16 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YPcGhOrlBNI7iZ0a@yuki>
References: <20210720133324.21752-1-aleksei.kodanev@bell-sw.com>
 <YPbNQ4AebDiUMxVz@yuki>
 <f9767568-466f-73d2-7d73-aa880fde6a63@bell-sw.com>
 <YPbcfEgPs66/ng7c@yuki>
 <7941651c-1712-55cb-a935-277cff8b1969@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7941651c-1712-55cb-a935-277cff8b1969@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 00/16] syscalls/sched_*: convert to new API and
 handle ENOSYS errno
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
> >> BTW, sched_rr_get_interval* tests already using tst_variants, adding
> >> more variants will double them too, right?
> > 
> > Actually not, since we do run the test for both the libc
> > sched_rr_get_interval and for all possible syscalls variants we don't
> > have to touch these tests at all.
> 
> sched_rr_get_interval works with musl, the one which returns ENOSYS
> is sched_setscheduler() there, in setup().

Since this is setup we may as well switch to syscall() in the test
setup and be done with it, we are not testing sched_setscheduler() in
these tests.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
