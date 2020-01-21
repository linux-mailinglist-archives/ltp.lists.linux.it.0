Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCBF143AF9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 11:27:12 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D49E3C24D6
	for <lists+linux-ltp@lfdr.de>; Tue, 21 Jan 2020 11:27:12 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 34D533C2219
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 11:27:08 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 464D51401B29
 for <ltp@lists.linux.it>; Tue, 21 Jan 2020 11:27:06 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3748AF33;
 Tue, 21 Jan 2020 10:27:05 +0000 (UTC)
Date: Tue, 21 Jan 2020 11:17:53 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200121101513.GA9254@gacrux.arch.suse.de>
References: <1575532537-27105-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20200121052447.GA6657@dell5510>
 <5707ecce-aec4-a80d-5ec6-f9c728625634@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5707ecce-aec4-a80d-5ec6-f9c728625634@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] syscalls/userfaultfd01: Always require
 CAP_SYS_PTRACE
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Xu,

> We have pushed "syscalls/userfaultfd01: add hint about unprivileged_userf=
aultfd" patch(v2)[1].

> This is v1.=A0 li Wang and me both think adding hint is more wise, more i=
nfo see[2].

> [1] https://github.com/linux-test-project/ltp/commit/7dc571d3ad1908d6e501=
63a06ef848f096fe880a
> [2] http://lists.linux.it/pipermail/ltp/2020-January/014921.html
Thanks for notification, I'll check previous commits next time!

BTW this was caused by maintainers not updating patchwork :(.
Would you mind to register to patchwork and check state of your tickets tim=
e to
time [1]. You'd be able to change state of your own patches.

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/list/?submitter=3D76329

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
