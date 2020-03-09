Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB217D8AB
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 05:56:30 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 84B533C623C
	for <lists+linux-ltp@lfdr.de>; Mon,  9 Mar 2020 05:56:29 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id C6FD23C6208
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 05:56:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 046F1600918
 for <ltp@lists.linux.it>; Mon,  9 Mar 2020 05:56:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D3B5AAD94;
 Mon,  9 Mar 2020 04:56:22 +0000 (UTC)
Date: Mon, 9 Mar 2020 05:56:21 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200309045621.GA3631484@x230>
References: <20200306071221.GA13530@dell5510>
 <1583490720-10003-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
 <CAEemH2ce95Uyi1cZumF4drQ7NtehVwWyhcTM5L7cEjcb7he+oA@mail.gmail.com>
 <1d808289-aa4b-a47d-55cd-81908aaa532c@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d808289-aa4b-a47d-55cd-81908aaa532c@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] hugeshmctl01: Small refactor and remove
 stat_time
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Xu,

> > Thanks for the quick work on refactoring. I'd suggest using the new
> > '.request_hugepages'=A0 in the testcase, would mind having a try?
+1

> OK. But I think we can merge this patch( it has a new line before func_st=
at,
> remove ..) firstly and then I will use this library api in next patch for
> all related  hugepage cases.
Yes, I also think this should be separated, thus merged this fix.

Kind regards,
Petr

-- =

Mailing list info: https://lists.linux.it/listinfo/ltp
