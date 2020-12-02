Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CC2CC2FF
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 18:05:13 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00DA23C5501
	for <lists+linux-ltp@lfdr.de>; Wed,  2 Dec 2020 18:05:13 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0224A3C13D9
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 18:05:11 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 91093140133B
 for <ltp@lists.linux.it>; Wed,  2 Dec 2020 18:05:11 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE23DAB7F;
 Wed,  2 Dec 2020 17:05:10 +0000 (UTC)
Date: Wed, 2 Dec 2020 18:05:08 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <X8fJRNgQ0n4nB4lH@pevik>
References: <20201201174214.24625-1-pvorel@suse.cz>
 <20201201174214.24625-7-pvorel@suse.cz>
 <CAOQ4uxg_Kwmx1K=om9aA6Sh=+L129=YpneDW1ZLP2sL96ELNgw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxg_Kwmx1K=om9aA6Sh=+L129=YpneDW1ZLP2sL96ELNgw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 06/10] fanotify: Add helper for mark support
 check
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

Hi Amir, Cyril,

> On Tue, Dec 1, 2020 at 7:42 PM Petr Vorel <pvorel@suse.cz> wrote:

> > i.e. FAN_MARK_FILESYSTEM and use it in relevant tests setup().
> > The purpose is to reduce checks (cleanup).

> > NOTE: all tests check only for FAN_MARK_FILESYSTEM, but keep helper
> > generic for future use.

> > Suggested-by: Amir Goldstein <amir73il@gmail.com>
> > Signed-off-by: Petr Vorel <pvorel@suse.cz>
> > ---
> > New in v5.

> >  testcases/kernel/syscalls/fanotify/fanotify.h | 21 ++++++++++++++++
> >  .../kernel/syscalls/fanotify/fanotify01.c     | 12 +++++----
> >  .../kernel/syscalls/fanotify/fanotify03.c     | 25 +++++++++----------
> >  .../kernel/syscalls/fanotify/fanotify10.c     | 14 +++++------
> >  .../kernel/syscalls/fanotify/fanotify13.c     | 15 +++++------
> >  5 files changed, 55 insertions(+), 32 deletions(-)

> > diff --git a/testcases/kernel/syscalls/fanotify/fanotify.h b/testcases/kernel/syscalls/fanotify/fanotify.h
> > index 821e6cb29..2275a1da3 100644
> > --- a/testcases/kernel/syscalls/fanotify/fanotify.h
> > +++ b/testcases/kernel/syscalls/fanotify/fanotify.h
> > @@ -351,4 +351,25 @@ static inline void require_fanotify_fan_report_fid_supported_on_fs(const char *f
> >  #define REQUIRE_FANOTIFY_FAN_REPORT_FID_SUPPORTED_ON_FS(fname) \
> >         require_fanotify_fan_report_fid_supported_on_fs(__FILE__, __LINE__, (fname))

> > +static inline int fanotify_mark_supported_by_kernel(uint64_t flag)
> > +{
> > +       int fd;
> > +       int rval = 0;
> > +
> > +       fd = SAFE_FANOTIFY_INIT(FAN_CLASS_CONTENT, O_RDONLY);
> > +
> > +       if (fanotify_mark(fd, FAN_MARK_ADD | flag, FAN_ACCESS_PERM, AT_FDCWD, ".") < 0) {
> > +               if (errno == EINVAL) {
> > +                       rval = -1;
> > +               } else {
> > +                       tst_brk(TBROK | TERRNO,
> > +                               "fanotify_mark (%d, FAN_MARK_ADD, ..., FAN_ACCESS_PERM, AT_FDCWD, \".\") failed", fd);
> > +               }

> You meant FAN_ACCESS.

> FAN_ACCESS_PERM requires CONFIG_FANOTIFY_ACCESS_PERMISSIONS which is not
> a requirement for most of the affected tests.
Thanks for explanation, I was thinking about it :).

> Patch set is super! it's the only issue I found, so I don't think you
> need to re-post for that.

Fixing this and Cyril notes in 04/10 and merging tonight.

Kind regards,
Petr

> Thanks,
> Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
