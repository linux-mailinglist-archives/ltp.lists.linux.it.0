Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F6E75677
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 20:00:14 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 997F53C1C93
	for <lists+linux-ltp@lfdr.de>; Thu, 25 Jul 2019 20:00:14 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 6F4933C104D
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 18:32:32 +0200 (CEST)
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 73DD56018BB
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 18:32:31 +0200 (CEST)
Received: by mail-lf1-x144.google.com with SMTP id b29so27732963lfq.1
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 09:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JqOFR6ie8Zaoa2hn6SZllwIPPh5UhjENPA2Q0bn9vfg=;
 b=CVnx+CPrZRWriTDWiJoish2j/9LHhqWaP2xJQvJOBX95wj/wrHDKQfrkszdzZTakLl
 iU/tjq16CMZ4gvuLAxJ3aV7rCxcl4fmpZvOkLHV8dl4gWnQauNEw/oiQgeh5vM3qdZOB
 1zDwearX/Gx62mziEFU3rTy1XcTR+XmyD9acE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JqOFR6ie8Zaoa2hn6SZllwIPPh5UhjENPA2Q0bn9vfg=;
 b=jdSP/n0KvFgO0aM0jyqXAYmVaWLVWyy+DJJ2hM4YnjQSGfeE8B40Jf+YW7lSRawqYq
 1Qdv/icNv1wd+rII/l7B2+VlUX2nCogNtuLhBUX+QaJJA2F9FAn6kCFm1jZsf+t3Z2T4
 LxrxOUJ/xcUeGIcmnuAtvKXwjrE1n7pdygWMCse/+IrIJpKnpeZqSUmwCSJWfEiC94Zu
 DIM9J7ZvZSJZtgJzECUY/3ly1yrpPTDyPDPbTHlWR1MOU7gsS0+N+PhuGeDBZpVJIlC4
 dA1Evugx4qfn4d+XeTAVNconxMmqv88hxSeQKeQFsEVadowRKzLve9orGdffpNwWbBv4
 hPYw==
X-Gm-Message-State: APjAAAV+TvWXvlAQ5u0y9bYXVgwnZQfC5Ky0f9VxvbmJXEJfZ7Gc5oUR
 nZvmV2yYHlzIF4twkxnQW7PvLEM5S/Y=
X-Google-Smtp-Source: APXvYqxhIMFmxG1TeKSSyH0j0vFFlvPb1/NFfmGwmpao3+JSyAO8dTlkSwCT1pmPVvxfM5B128Qvow==
X-Received: by 2002:ac2:5336:: with SMTP id f22mr40364098lfh.180.1564072350604; 
 Thu, 25 Jul 2019 09:32:30 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id w8sm7570373lfq.62.2019.07.25.09.32.29
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 09:32:29 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id b29so27732902lfq.1
 for <ltp@lists.linux.it>; Thu, 25 Jul 2019 09:32:29 -0700 (PDT)
X-Received: by 2002:ac2:5c42:: with SMTP id s2mr31129161lfp.61.1564072349436; 
 Thu, 25 Jul 2019 09:32:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190725110944.GA22106@shao2-debian>
 <20190725132617.GA23135@rei.lan>
In-Reply-To: <20190725132617.GA23135@rei.lan>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Jul 2019 09:32:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg+yRjY_AUrjbgrN59OeGAWMF_q=-Dqf2cYtVzoY01j7Q@mail.gmail.com>
Message-ID: <CAHk-=wg+yRjY_AUrjbgrN59OeGAWMF_q=-Dqf2cYtVzoY01j7Q@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Thu, 25 Jul 2019 20:00:13 +0200
Subject: Re: [LTP] 56cbb429d9: ltp.fs_fill.fail
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
Cc: LKML <linux-kernel@vger.kernel.org>, LKP <lkp@01.org>,
 Al Viro <viro@zeniv.linux.org.uk>, ltp@lists.linux.it,
 kernel test robot <rong.a.chen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Jul 25, 2019 at 6:26 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>
> This looks like mkfs.vfat got EBUSY after the loop device was
> succesfully umounted.

Hmm. Smells like the RCU-delaying got triggered again.

We have that "synchronize_rcu_expedited()" in namespace_unlock(),
which is so that everything should be done by the time we return to
user space.

Al, maybe that RCU synchronization should be after the mntput()s?

               Linus

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
