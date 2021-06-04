Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 011DF39C0D1
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 21:50:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 64D873C7FE1
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 21:50:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E0A683C27EC
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 21:50:52 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 397B26010AA
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 21:50:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 803681FD47;
 Fri,  4 Jun 2021 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622836251;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWDeu8dEU6gjzTiO6vSJSQqmn0TChTlDpvvpDniI2k8=;
 b=Suh0eY4W9KWDBA3a7n7qoYVqHP3spPk4tNq5PsiG/uc0gflEGKp0Ol5+sh+x99kRhCnv/g
 peZVsgWLMBB41AiFDhWV686p8jjmgIu421BtudTeTmeR3WX4rBw3c4NbjnQWv+B9tIgCgz
 l2/D8z3saeavB3eYhdR54RLKzN+H/8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622836251;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWDeu8dEU6gjzTiO6vSJSQqmn0TChTlDpvvpDniI2k8=;
 b=TSd5qcGwN3/A0TyMkrFNSEkzt9yq69V7W5jMOY9CTZKhtReahYlVZjAZtO7TYs+wNY5Oxc
 pGej5hQoGXiOw5AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 14D88118DD;
 Fri,  4 Jun 2021 19:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622836251;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWDeu8dEU6gjzTiO6vSJSQqmn0TChTlDpvvpDniI2k8=;
 b=Suh0eY4W9KWDBA3a7n7qoYVqHP3spPk4tNq5PsiG/uc0gflEGKp0Ol5+sh+x99kRhCnv/g
 peZVsgWLMBB41AiFDhWV686p8jjmgIu421BtudTeTmeR3WX4rBw3c4NbjnQWv+B9tIgCgz
 l2/D8z3saeavB3eYhdR54RLKzN+H/8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622836251;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BWDeu8dEU6gjzTiO6vSJSQqmn0TChTlDpvvpDniI2k8=;
 b=TSd5qcGwN3/A0TyMkrFNSEkzt9yq69V7W5jMOY9CTZKhtReahYlVZjAZtO7TYs+wNY5Oxc
 pGej5hQoGXiOw5AA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 40XIAhuEumBecwAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Fri, 04 Jun 2021 19:50:51 +0000
Date: Fri, 4 Jun 2021 21:50:49 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Enji Cooper <yaneurabeya@gmail.com>
Message-ID: <YLqEGb/fWiGJDI6z@pevik>
References: <YLh9jvI/p/VxsSmx@pevik>
 <CAASaF6yHHty1m+1U-buHUt4P80fnoTqXTaSO7G-YBm=REWZyWw@mail.gmail.com>
 <656D3EBA-5A3C-45F5-84B0-1427CE69C1F2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <656D3EBA-5A3C-45F5-84B0-1427CE69C1F2@gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [RFC] Remove disktest from LTP
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
Cc: Mike Frysinger <vapier@gentoo.org>, Xiao Yang <yangx.jy@cn.fujitsu.com>,
 automated-testing <automated-testing@yoctoproject.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Enji,

> > does anybody use testcases/kernel/io/disktest ?

> > It supports various OS, but not sure if it's relevant now in SSD era.
> > Last update was in 2008 (version 1.4.2).

> > I don't think I ever used it, it does look outdated, so I won't miss it.
> > If it has upstream repo somewhere, we could put a reference in commit message.

> I say nuke it from orbit.

> It exists in VCS still, so if someone wants to restore it and work on it, they can go back through the git history and do so.

I have not found the original project in sourceforge. Would you please post a
link, I'll add it to the commit message of the removal commit.

Kind regards,
Petr

> Cheers,
> -Enji



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
