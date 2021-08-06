Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588F3E28C2
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 12:37:05 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CE0BA3C7B0D
	for <lists+linux-ltp@lfdr.de>; Fri,  6 Aug 2021 12:37:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CA6CD3C1883
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 12:37:03 +0200 (CEST)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 1A587201090
 for <ltp@lists.linux.it>; Fri,  6 Aug 2021 12:37:03 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id k9so12407035edr.10
 for <ltp@lists.linux.it>; Fri, 06 Aug 2021 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohHKSh+HZImpSVaLM9TW5relpABftXO5BlsVkkQC4Nk=;
 b=XYiFbQ2l+Q6VnSuV3mymGTcQZDcTePXH6XonuZpjEeql1yzQTM9ZnH8pilXV4DIuID
 wDH6SxZ84yHVSzT+rneEwPYnY764gFXIXf+HhKFw7pmiVPSjBq66l4ZgWjUYSTCwwRHD
 IPUSw5iy2QAwSXR9NEQ5CBeG7ZOJ+tyXlrZf35KtgHVSkmO5gEgpWhPREtxIAigx7Q54
 /hu2yhPbubYXMAm1n8gepSozQnWaaEkBbWQywVgce/BXCouIbuLE2sAWeH61kwRES3zS
 fHjzaJPB1ce1I3VvVfSeTCjBvFwjrnOijjBB/6aF9nibTWs7Gs7GGnIyfOOz03U6K9Op
 uzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohHKSh+HZImpSVaLM9TW5relpABftXO5BlsVkkQC4Nk=;
 b=UEWvujpuI9H54Tg/S+njoq6B5eaCnpDZlFbhOGPcwThG2WaJfvqnP4ppeBk5bFjeKG
 AnUu7bmfYI4iHpQt/XIBc/t7kqghhXIEm3p2LBf2a7lucebSC6qykVUNEvKxOoGpEBZR
 ch9bYX/v0rcuoVo8G/hRS2S+EWmMLGWWF02Q3HxZLWjNmbDEn8uEUmL0DCL0hwRWXY+i
 2Jaq2s5+kqu7MuZsMDAWrLLQoIjm6kqD9l8YuMbtNIQ5ZPihZKz+9XU6PLSs1Ig/Egl3
 eUJyoEUfYURX5FxZqgnFXqizXTRzlDmjf1FIhaTJh2GWz/IQIQNx6aFxhhZnnapCNpot
 W1YA==
X-Gm-Message-State: AOAM532WGveVgdULdtKfTre1ulv6+5icPPisDuHJWF1EDjPHf27KO6XI
 fI0/n7w/e+PIC+rMwp9aCm+rN5+N5O7UN7zge3zrig==
X-Google-Smtp-Source: ABdhPJwngALTFtP2SGuhZhQaLpak7jWhSExOZMtTGHS+YF1ZqsrJ8bWECzb9vFagDm+wJhPNQAl8V06+xBILBLJxK/U=
X-Received: by 2002:aa7:c805:: with SMTP id a5mr11962205edt.23.1628246222536; 
 Fri, 06 Aug 2021 03:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210730062854.3601635-1-svens@linux.ibm.com>
 <YQn+GomdRCoYc/E8@Ryzen-9-3900X.localdomain>
 <875ywlat5e.fsf@disp2133> <94478003-8259-4b57-6d93-5a07e0750946@kernel.org>
 <87v94jalck.fsf@disp2133> <56b7c0fe-f2e1-7c4f-eb1b-1d9793dea5a8@kernel.org>
In-Reply-To: <56b7c0fe-f2e1-7c4f-eb1b-1d9793dea5a8@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 6 Aug 2021 16:06:51 +0530
Message-ID: <CA+G9fYv+Azmu+_YUv6+C6RRM990k0FhUc0hgSJKssubmsWfvhA@mail.gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] ucounts: add missing data type changes
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
Cc: Jan Kara <jack@suse.cz>, open list <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Alexey Gladkov <legion@kernel.org>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 6 Aug 2021 at 00:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/5/2021 9:48 AM, Eric W. Biederman wrote:
> > Nathan Chancellor <nathan@kernel.org> writes:
> >
> >> Hi Eric,
> >>
> >> On 8/4/2021 12:47 PM, Eric W. Biederman wrote:
> >>> Nathan Chancellor <nathan@kernel.org> writes:
> >>>
> >>>> On Fri, Jul 30, 2021 at 08:28:54AM +0200, Sven Schnelle wrote:
> >>>>> commit f9c82a4ea89c3 ("Increase size of ucounts to atomic_long_t")
> >>>>> changed the data type of ucounts/ucounts_max to long, but missed to
> >>>>> adjust a few other places. This is noticeable on big endian platforms
> >>>>> from user space because the /proc/sys/user/max_*_names files all
> >>>>> contain 0.
> >>>>>
> >>>>> Fixes: f9c82a4ea89c ("Increase size of ucounts to atomic_long_t")
> >>>>> Signed-off-by: Sven Schnelle <svens@linux.ibm.com>
> >>>>
> >>>> This patch in -next as commit e43fc41d1f7f ("ucounts: add missing data type
> >>>> changes") causes Windows Subsystem for Linux to fail to start:

On Linux next-20210802..next-20210805 we have been noticing
that LTP syscalls inotify06 test case getting failed all architectures.

BAD:
  Linux next-20210802
  inotify06.c:57: TBROK: Failed to close FILE
'/proc/sys/fs/inotify/max_user_instances': EINVAL (22)
  inotify06.c:107: TWARN: Failed to close FILE
'/proc/sys/fs/inotify/max_user_instances': EINVAL (22)

GOOD:
  Linux next-20210730
  inotify06.c:92: TPASS: kernel survived inotify beating

Investigation:
Following changes found between good and bad Linux next tags under fs/notify
git log --oneline --stat next-20210730..next-20210802 fs/notify
e43fc41d1f7f ucounts: add missing data type changes
 fs/notify/fanotify/fanotify_user.c | 10 ++++++----
 fs/notify/inotify/inotify_user.c   | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

Conclusion:
We have confirmed this patch caused the LTP syscalls inotify06 test failure.

After applying your proposed fix patch [1] the reported test getting pass.
However, I have to run full test plan to confirm this do not cause regressions.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

[1] https://lore.kernel.org/lkml/87v94jalck.fsf@disp2133/


> > diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
> > index 6576657a1a25..28b67cb9458d 100644
> > --- a/fs/notify/fanotify/fanotify_user.c
> > +++ b/fs/notify/fanotify/fanotify_user.c
> > @@ -54,6 +54,9 @@ static int fanotify_max_queued_events __read_mostly;
> >
> >   #include <linux/sysctl.h>
> >
> > +static long ft_zero = 0;
> > +static long ft_int_max = INT_MAX;
> > +
> >   struct ctl_table fanotify_table[] = {
> >       {
> >               .procname       = "max_user_groups",
> > @@ -61,8 +64,8 @@ struct ctl_table fanotify_table[] = {
> >               .maxlen         = sizeof(long),
> >               .mode           = 0644,
> >               .proc_handler   = proc_doulongvec_minmax,
> > -             .extra1         = SYSCTL_ZERO,
> > -             .extra2         = SYSCTL_INT_MAX,
> > +             .extra1         = &ft_zero,
> > +             .extra2         = &ft_int_max,
> >       },
> >       {
> >               .procname       = "max_user_marks",
> > @@ -70,8 +73,8 @@ struct ctl_table fanotify_table[] = {
> >               .maxlen         = sizeof(long),
> >               .mode           = 0644,
> >               .proc_handler   = proc_doulongvec_minmax,
> > -             .extra1         = SYSCTL_ZERO,
> > -             .extra2         = SYSCTL_INT_MAX,
> > +             .extra1         = &ft_zero,
> > +             .extra2         = &ft_int_max,
> >       },
> >       {
> >               .procname       = "max_queued_events",
> > diff --git a/fs/notify/inotify/inotify_user.c b/fs/notify/inotify/inotify_user.c
> > index 55fe7cdea2fb..62051247f6d2 100644
> > --- a/fs/notify/inotify/inotify_user.c
> > +++ b/fs/notify/inotify/inotify_user.c
> > @@ -55,6 +55,9 @@ struct kmem_cache *inotify_inode_mark_cachep __read_mostly;
> >
> >   #include <linux/sysctl.h>
> >
> > +static long it_zero = 0;
> > +static long it_int_max = INT_MAX;
> > +
> >   struct ctl_table inotify_table[] = {
> >       {
> >               .procname       = "max_user_instances",
> > @@ -62,8 +65,8 @@ struct ctl_table inotify_table[] = {
> >               .maxlen         = sizeof(long),
> >               .mode           = 0644,
> >               .proc_handler   = proc_doulongvec_minmax,
> > -             .extra1         = SYSCTL_ZERO,
> > -             .extra2         = SYSCTL_INT_MAX,
> > +             .extra1         = &it_zero,
> > +             .extra2         = &it_int_max,
> >       },
> >       {
> >               .procname       = "max_user_watches",
> > @@ -71,8 +74,8 @@ struct ctl_table inotify_table[] = {
> >               .maxlen         = sizeof(long),
> >               .mode           = 0644,
> >               .proc_handler   = proc_doulongvec_minmax,
> > -             .extra1         = SYSCTL_ZERO,
> > -             .extra2         = SYSCTL_INT_MAX,
> > +             .extra1         = &it_zero,
> > +             .extra2         = &it_int_max,
> >       },
> >       {
> >               .procname       = "max_queued_events",
> > diff --git a/kernel/ucount.c b/kernel/ucount.c
> > index 260ae7da815f..bb51849e6375 100644
> > --- a/kernel/ucount.c
> > +++ b/kernel/ucount.c
> > @@ -58,14 +58,17 @@ static struct ctl_table_root set_root = {
> >       .permissions = set_permissions,
> >   };
> >
> > +static long ue_zero = 0;
> > +static long ue_int_max = INT_MAX;
> > +
> >   #define UCOUNT_ENTRY(name)                                  \
> >       {                                                       \
> >               .procname       = name,                         \
> >               .maxlen         = sizeof(long),                 \
> >               .mode           = 0644,                         \
> >               .proc_handler   = proc_doulongvec_minmax,       \
> > -             .extra1         = SYSCTL_ZERO,                  \
> > -             .extra2         = SYSCTL_INT_MAX,               \
> > +             .extra1         = &ue_zero,                     \
> > +             .extra2         = &ue_int_max,                  \
> >       }
> >   static struct ctl_table user_table[] = {
> >       UCOUNT_ENTRY("max_user_namespaces"),


--
Linaro LKFT
https://lkft.linaro.org

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
