Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DC80428E5E2
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 20:02:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5302B3C5AC7
	for <lists+linux-ltp@lfdr.de>; Wed, 14 Oct 2020 20:02:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id EAEF53C0376
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 20:02:24 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id C1E1E600811
 for <ltp@lists.linux.it>; Wed, 14 Oct 2020 20:02:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15070AC0C;
 Wed, 14 Oct 2020 18:02:23 +0000 (UTC)
Date: Wed, 14 Oct 2020 20:02:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20201014180221.GC19540@dell5510>
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20201014134648.GA13224@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014134648.GA13224@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] fanotify: Move safe_fanotify_init() + safe
 macro into fanotify.h
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

Hi,

> > Fanotify code is used only in testcases/kernel/syscalls/fanotify/, which
> > justify breaking rule of having safe function and macro outside of
> > library. This will be further cleaned in next commit.

> I guess that this is OK, I doubt that we will need a fanotify_init()
> anywhere else but the fanotify testcases.
Amir acked whole patch some time ago, thus I guess he's not against this first one.

The original motivation was to do further modifications for libc wrapper vs.
syscall() for fanotify_init() and fanotify_mark(). But I guess even without
second commit it makes sense to have all fanotify helpers together.
We can always revert it if really need them as safe macros.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
