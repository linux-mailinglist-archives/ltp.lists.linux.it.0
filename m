Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E739A2C7
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 16:06:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1C7433C8047
	for <lists+linux-ltp@lfdr.de>; Thu,  3 Jun 2021 16:06:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DD1613C4F93
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 16:06:48 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2B57B14010F7
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 16:06:47 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E99CC1FD4E
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622729206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZWb98KFBFYfVIzQVtQESQxtHMV0KaVoNSE8pos9fyM=;
 b=dNJu5ZNJ+zPFeHQqf2vdvGoEiYcNZYDE4SOaKaCU33gMJOD7Al4+Ebjp6zrTmVePk6tH2B
 S2/KJvf+EfGpepYNdCXFWjOhAkcjZt5oWETjO69bLD+whIj+3Fvtgg9zeckDFaG2KGun9E
 qzKSSY07x8wIux9EolvtvP4G668k6i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622729206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZWb98KFBFYfVIzQVtQESQxtHMV0KaVoNSE8pos9fyM=;
 b=n+vmlmnCnzuzdkUwaHlIkWHuQAcZIACthFmkyh8BKTGE+p+vC5ecNPBlTdEnEvCNn3Yu87
 kmnzetWbJS7JM4Ag==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CDDD0118DD
 for <ltp@lists.linux.it>; Thu,  3 Jun 2021 14:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622729206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZWb98KFBFYfVIzQVtQESQxtHMV0KaVoNSE8pos9fyM=;
 b=dNJu5ZNJ+zPFeHQqf2vdvGoEiYcNZYDE4SOaKaCU33gMJOD7Al4+Ebjp6zrTmVePk6tH2B
 S2/KJvf+EfGpepYNdCXFWjOhAkcjZt5oWETjO69bLD+whIj+3Fvtgg9zeckDFaG2KGun9E
 qzKSSY07x8wIux9EolvtvP4G668k6i0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622729206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WZWb98KFBFYfVIzQVtQESQxtHMV0KaVoNSE8pos9fyM=;
 b=n+vmlmnCnzuzdkUwaHlIkWHuQAcZIACthFmkyh8BKTGE+p+vC5ecNPBlTdEnEvCNn3Yu87
 kmnzetWbJS7JM4Ag==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1cA3MfbhuGCZQgAALh3uQQ (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Thu, 03 Jun 2021 14:06:46 +0000
Date: Thu, 3 Jun 2021 15:40:56 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YLjb6E5+CT3hMC4l@yuki>
References: <20210601155427.996321-1-zlang@redhat.com> <YLdwYJ3Kw5qf64d2@yuki>
 <20210602182625.GJ2978781@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210602182625.GJ2978781@localhost.localdomain>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] ltp-aiodio: help aiodio test work normally
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> > I do not like this solution. I think that we should instead fix the
> > scripts. I think that the runltp should just export TMPDIR if it was
> > passed on commandline and it should be the resposibility of the caller
> > to set up a temporary directory somewhere in /tmp in that case.
> 
> Sorry I can't understand your solution, would you like to show me some
> detailed code which can make the aiodio test pass, to explain what do
> you really like to do?

Looking at the testscripts/ltp-aiodio.sh it calls ltp-pan directly so
runltp is not involved at all. I guess that the simple solution here
would be exporting correct TMPDIR so that it points to the
"$TMP/aiodio".

From the testcase viewpoint TMPDIR always was the path where the test
should create files.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
