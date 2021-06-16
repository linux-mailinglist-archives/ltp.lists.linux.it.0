Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2803A96A2
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:54:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC2AA3C7219
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Jun 2021 11:54:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A47DD3C4CB8
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:54:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id C75B51000EC0
 for <ltp@lists.linux.it>; Wed, 16 Jun 2021 11:54:14 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 02D371FD2F;
 Wed, 16 Jun 2021 09:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623837254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2loCJr5ivpJ/00fkVJWImuxJ9rmov8yf15FjU2IX3Lc=;
 b=apO7Lk0H4oTUMLc0MVMAtv0X589ZMjbthHjppz6SPXTtnWx97t8u67WfpfjhnVoBfIdxqp
 BOs8aTDUws+22ohbOlLuftQJEnF17dehOOWngBkVr/kKhYtWY7T/Js3CF+83KL2MohYF7u
 vOqmKpXMC05HwtL202c7e0Yq2lV4320=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623837254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2loCJr5ivpJ/00fkVJWImuxJ9rmov8yf15FjU2IX3Lc=;
 b=aIT941V+Z5MW3rjXnH2vkeMd3ay7crvjjU3lrfnHDQ849QjjcG3Hso+Pzcc7Mx18N0QW8t
 uc8MDeMj3v7ED/DA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DB484118DD;
 Wed, 16 Jun 2021 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623837253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2loCJr5ivpJ/00fkVJWImuxJ9rmov8yf15FjU2IX3Lc=;
 b=sXqiR14oBhMFOdSZMvhV60O9C4KcCDd+FXylU/kctRMcit9hAnfOFgx9ImpHfyVX5WKYrP
 EPvRHmSnUMRWQ7UuXxqyOgcnpDQoMzHtQuMcgX+A+GdT2sGTonPPljl9dyoE4klP8hApzU
 3Umao6rxsWX9za0Ms5EMVB3qN7xFTfs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623837253;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2loCJr5ivpJ/00fkVJWImuxJ9rmov8yf15FjU2IX3Lc=;
 b=/G4oDxtIbV/1k5SKETAopnfATiKhivB83F6IEjX9EpEvFV5bQqKEcMPE9806iBiffQ9nqe
 6ISIhqyNY2YOsuCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id JrBONEXKyWDAOgAALh3uQQ
 (envelope-from <chrubis@suse.cz>); Wed, 16 Jun 2021 09:54:13 +0000
Date: Wed, 16 Jun 2021 11:28:33 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <YMnEQSEAT5LTBSwN@yuki>
References: <YKzX7FPWGGROn6kR@pevik>
 <1622713444-21197-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <YMmiQfWgvqtCzOmg@pevik>
 <da3974e4-76ee-1eee-b730-c49953c21120@jv-coder.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da3974e4-76ee-1eee-b730-c49953c21120@jv-coder.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/mallinfo2_01: Add a basic test for
 mallinfo2 when setting 2G size
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
> > BTW Cyril also suggested recently to drop out of tree support, because build
> > system dependencies are broken and fixing it would be much easier when
> > supporting only in tree build.
> Really? I got the feeling out-of-tree builds are becoming the new normal 
> and even complex pieces of software like the kernel, glibc and gcc are 
> able to be built out-of-tree or even enforce it.

The question here really if support of out-of-tree build is worth the
trouble. The problem is that the complexity it adds to the build system
is quite high. The way it's implemented in LTP the build system has to
work with absolute paths and you have to make sure you have the right
path to a file all the time and people are often confused by this. Also
it crashes and burns with cryptic error messages if you happen to have
characters interpreted by make in a directory name anywhere from the LTP
dir to the filesystems root (try adding : to a directory name for
instance). We used to have out-of-tree build broken for years, before we
set up a CI, and nobody complained. So considering all of this it may be
for the better to just get rid of it.

I'm not against out-of-tree build in principle but given that the way
it's implemented in LTP is subtly broken by design and that there does
not seem to be real users it does not make that much sense to keep it
maintained and spend any effort to keep it afloat.

> Maybe it is time to abandon autoconf/automake and switch to a better 
> build configuration systems like cmake instead of abandoning out-of-tree 
> builds.

I'm not againts this, the main problem is that this will take a
significant effort my guess is at least month to implement and and even
more to iron out all the corner cases. Also the choosen build systems
has to be generally available even on 10 years old system, but I guess
that cmake should classify easily here.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
