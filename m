Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F41BBDB3
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 14:36:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4B97B3C2973
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 14:36:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 0A65B3C281C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 14:36:23 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 81AA4200D2D
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 14:36:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 21532AC6C;
 Tue, 28 Apr 2020 12:36:22 +0000 (UTC)
Date: Tue, 28 Apr 2020 14:36:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200428123621.GA32116@dell5510>
References: <20190605072126.19856-1-pvorel@suse.cz>
 <20190613131018.GA29926@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613131018.GA29926@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] inotify: Add SAFE_MYINOTIFY_INIT{,
 1}() helpers
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> These two patches are obviously OK.

> Well I we were pedantic the licence change should be in a separate
> patch, but I guess that it's fine as it is.

> Also we should probably switch to the inotify_init() from sys/inotify.h
> and drop the my from the functions and macros, but that could be done in
> a subsequent patch.
Looking into this old TODO for inotify tests. I have similar question to
fanotify: do you consider worth of testing both raw syscall and inotify_init()?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
