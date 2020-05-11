Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 441CB1CD377
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:59:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AFA873C268D
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 09:59:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3031E3C25CD
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:59:07 +0200 (CEST)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9FD741000CDB
 for <ltp@lists.linux.it>; Mon, 11 May 2020 09:59:06 +0200 (CEST)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MuDHR-1jFHts43SP-00ubQl for <ltp@lists.linux.it>; Mon, 11 May 2020
 09:59:06 +0200
Received: by mail-qv1-f51.google.com with SMTP id 59so4131620qva.13
 for <ltp@lists.linux.it>; Mon, 11 May 2020 00:59:05 -0700 (PDT)
X-Gm-Message-State: AGi0PuZKPFL10lF16AZGQ6UuVubHCRmqZAClsS+QJQaExy+iZ2K1Agr4
 sgoRUMdXQlV74/MTj4tpvuh1yL7uEUSaVvYnlDA=
X-Google-Smtp-Source: APiQypJO70+e9w4jFgUw3Jkc6DxYJBLoagVFVMEr6CjSIbafrfzZ0ky3+5v8qC0SPmr36QKv7sl3bGpVDtnZ40rrg4Q=
X-Received: by 2002:ad4:4aaa:: with SMTP id i10mr11122124qvx.4.1589183944732; 
 Mon, 11 May 2020 00:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
 <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
 <20200511073315.gws5lhw6tsaaijpi@vireshk-i7>
In-Reply-To: <20200511073315.gws5lhw6tsaaijpi@vireshk-i7>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 May 2020 09:58:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3VrcpdmGZB_VOLk17uDMxAfYyfM57yUUUSuqEdKvROOQ@mail.gmail.com>
Message-ID: <CAK8P3a3VrcpdmGZB_VOLk17uDMxAfYyfM57yUUUSuqEdKvROOQ@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Provags-ID: V03:K1:YjMvRVsZ1S5PAjx9GoGkeTcuJATNpczT7BBEekcYCdGJ8IDt5X4
 7ORr9hXcJNku87Ae9k9nvzqVucJI1hwbp9mJXBJrane/x+D7xIYu203g2w9eQamq2mgQJYT
 eJpWz7ojM0FYT+8MgyieejTVcE8KmrCECoZPaIiE42VfogDHG+OESJo0fVo2QZ1HRCKmPyJ
 16pEmwYIE0WyImL7NQTWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5t3NkrMtsj8=:Q2EpWk4fi9pDRZBCnfcZMn
 klsVXNnYUt9v3dq5wU7F9PUp6ebZ6q1Hkvr8UDMFGoRshtSVL0wOFsKkv7t74Cb9neNKFWaR4
 uTGuyelles2ZCNMJPHJG+bwhP2By1U6z9/eU8WkDbHsBzvm0zABwLCHk5FhgEkaafmETMYngf
 K6+wWzlWFZPRTy7ifvLjO7MnVgMV34aFF2y3hiIytm41ZBg1JcjYfc9zf5ZXzSJVIHcsNFYaT
 eYXRMQKnaNGXDX0bkXwbGA+2odb5LrojqrsqS3pdCdFbrPPPb9Xb/7IJQx2XtKJs1OxW4Bi1i
 uASs4uvFlECUtOagu2QF0v7fv9y/tRi5UlLx/mjGYFlqrv9kv40bdjAqL6OxUZEo/BqA8RM7D
 yRvwgNoBcxygnLJp1e566qcPxMeciJTd98jo5cT5janzGxkkFG0lq4frmBIqg9UkpJX5hIr6e
 ksxOYWvkpfwHmuDN0RRVJwOyVOfvvNamtUODCHKRb8zULke7SStV4xTea3pxfocp4CJNkxNbf
 X2x8QqJGa89RILtTwFm6CLtEu5AK0/+9cLOIUfeBaJ48kYi3zY1njuxqYoFMU8Ne3mUlqSqfU
 qjFVJanLmCXnSQmBe//YoX6Cyym87vZ2jIg0ypBvrpZBFNJWanA6wEc17LcI2UCmVrLQrOyiH
 peTk6D0eTSkAPF6Yo/MX9D1NPthKKQNdgmHtOd4zC6oTm0TIAl1eZ19QRQhRBC8Uluqtx8nX+
 n5mkHfXWHaHc+FsQKT4ID0O0dXEDQP5uGIOwGzz1tDJg+xiYejIHRZr9YoFtr7v05mSrXTOna
 Umhn+6pOHySRtN7g4ewqhfaZBQEqdS4cHsYtLSkzZhlFlxb4QM=
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Mon, May 11, 2020 at 9:33 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 11-05-20, 09:20, Arnd Bergmann wrote:
> > It looks like you are still missing a test for the libc semtimedop function with
> > TST_LIBC_TIMESPEC, but perhaps this is in a different place?
>
> The libc test is missing for few of the syscalls, as it was already missing for
> them because the headers may not have the definition.
>
> And so I didn't add them separately.

Ok, I see. This one just looked curious because the you add tests for the kernel
syscall (semtimedop) in a file that checks an older libc syscall (semop).

The libc semop is implemented in terms of the kernel's semtimedop for
architectures that don't have their own semop by passing a NULL timeout
argument. We should still check that five variants of it (sys_semop,
sys_semtimedop, sys_semtimedop64, ipc(SEMTIMEDOP) and ipc(SEMOP))
correctly implement the semop semantics, but I would also note that
testing the differences of the time types is only meaningful when you
actually pass a non-NULL timeout.

      Arnd

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
