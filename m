Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823122ADD0
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 13:33:25 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D15103C26D7
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jul 2020 13:33:24 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id B3D033C13D8
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 13:33:20 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 53C236011AA
 for <ltp@lists.linux.it>; Thu, 23 Jul 2020 13:32:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6FAFEABCF;
 Thu, 23 Jul 2020 11:33:27 +0000 (UTC)
Date: Thu, 23 Jul 2020 13:33:17 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <20200723113317.GA18525@dell5510>
References: <20200717152450.10787-1-mdoucha@suse.cz>
 <2b209b61-2bbc-c35f-5704-7b84bab9254d@cn.fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b209b61-2bbc-c35f-5704-7b84bab9254d@cn.fujitsu.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] Convert chdir01 to the new API
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

> Honestly speak, I don't like merge chdir02 into chdir01 and we should
> cleanup chdir02 case individually.
chdir02.c tests chdir("/"); and chdir("/tmp"). Not sure whether full path is
more coverage than relative path from chdir01.c.
If we consider these useful, we can just add it into chdir01.c.

Although it looks a bit strange to chroot into root, I'd use just that and avoid
/tmp (it breaks at least for Android with no good reason).

It might makes sense to use .all_filesystems = 1.

> I prefer to merge chdir03 and chdir04 into chdir01 because they are all
> error test.

> Also, when tesing EACCES error,it succeeded.
> tst_test.c:1245: INFO: Timeout per run is 0h 05m 00s
> chdir01.c:68: PASS: chdir("testfile") returns correct value: ENOTDIR (20)
> chdir01.c:68: PASS: chdir("symloop") returns correct value: ELOOP (40)
> chdir01.c:61: FAIL: chdir("keep_out") returned unexpected value 0: SUCCESS
> (0)
Got the same problem on 5.8.0 (on all filesystems).
> chdir01.c:68: PASS: chdir("subdir") returns correct value: SUCCESS (0)
> chdir01.c:68: PASS: chdir(".") returns correct value: SUCCESS (0)
> chdir01.c:68: PASS: chdir("..") returns correct value: SUCCESS (0)
> chdir01.c:68: PASS: chdir("missing") returns correct value: ENOENT (2)

> Best regards
> Yang Xu

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
