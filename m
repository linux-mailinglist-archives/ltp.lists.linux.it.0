Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF84DB5F11
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 10:24:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 326D43C20EC
	for <lists+linux-ltp@lfdr.de>; Wed, 18 Sep 2019 10:24:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 920D03C20AE
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 10:24:26 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id BD5881A01728
 for <ltp@lists.linux.it>; Wed, 18 Sep 2019 10:24:25 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E2774AE1A;
 Wed, 18 Sep 2019 08:24:23 +0000 (UTC)
Date: Wed, 18 Sep 2019 10:24:21 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20190918082421.GA11711@x230>
References: <20190913125823.17314-1-pvorel@suse.cz>
 <20190913125823.17314-3-pvorel@suse.cz>
 <CAEemH2f4oeSvN-p7xSzjo2ZFvndxjX2sQ+M9f6fYV_bN2ewn=A@mail.gmail.com>
 <20190917165520.GA30320@x230>
 <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2cHYS6jd4DCzJsy-vKLqShcFO6fU_-Rk=zxu=yD=7YLVg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/3] shell: Introduce TST_TIMEOUT variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,

> > > Here as well, why we need to distinguish the float and int, is the float
> > > expression does not work for integer?
> > Because it brings awk dependency on whole library, which I'm not sure if we
> > want (awk is a must on linux distros, it's in busybox; it's missing on
> > android
> > toolsbox, but android project concentrates on syscalls, probably nobody
> > uses
> > shell tests on android). Also I'm not sure about containers, JeOS etc. (it
> > sometimes miss a basic dependency).
> > If awk dependency is ok, it'd simplify test a bit.


> But it doesn't solve the dependency issue because, if the awk is missing,
> it will still tst_brk on float $LTP_TIMEOUT_MUL at:
>     tst_test_cmds awk
No, int was handled previously in:
      if tst_is_int "$LTP_TIMEOUT_MUL"; then
> and never goes to the integer expression branch.

> So, maybe that could be as a reason to disable float support for
> $LTP_TIMEOUT_MUL?

Maybe I'm missing something, therefore explaining the intent of the code.
(int was handled in if tst_is_int "$LTP_TIMEOUT_MUL"; then):

+	local err is_float
+	if tst_is_num "$LTP_TIMEOUT_MUL"; then
		# it's int or float
+		if tst_is_int "$LTP_TIMEOUT_MUL"; then
			# it's int only
+			[ "$LTP_TIMEOUT_MUL" -ge 1 ] || err=1
+		else
            # it's float only
+			tst_test_cmds awk
+			echo | awk '{if ('"$LTP_TIMEOUT_MUL"' < 1) {exit 1}}' || err=1
+			is_float=1
+		fi
+	else
        # NaN
+		err=1
+	fi
+	if [ "$err" ]; then
+		tst_brk TCONF "LTP_TIMEOUT_MUL must be number >= 1! ($LTP_TIMEOUT_MUL)"
+	fi

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
