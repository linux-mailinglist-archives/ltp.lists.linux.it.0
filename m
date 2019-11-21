Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A70104DF8
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:32:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 15B8F3C1CA3
	for <lists+linux-ltp@lfdr.de>; Thu, 21 Nov 2019 09:32:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 5408C3C04F9
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:32:18 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id EA545141C41E
 for <ltp@lists.linux.it>; Thu, 21 Nov 2019 09:32:17 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 47E81B258;
 Thu, 21 Nov 2019 08:32:17 +0000 (UTC)
Date: Thu, 21 Nov 2019 09:32:15 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20191121083215.GC14920@dell5510>
References: <1574241216-15168-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <1574241216-15168-2-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <20191120151244.GA28197@dell5510>
 <d1d72a63-fd3b-e670-4559-c0216176546c@cn.fujitsu.com>
 <20191121054507.GB59487@x230>
 <d346af6e-c037-7ac7-748a-a53c9b12046b@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d346af6e-c037-7ac7-748a-a53c9b12046b@cn.fujitsu.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/5] syscalls/quotactl01: Add Q_GETNEXTQUOTA
 test
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

> I see. Now, I think we should avoid to use <linux/types.h>=A0=A0 because =
on musl=A0 libc doesn't have it.
IMHO <linux/types.h> are always installed from kernel, not from libc
(packaged result of make headers_install run from kernel sources).

> Also ,If we use uint64_t, they still failed on 2.6.32-754.el6.x86_64 with=
 undefined  . Or, we should use TST_ABI to define uint64_t them
Hm, that what I said: using kernel headers is imho easier that using libc
headers (fewer problems with compatibility).
Anyway, I don't want to block this patchset.
We can always merge it as it is and sort/fix this problem later.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
