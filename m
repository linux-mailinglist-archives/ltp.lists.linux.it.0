Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 116655544A6
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jun 2022 10:33:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8BD103C94DB
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jun 2022 10:33:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60D1D3C641F
 for <ltp@lists.linux.it>; Wed, 22 Jun 2022 10:33:16 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A70EF100044C
 for <ltp@lists.linux.it>; Wed, 22 Jun 2022 10:33:15 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB95B21C50;
 Wed, 22 Jun 2022 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1655886794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vCekljrFYWKmasby9hEQzWdT9xlgvN5Y1Q32AfFd6h8=;
 b=A7O3bknnLbtNwO3C3mbwF3ulDxOHHsi13JaiGfDRYMobJlAvZbwfeCTm/bJqF8+Vcghe03
 nYlVwK6ALMZPKDaYGuKj8/TEuPexaq5Qcq2qzF1pHXnwS4XRcwvzupB+lrRDFpfNlyxW3T
 3e1xWaCZmrIbcOyesmI90bR0seU59c4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1655886794;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vCekljrFYWKmasby9hEQzWdT9xlgvN5Y1Q32AfFd6h8=;
 b=Lwj8mlk7GnDWnAlRVdzaUl7f7l2j/cHejyh59RcL68gQ0BwfKvfc0hF2Wn7PZ0mJZKYfSv
 YwrnSVc7sjySLcAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D76A9134A9;
 Wed, 22 Jun 2022 08:33:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JUY4M8rTsmKCCwAAMHmgww
 (envelope-from <chrubis@suse.cz>); Wed, 22 Jun 2022 08:33:14 +0000
Date: Wed, 22 Jun 2022 10:35:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YrLUSjGS4Ld2ibG2@yuki>
References: <20220620133746.99167-1-cristian.marussi@arm.com>
 <762be123-13ad-1fcf-e4f3-846c7e1b236a@jv-coder.de>
 <7605268f-8c8b-fe95-3c58-a29544256dee@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7605268f-8c8b-fe95-3c58-a29544256dee@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix mountns01/02/03/04 final umounts using
 more peculiar dir names
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
> >> --- a/testcases/kernel/containers/mountns/mountns.h
> >> +++ b/testcases/kernel/containers/mountns/mountns.h
> >> @@ -10,8 +10,8 @@
> >>  #include "tst_test.h"
> >>  #include "lapi/namespaces_constants.h"
> >>  
> >> -#define DIRA "A"
> >> -#define DIRB "B"
> >> +#define DIRA "__DIR_A"
> >> +#define DIRB "__DIR_B"
> > This is the only non-comment change. How does renaming the directories
> > change anything? Am I missing something?
> Nevermind, now after I read the v1-thread, I get it..

We tend to prefix globally visible objects with LTP_ in order to make
them unique enough and that makes them clearly recognizable as being
created by LTP as well. So maybe we should put the LTP string somewhere
in the names too.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
