Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6497D3BC8A5
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:46:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2A89A3C68B6
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 11:46:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AFF0B3C0F90
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:45:58 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 4F7F01000B08
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 11:45:58 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A846D22491;
 Tue,  6 Jul 2021 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625564757;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2zOM1yeUJFkm2KRrhnJiuGKqOdjD28JY7S+JLj/uMU=;
 b=RXlEmME+tKspCygRjsDwl/+qv1Q4AIiOye8T1MFXvPYkvKJOZItrp204+qMGS4IHV0erke
 Husv0dRCtZLjs5TXbij1QvDGomV/F5h/7V2O27X/3wAu+Ddk036KUUGB41mgF7hFVT0sd1
 6YZTx+P7dUkX/qF3fE0FYhJRPH5ERWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625564757;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R2zOM1yeUJFkm2KRrhnJiuGKqOdjD28JY7S+JLj/uMU=;
 b=gsrNB0Mp1VF914e1XFA/OUPpgJR/Uc8Bh8aG1pLSNJyYEyRTIpF9DLn77aHSCpmtqI9X7V
 SNr1h6EzqPfhnzCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 45CC3A3B9A;
 Tue,  6 Jul 2021 09:45:57 +0000 (UTC)
References: <20210705135014.679200-1-lkml@jv-coder.de>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Joerg Vehlow <lkml@jv-coder.de>
In-reply-to: <20210705135014.679200-1-lkml@jv-coder.de>
Date: Tue, 06 Jul 2021 10:45:56 +0100
Message-ID: <87wnq37p2j.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/1] fs_bind: Convert to ltp tests
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Joerg,

Joerg Vehlow <lkml@jv-coder.de> writes:

> Hi everyone,
>
> I know this is a huge changeset, but there is not really a good way to         
> break it down into multiple commits. Every step in between would either
> lead to a broken test suite or a change, that is then changed again.
> So I made this one huge commit, that converts all of the tests of the     
> testsuite in one go.

It seems like there are no file renames (according to Git), but many
files are deleted and created. So you could split the commit into a
deletion patch and a creation patch.

I guess the deletion patch might have to remove some runtest file
entries temporarily? However I don't see a big problem with that.

>
> I added some minor bugfixes especially added umounts, because some where
> missing and some were redundant. I also dropped all useless output (bare ls).
>
> I may have overused EXPECT_PASS a bit here, but I think it does not do any harm,
> if all mounts are checked.
>
> Joerg


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
