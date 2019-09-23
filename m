Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D28BC6C3
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 13:26:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BE48F3C20A6
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Sep 2019 13:26:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id E82F53C1CF9
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 20:10:57 +0200 (CEST)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3D26614011A9
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 20:10:56 +0200 (CEST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EC9520856
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 18:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569262254;
 bh=KvD6fLRfhprsPZVrNJfg2XWPRxn7aB8JcuChWQAo+ds=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IVINVMwHkmOGlL9HB6FsXvXgTEt4qN0WNsr4IiDVesseU4+3q7uCkMQcKNwpGdg2d
 J3y8XC/51i2cJ9QJKID8vEcuEXNznBSaSAXO19DXUc7sb09owap0iaGKIboe/1ViLG
 UAn0vEAhfyga9uRhfMhYmrPbiCT5n/Kofi2iKYh8=
Received: by mail-wr1-f45.google.com with SMTP id r3so15051553wrj.6
 for <ltp@lists.linux.it>; Mon, 23 Sep 2019 11:10:54 -0700 (PDT)
X-Gm-Message-State: APjAAAXkbBnrI/A+L8qhbUXRrExn/bs4dOKgzJ6o8kdflVVUhYATljVP
 o4e0wC+6BmP0L/D/RaBw26MvaUlHU6FA2UKSho5lHA==
X-Google-Smtp-Source: APXvYqxMf22Qtxv28RvJGcXj21jvydzNhjpv9uM730jDDQc2vs1JXzrHu+IVI390PKNLgCUZzPg1mLn6U2pUMtf/oYU=
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr501724wrs.111.1569262253107; 
 Mon, 23 Sep 2019 11:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190923003846.GB15734@shao2-debian>
 <871rw7l9dv.fsf@rpws.prws.suse.cz> <20190923153908.GA379@dell5510>
In-Reply-To: <20190923153908.GA379@dell5510>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 23 Sep 2019 11:10:41 -0700
X-Gmail-Original-Message-ID: <CALCETrWCQyh=QkLU-Zcy7ijb8butWGddvPiuaPuu0-tLd+ur-w@mail.gmail.com>
Message-ID: <CALCETrWCQyh=QkLU-Zcy7ijb8butWGddvPiuaPuu0-tLd+ur-w@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 24 Sep 2019 13:26:36 +0200
Subject: Re: [LTP] 12abeb544d: ltp.read_all_dev.fail
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
Cc: LKP <lkp@01.org>, Andy Lutomirski <luto@kernel.org>, ltp@lists.linux.it,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, Sep 23, 2019 at 8:39 AM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi,
>
> > > FYI, we noticed the following commit (built with gcc-7):
>
> > > commit: 12abeb544d548f55f56323fc6e5e6c0fb74f58e1 ("horrible test hack")
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/luto/linux.git random/kill-it
>
> ...
> > > tst_test.c:1108: INFO: Timeout per run is 0h 05m 00s
> > > Test timeouted, sending SIGKILL!
> > > tst_test.c:1148: INFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
> > > tst_test.c:1149: BROK: Test killed! (timeout?)
>
> > So perhaps this is caused by reads of /dev/random hanging?
>
> > At any rate,
> > I suppose this is intended to deliberately break something, so we can
> > ignore it.
> Yep, I'd ignore it, [1] really looks like the commit description "horrible test hack" :)
>

Indeed.  I should have pushed this to my not-for-automated-testing tree.

--Andy

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
