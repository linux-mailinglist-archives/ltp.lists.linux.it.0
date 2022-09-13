Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB54F5B6A7A
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:14:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11FD53CAAEF
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Sep 2022 11:14:49 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E868E3C9503
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:14:46 +0200 (CEST)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 3BDFE600CC2
 for <ltp@lists.linux.it>; Tue, 13 Sep 2022 11:14:43 +0200 (CEST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MRd5y4BpXzHnlD;
 Tue, 13 Sep 2022 17:12:38 +0800 (CST)
Received: from dggpeml500024.china.huawei.com (7.185.36.10) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 17:14:39 +0800
Received: from dggpeml500024.china.huawei.com ([7.185.36.10]) by
 dggpeml500024.china.huawei.com ([7.185.36.10]) with mapi id 15.01.2375.031;
 Tue, 13 Sep 2022 17:14:39 +0800
To: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH] pty04.c/pidfd_send_signal03.c: Drop redundant
 tst_reap_children()
Thread-Index: AdjHTZm5DomIg6lVTnKuTNsA25mzng==
Date: Tue, 13 Sep 2022 09:14:39 +0000
Message-ID: <98009b0ab476426996e5687fca79b454@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.67.111.107]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=2.0 required=7.0 tests=HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] pty04.c/pidfd_send_signal03.c: Drop redundant
 tst_reap_children()
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
From: "luoxiaoyu \(C\) via ltp" <ltp@lists.linux.it>
Reply-To: "luoxiaoyu \(C\)" <luoxiaoyu9@huawei.com>
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Maybe I have a question to ask for.
As my understand, tst_reap_children() has been called in API even test hit tst_brk, right?

Regards,
Luo
-----origin mail-----
Re: [LTP] [PATCH] pty04.c/pidfd_send_signal03.c: Drop redundant tst_reap_children()

> On Tue, Sep 13, 2022 at 2:42 PM Petr Vorel <pvorel@suse.cz> wrote:

> > Hi Luo,

> > > Drop redundant calling of tst_reap_children() in cleanup() since 
> > > it has been called in the API (run_tests()).

> > LGTM, I suppose that was a mistake.


> Hmm, I slightly think that reflact a cautious thought from the author, 
> in case of test hit tst_brk unexpectly with invoke cleanup it can also 
> do reap children.

> So, it's probably no harmful to keep tst_reap_children there.
Ah, thx for info. I set status rejected in patchwork.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
