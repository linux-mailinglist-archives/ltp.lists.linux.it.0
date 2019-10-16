Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D6D8969
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 09:28:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4D0533C22C5
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 09:28:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id DF6C63C18B5
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 09:28:48 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3450C2010AA
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 09:28:46 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A6AC8B15A;
 Wed, 16 Oct 2019 07:28:45 +0000 (UTC)
References: <20191015101534.17691-1-liwang@redhat.com>
 <87sgnuw48s.fsf@rpws.prws.suse.cz>
 <CAEemH2dfHM7ExwYwdc-_oEw9_DftgfRw3mn2pnAEf1CKxyyn2A@mail.gmail.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Li Wang <liwang@redhat.com>
In-reply-to: <CAEemH2dfHM7ExwYwdc-_oEw9_DftgfRw3mn2pnAEf1CKxyyn2A@mail.gmail.com>
Date: Wed, 16 Oct 2019 09:28:45 +0200
Message-ID: <87r23dw3ma.fsf@rpws.prws.suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] include: undefine _LINUX_TYPES_H if including
 sys/capability.h
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
Reply-To: rpalethorpe@suse.de
Cc: LTP List <ltp@lists.linux.it>,
 Richard Palethorpe <richard.palethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Li Wang <liwang@redhat.com> writes:

> Richard Palethorpe <rpalethorpe@suse.de> wrote:
>
> ...
>> >  #ifdef HAVE_SYS_CAPABILITY_H
>> >  # include <sys/capability.h>
>> > +# undef _LINUX_TYPES_H
>>
>> My concern here is if linux/types.h has already been included. Then this
>> could cause a redefinition error if it is included again.
>>
>
> Hmm, it looks tricky to solve this, because I didn't find a macro to show
> version in libcap files.
>
> Another method I can think of is to build a small program to check if that
> libcap version is newer or not during the configure phase. If yes, then
> export a new macro HAVE_NEWER_LIBCAP to be used in /lapi/capability.h.

Yes, this could work.

>
> The following patch has been verified on both rhel6 and rhel8, any comments?
> [I'm not familiar with m4 syntax, just copy from other places]

m4 all looks ugly to me ;-)

>
> diff --git a/include/lapi/capability.h b/include/lapi/capability.h
> index 3c2ee7937..3607179b5 100644
> --- a/include/lapi/capability.h
> +++ b/include/lapi/capability.h
> @@ -10,7 +10,9 @@
>
>  #ifdef HAVE_SYS_CAPABILITY_H
>  # include <sys/capability.h>
> -# undef _LINUX_TYPES_H
> +# ifndef HAVE_NEWER_LIBCAP
> +#  undef _LINUX_TYPES_H
> +# endif
>  #endif

This is so wierd it maybe deserves a comment. Otherwise, this looks good
to me.

>
>  #ifndef CAP_NET_RAW
> diff --git a/m4/ltp-cap.m4 b/m4/ltp-cap.m4
> index 02d3cac8c..8b1546401 100644
> --- a/m4/ltp-cap.m4
> +++ b/m4/ltp-cap.m4
> @@ -14,4 +14,20 @@ if test "x$cap_libs" != x; then
>         AC_DEFINE(HAVE_LIBCAP)
>  fi
>  AC_SUBST(CAP_LIBS,$cap_libs)
> +
> +AH_TEMPLATE(HAVE_NEWER_LIBCAP,
> +[Define to 1 if you have newer libcap-2 installed.])
> +AC_COMPILE_IFELSE([AC_LANG_SOURCE([
> +#include <sys/capability.h>
> +#include <linux/types.h>
> +int main(void) {
> +       __u16 a;
> +       __u32 b;
> +       return 0;
> +}])],[has_newer_libcap="yes"])
> +
> +if test "x$has_newer_libcap" = xyes; then
> +       AC_DEFINE(HAVE_NEWER_LIBCAP)
> +fi
>  ])


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
