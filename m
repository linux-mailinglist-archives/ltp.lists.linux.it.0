Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 821B52B240F
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:52:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0E7BC3C6578
	for <lists+linux-ltp@lfdr.de>; Fri, 13 Nov 2020 19:52:59 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 4991E3C4FAA
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:52:55 +0100 (CET)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id CE39C1A014F0
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 19:52:54 +0100 (CET)
Received: by mail-io1-xd44.google.com with SMTP id n12so10830566ioc.2
 for <ltp@lists.linux.it>; Fri, 13 Nov 2020 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1yp+4ywxSBW8iGBERZiLRwrZngUWCLYv/f8WMWEPbMA=;
 b=OPtxAxmg0rGJoh/0krFjGRG/sX8H2aJbMfC4SsEma3AK4Ij+yykI4wiKxV7Vsh2aFI
 IWHZIwcr49OYZRt9WR2QI41SqTeu9bxuTBcaoTfrf8+TQGsoJIUAnYrhpfG2/zYVrpsq
 AFJVsJk5FRlXg4uVbK2V66zOXDz8jQwY+W1hneKUg9YscS0frOhNUD0/Teah9wVuah5f
 tGauaoxiqPtdpayftCx1qTrvcui78Kpa2g3PHuyhXG09o4cUc5PccQ3lOflQHb1g0Mi+
 m9XOaJNox20MQl0Cmc4H7Ma1TWC1sZ1RvzJjEpve6EAS2X2CFcZc+CQ5t1rEw5LBgBXI
 DDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1yp+4ywxSBW8iGBERZiLRwrZngUWCLYv/f8WMWEPbMA=;
 b=ZGac9nEGAi2mkkwHghCPwLs/ErZ2fOqdYbM/5XFIBMI7HmtSGdzHnClyScOsDmCdcE
 q1SEYdfPrygYzIJO6TbGeT3AKKCN8fDmlKM/vqkfCz8RdiRhbQPxQYDAdqZQXTmuyEyA
 rn2CtfWSRYJ89b7+tO1AI0zEAhf8114swvpaPM2Q0+vterilb9hrUJbpBnyqt+XB85xD
 IKWRJnMuOGjIxl93m3dE8591t99OAnAoay7f64Y593X4gqoL2vPC7UEf6rRY/PkRaqZs
 TBL/74geaRB8Glq8Dasyi3p0g6sBD+FG0cuELMcrEd+3HAKMwF+/rX3r8hG7JHJtx+93
 xCQA==
X-Gm-Message-State: AOAM530Pf3l7r/TEsR2+R1rRHXLCt01kB/HmWb6ALjlGjlcA2OG3Qlrz
 cQKNMpl/Cx23vXosECHeF4zuvcuKxiXXCUh2ROc=
X-Google-Smtp-Source: ABdhPJy6MLnSiwe3HTNZxKjVln5Z9gtgbyRgja2xeSp+v6WpWvLZIs2M2qX5YpTzkF7mmJFC9+KHSSpI2fkAzTIcF28=
X-Received: by 2002:a6b:7841:: with SMTP id h1mr916252iop.72.1605293573628;
 Fri, 13 Nov 2020 10:52:53 -0800 (PST)
MIME-Version: 1.0
References: <20201113155123.5959-1-pvorel@suse.cz>
 <20201113155123.5959-3-pvorel@suse.cz>
 <CAOQ4uxixL6f2hApFUjgO2d1ZOstftQwn8-y4dN6Qcd6RE-oyWA@mail.gmail.com>
In-Reply-To: <CAOQ4uxixL6f2hApFUjgO2d1ZOstftQwn8-y4dN6Qcd6RE-oyWA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 13 Nov 2020 20:52:42 +0200
Message-ID: <CAOQ4uxhWOaarVWE6r_EgvtqSV83WeVghp+crAMo5UpC4KxeP9Q@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/5] fanotify: Handle supported features checks
 in setup()
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, Nov 13, 2020 at 8:33 PM Amir Goldstein <amir73il@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 5:51 PM Petr Vorel <pvorel@suse.cz> wrote:
> >
> > Create 2 helpers which are used in various tests in setup() to check for
> > FAN_ACCESS_PERM enablement (caused by disabled CONFIG_FANOTIFY_ACCESS_PERMISSIONS)
> > or FAN_OPEN_EXEC and FAN_OPEN_EXEC_PERM support in kernel.
> >
> > That helps to further code simplification in next commit.
> >
> > Suggested-by: Amir Goldstein <amir73il@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > Hi Amir,
> >
>
> Hi Petr,
>
> > New in v2.
> >
> > Is that how you meant the check?
>
> Yes, almost.
>
> FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL()
> does not need to take a mask argument.
> It just needs to check support for FAN_OPEN_EXEC.
> FAN_OPEN_EXEC_PERM will be supported if FAN_OPEN_EXEC
> is supported and permission events are supported.
>
> Alternatively, rename the helper to FANOTIFY_EVENTS_SUPPORTED_BY_KERNEL()
> with the mask argument and then it could be used in the future for
> testing support for more new events.
>
> > Not sure about function names, feel free to suggest better ones.
>
> I am not good with naming ;-)
>
> > Also it's not good that it's not clear from function name whether it
> > uses tst_brk() on EINVAL or it returns value.
>
> I agree with that.
> Better look for precedents in LTP or consult with other LTP developers.
>
> Thanks,
> Amir.
>
> >
> > Kind regards,
> > Petr
> >
> >  testcases/kernel/syscalls/fanotify/fanotify.h | 47 +++++++++++++++
> >  .../kernel/syscalls/fanotify/fanotify03.c     | 30 ++++------
> >  .../kernel/syscalls/fanotify/fanotify07.c     |  2 +
> >  .../kernel/syscalls/fanotify/fanotify10.c     |  8 +++
> >  .../kernel/syscalls/fanotify/fanotify12.c     | 57 ++++++++-----------
> >  5 files changed, 91 insertions(+), 53 deletions(-)
> >
> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> > index 0afbc02aa..0c61f8ab7 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> > @@ -242,4 +242,51 @@ static inline void fanotify_save_fid(const char *path,
> >  #define INIT_FANOTIFY_MARK_TYPE(t) \
> >         { FAN_MARK_ ## t, "FAN_MARK_" #t }
> >
> > +
> > +static inline void fanotify_access_permissions_supported_by_kernel(void)
> > +{
> > +       int fd;
> > +
> > +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> > +
> > +       if (fanotify_mark(fd, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD, ".") < 0) {
> > +               if (errno == EINVAL) {
> > +                       tst_brk(TCONF | TERRNO,
> > +                               "CONFIG_FANOTIFY_ACCESS_PERMISSIONS not configured in kernel?");
> > +               } else {
> > +                       tst_brk(TBROK | TERRNO,
> > +                               "fanotify_mark (%d, FAN_MARK_ADD, FAN_ACCESS_PERM, AT_FDCWD,"
> > +                               " \".\") failed", fd);
> > +               }
> > +       }
> > +
> > +       SAFE_CLOSE(fd);
> > +}
> > +
> > +static inline int fanotify_exec_events_supported_by_kernel(uint64_t mask,
> > +                                                          const char* smask)
> > +{
> > +       int fd;
> > +       int rval = 0;
> > +
> > +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> > +
> > +       if (fanotify_mark(fd, FAN_MARK_ADD, mask, AT_FDCWD, ".") < 0) {
> > +               if (errno == EINVAL) {
> > +                       rval = -1;
> > +               } else {
> > +                       tst_brk(TBROK | TERRNO,
> > +                               "fanotify_mark (%d, FAN_MARK_ADD, %s, AT_FDCWD, \".\") failed",
> > +                               fd, smask);
> > +               }
> > +       }
> > +
> > +       SAFE_CLOSE(fd);
> > +
> > +       return rval;
> > +}
> > +
> > +#define FANOTIFY_EXEC_EVENTS_SUPPORTED_BY_KERNEL(mask) \
> > +       fanotify_exec_events_supported_by_kernel(mask, #mask)
> > +
> >  #endif /* __FANOTIFY_H__ */
> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify03.c b/testcases/kernel/syscalls/fanotify/fanotify03.c
> > index 1ef1c206b..fbec652f6 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify03.c
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify03.c
> > @@ -212,28 +212,23 @@ static int setup_mark(unsigned int n)
> >         char *const files[] = {fname, FILE_EXEC_PATH};
> >
> >         tst_res(TINFO, "Test #%d: %s", n, tc->tname);
> > +
> > +       if (support_exec_events != 0 && tc->mask & FAN_OPEN_EXEC_PERM) {
> > +               tst_res(TCONF | TERRNO, "FAN_OPEN_EXEC_PERM not supported in kernel?");
> > +               return -1;
> > +       }
> > +

Please remove the comment above tcases[] definition:
"Ensure to keep the first..."

It is no longer needed after this change.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
